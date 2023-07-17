USE [HESS SAS]

-- Importamos las tablas de software de la empresa

-- Seleccionar las tablas a utilizar
Select *
from dbo.contrimarginalDL

Select *
From dbo.ventas2022_2023DL

-- Crear una tabla que contenga todos las columnas que necesito

CREATE TABLE [dbo].[DL](
	[Codigo] [nvarchar](255) NULL,
	[Nombre] [nvarchar](255) NULL,
	[Cantidad Caja] [float] NULL,
	[Cantidad Blister] [float] NULL,
	[Cantidad Unidad] [float] NULL,
	[Venta Bruta] [money] NULL,
	[Descuento] [money] NULL,
	[Devolución] [money] NULL,
	[Venta Neta] [money] NULL,
	[Iva] [money] NULL,
	[Venta Neta+Iva] [money] NULL,
	[Costo] [money] NULL,
	[Bonificación] [money] NULL,
	[Rentabilidad] [money] NULL,
	[Porcentaje Rentabilidad] [float] NULL,
	[Porcentaje Contribución] [float] NULL,
	[Fecha Movimiento] [datetime] NULL,
	[Código Producto] [nvarchar](255) NULL,
	[Vendedor] [nvarchar](255) NULL,
	[Nombre Cliente] [nvarchar](255) NULL,
	[Apellido Cliente] [nvarchar](255) NULL,
	[Grupo I] [nvarchar](255) NULL,
	[Grupo II] [nvarchar](255) NULL,
	[Tipo Venta] [nvarchar](255) NULL
) ON [PRIMARY]
GO

-- Ordenar la nueva tabla por fecha

SELECT * FROM dbo.DL ORDER BY [Fecha Movimiento]

---- Insertar los que necesita la nueva Tabla dbo.DL con la tabla dbo.contrimarginal y completarla con una Inner Join de la tabla
--dbo.ventas2022_2023

INSERT INTO dbo.DL (Codigo,
		Nombre,
		[Cantidad Caja],
		[Cantidad Blister],
		[Cantidad Unidad],
		[Venta Bruta],
		Descuento,
		Devolución,
		[Venta Neta],
		Iva,
		[Venta Neta+Iva],
		Costo,
		Bonificación,
		Rentabilidad,
		[Porcentaje Rentabilidad],
		[Porcentaje Contribución], 
		[Fecha Movimiento],
		[Código Producto],
		Vendedor,
		[Nombre Cliente],
		[Apellido Cliente],
		[Grupo I],
		[Grupo II],
		[Tipo Venta])
	SELECT Codigo,
		Nombre,
		[Cantidad Caja],
		[Cantidad Blister],
		[Cantidad Unidad],
		[Venta Bruta],
		Descuento,
		Devolución,
		[Venta Neta],
		Iva,
		[Venta Neta+Iva],
		Costo,
		Bonificación,
		Rentabilidad,
		[Porcentaje Rentabilidad],
		[Porcentaje Contribución],
		[Fecha Movimiento],
		[Código Producto],
		Vendedor,
		[Nombre Cliente],
		[Apellido Cliente],
		[Grupo I],
		[Grupo II],
		[Tipo Venta]
		FROM dbo.contrimarginalDL 
		INNER JOIN dbo.ventas2022_2023DL on Codigo = [Código Producto]
		
------------------------------------------------------------------------------------------------------

		---- Debemos realizar el mismo ejercicio para otra de las sedes de la empresa 
		--Pero esta Se llamará FL

Select *
from dbo.contrimarginalDL

Select *
From dbo.ventas2022_2023FL


