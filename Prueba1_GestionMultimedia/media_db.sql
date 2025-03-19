create database media_db ;
use media_db;
create table multimedia(
	id int primary key AUTO_INCREMENT,
    titulo varchar(100),
    descripcion varchar(200),
    url varchar(500),
    tipo varchar(50)
);

INSERT INTO multimedia(titulo,descripcion,url,tipo) 
	VALUES ("Aprendiendo CSS", "Curso desde 0","https://www.youtube.com/watch?v=hrxjBqZWsb0&ab_channel=midulive","Video");
INSERT INTO multimedia(titulo,descripcion,url,tipo) 
	VALUES ("Montana", "Fondo para escritorio",
    "https://image.slidesdocs.com/responsive-images/background/monochrome-dreamland-gray-featuring-mountains-trees-clouds-and-the-moon-in-3d-canvas-powerpoint-background_8c4545aa7f__960_540.jpg",
    "Imagen");
INSERT INTO multimedia(titulo,descripcion,url,tipo) 
	VALUES ("Grateful", "Cancion de NEFFEX","https://music.youtube.com/watch?v=dAgNwavNAHQ&list=RDAMVMdAgNwavNAHQ","Audio");