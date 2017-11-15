-- base de datos --

SET NAMES 'utf8' COLLATE 'utf8_general_ci';

create database if not exists Esplai CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

use Esplai;

create table if not exists Usuarios
(
    id int not null auto_increment,
    correo varchar(200),
    telefono varchar(20),
	nombre varchar(200) not null,
	apellidos varchar(200),
	imagen varchar(500),
    interes1 text,
    interes2 text,
    interes3 text,
	primary key (id)
);

CREATE TABLE if not exists Programa (
	ID int not null auto_increment,
	horaIn datetime,
	horaFin datetime,
	nombre varchar(255),
	PRIMARY KEY (ID)
);

CREATE TABLE if not exists Fundacion (
    id int not null auto_increment,
	foro text,
	fundacion text,
	primary key (id)
);

CREATE TABLE if not exists Espacios (
	ID int not null auto_increment,
	nombre varchar(500),
	arquitecto varchar(255),
	inauguracion int,
	descripcion text,
	fotos varchar(255),
	PRIMARY KEY (ID)
);

CREATE TABLE if not exists Actividades (
	ID int not null auto_increment,
	nombre varchar(500),
	lugar varchar(500),
	participantes varchar(500),
	descripcion text,
	objetivos text,
	origen text,
	dinamizada text,
	localizacion int,
	PRIMARY KEY (ID)
);

create table if not exists Actualizar (
    tabla varchar(255),
    fecha datetime,
    primary key (tabla)

);

insert into Actualizar (tabla, fecha) values
    ('Programa', now()),
    ('Fundacion', now()),
    ('Espacios', now()),
    ('Actividades', now());

INSERT INTO Programa (ID, horaIn, horaFin, nombre) VALUES
    ('1','2017-11-18 11:00:00','2017-11-18 12:00:00','Llegada de jóvenes y de las entidades Conecta al Albergue San Fermín. Dirección: Avenida de Los Fueros 36 - Tel.91 792 08 97. 28041 Madrid'),
    ('2','2017-11-18 11:30:00','2017-11-18 12:00:00', 'Bienvenida y presentación del Foro Fundación Esplai'),
    ('3','2017-11-18 12:00:00','2017-11-18 14:00:00','Presentación de la Propuesta educativa 3, 2,1 Conecta!'),
    ('4','2017-11-18 14:00:00', '2017-11-18 16:00:00', 'Comida'),
    ('5','2017-11-18 16:00:00', '2017-11-18 21:00:00', 'Actividades paralelas'),
    ('6','2017-11-18 21:00:00', '2017-11-18 22:30:00', 'Cena'),
    ('7','2017-11-18 22:30:00','2017-11-19 00:00:00','Vuelta a los albergues'),
    ('8','2017-11-19 10:30:00','2017-11-19 11:00:00','Llegada de los y las jóvenes y las entidades a la Casa del Lector de Matadero.'),
    ('9','2017-11-19 11:00:00', '2017-11-19 12:00:00', 'Inicio actividades paralelas'),
    ('10','2017-11-19 12:00:00', '2017-11-19 13:00:00', 'Acto simbólico y animación musical.'),
    ('11','2017-11-19 13:00:00','2017-11-19 14:00:00','Entrega de Premios Fundación Esplai a la Ciudadanía Comprometida.'),
    ('12','2017-11-19 14:00:00','2017-11-19 16:00:00','Comida');