CREATE TABLE [dbo].[FL](
	[Codigo] [nvarchar](255) NULL,
	[Nombre] [nvarchar](255) NULL,
	[Cantidad Caja] [float] NULL,
	[Cantidad Blister] [float] NULL,
	[Cantidad Unidad] [float] NULL,
	[Venta Bruta] [money] NULL,
	[Descuento] [money] NULL,
	[Devolución] [money] NULL,
	[Venta Neta] [money] NULL,
	[Iva] [money] NULL,
	[Venta Neta+Iva] [money] NULL,
	[Costo] [money] NULL,
	[Bonificación] [money] NULL,
	[Rentabilidad] [money] NULL,
	[Porcentaje Rentabilidad] [float] NULL,
	[Porcentaje Contribución] [float] NULL,
	[Fecha Movimiento] [datetime] NULL,
	[Código Producto] [nvarchar](255) NULL,
	[Vendedor] [nvarchar](255) NULL,
	[Nombre Cliente] [nvarchar](255) NULL,
	[Apellido Cliente] [nvarchar](255) NULL,
	[Grupo I] [nvarchar](255) NULL,
	[Grupo II] [nvarchar](255) NULL,
	[Tipo Venta] [nvarchar](255) NULL
) ON [PRIMARY]
GO


INSERT INTO [dbo].[FL] (Codigo,
		Nombre,
		[Cantidad Caja],
		[Cantidad Blister],
		[Cantidad Unidad],
		[Venta Bruta],
		Descuento,
		Devolución,
		[Venta Neta],
		Iva,
		[Venta Neta+Iva],
		Costo,
		Bonificación,
		Rentabilidad,
		[Porcentaje Rentabilidad],
		[Porcentaje Contribución], 
		[Fecha Movimiento],
		[Código Producto],
		Vendedor,
		[Nombre Cliente],
		[Apellido Cliente],
		[Grupo I],
		[Grupo II],
		[Tipo Venta])
	SELECT Codigo,
		Nombre,
		[Cantidad Caja],
		[Cantidad Blister],
		[Cantidad Unidad],
		[Venta Bruta],
		Descuento,
		Devolución,
		[Venta Neta],
		Iva,
		[Venta Neta+Iva],
		Costo,
		Bonificación,
		Rentabilidad,
		[Porcentaje Rentabilidad],
		[Porcentaje Contribución],
		[Fecha Movimiento],
		[Código Producto],
		[Grupo I],
		[Grupo II],
		[Tipo Venta],
		[Nombre Cliente],
		[Apellido Cliente],
		[Vendedor]
		FROM dbo.contrimarginalDL 
		INNER JOIN dbo.ventas2022_2023FL on Codigo = [Código Producto]


-- Consultas de prueba para confirmar si los datos están correctos

Select * 
From dbo.FL
order by [Fecha Movimiento]

Select Codigo, Nombre, [Venta Neta], [Fecha Movimiento]
from dbo.FL 
where month ([Fecha Movimiento]) = 1
Order by [Fecha Movimiento]

-- total de las ventas en enero de la tabla dbo.ventas2022_2023DL
Select sum([Valor Venta Neta])
from dbo.ventas2022_2023DL
where [Fecha Movimiento] between '2023-01-01' and '2023-31-01'

-- total de las ventas en enero de la tabla dbo.ventas2022_2023FL
Select sum([Valor Venta Neta])
from dbo.ventas2022_2023FL
where [Fecha Movimiento] between '2023-01-01' and '2023-31-01'

-- totalde las ventas en enero de la tabla dbo.FL
Select sum([Venta Neta])
from dbo.FL
where [Fecha Movimiento] between '2023-01-01' and '2023-31-01'

-- Muestra de la info que se encuentra en la tabla dbo.ventas2022_2023DL en enero 2023
select [Fecha Movimiento], Codigo, Nombre, [Venta Neta] 
from dbo.FL
where [Fecha Movimiento] between '2023-01-01' and '2023-31-01'
order by [Fecha Movimiento]

-- Muestra de la info que se encuentra en la tabla dbo.ventas2022_2023DL en enero 2023
select *
from dbo.ventas2022_2023DL
where [Fecha Movimiento] between '2023-01-01' and '2023-31-01'
order by [Fecha Movimiento]


