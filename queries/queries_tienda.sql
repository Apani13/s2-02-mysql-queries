USE tienda;

/* 1. Llista el nom de tots els productes que hi ha en la taula producto.*/
SELECT nombre 
FROM producto;

/* 2. Llista els noms i els preus de tots els productes de la taula producto.*/
SELECT nombre, precio
FROM producto;

/* 3. Llista totes les columnes de la taula producto.*/
SELECT * 
FROM producto;

/* 4. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).*/
SELECT nombre, precio , ROUND(precio * 1.12, 2) FROM producto;

/* 5. Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
 Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.*/
 SELECT nombre AS 'nom de producto', precio AS 'euros', ROUND(precio * 1.12, 2) AS 'dòlars' FROM producto;
 
/* 6. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.*/
SELECT UPPER(nombre) nombre, precio FROM producto;

/* 7. Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.*/
SELECT LOWER(nombre) nombre, precio FROM producto;

/* 8. Llista el nom de tots els fabricants en una columna,
i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.*/
SELECT nombre, UPPER(LEFT(nombre, 2)) AS iniciales FROM fabricante;

/* 9. Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.*/
SELECT nombre, ROUND(precio) AS 'Precio redondeado' FROM producto;

/* 10. Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.*/
SELECT TRUNCATE(precio, 0)  AS 'Precio sin decimales' FROM producto;

/* 11. Llista el codi dels fabricants que tenen productes en la taula producto.*/
SELECT f.codigo
FROM fabricante AS f
JOIN producto AS p
ON p.codigo_fabricante = f.codigo;

/* 12. Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.*/
SELECT DISTINCT f.codigo
FROM fabricante AS f
JOIN producto AS p
ON p.codigo_fabricante = f.codigo;

/* 13. Llista els noms dels fabricants ordenats de manera ascendent.*/
SELECT nombre
FROM fabricante
ORDER BY nombre ASC;
 
 /* 14. Llista els noms dels fabricants ordenats de manera descendent.*/
 SELECT nombre
 FROM fabricante
 ORDER BY nombre DESC;
 
 /* 15. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i,
 en segon lloc, pel preu de manera descendent.*/
 SELECT nombre, precio
 FROM producto
 ORDER BY nombre ASC, precio DESC;
 
 /* 16. Retorna una llista amb les 5 primeres files de la taula fabricante.*/
 SELECT *
 FROM fabricante
 LIMIT 5;
 
 /* 17. Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante.
 La quarta fila també s'ha d'incloure en la resposta.*/
 SELECT *
 FROM fabricante
 LIMIT 2
 OFFSET 3;
 
 /* 18. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT).
 NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.*/
 SELECT nombre, precio
 FROM producto
 ORDER BY precio ASC
 LIMIT 1;
 
 /* 19. Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT).
 NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.*/
 SELECT nombre, precio
 FROM producto
 ORDER BY precio DESC
 LIMIT 1;
 
 /* 20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.*/
 SELECT nombre
 FROM producto
 WHERE codigo_fabricate = 2;
 
 






