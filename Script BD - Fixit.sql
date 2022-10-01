create database fixit;

use fixit;

CREATE TABLE localidad_usuario (
    id_localidad int not null primary key,
    nombre_localidad char(20) not null
);

CREATE TABLE categoria_servicios(
    id_categoriaser int not null primary key,
    nombre_categoriaser char(50) not null
);

CREATE TABLE servicios(
    id_servicio int auto_increment not null primary key,
    id_categoria_serv int not null,
    nombre_servicio char(40) not null,
    foreign key (id_categoria_serv) references categoria_servicios (id_categoriaser)
);

CREATE TABLE administrador(
    id_admin int not null primary key,
    nombres_admin char(40) not null,
    apellidos_admin char(40) not null,
    edad_admin int not null,
    telefono_admin int not null,
    correo_admin char(40) not null,
    direccion_admin char(40) not null,
    localidad_admin int not null,
    foreign key (localidad_admin) references localidad_usuario (id_localidad)
);

CREATE TABLE clientes(
    id_cliente int not null primary key,
    nombres_cliente char(40) not null,
    apellidos_cliente char(40) not null,
    edad_cliente int not null,
    telefono_cliente int not null,
    correo_cliente char(40) not null,
    direccion_cliente char(40) not null,
    localidad_cliente int not null,
    foreign key (localidad_cliente) references localidad_usuario (id_localidad)
);

CREATE TABLE usuariosps(
    id_usuariops int not null primary key,
    nombres_usuariops char(40) not null,
    apellidos_usuariops char(40) not null,
    edad_usuariops int not null,
    telefono_usuariops int not null,
    correo_usuariops char(40) not null,
    direccion_usuariops char(40) not null,
    localidad_usuariops int not null,
    servicio_usuariops int not null,
    foreign key (localidad_usuariops) references localidad_usuario (id_localidad),
    foreign key (servicio_usuariops) references servicios (id_servicio)
);

CREATE TABLE servicios_prestados(
    id_servicio_prestado int auto_increment not null primary key,
    usuariops_id int not null,
    tiposervicio_id int not null,
    foreign key (usuariops_id) references usuariosps (id_usuariops),
    foreign key (tiposervicio_id) references servicios (id_servicio)
);

CREATE TABLE servicio_activo(
    id_servicio_act int auto_increment not null primary key,
    fecha_serv_act char(10) not null,
    id_serviciospres_act int not null,
    foreign key (id_serviciospres_act) references servicios_prestados (id_servicio_prestado)
);

CREATE TABLE calificacion_cliente(
    id_calificacion_cli int auto_increment not null primary key,
    id_usuariocli int not null,
    calificacion_cli int not null,
    observacion_cli char(100) not null,
    foreign key (id_usuariocli) references clientes (id_cliente)
);

CREATE TABLE calificacion_usuariops(
    id_calificacion_usuariops int auto_increment not null primary key,
    id_usuario_usuariops int not null,
    calificacion_usuariops int not null,
    observacion_usuariops char(100) not null,
    foreign key (id_usuario_usuariops) references usuariosps (id_usuariops)
);

CREATE TABLE pqrs_usuariops(
    id_pqrs_usuariops int auto_increment not null primary key,
    id_pqrs_usuario_ps int not null,
    tipo_pqrs_usuariops char(100) not null,
    observacion_pqrs_usuariops char(100) not null,
    foreign key (id_pqrs_usuario_ps) references usuariosps (id_usuariops)
);

CREATE TABLE pqrs_cliente(
    id_pqrs_cliente int auto_increment not null primary key,
    id_pqrs_usuario_cliente int not null,
    tipo_pqrs_cliente char(100) not null,
    observacion_pqrs_cliente char(100) not null,
    foreign key (id_pqrs_usuario_cliente) references clientes (id_cliente)
);

