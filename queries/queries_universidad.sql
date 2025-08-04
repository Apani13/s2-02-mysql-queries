USE universidad;

/* 1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes.
 El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.*/
 
 SELECT apellido1, apellido2, nombre
 FROM persona
 WHERE tipo = 'alumno'
 ORDER BY apellido1, apellido2, nombre;
 
/* 2. Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.*/

SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

/* 3. Retorna el llistat dels alumnes que van néixer en 1999.*/

SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

/* 4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades
 i a més el seu NIF acaba en K.*/
 
 SELECT apellido1, apellido2, nombre
 FROM persona
 WHERE tipo = 'profesor' AND telefono IS NULL AND UPPER(RIGHT(nif, 1)) = 'K';
 
/* 5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre,
 en el tercer curs del grau que té l'identificador 7.*/
 
 SELECT nombre
 FROM asignatura
 WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
 
/* 6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats.
 El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament.
 El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.*/
 
 SELECT p.apellido1, p.apellido2, p.nombre nombre, d.nombre nombre_departamento
 FROM persona p
 JOIN profesor pf ON p.id = pf.id_profesor
 JOIN departamento d ON pf.id_departamento = d.id
 ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
 
/* 7. Retorna un llistat amb el nom de les assignatures,
 any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.*/
 
 SELECT a.nombre, cc.anyo_inicio, cc.anyo_fin
 FROM persona p 
 JOIN alumno_se_matricula_asignatura am ON am.id_alumno = p.id
 JOIN curso_escolar cc ON cc.id = am.id_curso_escolar
 JOIN asignatura a ON a.id = am.id_asignatura
 WHERE p.nif = '26902806M';
 
 /* 8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen
 alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).*/
 
 SELECT DISTINCT d.nombre
 FROM departamento d
 JOIN profesor p ON p.id_departamento = d.id
 JOIN asignatura a ON a.id_profesor = p.id_profesor
 JOIN grado g ON g.id = a.id_grado
 WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
 
/* 9. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.*/

SELECT DISTINCT p.*
FROM persona p
JOIN alumno_se_matricula_asignatura am ON am.id_alumno = p.id
JOIN curso_escolar cc ON cc.id = am.id_curso_escolar
WHERE cc.anyo_inicio = 2018 AND cc.anyo_fin = 2019;


/*----------------------*/


/* 1. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats.
El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat.
El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. 
El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.*/

SELECT d.nombre, p.apellido1, p.apellido2, p.nombre 
FROM persona p
LEFT JOIN profesor pf ON pf.id_profesor = p.id
LEFT JOIN departamento d ON d.id = pf.id_departamento
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

/* 2. Retorna un llistat amb els professors/es que no estan associats a un departament.*/

SELECT p.nombre
FROM persona p
LEFT JOIN profesor pf ON pf.id_profesor = p.id
LEFT JOIN departamento d ON d.id = pf.id_departamento
WHERE pf.id_departamento IS NULL AND persona = 'profesor';

/* 3. Retorna un llistat amb els departaments que no tenen professors/es associats.*/

SELECT d.nombre
FROM departamento d
LEFT JOIN profesor pf ON pf.id_departamento = d.id
WHERE pf.id_profesor IS NULL;

/* 4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.*/

SELECT p.nombre
FROM persona p
LEFT JOIN profesor pf ON pf.id_profesor = p.id
LEFT JOIN asignatura a ON a.id_profesor = pf.id_profesor
WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL;

/* 5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.*/

SELECT nombre 
FROM asignatura
WHERE id_profesor IS NULL;

SELECT a.nombre
FROM asignatura a
LEFT JOIN profesor pf ON pf.id_profesor = a.id_profesor
WHERE a.id_profesor IS NULL;

/* 6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.*/

SELECT DISTINCT d.nombre departamento 
FROM departamento d 
LEFT JOIN profesor pr ON pr.id_departamento = d.id 
LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor 
WHERE a.id_profesor IS NULL;

/*---------------------*/


/* 1. Retorna el nombre total d'alumnes que hi ha.*/

SELECT COUNT(*) numero_alumnos
FROM persona
WHERE tipo = 'alumno';

/* 2. Calcula quants alumnes van néixer en 1999.*/

SELECT COUNT(*) alumnos_nacidos_1999
FROM persona
WHERE tipo = 'alumno' AND LEFT(fecha_nacimiento, 4) = 1999;

/* 3. Calcula quants professors/es hi ha en cada departament.
 El resultat només ha de mostrar dues columnes, una amb el nom del departament 
 i una altra amb el nombre de professors/es que hi ha en aquest departament.
 El resultat només ha d'incloure els departaments que tenen professors/es associats
 i haurà d'estar ordenat de major a menor pel nombre de professors/es.*/
 
 SELECT d.nombre, COUNT(pf.id_profesor) numero_profesores
 FROM departamento d
 JOIN profesor pf ON pf.id_departamento = d.id
 GROUP BY d.nombre
 ORDER BY numero_profesores DESC;
 
/* 4. Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells.
 Tingui en compte que poden existir departaments que no tenen professors/es associats.
 Aquests departaments també han d'aparèixer en el llistat.*/
 
SELECT d.nombre, COUNT(pf.id_profesor) numero_profesores
FROM departamento d
LEFT JOIN profesor pf ON pf.id_departamento = d.id 
GROUP BY d.nombre;
 
 
/* 5. Retorna un llistat amb el nom de tots els graus existents en la base de dades
i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades.
Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.*/

SELECT g.nombre, COUNT(a.id) numero_asignaturas
FROM grado g
LEFT JOIN asignatura a ON a.id_grado = g.id
GROUP BY g.nombre
ORDER BY numero_asignaturas DESC;