INSERT INTO Actividades (ID, nombre, lugar, participantes, descripcion, objetivos, origen, dinamizada, localizacion) VALUES
    (1, 'Participa para acercar generaciones', 'Interior Casa del Lector, 19 de Noviembre, de 11.00h a 13.00h', 'Recomendado para jóvenes de 15 a 25 años y mayores','Taller de alfabetización digital para mayores en el uso de Smartphones y tabletas.', 'Fomentar el empoderamiento de jóvenes y gente mayor. A través de la metodología de ApS los mayores aprenden el uso de Smartphones y tabletas con la finalidad de potenciar su empoderamiento ciudadano y su inclusión social y digital de la mano de jóvenes voluntarios.', 'Propuesta vinculada al proyecto Mayores Conecta2 de Fundación Esplai', 'Jóvenes participantes de los proyectos de Fundación Esplai y C.E. Diversitat Lúdica', 1),
    (2, 'Participa para garantizar los derechos de la infancia - DUDI', 'Exterior Casa del Lector, 19 de Noviembre, de 11.00h a 13.00h', 'Recomendada para todas las edades','Se trabaja el Día Internacional de la Infancia mediante una dinámica consistente en relacionar derechos y deberes.', 'Reflexionar acerca de los derechos de la infancia en conmemoración del Día Internacional de los Derechos de la Infancia.', 'Propuesta vinculada al proyecto Jo-Ven! Disueña y Construye tu Comunidad de Fundación Esplai', 'Jóvenes participantes de los proyectos de la IV edición del Jo-Ven! y Fundación Esplai', 1),
    (3, 'Participa para promocionar los hábitos saludables', 'Itinerante Casa del Lector, 19 de Noviembre, de 11.00 a 13.00h', 'Recomendada para todas las edades','Acercamiento al significadode practicar el ocio saludable y prevención de conductas de riesgo a través del juego.', 'Fomentar los hábitos saludables entre la ciudadanía. Empoderar a los jóvenes cómo motor de la promoción de la salud a través de la metodología de ApS', 'Propuesta vinculada a la línea de salud de Fundación Esplai: Actívate, Activados y Activando', 'Jóvenes participantes de los proyectos salud de Fundación Esplai y Centro de juventud del Ayuntamiento de Puigcerdà', 1),
    (4, 'Participa por la creatividad en el uso de las TIC. Laboratorio STEAM', 'Interior Casa del Lector, 19 de Noviembre, de 11.00h a 13.00h', 'Recomendado para edades de 3 a 12 años','Fomentar el aprendizaje de competencias y habilidades a través de la robótica educativa. Programación, tabajo en equipo, diseño y creatividad, metodología de ensayo y error, resolución de problemas, etc.', 'Fomentar competencias STEAM (Science, Technology, Engineering, Art and Mathematics) en niños y niñas a través de experiencias de coding, realidad aumentada y robótica educativa.', 'Propuesta vinculada a los proyectos sobre programación de Fundación Esplai', 'Jóvenes participantes de los proyectos de Fundación Esplai, La Rueca Asociación y participantes del proyecto Enfoca´t', 1),
    (5, 'Participa para encontrar soluciones a través de las TIC. Gincana de código', 'Interior Casa del Lector, 19 de Noviembre, de 11.00h a 13.00h', 'Recomendado para todas las edades','Gincana por las instalaciones del Foro para recopilar partes de código QR y finalmente combinarlos para conseguir un programa informático que funcione en Processing.', 'Fomentar competencias STEAM (Science, Technology, Engineering, Art and Mathematics) y el aprendizaje de competencias y habilidades a través de la robótica educativa.', 'Propuesta vinculada a los proyectos robótica educativa de Fundación Esplai', 'Jóvenes participantes de los proyectos de robótica educativa de Fundación Esplai', 1),
    (6, 'Participa para fomentar una sociedad inclusiva', 'Exterior Casa del Lector, 19 de Noviembre, de 11.00h a 13.00h', 'Recomendado para todas las edades', '', 'Trabajar valores relacionados con la interculturalidad. Fomentar valores relacionados con la convivencia y la cohesión social. Dar a conocer los efectos positivos de las TIC en personas migrantes.', 'Propuesta vinculada a los proyectos de la línea de interculturalidad de Fundación Esplai', 'Participantes de los proyectos de Fundación Esplai y la Fundación Plan B Educación Social', 1),
    (7, 'Participa para construir una ciudadanía comprometida', 'Exterior Casa del Lector, 19 de Noviembre, de 11.00h a 13.00h', 'Recomendado para todas las edades','Taller para fomentar la cooperación y cohesión de la ciudadanía reconociendo las competencias de cada participante y compartiéndolas con el resto del grupo.', 'Identificar los beneficios del trabajo en red bajo los valores de la participación y dinamización juvenil e infantil en el tiempo libre con la metodología ApS.', 'Propuesta vinculada a los proyectos de la Red Ciudadanía Comprometida de Fundación Esplai', 'Jóvenes participantes de los proyectos de Fundación Esplai y Servicio de Juventud del Ayuntamiento de San Andrés y Sauces', 1);

