
use tienda;
/*
1. Lista el nombre de todos los productos que hay en la tabla producto.
2. Lista los nombres y los precios de todos los productos de la tabla producto.
3. Lista todas las columnas de la tabla producto.
4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando
el valor del precio.
5. Lista el código de los fabricantes que tienen productos en la tabla producto.
6. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar
los repetidos.
7. Lista los nombres de los fabricantes ordenados de forma ascendente.
8. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma
ascendente y en segundo lugar por el precio de forma descendente.
9. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
10. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas
ORDER BY y LIMIT)
11. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER
BY y LIMIT)
12. Lista el nombre de los productos que tienen un precio menor o igual a $120.
13. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador
BETWEEN.
14. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador
IN.
15. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil
en el nombre.
*/
-- 1Lista el nombre de todos los productos que hay en la tabla producto.
select nombre from producto; 
-- 2
select nombre, precio from producto;
-- 3
select* from producto;
/*4. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando
el valor del precio.*/
select round(precio), nombre from producto; 

/*5. Lista el código de los fabricantes que tienen productos en la tabla producto.*/
select * from fabricante;
select fabricante.nombre from fabricante , producto  where fabricante.codigo = producto.codigo_fabricante;
select f.nombre from fabricante f where not exists (
	Select p.codigo_fabricante from producto p where p.codigo_fabricante = f.codigo
);

select p.codigo_fabricante, p.nombre, f.nombre from producto p, fabricante f where p.codigo_fabricante =  f.codigo;
select * from fabricante;
/*6. Lista el código de los fabricantes que tienen productos en la tabla producto, sin mostrar
los repetidos.*/

select codigo_fabricante as 'Codigo de Fabricante', count(f.nombre) as 'Cantidad de Fabricantes' from producto p, fabricante f where f.codigo = p.codigo_fabricante group by codigo_fabricante; 

/*7. Lista los nombres de los fabricantes ordenados de forma ascendente.
*/

select nombre from fabricante order by nombre;

/*8. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma
ascendente y en segundo lugar por el precio de forma descendente.
*/
select nombre, precio from producto order by nombre asc, precio desc;
/*
9. Devuelve una lista con las 5 primeras filas de la tabla fabricante.*/
select * from fabricante f limit 5;
/*
10. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas
ORDER BY y LIMIT)*/
select nombre, precio from producto order by precio limit 1;
/*
11. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER
BY y LIMIT)*/
select * from producto;
select nombre, precio from producto order by precio desc limit 1;
/*
12. Lista el nombre de los productos que tienen un precio menor o igual a $120.
*/
select nombre, precio
from producto 
where precio<=120
order by precio;
/*
13. Lista todos los productos que tengan un precio entre $60 y $200. Utilizando el operador
BETWEEN.*/
select nombre, precio
from producto 
where precio between 60 and 200;
/*
14. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador
IN.*/
select nombre, codigo_fabricante from producto where codigo_fabricante in (1, 3, 5);
/*
15. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil
en el nombre.*/
select nombre from producto where nombre like 'Portatil%';
select nombre from producto;

/*Consultas Multitabla
1. Devuelve una lista con el código del producto, nombre del producto, código del fabricante
y nombre del fabricante, de todos los productos de la base de datos.*/
select p.codigo, p.nombre, p.codigo_fabricante, f.nombre, p.precio
from producto p, fabricante f where f.codigo = p.codigo_fabricante;
/*
2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos
los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por
orden alfabético.*/
select p.nombre, p.precio, f.nombre
from producto p, fabricante f where f.codigo = p.codigo_fabricante order by f.nombre asc;
/*
3. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto
más barato.*/
select p.nombre, p.precio, f.nombre
from producto p, fabricante f where f.codigo = p.codigo_fabricante order by p.precio limit 1;
/*
4. Devuelve una lista de todos los productos del fabricante Lenovo.*/
select p.nombre, f.nombre from producto p, fabricante f where f.nombre = 'Lenovo' and f.codigo = p.codigo_fabricante;
/*
5. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio
mayor que $200.*/
select p.nombre, p.precio, f.nombre from producto p, fabricante f where f.nombre = 'Crucial' and  precio>200 and f.codigo = p.codigo_fabricante;
/*
6. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard.
Utilizando el operador IN.*/
select p.nombre, f.nombre from producto p, fabricante f where f.nombre in ('Asus','Hewlett-Packard') and f.codigo = p.codigo_fabricante;
/*
7. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos
los productos que tengan un precio mayor o igual a $180. Ordene el resultado en primer
lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden
ascendente)*/
select p.nombre, p.precio, f.nombre from producto p, fabricante f where  f.codigo = p.codigo_fabricante and precio>=180 order by p.precio desc, p.nombre asc ;

/*Consultas Multitabla
Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los
productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos
fabricantes que no tienen productos asociados.*/
select f.nombre as 'Nombre de Fabricante', p.nombre as 'Nombre de Producto'from fabricante f  left join producto p on f.codigo = p.codigo_fabricante;
/*
2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún
producto asociado.*/
SELECT f.nombre
FROM fabricante f
LEFT JOIN producto p
ON f.codigo = p.codigo_fabricante
WHERE p.codigo_fabricante IS NULL;
select f.nombre from fabricante f where not exists (
	Select p.codigo_fabricante from producto p where p.codigo_fabricante = f.codigo
);

/*Subconsultas (En la cláusula WHERE)
Con operadores básicos de comparación
1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).*/
select p.nombre, f.nombre from producto p, fabricante f where f.nombre='Lenovo';
select p.nombre from producto p where (select f.nombre='Lenovo' from fabricante f where f.nombre='Lenovo');
/*
2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto
más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).*/

select p.nombre, p.precio from producto p where p.precio = (select p.precio from fabricante f, producto p where f.nombre ='Lenovo' order by p.precio desc limit 1);
/*
3. Lista el nombre del producto más caro del fabricante Lenovo.*/
select p.precio from producto p where (select nombre='Lenovo' from fabricante where nombre='Lenovo') order by p.precio desc limit 1;
/*
4. Lista todos los productos del fabricante Asus que tienen un precio superior al precio
medio de todos sus productos.
*/

select avg(p.precio) as 'Promedio de precios de Asus' from producto p, fabricante f where f.nombre='Asus';
select p.precio, f.nombre from fabricante f, producto p where f.nombre = 'Asus';
select p.nombre , p.precio from producto p, fabricante f where p.precio> (select avg(p.precio) as 'Promedio de precios de Asus' from producto p, fabricante f where f.nombre='Asus') and f.nombre = 'Asus'; 
/*Subconsultas con IN y NOT IN
1. Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o
NOT IN).*/
SELECT nombre FROM fabricante WHERE codigo IN (SELECT codigo_fabricante FROM producto);
/*
2. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando
IN o NOT IN).*/
 select nombre from fabricante where codigo not in (select codigo_fabricante from producto);
/*
Subconsultas (En la cláusula HAVING)
1. Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número
de productos que el fabricante Lenovo.*/
select p.nombre, f.nombre from producto p, fabricante f where f.nombre='Lenovo';
select count(p.nombre) from producto p, fabricante f where f.nombre = 'Lenovo';
select f.nombre, count(p.nombre) as 'Cant de productos' from fabricante f, producto p group by f.nombre having( count(p.nombre) = (select count(p.nombre) from producto p, fabricante f where f.nombre = 'Lenovo')); 
select*from producto;
