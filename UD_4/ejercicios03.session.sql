-- Elimina la base de datos si ya existe
drop database if exists basketball_db;

-- Crea la base de datos
create database basketball_db;
use basketball_db;

-- Tabla equipos
-- Crea la tabla equipos con las columnas:
-- id (entero, clave primaria)
-- nombre (nombre del equipo)
-- ciudad (ciudad del equipo)
-- campeonatos (cantidad de campeonatos ganados)
create table equipos (
    id int primary key,
    nombre varchar(50),
    ciudad varchar(50),
    campeonatos int
);

-- Inserta registros de ejemplo en la tabla equipos
insert into equipos values
(1, 'Lakers', 'Los Angeles', 17),
(2, 'Warriors', 'San Francisco', 7),
(3, 'Celtics', 'Boston', 17),
(4, 'Heat', 'Miami', 3),
(5, 'Bulls', 'Chicago', 6),
(6, 'Spurs', 'San Antonio', 5),
(7, 'Knicks', 'New York', 2),
(8, 'Mavericks', 'Dallas', 1),
(9, 'Raptors', 'Toronto', 1),
(10, 'Suns', 'Phoenix', 0);

-- Tabla jugadores
-- Crea la tabla jugadores con las columnas:
-- id (entero, clave primaria)
-- nombre (nombre del jugador)
-- equipo_id (clave foránea que hace referencia a la tabla equipos)
-- puntos_por_juego (promedio de puntos por juego)
-- asistencias_por_juego (promedio de asistencias por juego)
create table jugadores (
    id int primary key,
    nombre varchar(50),
    equipo_id int,
    puntos_por_juego decimal(5, 2),
    asistencias_por_juego decimal(5, 2),
    foreign key (equipo_id) references equipos(id)
);

-- Inserta registros de ejemplo en la tabla jugadores
insert into jugadores values
(1, 'LeBron James', 1, 27.2, 7.3),
(2, 'Stephen Curry', 2, 24.6, 6.5),
(3, 'Jayson Tatum', 3, 22.8, 3.3),
(4, 'Jimmy Butler', 4, 18.8, 4.0),
(5, 'Zach LaVine', 5, 20.3, 4.5),
(6, 'Tim Duncan', 6, 19.0, 3.0),
(7, 'Julius Randle', 7, 19.5, 3.7),
(8, 'Luka Doncic', 8, 27.9, 8.6),
(9, 'Pascal Siakam', 9, 21.2, 3.9),
(10, 'Devin Booker', 10, 24.0, 4.4);

-- Ejercicios para practicar AS y ORDER BY

-- 1. Recupera los nombres de los equipos y su ciudad, usando alias para los nombres de las columnas.
SELECT 
    nombre AS 'nombre_equipos',
    ciudad AS 'sede'
FROM equipos;

-- 2. Muestra los nombres de los jugadores y su promedio de puntos por juego, ordenados de mayor a menor.
SELECT
    nombre AS 'Nombre Jugador',
    puntos_por_juego AS 'Promedio Puntos'
FROM jugadores
ORDER BY puntos_por_juego DESC;

-- 3. Recupera los nombres de los equipos y la longitud de sus nombres, ordenados por esta longitud de mayor a menor.
SELECT
    nombre AS nombre_equipo,
    CHAR_LENGTH(nombre) AS longitud_palabra
FROM equipos
ORDER BY longitud_palabra DESC;

-- 4. Muestra los nombres de las ciudades y la suma total de campeonatos ganados por equipos en cada ciudad, ordenados por la suma de mayor a menor.
SELECT
    ciudad AS nombre_ciudades,
    SUM(campeonatos) AS suma_campeonatos
FROM equipos
GROUP BY nombre_ciudades
ORDER BY suma_campeonatos DESC;