create database media_db ;
use media_db;
create table multimedia(
	id int primary key AUTO_INCREMENT,
    titulo varchar(100),
    descripcion varchar(200),
    url varchar(500),
    tipo varchar(50)
);

select * from multimedia;
delete from multimedia where id =5;