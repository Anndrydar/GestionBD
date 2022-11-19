
/*==============================================================*/
/* Table: DETALLE_DRONE                                         */
/*==============================================================*/
create table DETALLE_DRONE 
(
   ID_DRON              integer                        null,
   FABRICANTE           varchar(50)                    null,
   MODELO               varchar(50)                    null,
   MARCA                varchar(50)                    null,
   CATEGORIA            varchar(2)                     null,
   PESO                 varchar(70)                    null
);



/*==============================================================*/
/* Table: DETALLE_UBICACION_DRONE                               */
/*==============================================================*/
create table DETALLE_UBICACION_DRONE 
(
   ID_UBICACION         integer                        null,
   ALTURA               decimal                        null,
   LIMITE_NORTE         varchar(70)                    null,
   LIMITE_SUR           varchar(70)                    null,
   LIMITE_ESTE          varchar(70)                    null,
   LIMITE_OESTE         varchar(70)                    null,
   SUPERFICIE_ESTABLECIDA decimal                        null
);



/*==============================================================*/
/* Table: DRONE                                                 */
/*==============================================================*/
create table DRONE 
(
   ID_DRON              integer                        not null,
   ID_PILOTO            integer                        null,
   ID_TIPO_DRONE        integer                        null,
   PLACA                varchar(5)                     null,
   UTE_10               varchar(20)                    null,
   constraint PK_DRONE primary key (ID_DRON)
);




/*==============================================================*/
/* Table: ESTACION_MANEJO_DRONE                                 */
/*==============================================================*/
create table ESTACION_MANEJO_DRONE 
(
   ID_ESTACION          integer                        not null,
   ID_DRON              integer                        null,
   ID_PILOTO            integer                        null,
   NOMBRE_ESTACION      varchar(40)                    null,
   DIRECCION            varchar(70)                    null,
   constraint PK_ESTACION_MANEJO_DRONE primary key (ID_ESTACION)
);




/*==============================================================*/
/* Table: HORARIO_INCIDENCIA_DRONE                              */
/*==============================================================*/
create table HORARIO_INCIDENCIA_DRONE 
(
   ID_HORARIO_INCIDENCIA integer                        not null,
   ID_INCIDENCIA        integer                        null,
   HORA_INICIO          time                           null,
   HORA_FIN             time                           null,
   TURNO                varchar(50)                    null,
   FECHA                date                           null,
   constraint PK_HORARIO_INCIDENCIA_DRONE primary key (ID_HORARIO_INCIDENCIA)
);



/*==============================================================*/
/* Table: HORARIO_VIGILANCIA_DRONE                              */
/*==============================================================*/
create table HORARIO_VIGILANCIA_DRONE 
(
   ID_HORARIO_VIGILANCIA integer                        not null,
   ID_VIGILANCIA        integer                        null,
   HORA_INICIO          time                           null,
   HORA_FIN             time                           null,
   TURNO                varchar(50)                    null,
   FECHA                date                           null,
   constraint PK_HORARIO_VIGILANCIA_DRONE primary key (ID_HORARIO_VIGILANCIA)
);



/*==============================================================*/
/* Table: HORARIO_VUELO_DRONE                                   */
/*==============================================================*/
create table HORARIO_VUELO_DRONE 
(
   ID_HORARIO_VUELO     integer                        not null,
   ID_DRON              integer                        null,
   HORA_INICIO          time                           null,
   HORA_FIN             time                           null,
   TURNO                varchar(50)                    null,
   FECHA                date                           null,
   constraint PK_HORARIO_VUELO_DRONE primary key (ID_HORARIO_VUELO)
);


/*==============================================================*/
/* Table: INCIDENCIA_DRONE                                      */
/*==============================================================*/
create table INCIDENCIA_DRONE 
(
   ID_INCIDENCIA        integer                        not null,
   ID_DRON              integer                        null,
   DESCRIPCION_ANOMALIA varchar(100)                   not null,
   constraint PK_INCIDENCIA_DRONE primary key (ID_INCIDENCIA)
);



