use empleados

--1
SELECT COUNT(distinct Cc)cantidad_empleados 
FROM dbo.EMPLEADO$

--2
SELECT sede, COUNT(B.FK_sede)empleados_sede 
FROM dbo.SEDE$ A
INNER JOIN dbo.EMPLEADO$ B
ON A.id_sede = B.FK_sede
GROUP BY sede

--SELECT COUNT(FK_sede)cantidad_empleados FROM dbo.EMPLEADO$
--GROUP BY FK_sede

--3
SELECT estrato, COUNT(B.FK_estrato)empleados_estrato 
FROM dbo.Nivel_SOCIOECONOMICO$ A
INNER JOIN dbo.EMPLEADO$ B
ON A.id_Estrato = B.FK_estrato
GROUP BY estrato


--4
SELECT TOP 5 nombres
FROM dbo.EMPLEADO$ A
INNER JOIN dbo.Fecha_contratacion$ B
ON A.Cc = B.FK_empleado
ORDER BY(B.fecha_de_contratacion) DESC

--5
SELECT TOP 5 nombres
FROM dbo.EMPLEADO$ A
INNER JOIN dbo.Fecha_contratacion$ B
ON A.Cc = B.FK_empleado
ORDER BY(B.fecha_de_contratacion)

--6
SELECT A.nombres, B.sede, C.cargo
FROM dbo.EMPLEADO$ A
INNER JOIN dbo.SEDE$ B
ON A.FK_sede = B.id_sede
INNER JOIN dbo.CARGO$ C
ON A.FK_cargo = C.id_cargo
WHERE A.Cc = 10662101

--7
Delete from dbo.EMPLEADO$ 
WHERE dbo.EMPLEADO$.Cc = 10188530

--8
SELECT A.nombres
FROM dbo.EMPLEADO$ A
INNER JOIN dbo.Fecha_contratacion$ B
ON A.Cc = B.FK_empleado
WHERE B.fecha_de_contratacion >= '2000-01-1' 
AND B.fecha_de_contratacion <= '2005-12-31' 

--9
SELECT *
FROM (SELECT TOP 5 A.nombres, A.[edad ]
	FROM dbo.EMPLEADO$ A
	INNER JOIN dbo.Fecha_contratacion$ B
	ON A.Cc = B.FK_empleado
	ORDER BY DATEDIFF(YY, B.fecha_de_contratacion,CONVERT(DATE,GETDATE())) DESC
	UNION 
	SELECT TOP 5 A.nombres, A.[edad ]
	FROM dbo.EMPLEADO$ A
	INNER JOIN dbo.Fecha_contratacion$ B
	ON A.Cc = B.FK_empleado
	ORDER BY DATEDIFF(YY, B.fecha_de_contratacion,CONVERT(DATE,GETDATE())) ASC
	) A
ORDER BY nombres DESC

--10
SELECT A.nombres, Antiguedad = DATEDIFF(YY,B.fecha_de_contratacion, CONVERT(DATE,GETDATE()))
FROM dbo.EMPLEADO$ A
INNER JOIN dbo.Fecha_contratacion$ B
ON A.Cc = B.FK_empleado
WHERE DATEDIFF(YY,B.fecha_de_contratacion, CONVERT(DATE,GETDATE())) BETWEEN 17 AND 25

--11
SELECT AVG([edad ]) PROMEDIO
FROM dbo.EMPLEADO$ 


--12
SELECT SUM(sueldo)suma_todos_los_sueldos
FROM dbo.EMPLEADO$

--13
SELECT TOP 1 A.nombres, B.sede, C.estrato, 
D.fecha_de_contratacion, E.cargo
FROM dbo.EMPLEADO$ A
INNER JOIN dbo.SEDE$ B
ON A.FK_sede = B.id_sede
INNER JOIN dbo.Nivel_SOCIOECONOMICO$ C
ON A.FK_estrato = C.id_Estrato
INNER JOIN dbo.Fecha_contratacion$ D
ON A.Cc = D.FK_empleado
INNER JOIN dbo.CARGO$ E
ON A.FK_cargo = E.id_cargo
ORDER BY(A.sueldo) DESC

--14
SELECT TOP 1 A.nombres
FROM dbo.EMPLEADO$ A
INNER JOIN dbo.SEDE$ B
ON A.FK_sede = B.id_sede
INNER JOIN dbo.Fecha_contratacion$ D
ON A.Cc = D.FK_empleado
INNER JOIN dbo.CARGO$ E
ON A.FK_cargo = E.id_cargo
WHERE E.id_cargo = 4 AND B.id_sede = 3
ORDER BY(D.fecha_de_contratacion) DESC

--15
SELECT estrato, COUNT(B.FK_estrato)empleados_estrato 
FROM dbo.Nivel_SOCIOECONOMICO$ A
INNER JOIN dbo.EMPLEADO$ B
ON A.id_Estrato = B.FK_estrato
GROUP BY estrato

--SELECT COUNT(FK_sede)cantidad_empleados FROM dbo.EMPLEADO$
--GROUP BY FK_sede

--16
SELECT sede, COUNT(B.FK_sede)empleados_sede 
FROM dbo.SEDE$ A
INNER JOIN dbo.EMPLEADO$ B
ON A.id_sede = B.FK_sede
GROUP BY sede




