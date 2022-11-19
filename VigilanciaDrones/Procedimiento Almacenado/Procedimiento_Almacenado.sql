Procedimiento almacenado que al ingresar el nombre del piloto me muestre el numero de incidencias que ha tenido. 
CREATE FUNCTION BuscarIncidencias (Varchar) RETURNS BIGINT 
AS 
$$
           SELECT
           COUNT (INCIDENCIA_DRONE)DESCRIPCION_ANOMALIA
		   FROM PILOTO
           INNER JOIN DRONE ON PILOTO.ID_PILOTO = DRONE.ID_DRON
           INNER JOIN INCIDENCIA_DRONE ON DRONE.ID_DRON = INCIDENCIA_DRONE.ID_INCIDENCIA
		   WHERE PILOTO.NOMBRE =$1
           GROUP BY INCIDENCIA_DRONE
$$
LANGUAGE SQL ;

SELECT BuscarIncidencias ('Ken Luis');
SELECT BuscarIncidencias ('Mirela Samantha');