/*==============================================================*/
/* Table: PERMISO_MANEJO_PILOTO                                 */
/*==============================================================*/
create table PERMISO_MANEJO_PILOTO 
(
   ID_PILOTO            integer                        null,
   TIPO_LICENCIA        varchar(4)                     null,
   NOMBRE_CERTIFICADO_ESCUELA varchar(35)                    null
);



/*==============================================================*/
/* Table: PILOTO                                                */
/*==============================================================*/
create table PILOTO 
(
   ID_PILOTO            integer                        not null,
   CEDULA               varchar(10)                    null,
   NOMBRE               varchar(20)                    null,
   APELLIDO             varchar(50)                    null,
   CORREO               varchar(40)                    null,
   DIRECCION            varchar(70)                    null,
   constraint PK_PILOTO primary key (ID_PILOTO)
);



/*==============================================================*/
/* Table: RUTA_UBICACION_DRONE                                  */
/*==============================================================*/
create table RUTA_UBICACION_DRONE 
(
   ID_RUTA              integer                        not null,
   ID_UBICACION         integer                        null,
   AVENIDA_RECORRIDA_1  varchar(70)                    null,
   AVENIDA_RECORRIDA_2  varchar(70)                    null,
   SECTOR_RECORRIDO_1   varchar(70)                    null,
   SECTOR_RECORRIDO_2   varchar(70)                    null,
   constraint PK_RUTA_UBICACION_DRONE primary key (ID_RUTA)
);



/*==============================================================*/
/* Table: TIPO_DRONE                                            */
/*==============================================================*/
create table TIPO_DRONE 
(
   ID_TIPO_DRONE        integer                        not null,
   NOMBRE_DRONE         varchar(70)                    null,
   constraint PK_TIPO_DRONE primary key (ID_TIPO_DRONE)
);


/*==============================================================*/
/* Table: UBICACION_DRONE                                       */
/*==============================================================*/
create table UBICACION_DRONE 
(
   ID_UBICACION         integer                        not null,
   ID_DRON              integer                        null,
   LOCALIDAD            varchar(35)                    null,
   DESCRIPCION_UBICACION varchar(100)                   null,
   constraint PK_UBICACION_DRONE primary key (ID_UBICACION)
);



/*==============================================================*/
/* Table: VIGILANCIA_DRONE                                      */
/*==============================================================*/
create table VIGILANCIA_DRONE 
(
   ID_VIGILANCIA        integer                        not null,
   ID_DRON              integer                        null,
   DESCRIPCION_ACTIVIDAD_REALIZADA varchar(300)                   null,
   NUMERO_RONDAS        integer                        null,
   constraint PK_VIGILANCIA_DRONE primary key (ID_VIGILANCIA)
);


alter table DETALLE_DRONE
   add constraint FK_DETALLE__FK_DETALL_DRONE foreign key (ID_DRON)
      references DRONE (ID_DRON)
      on update restrict
      on delete restrict;

alter table DETALLE_UBICACION_DRONE
   add constraint FK_DETALLE__FK_DETALL_UBICACIO foreign key (ID_UBICACION)
      references UBICACION_DRONE (ID_UBICACION)
      on update restrict
      on delete restrict;

alter table DRONE
   add constraint FK_DRONE_FK_DRONE__PILOTO foreign key (ID_PILOTO)
      references PILOTO (ID_PILOTO)
      on update restrict
      on delete restrict;

alter table DRONE
   add constraint FK_DRONE_FK_DRONE__TIPO_DRO foreign key (ID_TIPO_DRONE)
      references TIPO_DRONE (ID_TIPO_DRONE)
      on update restrict
      on delete restrict;

alter table ESTACION_MANEJO_DRONE
   add constraint FK_ESTACION_FK_ESTACI_DRONE foreign key (ID_DRON)
      references DRONE (ID_DRON)
      on update restrict
      on delete restrict;

alter table ESTACION_MANEJO_DRONE
   add constraint FK_ESTACION_FK_ESTACI_PILOTO foreign key (ID_PILOTO)
      references PILOTO (ID_PILOTO)
      on update restrict
      on delete restrict;

alter table HORARIO_INCIDENCIA_DRONE
   add constraint FK_HORARIO__FK_HORARI_INCIDENC foreign key (ID_INCIDENCIA)
      references INCIDENCIA_DRONE (ID_INCIDENCIA)
      on update restrict
      on delete restrict;

