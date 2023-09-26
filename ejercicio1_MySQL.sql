-- Obtener los datos completos de los empleados.
select * from personal.empleados;
-- Obtener los datos completos de los departamentos.
select * from departamentos;
-- Listar el nombre de los departamentos.
select nombre_depto from departamentos;
-- Obtener el nombre y salario de todos los empleados.
select nombre, sal_emp from empleados;
-- Listar todas las comisiones.
select comision_emp from empleados;
-- Obtener los datos de los empleados cuyo cargo sea ‘Secretaria’.
select * from empleados where cargo_emp = 'Secretaria';
-- Obtener los datos de los empleados vendedores, ordenados por nombre alfabéticamente.
select * from empleados where cargo_emp = 'Vendedor' order by nombre ASC;
-- Obtener el nombre y cargo de todos los empleados, ordenados por salario de menor a mayor.
select nombre, cargo_emp, sal_emp from empleados order by sal_emp ASC;
-- Obtener el nombre de o de los jefes que tengan su departamento situado en la ciudad de “Ciudad Real”
select nombre_jefe_depto from departamentos where ciudad = 'CIUDAD REAL';
-- Elabore un listado donde para cada fila, figure el alias ‘Nombre’ y ‘Cargo’ para las respectivas tablas de empleados.
select nombre as 'Nombre', cargo_emp as 'Cargo' from empleados;
-- Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión de menor a mayor.
select sal_emp as 'Salario', comision_emp as 'Comision' from empleados where id_depto = 2000 order by comision_emp ASC;
-- Obtener el valor total a pagar a cada empleado del departamento 3000, que resulta
-- de: sumar el salario y la comisión, más una bonificación de 500. Mostrar el nombre del
-- empleado y el total a pagar, en orden alfabético.
select nombre, (sal_emp + 500 + comision_emp) as Total, sal_emp, comision_emp from empleados where id_depto = 3000 order by nombre;
-- Muestra los empleados cuyo nombre empiece con la letra J.
SELECT nombre FROM empleados WHERE nombre LIKE 'J%';
-- Listar el salario, la comisión, el salario total (salario + comisión) y nombre, de aquellos
-- empleados que tienen comisión superior a 1000.
select sal_emp, comision_emp, (sal_emp+comision_emp) as Total, nombre from empleados where comision_emp > 1000;
-- Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión.
select sal_emp, comision_emp, (sal_emp+comision_emp) as Total, nombre from empleados where comision_emp = 0;
-- Obtener la lista de los empleados que ganan una comisión superior a su sueldo.
select nombre, comision_emp, sal_emp from empleados where comision_emp > sal_emp;
-- Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
select nombre, comision_emp, (sal_emp*0.3) as '30%' from empleados where comision_emp <= sal_emp*0.3;
-- Hallar los empleados cuyo nombre no contiene la cadena “MA”
select nombre from empleados where nombre NOT LIKE '%ma%';
-- Obtener los nombres de los departamentos que sean “Ventas”, “Investigación” o ‘Mantenimiento.
select nombre, cargo_emp from empleados where cargo_emp IN ('Vendedor', 'Investigador', 'Tecnico'); 
-- Ahora obtener el contrario, los nombres de los departamentos que no sean “Ventas” ni “Investigación” ni ‘Mantenimiento.
select nombre, cargo_emp from empleados where cargo_emp NOT IN ('Vendedor', 'Investigador', 'Tecnico');
-- Mostrar el salario más alto de la empresa.
select max(sal_emp) as 'Salario mas alto' from empleados;
-- Mostrar el nombre del último empleado de la lista por orden alfabético.
select max(nombre) from empleados;
-- Hallar el salario más alto, el más bajo y la diferencia entre ellos.
select max(sal_emp), min(sal_emp), (max(sal_emp) - min(sal_emp)) from empleados;
-- Hallar el salario promedio por departamento.
select avg(sal_emp) as Promedio, id_depto from empleados group by id_depto;
-- Hallar los departamentos que tienen más de tres empleados. Mostrar el número de empleados de esos departamentos.
SELECT COUNT(nombre), id_depto FROM empleados GROUP BY id_depto HAVING COUNT(nombre) > 3;
-- Hallar los departamentos que no tienen empleados
SELECT COUNT(nombre), id_depto FROM empleados GROUP BY id_depto HAVING COUNT(nombre) = 0;
-- Mostrar la lista de los empleados cuyo salario es mayor o igual que el promedio de la 
-- empresa. Ordenarlo por departamento.
SELECT nombre, sal_emp, (SELECT AVG(sal_emp) FROM Empleados), id_depto  FROM empleados WHERE sal_emp >= (SELECT AVG(sal_emp) FROM Empleados) order by id_depto ASC;