INSERT INTO Espacios (ID, nombre, arquitecto, inauguracion, descripcion, fotos) VALUES
    ('1','Escaravox','Andrés Jaque Arquitectos','2012','Dos unidades de una espectacular estructura móvil que lleva por nombre Escaravox y que es al mismo tiempo un espacio escénico, área de juegos, zona de descanso y refresco, sistema de sonido y pantalla de proyecciones. Construidos sobre los sistemas de riego móviles utilizados en las grandes explotaciones agrícolas, los Escaravox cuentan con pantallas, altavoces, vegetación, sombrillas. Escaravox es algo así como una gigantesca navaja suiza del ocio, llamada además a romper la tradicional barrera entre artistas y público, que permite a ambos programar sus propias actividades, actuar e interactuar de un modo libre, original y creativo. La disposición de los Escaravox, móviles, se transforma por temporadas, otorgando a la Plaza Matadero distintas configuraciones según las necesidades del centro.',null),
    ('2','El Taller y Oficina de Coordinación','Arturo Franco','2010','Espacio de uso polivalente dedicado a la formación y la producción artística (El Taller), al Archivo Matadero y a oficina y sala de reuniones. La intervención llevada a cabo en estos espacios pretende respetar una configuración espacial pre existente válida, sin adulterarla. Básicamente ha consistido en la introducción en el espacio interior de tejas planas y aparejadas previamente recuperadas de una cubierta en mal estado, la restitución de la cubierta de teja, el reforzamiento estructural del conjunto y el acabado del interior con maderas viejas que aíslan el conjunto para dar servicio a los nuevos usos de las salas. Pero lo más innovador es que se trata de un proyecto también bioclimático, porque la teja contribuye al confort térmico, acústico y sostenible del edificio, que ha sido reinventado con elementos pertenecientes a su entorno.',null),
    ('3','Cineteca','José María Churtichaga y Cayetana de la Quadra Salcedo','2011','Dedicada a la creación audiovisual, su programación se centra en la proyección de cine de no ficción. La Cineteca es un complejo pionero en España tanto por sus contenidos como por su arquitectura. Dedicado casi exclusivamente al cine de no-ficción, con sus 2.688 m2, conserva la estructura espacial existente, distribuida en cinco espacios distintos: dos salas de cine, un plató de rodaje, archivo, una cantina y una terraza con posibilidad de proyección. Lo antiguo y lo nuevo conviven aquí en una atmósfera sombría común en la que la luz artificial de los leds y las proyecciones se convierten en un elemento fundamental del proyecto: destacan dentro del complejo las cestas tejidas con mangueras de riego que se configuran como un elemento luminiscente que alimenta de luz los techos de las salas de cine y del archivo.',null),
    ('4','Central de Diseño y AVAM','José Antonio García Galván','2007','Institución de referencia para la difusión y promoción del diseño contemporáneo. La actuación llevada a cabo en la Central de Diseño consisitió en mantener la fuerza de la propia descomposición constructiva de los elementos incorporando materiales reciclados y reciclables: policarbonato desmontable para el muro luminoso, bandejas industriales de parachoques reciclados en el suelo, hierro galvanizado  y vidrio. Este complejo en forma de L acoge regularmente exposiciones, festivales y talleres y en sus distintos ambientes se integran además un aula, espacio para oficinas y almacén.',null),
    ('5','Abierto X Obras','Espacio sin intervenir','2007','La cámara frigorífica del antiguo matadero acoge regularmente el programa artístico de exposiciones site specific Abierto X Obras. Esta sala de más de 800 metros cuadrados todavía conserva su aspecto original y las huellas de un incendio sucedido en los años 90. Mediante una intervención mínima de conservación y consolidación de elementos se ha mantenido el carácter íntimo de este espacio, característico por su estructura diáfana de arcos volados y columnas.',null),
    ('6','Naves del Español','Emilio Esteras','2007','Complejo escénico dedicado al teatro contemporáneo. El complejo de las Naves del Español  ha sido concebido por el creador de espacios escénicos Jean Guy Lecat y es el resultado de la estrecha colaboración de éste, con el director de teatro Mario Gas, el director técnico Francisco Fontanals y el arquitecto municipal Emilio Esteras. Las tres naves que lo forman están interconectadas entre sí pero su especial diseño y flexibilidad permite su funcionamiento de forma totalmente autónoma, y la posibilidad de múltiples configuraciones en sus espacios. Además la introducción de elementos y materiales industriales que se yuxtaponen a los pre existentes permiten una clara lectura de las intervenciones arquitectónicas realizadas.',null),
    ('7','Intermediae y Vestíbulo','Arturo Franco','2007','Intermediae cuenta con 2.700m2 repartidos en varios espacios: dos naves diáfanas que se transforman con cada proyecto, el Terrario y oficinas. La intervención arquitectónica de estos dos espacios explora las posibilidades de rehabilitación de la ruina en la que se encontraba el edificio y aporta una mirada nueva sobre la actuación en el patrimonio histórico. El concepto base del proyecto es la búsqueda de un equilibro entre el respeto por la identidad del propio lugar y la incorporación de nuevos elementos, los necesarios para lograr transformarlo en un espacio para un nuevo uso. Para ello se eligieron exclusivamente materiales industriales como el hierro y el vidrio utilizados directamente, sin sufrir apenas ninguna manipulación.',null),
    ('8','Plaza y Calle Matadero','Ginés Garrido, Carlos Rubio y Fernando Porras','2011','Un punto de encuentro y socialización capaz de acoger grandes eventos al aire libre. Estos dos espacios comprendidos entre las naves de Matadero Madrid funcionan como el gran ágora y el foro del centro cultural. Son dos espacios de acceso público que articulan la distribución de las diferentes instituciones que conviven en Matadero permitiendo su acceso desde distintos puntos, la Plaza de Legazpi, el Paseo de la Chopera, la Junta de Arganzuela  y Madrid Río. Un espacio polivalente que puede acoger un gran abanico de manifestaciones, presentaciones y actividades.',null),
    ('9','Casa del Lector','Antón García Abril','2012','La esencia de este proyecto arquitectónico es la conectividad de personas, tanto público general como profesional, ideas, espacios y lugares. Las naves 13 y 14, de corte longitudinal, conectan transversalmente mediante puentes de vigas de hormigón pretensado, provocando el encuentro entre las dos estructuras. La Casa del Lector, con sus más de 8.000 metros cuadrados, acoge actividades literarias, que abarcan desde el papel impreso a los nuevos soportes comunicativos; de lo lingüístico a lo audiovisual, con especial interés en el papel desempeñado por las nuevas tecnologías y soportes. Para el desarrollo de su actividad, la Casa del Lector cuenta con aulas de formación, biblioteca y área de consulta, talleres, salas de motivación lectora, sets de radio y tv, sala de exposición y auditorio con capacidad para 300 personas, donde cine, música, teatro, performances e instalaciones.',null),
    ('10','Nave 16','Alejandro Vírseda, José Ignacio Carnicero e Ignacio Vila Almazán','2011','El gran espacio para las artes visuales de Matadero Madrid. La Nave 16 es un espacio versátil capaz de acoger grandes proyectos multidisciplinares. Sus más de 4.000 m2 pueden ser fácilmente divididos en módulos independientes divididos por grandes paneles de acero y permitir así la programación de contenidos de forma simultánea: proyecciones, grandes exposiciones, conciertos, talleres de producción de obra, charlas, propuestas escénicas o actividades sociales.',null);