alter table HORARIO_VIGILANCIA_DRONE
   add constraint FK_HORARIO__FK_HORARI_VIGILANC foreign key (ID_VIGILANCIA)
      references VIGILANCIA_DRONE (ID_VIGILANCIA)
      on update restrict
      on delete restrict;

alter table HORARIO_VUELO_DRONE
   add constraint FK_HORARIO__FK_HORARI_DRONE foreign key (ID_DRON)
      references DRONE (ID_DRON)
      on update restrict
      on delete restrict;

alter table INCIDENCIA_DRONE
   add constraint FK_INCIDENC_FK_INCIDE_DRONE foreign key (ID_DRON)
      references DRONE (ID_DRON)
      on update restrict
      on delete restrict;

alter table PERMISO_MANEJO_PILOTO
   add constraint FK_PERMISO__FK_PERMIS_PILOTO foreign key (ID_PILOTO)
      references PILOTO (ID_PILOTO)
      on update restrict
      on delete restrict;

alter table RUTA_UBICACION_DRONE
   add constraint FK_RUTA_UBI_FK_RUTA_U_UBICACIO foreign key (ID_UBICACION)
      references UBICACION_DRONE (ID_UBICACION)
      on update restrict
      on delete restrict;

alter table UBICACION_DRONE
   add constraint FK_UBICACIO_FK_UBICAC_DRONE foreign key (ID_DRON)
      references DRONE (ID_DRON)
      on update restrict
      on delete restrict;

alter table VIGILANCIA_DRONE
   add constraint FK_VIGILANC_FK_VIGILA_DRONE foreign key (ID_DRON)
      references DRONE (ID_DRON)
      on update restrict
      on delete restrict;

ALTER TABLE drone ADD COLUMN estado varchar(30);



-- INGRESO DE DATOS piloto
insert into piloto values(1, '1310742331','Ken Luis', 'Solorzano Delgado', 'ken10@gmail.com','La Dolorosa');
insert into piloto values(2, '1310742332','Renan Alexis', 'Cevallos Anzules', 'real20@gmail.com','Sta Monica');
insert into piloto values(3, '1310742333','Mirela Samantha', 'Delgado Martinez', 'mireli@gmail.com','Altamira');
insert into piloto values(4, '1310742334','Ramon Tomas', 'Ayala Calderon', 'ayalaramon2000@gmail.com','La Victoria');
insert into piloto values(5, '1310742335','Ricardo Eduardo', 'Zambrano Cedeño', 'rezc@gmail.com','San Agustin');
insert into piloto values(6, '1310742336','Jhon Alex', 'Cedeño Delgado', 'jacd@gmail.com','Altagracia');
insert into piloto values(7, '1310742337','Ariel Maria', 'Garces Alarcon', 'ari@gmail.com','Jockay');
insert into piloto values(8, '1310742338','Lionel Alfonso', 'Centeno Miranda', 'lio@gmail.com','La Aurora');



--INGRESO DE DATOS permiso_manejo_piloto
insert into permiso_manejo_piloto values(1, 'A2','Certificado de aprobacion FTO');
insert into permiso_manejo_piloto values(2, 'A2','Certificado de aprobacion FTO');
insert into permiso_manejo_piloto values(3, 'A3','Certificado de aprobacion FTO');
insert into permiso_manejo_piloto values(4, 'A3','Certificado de aprobacion FTO');
insert into permiso_manejo_piloto values(5, 'A2','Certificado de aprobacion FTO');
insert into permiso_manejo_piloto values(6, 'A2','Certificado de aprobacion FTO');
insert into permiso_manejo_piloto values(7, 'A3','Certificado de aprobacion FTO');
insert into permiso_manejo_piloto values(8, 'A3','Certificado de aprobacion FTO');



--INGRESO DE DATOS tipo_drone
insert into tipo_drone values(1,'Dron de Ala Fila');
insert into tipo_drone values(2,'Dron de Ala Fila');
insert into tipo_drone values(3,'Dron VTOL');
insert into tipo_drone values(4,'Dron Multicoptero');
insert into tipo_drone values(5,'Dron Cuadrirrotor');
insert into tipo_drone values(6,'Dron Octorrotor');



