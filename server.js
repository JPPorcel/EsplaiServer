
var express = require("express"),  
    app = express(),
    bodyParser  = require("body-parser"),
    methodOverride = require("method-override"),
    mysql = require('mysql'),
	fs = require('fs');
	
var connection = mysql.createConnection({
	host     : 'localhost',
	user     : 'root',
	password : '',
	database : 'Esplai'
});

var crypto = require("crypto");

function getHashKey()
{
    var current_date = (new Date()).valueOf().toString();
    var random = Math.random().toString();
    return crypto.createHash('sha1').update(current_date + random).digest('hex');
}


app.use(bodyParser.urlencoded({ extended: true }));  
app.use(bodyParser.json());  
app.use(methodOverride());
app.enable('trust proxy')

var router = express.Router();

// raíz del servidor - devolverá html
router.get('/', function(req, res) 
{  
	res.send("Esplai");
});

// devuelve la fecha de última actualización de las tablas de la base de datos
// desde el cliente: si la fecha local es menor que la fecha que devolvemos, actualiza las tablas
router.get('/tables', function(req, res) 
{  	
	connection.query("select * from Actualizar",function(err,rows){
		if(err) 
			throw err;
		
		res.set({ 'content-type': 'application/json; charset=utf-8' });
		res.send(rows);
	});
});

// devuelve la base de datos completa (programa, fundacion, espacios, actividades)
router.get('/db', function(req, res) 
{  	
	connection.query("select * from Programa", function (err, programa)
	{
		if(err)
			throw err;
        
        connection.query("select * from Fundacion", function (err, fundacion)
        {
            if(err)
                throw err;
            
            connection.query("select * from Espacios", function (err, espacios)
            {
                if(err)
                    throw err;
                
                connection.query("select * from Actividades", function (err, actividades)
                {
                    if(err)
                        throw err;
                    
                    connection.query("select * from Actualizar", function (err, actualizar)
                    {
                        if(err)
                            throw err;
                        
                        result = '{"Programa":' + JSON.stringify(programa) + ', "Fundacion":' + JSON.stringify(fundacion) + ', "Espacios":' + JSON.stringify(espacios) + ', "Actividades":' + JSON.stringify(actividades) + ', "Actualizar":' + JSON.stringify(actualizar) +'}'
                        
                        res.set({ 'content-type': 'application/json; charset=utf-8' });
                        res.send(String(result));
                    });
                });
            });
        });		
	});
});

// devuelve la tabla especificada
router.get('/db/:table', function(req, res) 
{  	
    var tabla = mysql.escape(req.params.id);
    
    if(tabla != "Programa" || tabla != "Fundacion" || tabla != "Espacios" || tabla != "Actividades")
    {
        res.set({ 'content-type': 'application/json; charset=utf-8' });
        res.send("{'code': '43', 'message': 'table does not exists'}");
        return;
    }
    
	connection.query("select * from " + tabla, function (err, tabla)
	{
		if(err)
			throw err;
                    
        connection.query("select * from Actualizar where tabla='" + tabla + "'", function (err, actualizar)
        {
            if(err)
                throw err;
            
            result = '{"tabla":' + JSON.stringify(tabla) + ', "Actualizar":' + JSON.stringify(actualizar) +'}'
            
            res.set({ 'content-type': 'application/json; charset=utf-8' });
            res.send(String(result));
        });	
	});
});

// devolverá lista de usuarios
router.get('/users', function(req, res) 
{  
	connection.query("select * from Usuarios",function(err,rows){
		if(err) 
			throw err;
		
		res.set({ 'content-type': 'application/json; charset=utf-8' });
		res.send(rows);
	});
});


// devuelve el usuario con id
router.get('/users/:id', function(req, res) 
{  	
	connection.query("select * from Usuarios where id="+mysql.escape(req.params.id),function(err,rows){
		if(err) 
			throw err;
		
		res.set({ 'content-type': 'application/json; charset=utf-8' });
		res.send(rows);
	});
});

// devuelve la información de una marcha, si existe
router.get('/users/filter/:filtro', function(req, res) 
{  
	var filtro = mysql.escape(req.params.filtro);

	connection.query("select Usuarios.id, Usuarios.correo, Usuarios.telefono, Usuarios.nombre, Usuarios.apellidos, Usuarios.localidad as idLocalidad, Usuarios.imagen, Usuarios.interes1, Usuarios.interes2, Usuarios.interes3, Localidad.nombre as localidad from Usuarios join Localidad on Usuarios.localidad=Localidad.id where Usuarios.nombre like '%" + filtro + "%' or Usuarios.telefono like '%" + filtro + "%' or Usuarios.correo like '%" + filtro + "%'", function (err, usuarios)
    {
        if(err)
            throw err;
        
        result = '{"usuarios":' + JSON.stringify(usuarios) + '}'
        
        res.set({ 'content-type': 'application/json; charset=utf-8' });
        res.send(String(result));
    });
});

router.post('/users/create', function(req, res)
{	
    var correo = mysql.escape(req.body.correo);
	var nombre = mysql.escape(req.body.nombre);
	var apellidos = mysql.escape(req.body.apellidos);
	var telefono = mysql.escape(req.body.telefono);
    var interes1 = mysql.escape(req.body.porque);

	connection.query("insert into Usuarios set correo=" + correo + ", telefono=" + telefono + ", nombre=" + nombre + ", apellidos=" + apellidos+", interes1="+interes1, function (err, result)
	{
		if(err)
			throw err;
		
		res.set({ 'content-type': 'application/json; charset=utf-8' });
		res.send("{'code': '20', 'message': '"+result.insertId+"'}");
	});
});

router.post('/users/update', function(req, res)
{	
	var id = mysql.escape(req.body.id);
	var nombre = mysql.escape(req.body.nombre);
	var apellidos = mysql.escape(req.body.apellidos);
	var telefono = mysql.escape(req.body.telefono);
	var imagen = mysql.escape(req.body.imagen);
	var interes1 = mysql.escape(req.body.porque);
    
    connection.query("select id from Usuarios where id="+id,function(err,rows){
		if(err) 
			throw err;
        
        if(rows.length == 1)
		{
            connection.query("update Usuarios set telefono=" + telefono + ", nombre=" + nombre + ", apellidos=" + apellidos + ", interes1=" + interes1 + " where id=" + id, function (err, rows)
            {
                if(err)
                    throw err;
                
                res.set({ 'content-type': 'application/json; charset=utf-8' });
                res.send("{'code': '20', 'message': 'ok'}");
            });
        }
        else
		{
			res.set({ 'content-type': 'application/json; charset=utf-8' });
            res.send("{'code': '43', 'message': 'user does not exists'}");
		}
	});	
});


app.use(router);

app.listen(8080, function() {  
	console.log("Node server running on http://localhost:8080");
});
