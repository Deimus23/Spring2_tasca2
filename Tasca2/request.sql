USE tienda;
-- 1 Lista el nombre de todos los productos.
select nombre from producto;
-- 2 Lista el nombre y el precio en los productos.
select nombre ,precio from producto;
-- 3 Lista todas las columnas de los productos.
show columns from producto;
-- 4 Lista el nombre el precio en euros y en dolares.
select nombre,precio ,round(precio*4,2) from producto;
-- 5 Lista el nombre el precio en euros y en dolares(nombre producto,euros,dolares).
select nombre as nombreProducto,precio as euros, round(precio*4,2) as dolar from producto;
-- 6 Lista el nombre y el precio de todos los productos en Mayúsculas.
select upper(nombre) as nombreMayusculas, precio from producto;
-- 7 lista el nombre y el precio de todos los productos en minúscula.
select lower(nombre) as nombreMinusculas, precio from producto;
-- 8 lista el nombre de los fabricantes en una columna i en otra las dos primeras letras en Mayúscula.
select nombre , upper(substring(nombre,1,2)) as inicialesMayúsculas from fabricante;
-- 9 Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre ,round(precio)as precioRedondeado from producto;
-- 10 Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre, truncate(precio,0)as precioTruncado from producto;
-- 11 Lista el código de los fabricantes que tienen productos en la tabla producto.
select  codigo_fabricante from producto;
-- 12 Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
select distinct codigo_fabricante from producto;
-- 13 Lista los nombres de los fabricantes ordenados de manera ascendente.
select nombre from fabricante order by nombre asc;
-- 14 Lista los nombres de los fabricantes ordenados de manera descendente.
select nombre from fabricante order by nombre desc;
-- 15 Lista los nombres de los productos ordenados, en primer lugar, por el nombre de manera ascendente y, en segundo lugar, por el precio de manera descendente
select nombre  and precio from producto order by nombre asc , precio desc;
-- 16 Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
-- 17 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
select * from fabricante limit 2 offset 3;

USE universidad;
-- 1 Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1, apellido2, nombre ASC;
-- 2 Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
-- 3 Devuelve el listado de los alumnos que nacieron en 1999."
SELECT apellido1, apellido2, nombre, fecha_nacimiento  FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento LIKE '1999%' ORDER BY apellido1, apellido2, nombre ASC;
-- 4 Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y, además, su NIF termina en K
SELECT * FROM persona  WHERE tipo = 'profesor' AND (telefono IS NULL OR telefono = '') AND nif LIKE '%K';
-- 5 Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7
SELECT asignatura.nombre FROM asignatura WHERE asignatura.id_grado = 7 AND asignatura.curso = 3 AND asignatura.cuatrimestre = 1 ORDER BY asignatura.nombre ASC;
-- 6 Devuelve un listado de los/las profesores/as junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas: primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre
SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre AS department FROM persona JOIN profesor ON persona.id = profesor.id_profesor JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY persona.apellido1, persona.apellido2, persona.nombre;
-- 7 Retorna un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT asignatura.nombre AS subject, curso_escolar.anyo_inicio AS start, curso_escolar.anyo_fin AS end FROM alumno_se_matricula_asignatura JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE persona.nif = '26902806M';
-- 8 Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT grado.nombre AS degree, departamento.nombre AS department FROM departamento JOIN profesor ON departamento.id = profesor.id_departamento JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
-- 9 Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT persona.id AS id, CONCAT(persona.nombre, ' ', persona.apellido1, ' ', persona.apellido2) AS student, persona.nif FROM persona JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019 AND persona.tipo = 'alumno';
-- Left join/ right join
-- 1 Devuelve un listado con los nombres de todos los profesores/as y los departamentos a los que están vinculados. El listado también debe mostrar a aquellos profesores/as que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas: nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a. El resultado debe estar ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT departamento.nombre AS department , persona.apellido1 AS 'first surname', persona.apellido2 AS 'second surname', persona.nombre AS name FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor'  OR profesor.id_profesor IS NULL ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
-- 2 Devuelve un listado con los profesores/as que no están asociados a ningún departamento.
SELECT departamento.nombre AS department , persona.apellido1 AS 'first surname', persona.apellido2 AS 'second surname', persona.nombre AS name FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento RIGHT JOIN persona ON profesor.id_profesor = persona.id WHERE persona.tipo = 'profesor'  OR profesor.id_profesor IS NULL ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
-- 3 Retorna un listado con los departamentos que no tienen profesores/as asociados.
SELECT departamento.nombre AS department, CONCAT(persona.nombre, ' ', persona.apellido1, ' ', persona.apellido2) AS instructor FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
-- 4 Retorna un listado con los profesores/as que no imparten ninguna asignatura.
SELECT departamento.nombre AS department , persona.apellido1 AS 'first surname', persona.apellido2 AS 'second surname', persona.nombre AS name FROM departamento RIGHT JOIN profesor ON departamento.id = profesor.id_departamento RIGHT JOIN persona ON profesor.id_profesor = persona.id WHERE profesor.id_profesor IS NULL ORDER BY departamento.nombre ASC, persona.apellido1 ASC, persona.apellido2 ASC, persona.nombre ASC;
-- 5 Devuelve un listado con los profesores/as que no están asociados a ningún departamento.
SELECT departamento.nombre AS department, profesor.id_departamento AS 'instructor' FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_departamento IS NULL ORDER BY departamento.nombre ASC;
-- 6 Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT departamento.nombre AS department, profesor.id_departamento AS 'instructor' FROM profesor RIGHT JOIN departamento ON profesor.id_departamento = departamento.id WHERE profesor.id_departamento IS NULL ORDER BY departamento.nombre ASC;
-- Consultas resumen
-- 1 Devuelve el numero total de alumnos que hay.
SELECT COUNT(*) FROM persona WHERE tipo ='alumno';
-- 2  Calcula el numero de alumnos que ha nacido 1999.
SELECT COUNT(*) FROM persona WHERE tipo='alumno'AND fecha_nacimiento = 1999;
-- 3 Calcula cuántos profesores/as hay en cada departamento. El resultado solo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores/as que hay en dicho departamento. El resultado solo debe incluir los departamentos que tienen profesores/as asociados y debe estar ordenado de mayor a menor por el número de profesores/as.
SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre Order BY COUNT(profesor.id_profesor) desc;
-- 4 Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores/as asociados. Estos departamentos también deben aparecer en el listado.
SELECT departamento.nombre, COUNT(profesor.id_profesor) FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento GROUP BY departamento.nombre;
-- 5 Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Ten en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también deben aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT grado.nombre, COUNT(asignatura.id_grado) FROM grado LEFT JOIN asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre Order BY COUNT(asignatura.id_grado) desc;
