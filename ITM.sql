CREATE TABLE COMUNAS (
	ID INTEGER PRIMARY KEY,
	NOMBRE VARCHAR2(255)
)

INSERT INTO COMUNAS VALUES (1, 'POPULAR');
INSERT INTO COMUNAS VALUES (10, 'LA CANDELARIA');
INSERT INTO COMUNAS VALUES (11, 'LAURELES ESTADIO');
INSERT INTO COMUNAS VALUES (12, 'LA AMERICA');
INSERT INTO COMUNAS VALUES (13, 'SAN JAVIER');
INSERT INTO COMUNAS VALUES (14, 'POBLADO');
INSERT INTO COMUNAS VALUES (15, 'GUAYABAL');
INSERT INTO COMUNAS VALUES (16, 'BELÉN');
INSERT INTO COMUNAS VALUES (2, 'SANTA CRUZ');
INSERT INTO COMUNAS VALUES (3, 'MANRIQUE');
INSERT INTO COMUNAS VALUES (4, 'ARANJUEZ');
INSERT INTO COMUNAS VALUES (5, 'CASTILLA');
INSERT INTO COMUNAS VALUES (50, 'PALMITAS');
INSERT INTO COMUNAS VALUES (6, 'DOCE DE OCTUBRE');
INSERT INTO COMUNAS VALUES (60, 'SAN CRISTOBAL');
INSERT INTO COMUNAS VALUES (7, 'ROBLEDO');
INSERT INTO COMUNAS VALUES (70, 'ALTAVISTA');
INSERT INTO COMUNAS VALUES (8, 'VILLA HERMOSA');
INSERT INTO COMUNAS VALUES (80, 'SAN ANTONIO DE PRADO');
INSERT INTO COMUNAS VALUES (9, 'BUENOS AIRES');
INSERT INTO COMUNAS VALUES (90, 'SANTA ELENA');

create table colegios (
	id integer primary key,
	consecutivo_dane VARCHAR2(255),
	nombre_sede VARCHAR2(255),
	tipo_sede VARCHAR2(255),
	comuna_id INTEGER,
	prestacion_servicio VARCHAR2(255),
	zona VARCHAR2(255),
	barrio VARCHAR2(255),
	sector VARCHAR2(255),
	direccion_sede VARCHAR2(255),
	telefono_sede VARCHAR2(255),
	rector VARCHAR2(255),
	contador_prejardin_jardin INTEGER,
	contador_transicion INTEGER,
	contador_primaria INTEGER,
	contador_secundaria INTEGER,
	contador_media INTEGER,
	contador_adultos INTEGER,
	jornada_completa VARCHAR(8),
	jornada_manana VARCHAR(8),
	jornada_tarde VARCHAR(8),
	jornada_nocturna VARCHAR(8),
	jornada_fin_de_semana VARCHAR(8),
	jornada_unica VARCHAR(8),
	clasificacion_icfes VARCHAR(8),
	CONSTRAINT COMUNA_FK FOREIGN KEY (comuna_id) REFERENCES COMUNAS (ID)
);


SELECT * FROM COLEGIOS;

--QUERY 1
CREATE OR REPLACE VIEW QUERY1 as
SELECT NOMBRE_SEDE,  DIRECCION_SEDE, ZONA, CONTADOR_ADULTOS
FROM COLEGIOS
WHERE ZONA = 'Rural' AND  CLASIFICACION_ICFES <> 'N/A'
AND CONTADOR_ADULTOS > 10
WITH CHECK OPTION;

update QUERY1 set ZONA = 'Rural';

select * from QUERY1;


--QUERY2
create or replace view QUERY2 as
select RECTOR, COUNT(*) AS numero_colegios
from COLEGIOS
where rector <> 's/d' and rector not like '%@%'
group by rector
having count(*)>2
order by rector;

--NOTA: siempre que tenga order by, group by, analitics functions, inner join,  distinc no puedes actualizar las vistas

select * from QUERY1;



SELECT a.NOMBRE, 
       b.BARRIO,
       COUNT(*) NRO_COLEGIOS
       FROM comunas a
            INNER JOIN colegios b ON a.ID=b.comuna_id
       where a.NOMBRE = 'BUENOS AIRES'
       group by  a.NOMBRE, b.BARRIO
       order by NRO_COLEGIOS desc, a.NOMBRE, b.BARRIO;
       
select distinct(barrio), count(0) over (partition by barrio) numero_colegios
from colegios
inner join comunas on colegios.COMUNA_ID = comunas.ID
where comunas.NOMBRE = 'BUENOS AIRES'
order by numero_colegios desc;

--QUE ES EXPLA PLAN, TIPOS DE INDICES EN ORACLE