INSERT INTO Fundacion (foro,fundacion) VALUES ('El próximo 16 de octubre, en el centro de creación contemporánea Matadero, en Madrid, celebraremos el Foro Fundación Esplai, el principal encuentro anual de nuestra organización. En esta jornada lúdica, de trabajo, sensibilización y visualización de Fundación Esplai, reunimos a los y las protagonistas de los proyectos, a representantes de nuestras organizaciones socias, a personas de empresas, administraciones e instituciones que nos apoyan y, también, queremos contar con la participación de la ciudadanía de Madrid, para dar a conocer los proyectos que realizamos. En el marco del Foro se entregarán los Premios Fundación Esplai a la Ciudadanía Comprometida y los del concurso de vídeos “Y tú, ¿cómo controlas?”, así como los del concurso de la app que tienes en tus manos, y se realizarán diferentes actividades relacionadas con los programas que desarrollamos como talleres de programación de videojuegos, robótica educativa o formación de personas mayores en el uso del smartphone e Internet.','Fundación Esplai, Ciudadanía Comprometida es una organización de ámbito estatal creada en  1999 que comparte proyecto con Fundesplai. La apuesta por la ciudadanía comprometida como eje vertebrador de la organización, parte de la convicción de que el papel fundamental de una entidad del Tercer Sector es definir sueños y tener capacidad de construirlos. Uno de los principales sueños de Fundación Esplai es que cada persona sea protagonista de su  propia historia, disponga de las condiciones para definir su itinerario vital y en el integre la participación y el compromiso con su entorno, contribuyendo así a construcción de una sociedad mejor en la que todas las personas tengan las mismas oportunidades. Por esto, los objetivos de la organización son: - Soñar con el mundo en el que queremos vivir y tener la capacidad de, paso a paso, hacerlo realidad. Es decir, disponer de voluntad de transformar y poner en práctica las competencias para gestionar.- Ser un pilar de la estructura social que posibilite la participación de la ciudadanía con voluntad de comprometerse. Y dar a esta ciudadanía el protagonismo de la acción institucional. - Contribuir a la vertebración del Tercer Sector potenciando el trabajo conjunto y las alianzas para construir sueños globales.');

-- --------------------------------------------------------

create user if not exists 'esplai'@'localhost' identified by 'esplai';

grant all on Esplai to esplai@localhost;
