-- CONSULTA 1

select u.descripcion_ubicacion as nombre_barrio, 
d.nombre_drone || ' ' || d.placa as nombre_drone,

v.descripcion_actividad_realizada as actividad_desarrollada_realizada
from 
drone d
 
inner join ubicacion_drone u on d.id_dron = u.id_dron 

inner join vigilancia_drone v on d.id_dron = v.id_dron;


--CONSULTA 2

select  hdr.turno, 
dr.nombre_drone || ' ' || dr.placa as nombre_drone,

pi.nombre || ' ' || pi.apellido as piloto,
hdr.hora_inicio as partida, hdr.hora_fin as llegada,
 hdr.fecha
from piloto pi inner join drone dr
on pi.id_piloto = dr.id_piloto inner join vigilancia_drone vdr 
on dr.id_dron = vdr.id_dron
inner join horario_vuelo_drone hdr on
dr.id_dron = hdr.id_dron
 where  EXTRACT(year FROM hdr.fecha) = 2022 
and  
EXTRACT(MONTH FROM hdr.fecha) >= '1' and  EXTRACT(MONTH FROM hdr.fecha) <= '6';




--CONSULTA 3

select vdr.descripcion_actividad_realizada as actividad_realizada,

vdr.numero_rondas, hvr.hora_inicio as partida, hvr.hora_fin as llegada,
hvr.turno, 
hvr.fecha, pi.nombre || ' ' || pi.apellido as piloto 
from vigilancia_drone vdr 
join drone dr on dr.id_dron = vdr.id_dron
join piloto pi on pi.id_piloto = dr.id_piloto 
join horario_vigilancia_drone hvr
on vdr.id_vigilancia = hvr.id_vigilancia
 where  EXTRACT(MONTH FROM hvr.fecha) = '4';



--CONSULTA 4

select d.nombre_drone || ' ' || d.placa as drone,
 ind.descripcion_anomalia as descripcion_incidencia,

h.fecha as fecha_de_realizacion
from drone d 

inner join incidencia_drone ind on d.id_dron = ind.id_dron 

inner join horario_incidencia_drone h on ind.id_incidencia = h.id_incidencia