-- INGRESO DE DATOS drone
insert into drone values(1, 2, 3, 'ny-25', 'dronpin', 'BUENO');
insert into drone values(2, 2, 4, 'ny-26', 'dronpum', 'BUENO');
insert into drone values(3, 7, 5, 'ny-27', 'dronti', 'BUENO');
insert into drone values(4, 8, 6, 'ny-28', 'droncua', 'BUENO');
insert into drone values(5, 1, 6,  'ny-29', 'dronpp', 'BUENO');
insert into drone values(6, 5, 6,  'ny-30', 'drontt', 'BUENO');


--INGRESO DE DATOS detalle_drone
insert into detalle_drone values(1, 'The Orone Bird Company', 'Aves Series', 'Bird', 'C3', '25 Kg' );
insert into detalle_drone values(2, 'The Orone Bird Company', 'planet series', 'Bird', 'C4', '25 Kg' );
insert into detalle_drone values(3, 'Aeronautics', 'Orbiter 2', 'Aeronautics', 'C3', '25 Kg' );
insert into detalle_drone values(4, 'IDS', 'IA-3 Colibrí', 'IDS', 'C4', '25 Kg' );
insert into detalle_drone values(5, 'BlueBear', 'IStart', 'BlueBear', 'C4', '25 Kg' );
insert into detalle_drone values(6, 'SlidX', 'Black Manta Air', 'SlidX', 'C3', '25 Kg' );




-- INGRESO DE DATOS ubicacion_drone
insert into ubicacion_drone values(1, 3, 'Manta', 'Barrio Cuba');
insert into ubicacion_drone values(2, 4, 'Manta', 'Barrio Altagracia');
insert into ubicacion_drone values(3, 5, 'Manta', 'Barrio Cuba');
insert into ubicacion_drone values(4, 2, 'Manta', 'Barrio La Pradera');
insert into ubicacion_drone values(5, 1, 'Manta', 'Barrio La Aurora');
insert into ubicacion_drone values(6, 6, 'Manta', 'Barrio 4 de Noviembre');


--INGRESO DE DATOS detalle_ubicacion_drone
insert into detalle_ubicacion_drone values(1, 40.0, 'Barrio La Aurora', 'Sta Clara', 'Sta Ana', 'La Campiña', 140);
insert into detalle_ubicacion_drone values(2, 40.0, 'Marbella', 'Las Malvinas', 'Altamira', 'Elegole', 160);
insert into detalle_ubicacion_drone values(3, 40.0, 'Barrio La Aurora', 'Sta Clara', 'Sta Ana', 'La Campiña', 140);
insert into detalle_ubicacion_drone values(4, 40.0, 'Barrio Las Aquatas', 'Marbella', 'Montalvan', 'El Prado', 150);
insert into detalle_ubicacion_drone values(5, 40.0, 'Montalvan', 'Barrio Cuba', 'La 15 de abril', 'Marbella', 1.80);
insert into detalle_ubicacion_drone values(6, 40.0, 'Miraflores', 'La dolorosa', 'La interbarrial',
										   'La 8 de enero', 160);


--INGRESO DE DATOS ruta_ubicacion_drone
insert into ruta_ubicacion_drone values(1, 1, 'Av. Malecon', 'Av. 4 de noviembre', 'Tarqui', 'La Gul');
insert into ruta_ubicacion_drone values(2, 2, 'Av. malecon', 'Av. 4 de noviembre', 'Tarqui', 'Altamira');
insert into ruta_ubicacion_drone values(3, 3, 'Av. Circunvalacion', 'Av. Interbarrial ', 'San Pedro 2', 
										'San Pedro 1');
insert into ruta_ubicacion_drone values(4, 4, 'Av. Puerto Aeropuerto', 'Via Manta-Jaramijo', 'El palmar'
										, 'Costa Azul');
insert into ruta_ubicacion_drone values(5, 5, 'Via al Palmar', 'Via Manta-Montecristi', 'Calle 1', 'Calle 34 ');
insert into ruta_ubicacion_drone values(6, 6, 'Av. Interbarrial', 'Sin asignar', '9 de octubre', 'Sin asignar');


