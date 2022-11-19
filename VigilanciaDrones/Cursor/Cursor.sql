--Determinar mediante un cursor cuantos drones  tiene y que rutas ha recorrido cada piloto operando el drone
DO $$
DECLARE 
      REGISTRO RECORD;
	  CUR_PILOTOS CURSOR FOR
                        
                   SELECT 
                   PILOTO.NOMBRE AS NOMBRES,
                   PILOTO.APELLIDO AS APELLIDOS,
                   COUNT (DRONE) AS NUMERO_DE_DRONES,
                   RUTA_UBICACION_DRONE.AVENIDA_RECORRIDA_1 AS PRIMERA_AVENIDA,
                   RUTA_UBICACION_DRONE.AVENIDA_RECORRIDA_2 AS SEDUNDA_AVENDIDA,
                   RUTA_UBICACION_DRONE.SECTOR_RECORRIDO_1 AS SECTOR_1,
                   RUTA_UBICACION_DRONE.SECTOR_RECORRIDO_2 AS SECTOR_2
                   FROM PILOTO
                   INNER JOIN DRONE ON PILOTO.ID_PILOTO = DRONE.ID_DRON
                   INNER JOIN UBICACION_DRONE ON DRONE.ID_DRON = UBICACION_DRONE.ID_UBICACION
                   INNER JOIN RUTA_UBICACION_DRONE ON UBICACION_DRONE.ID_UBICACION = RUTA_UBICACION_DRONE.ID_RUTA
                   GROUP BY PILOTO.NOMBRE,PILOTO.APELLIDO,RUTA_UBICACION_DRONE.AVENIDA_RECORRIDA_1,RUTA_UBICACION_DRONE.AVENIDA_RECORRIDA_2,
                   RUTA_UBICACION_DRONE.SECTOR_RECORRIDO_1 ,RUTA_UBICACION_DRONE.SECTOR_RECORRIDO_2;
BEGIN 
OPEN CUR_PILOTOS;
FETCH CUR_PILOTOS INTO REGISTRO;
WHILE (FOUND)LOOP 
RAISE NOTICE 'NOMBRES: % ,APELLIDOS: %
,NUMERO_DE_DRONES: % ,PRIMERA_AVENIDA: % ,SEDUNDA_AVENDIDA: % ,SECTOR_1: % ,SECTOR_2: %',
REGISTRO.NOMBRES,
REGISTRO.APELLIDOS,
REGISTRO.NUMERO_DE_DRONES,
REGISTRO.PRIMERA_AVENIDA,
REGISTRO.SEDUNDA_AVENDIDA,
REGISTRO.SECTOR_1,
REGISTRO.SECTOR_2;
FETCH CUR_PILOTOS INTO REGISTRO;
END LOOP; 
END $$
LANGUAGE PLPGSQL;


 