--INGRESO DE DATOS horario_vuelo_drone
insert into horario_vuelo_drone values(1, 3, '09:00:00', '13:00:00', 'Matutino', '2022/03/05');
insert into horario_vuelo_drone values(2, 5, '14:00:00', '18:00:00', 'Vespertino', '2022/03/05');
insert into horario_vuelo_drone values(3, 4, '08:00:00', '12:00:00', 'Matutino', '2022/03/10');
insert into horario_vuelo_drone values(4, 6, '09:00:00', '13:00:00', 'Matutino', '2022/04/11');
insert into horario_vuelo_drone values(5, 1, '16:00:00', '20:00:00', 'Vespertino', '2022/05/24');
insert into horario_vuelo_drone values(6, 2, '11:00:00', '13:00:00', 'Matutino', '2021/11/19');






--INGRESO DE DATOS vigilancia_drone
insert into vigilancia_drone values(1, 5, 'Se observo un accidente de transito entre una volqueta y una
									moto en la respectiva ubicacion', 6);
insert into vigilancia_drone values(2, 6, 'Se observo el robo de una bicicleta en la respectiva ubicacion', 6);
insert into vigilancia_drone values(3, 4, 'En la respectiva ubicacion todo se mantuvo normal sin ningun 
									inconveniente ', 6);
insert into vigilancia_drone values(4, 3, 'Se observo el accidente de una camioneta y un camion 
									en la respectiva ubicacion', 6);
insert into vigilancia_drone values(5, 2, 'Nada raro por la respectiva ubicacion', 6);
insert into vigilancia_drone values(6, 1, 'Se observo intento de robo de un almacen en la respectiva ubicacion', 6);




--IMGRESO DE DATOS horario_vigilancia_drone
insert into horario_vigilancia_drone values(1, 4, '13:00:00', '15:00:00', 'Vespertino', '2022/03/05');
insert into horario_vigilancia_drone values(2, 6, '20:00:00', '22:00:00', 'Nocturno', '2022/05/24');
insert into horario_vigilancia_drone values(3, 5, '13:00:00', '15:00:00', 'Vespertino', '2021/11/19');
insert into horario_vigilancia_drone values(4, 2, '13:00:00', '15:00:00', 'Vespertino', '2022/04/11');
insert into horario_vigilancia_drone values(5, 1, '18:00:00', '20:00:00', 'Nocturno', '2022/03/05');
insert into horario_vigilancia_drone values(6, 3, '12:00:00', '14:00:00', 'Vespertino', '2022/03/10');





--INGRESO DE DATOS incidencia_drone
insert into incidencia_drone values(1, 2, 'Falla en un brazo del drone');
insert into incidencia_drone values(2, 3, 'Averia del motor ');
insert into incidencia_drone values(3, 4, 'Firmware desactualizado');


--INGRESO DE DATOS horario_incidencia_drone
insert into horario_incidencia_drone values(1, 1, '10:00:00', '11:00:00', 'Matutino', '2022/05/05');
insert into horario_incidencia_drone values(2, 2, '08:00:00', '10:00:00', 'Matutino', '2022/05/28');
insert into horario_incidencia_drone values(3, 3, '11:00:00', '12:00:00', 'Matutino', '2022/06/01');




--INGRESO DE DATOS estacion_manejo_drone 
insert into estacion_manejo_drone values(1, 6, 2, 'Estacion Interbarrial', 'Interbarrial' );
insert into estacion_manejo_drone values(2, 5, 5, 'Estacion Circunvalacion', 'Circunvalacion' );
insert into estacion_manejo_drone values(3, 4, 7, 'Estacion Malecon', 'Malecon' );
insert into estacion_manejo_drone values(4, 3, 8, 'Estacion Puerto de Manta', 'Malecon' );
insert into estacion_manejo_drone values(5, 2, 1, 'Estacion playita mia', 'Tarqui' );
insert into estacion_manejo_drone values(6, 1, 2, 'Estacion Terminal Manta', 'El Palmar' );

