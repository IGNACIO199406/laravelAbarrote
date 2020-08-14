USE [Promovendedores]
GO
/****** Object:  User [Adn]    Script Date: 08/14/2020 09:06:34 ******/
CREATE USER [Adn] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [PROMOVENDEDOR]    Script Date: 08/14/2020 09:06:34 ******/
CREATE USER [PROMOVENDEDOR] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [UsrCambios]    Script Date: 08/14/2020 09:06:34 ******/
CREATE USER [UsrCambios] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [usrconspromo]    Script Date: 08/14/2020 09:06:34 ******/
CREATE USER [usrconspromo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [UsrIusacell]    Script Date: 08/14/2020 09:06:34 ******/
CREATE USER [UsrIusacell] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [usrsie]    Script Date: 08/14/2020 09:06:34 ******/
CREATE USER [usrsie] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[db_datareader]
GO
/****** Object:  User [usrTelefonia]    Script Date: 08/14/2020 09:06:34 ******/
CREATE USER [usrTelefonia] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[PATELSAplicaBajaRH]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSAplicaBajaRH]
   @piStatusId INT /*Estatus de baja de promovendedor*/
AS
DECLARE @vlPemiteBaja BIT
IF(@piStatusId IN (1,2)) BEGIN SET @vlPemiteBaja=1 END
ELSE BEGIN SET @vlPemiteBaja=0 END
SELECT BajaRH=@vlPemiteBaja
RETURN @vlPemiteBaja
GO
/****** Object:  StoredProcedure [dbo].[PATELSTiposPeriodos]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSTiposPeriodos] 	
AS
BEGIN

	
	SELECT 1 AS fiTipoPeriodoId, 'Mes' AS fcTipoPeriodo
						  UNION
	SELECT 2 AS fiTipoPeriodoId, 'Semana' AS fcTipoPeriodo
	ORDER BY 1 ASC
	
END
GO
/****** Object:  Table [dbo].[ProCliente]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProCliente](
	[fiClienteId] [int] NOT NULL,
	[fcClienteUnico] [varchar](20) NOT NULL,
	[fcApellidoPaterno] [varchar](20) NOT NULL,
	[fcApellidoMaterno] [varchar](20) NOT NULL,
	[fcNombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK1_ProCliente] PRIMARY KEY CLUSTERED 
(
	[fiClienteId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProClasificacionFija]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProClasificacionFija](
	[fiReglaId] [int] NOT NULL,
	[fiDepto] [int] NOT NULL,
	[fiSubDepto] [int] NOT NULL,
	[fiClase] [int] NOT NULL,
	[fiSubClase] [int] NOT NULL,
	[fisku] [int] NOT NULL,
	[fcGeneral] [varchar](50) NULL,
	[fcDescripcion] [varchar](150) NULL,
 CONSTRAINT [PKProClasificacionFija] PRIMARY KEY CLUSTERED 
(
	[fiReglaId] ASC,
	[fiDepto] ASC,
	[fiSubDepto] ASC,
	[fiClase] ASC,
	[fiSubClase] ASC,
	[fisku] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROTipoPromocion]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROTipoPromocion](
	[fiTipoPromocionId] [int] NOT NULL,
	[fcDescripcion] [varchar](80) NULL,
	[fiOperacionValida] [int] NULL,
 CONSTRAINT [PK6_PROTipoPromocion] PRIMARY KEY CLUSTERED 
(
	[fiTipoPromocionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PROTipoElemento]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROTipoElemento](
	[fiTipo] [int] NOT NULL,
	[fcDescripcion] [varchar](80) NULL,
 CONSTRAINT [PK5_PROTipoElemento] PRIMARY KEY CLUSTERED 
(
	[fiTipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AutEstatus]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AutEstatus](
	[fiIdEstatus] [int] NOT NULL,
	[fcEstatusDesc] [varchar](50) NULL,
 CONSTRAINT [PK001AutEstatus] PRIMARY KEY CLUSTERED 
(
	[fiIdEstatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AutAplicacion]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AutAplicacion](
	[fiIdAplicacion] [int] NOT NULL,
	[fcNombreAplicacion] [varchar](50) NOT NULL,
	[fcDescripcion] [varchar](100) NULL,
 CONSTRAINT [PK001AutAplicacion] PRIMARY KEY CLUSTERED 
(
	[fiIdAplicacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ActivacionesIusacell]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActivacionesIusacell](
	[fiCanal] [int] NOT NULL,
	[fiPais] [int] NOT NULL,
	[fiPedido] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiEstatus] [int] NULL,
	[fiContrato] [int] NULL,
	[fcCuenta] [varchar](15) NULL,
	[fcDN] [varchar](10) NULL,
	[fcESN] [varchar](30) NULL,
	[fiSolicitud] [int] NULL,
	[fcServAdicionales] [varchar](8000) NULL,
	[fcServPromocion] [varchar](8000) NULL,
	[fnTAIncluido] [decimal](12, 2) NULL,
	[fcMinTel] [varchar](20) NULL,
	[fcSID] [int] NULL,
	[fiTipo] [int] NULL,
 CONSTRAINT [PKActivacionesIusacell] PRIMARY KEY NONCLUSTERED 
(
	[fiCanal] ASC,
	[fiPais] ASC,
	[fiPedido] ASC,
	[fiNoTienda] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AutRoles]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AutRoles](
	[fiIdRol] [int] NOT NULL,
	[fcRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK001AutRoles] PRIMARY KEY CLUSTERED 
(
	[fiIdRol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSFechaST]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSFechaST]
(
	@FECHA	DATETIME
)
RETURNS		DATETIME
AS
BEGIN
	
	DECLARE	 @FECHA_SIN_TIEMPO DATETIME
		
	SELECT @FECHA_SIN_TIEMPO = 
		CONVERT(DATETIME, CONVERT(VARCHAR(10), @FECHA, 103),103)

RETURN @FECHA_SIN_TIEMPO

END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSCadTodos]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSCadTodos]
(
	@LETRA CHAR
)
RETURNS		VARCHAR(10)
AS
BEGIN
	
	DECLARE	 @CAD_TODOS VARCHAR(10)
		
	SET @CAD_TODOS = 'TOD' + @LETRA  + 'S'

RETURN @CAD_TODOS

END
GO
/****** Object:  UserDefinedFunction [dbo].[FNSemanaAnio]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************
	Descripción: Devuelve la semana de la fecha proporcionada
*********************************************************************/
CREATE FUNCTION [dbo].[FNSemanaAnio](
	@pdFecha DATETIME
)
RETURNS		VARCHAR(6)
BEGIN
	DECLARE @vdFechaActual DATETIME = @pdFecha, @viSemanaActual INT, @viAnio INT, 
			@vdInicial DATETIME, @vdFinal DATETIME, @viMes INT, @viAnioFinal INT,
			@vcSemanaAnio VARCHAR(6)

	SELECT @viSemanaActual = DATEPART(ISO_WEEK, @vdFechaActual), @viAnio = DATEPART(yyyy, @vdFechaActual)
	IF(@viSemanaActual = 1)
	BEGIN 
		SET @viMes = DATEPART(MONTH, @vdFechaActual)
		IF(@viMes = 12)
		BEGIN
			SET @vdFechaActual = DATEADD(YEAR, 1, @vdFechaActual)
			SET @viAnio = DATEPART(YYYY, @vdFechaActual)
			SET @vdFechaActual = DATEADD(ms,-3,DATEADD(yy,0,DATEADD(yy,DATEDIFF(yy,0,@vdFechaActual),0)))
		END
		ELSE
		BEGIN
			SET @vdFechaActual = DATEADD(ms,-3,DATEADD(yy,0,DATEADD(yy,DATEDIFF(yy,0,@vdFechaActual),0)))
			SET @viAnio = DATEPART(YYYY, @vdFechaActual)
		END
		SET @viSemanaActual = DATEPART(ISO_WEEK, @vdFechaActual)
	END
	ELSE
	BEGIN
		SET @viSemanaActual = DATEPART(ISO_WEEK, @vdFechaActual)
		SET @viAnio = DATEPART(YYYY, @vdFechaActual)
	END
	SELECT @vdInicial = DATEADD(wk,DATEDIFF(wk,0,@vdFechaActual),0)
	SELECT @vdFinal =  DATEADD(wk,DATEDIFF(wk,0,@vdFechaActual),7)
	SELECT @viAnioFinal = DATEPART(YYYY, @vdFinal)

	IF(@viAnio != @viAnioFinal)
	BEGIN
		IF(@viSemanaActual = 1)
		BEGIN
			SET @viAnio = @viAnioFinal
		END
	END

	SET @vcSemanaAnio = CAST(@viAnio AS VARCHAR(10)) + CASE WHEN LEN(@viSemanaActual) <= 1 THEN '0' ELSE '' END + CAST(@viSemanaActual AS VARCHAR(10))
	RETURN @vcSemanaAnio
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnDiaSemana]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************
   Descripción: Obtiene el día de la semana según el sistema de promovendedores
   -------------------------------------------------------------------------------
   Responsable: Angel Israel López Rosales
   Fecha: 18/09/2012
**********************************************************************************/
CREATE FUNCTION [dbo].[fnDiaSemana]
(
   @pdFecha DATETIME
)
RETURNS INT
AS
BEGIN
   DECLARE @viDia INT
   SET @viDia=DATEPART(WEEKDAY,@pdFecha)-1
   IF(@viDia=0)
   BEGIN SET @viDia=7 END
   RETURN @viDia
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnCalculaRFC]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************
   Descripción: Calcula RFC a partir de nombre y fecha de nacimiento
   Fecha: Mayo del 2012
   Responsable: Angel Israel López Rosales
**********************************************************************/
CREATE FUNCTION [dbo].[fnCalculaRFC] 
(
   @pcNombres       VARCHAR(100),
   @pcAPaterno      VARCHAR(100),
   @pcAMaterno      VARCHAR(100),
   @pdFecNacimiento DATETIME
)
RETURNS VARCHAR(13)
AS
BEGIN

--DECLARACION DE VARIABLES
DECLARE 
   @vcNombre         VARCHAR(100),
   @vcAPaterno       VARCHAR(100),
   @vcAMaterno       VARCHAR(100),
   @vcNombre1        VARCHAR(100), --PRIMER NOMBRE
   @vcNombre2        VARCHAR(100), --DEMAS NOMBRES
   @vcAPaterno1      VARCHAR(100), --PRIMER NOMBRE
   @vcAPaterno2      VARCHAR(100), --DEMAS NOMBRES
   @vcAMaterno1      VARCHAR(100), --PRIMER NOMBRE
   @vcAMaterno2      VARCHAR(100), --DEMAS NOMBRES
   @vcRFC            VARCHAR(13),
   @vcTNomTot        CHAR(52),
   @vcNomNumerico    CHAR(102),    --Nombre numerico
   @vcHomoclave      CHAR(3),      -- Homoclave
   @viAMaternoLong   INT,          --LONGITUD DE TODOS @NOMBRES
   @viAMaterno1Long  INT,          --LONGITUD DEL PRIMER NOMBRE(MAS UNO,EL QUE SOBRA ES UN ESPACIO EN BLANCO)
   @viLoops          INT,          --VARIABLE PARA LOS LOOPS, SE INICIALIZA AL INICIR UN LOOP
   @viAPaternoLong   INT,          --LONGITUD DE TODOS @NOMBRES
   @viAPaterno1Long  INT,          --LONGITUD DEL PRIMER NOMBRE(MAS UNO,EL QUE SOBRA ES UN ESPACIO EN BLANCO)
   @viNomLongitud    INT,          --LONGITUD DE TODOS @NOMBRES
   @viNom1Longitud   INT,          --LONGITUD DEL PRIMER NOMBRE(MAS UNO,EL QUE SOBRA ES UN ESPACIO EN BLANCO)
   @viMod            INT,          --MOD de la division
   @viSuma           INT,
   @viDivID          INT,          --Dividendo
   @viNumAsc         INT,          --Numero ASC asignado a un caracter
   @viParcial        INT           --Acumulado de la suma de los caracteres del RFC

--INICIALZA VARIABLES
SELECT @vcNombre = LTRIM(RTRIM(@pcNombres)),
       @vcAPaterno = LTRIM(RTRIM(@pcAPaterno)),
       @vcAMaterno = LTRIM(RTRIM(@pcAMaterno))
SET @vcTNomTot=@vcAPaterno+' '+@vcAMaterno+' '+@vcNombre

--PROCESAR NOMBRES DE PILA
SET @viLoops = 0
WHILE @viLoops <> 1
BEGIN
   SELECT @viNomLongitud=LEN(@vcNombre),@viNom1Longitud=PATINDEX('% %',@vcNombre)
   IF @viNom1Longitud = 0
   SET @viNom1Longitud = @viNomLongitud
   SELECT @vcNombre1 = RTRIM(LEFT(@vcNombre,@viNom1Longitud))
         ,@vcNombre2 = LTRIM(RIGHT(@vcNombre,@viNomLongitud - @viNom1Longitud))

   --SE QUINTAN LOS NOMBRES DE JOSE, MARIA,MA,MA.
   IF @vcNombre1 IN ('JOSE','MARIA','MA.','MA','DE','LA','LAS','MC','VON','DEL','LOS','Y','MAC','VAN') AND @vcNombre2 <> ''
   BEGIN
      SET @vcNombre = @vcNombre2
   END 
   ELSE
   BEGIN
      SET @viLoops = 1
   END
END

--PROCESAMOS APELLIDOS, PATERNO EN UN LOOP
SET @viLoops = 0
WHILE @viLoops <> 1
BEGIN
   SELECT @viAPaternoLong = LEN(@vcAPaterno),@viAPaterno1Long = PATINDEX('% %',@vcAPaterno)
   IF @viAPaterno1Long = 0
      SET @viAPaterno1Long = @viAPaternoLong
   SELECT @vcAPaterno1 = RTRIM(LEFT(@vcAPaterno,@viAPaterno1Long))
      ,@vcAPaterno2 = LTRIM(RIGHT(@vcAPaterno,@viAPaternoLong - @viAPaterno1Long))

   --SE QUINTAN LOS SUFIJOS
   IF @vcAPaterno1 IN ('DE','LA','LAS','MC','VON','DEL','LOS','Y','MAC','VAN') AND @vcAPaterno2 <> ''
   BEGIN
      SET @vcAPaterno = @vcAPaterno2
   END 
   ELSE
   BEGIN
      SET @viLoops = 1
   END
END

--PROCESAMOS APELLIDOS, MATERNO EN UN LOOP
SET @viLoops = 0
WHILE @viLoops <> 1
BEGIN
   SELECT @viAMaternoLong = LEN(@vcAMaterno),@viAMaterno1Long = PATINDEX('% %',@vcAMaterno)
   IF @viAMaterno1Long = 0
      SET @viAMaterno1Long = @viAMaternoLong
   SELECT @vcAMaterno1 = RTRIM(LEFT(@vcAMaterno,@viAMaterno1Long))
   ,@vcAMaterno2 = LTRIM(RIGHT(@vcAMaterno,@viAMaternoLong - @viAMaterno1Long))
   --SE QUINTAN LOS SUFIJOS
   IF @vcAMaterno1 IN ('DE','LA','LAS','MC','VON','DEL','LOS','Y','MAC','VAN') AND @vcAMaterno2 <> ''
   BEGIN
      SET @vcAMaterno = @vcAMaterno2
   END
   ELSE
   BEGIN
      SET @viLoops = 1
   END
END

--SE OBTIENE DEL PRIMER APELLIDO LA PRIMER LETRA Y LA PRIMER VOCAL INTERNA
SELECT @vcRFC=LEFT(@vcAPaterno1,1),@viAPaterno1Long= LEN(@vcAPaterno1),@viLoops = 1 --EMPIEZA EN UNO POR LA PRIMERA LETRA SE LA VA A SALTAR

WHILE @viAPaterno1Long > @viLoops
BEGIN
   SET @viLoops = @viLoops + 1
   IF SUBSTRING(@vcAPaterno1,@viLoops,1) IN ('A','E','I','O','U')
   BEGIN
      SELECT @vcRFC = RTRIM(@vcRFC)+CONVERT(CHAR(1),SUBSTRING(@vcAPaterno1,@viLoops,1))
      ,@viLoops = @viAPaterno1Long
   END
END

--SE OBTIENE LA PRIMER LETRA DEL APELLIDO MATERNO SI NO TIENE APELLIDO MATERNO SE PONE UNA X
--DICE QUE SI NO TIENE APELLIDO MATERNO LE PONGAS LA PRIMER LETRA DEL APELLIDO PATERNO EN EL RFX
IF ISNULL(@vcAMaterno1,'') = ''
BEGIN
   SET @vcRFC = RTRIM(@vcRFC)+CONVERT(CHAR(1),SUBSTRING(@vcAPaterno1,1,1))
END
ELSE
BEGIN
   SET @vcRFC = RTRIM(@vcRFC)+CONVERT(CHAR(1),SUBSTRING(@vcAMaterno1,1,1))
END

--SE LE AGREGA LA PRIMER LETRA DEL NOMBRE
SET @vcRFC = RTRIM(@vcRFC)+CONVERT(CHAR(1),SUBSTRING(@vcNombre1,1,1))
--SE LE AGREGA LA FECHA DE NACIMIENTO
SET @vcRFC = RTRIM(@vcRFC) + CONVERT(CHAR,@pdFecNacimiento,12)
--HOMOCLAVE
SET @vcNomNumerico = '0'
--SACA NOMBRE NUMERICO
SET @viLoops = 1
WHILE @viLoops <= 52
BEGIN
   SET @vcNomNumerico = LTRIM(RTRIM (@vcNomNumerico)) +
   CASE
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'A' THEN '11'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'B' THEN '12'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'C' THEN '13'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'D' THEN '14'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'E' THEN '15'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'F' THEN '16'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'G' THEN '17'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'H' THEN '18'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'I' THEN '19'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'J' THEN '21'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'K' THEN '22'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'L' THEN '23'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'M' THEN '24'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'N' THEN '25'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'O' THEN '26'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'P' THEN '27'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'Q' THEN '28'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'R' THEN '29'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'S' THEN '32'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'T' THEN '33'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'U' THEN '34'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'V' THEN '35'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'W' THEN '36'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'X' THEN '37'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'Y' THEN '38'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) = 'Z' THEN '39'
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) >= '0' AND 
      SUBSTRING (@vcTNomTot,@viLoops,1) <= '9' THEN CONVERT(VARCHAR,CONVERT(INT, SUBSTRING (@vcTNomTot,@viLoops,1)),2)
      WHEN SUBSTRING (@vcTNomTot,@viLoops,1) IN ('&','Ñ') THEN '10'
      ELSE '00'
   END
   SET @viLoops = @viLoops + 1
END
SELECT @viLoops = 1,@viSuma = 0
WHILE @viLoops <= 99
BEGIN
   SET @viSuma = @viSuma + ((CONVERT(INT,SUBSTRING (@vcNomNumerico , @viLoops , 1))*10) + CONVERT(INT,SUBSTRING (@vcNomNumerico , @viLoops+1 , 1))) * CONVERT(INT,SUBSTRING (@vcNomNumerico , @viLoops+1 , 1))
   SET @viLoops = @viLoops + 1
END

-- Obtener HOMOCLAVE
SELECT @viDivID = @viSuma%1000 -- Obtener residuo de los ultimos 3 digitos
SELECT @viMod = @viDivID%34 -- Obtener el residuo de los ultimos 3 digitos-- entre 34
SELECT @viDivID = (@viDivID - @viMod) / 34 -- Obtener el Cociente entero
-- Checar Cociente y residuo
SET @viLoops = 0
WHILE @viLoops <= 1
BEGIN
   SET @vcHomoclave =
      CASE CASE @viLoops WHEN 0 THEN @viDivID ELSE @viMod END
         WHEN 0 THEN '1' 
         WHEN 1 THEN '2'
         WHEN 2 THEN '3'
         WHEN 3 THEN '4'
         WHEN 4 THEN '5'
         WHEN 5 THEN '6'
         WHEN 6 THEN '7'
         WHEN 7 THEN '8'
         WHEN 8 THEN '9' 
         WHEN 9 THEN 'A'
         WHEN 10 THEN 'B'
         WHEN 11 THEN 'C'
         WHEN 12 THEN 'D'
         WHEN 13 THEN 'E'
         WHEN 14 THEN 'F'
         WHEN 15 THEN 'G'
         WHEN 16 THEN 'H'
         WHEN 17 THEN 'I'
         WHEN 18 THEN 'J'
         WHEN 19 THEN 'K'
         WHEN 20 THEN 'L'
         WHEN 21 THEN 'M'
         WHEN 22 THEN 'N'
         WHEN 23 THEN 'P'
         WHEN 24 THEN 'Q'
         WHEN 25 THEN 'R'
         WHEN 26 THEN 'S'
         WHEN 27 THEN 'T'
         WHEN 28 THEN 'U'
         WHEN 29 THEN 'V'
         WHEN 30 THEN 'W'
         WHEN 31 THEN 'X'
         WHEN 32 THEN 'Y'
         ELSE 'Z'
      END
   SELECT @viLoops=@viLoops+1
   ,@vcRFC=LTRIM(RTRIM(@vcRFC))+LTRIM(RTRIM(@vcHomoclave))-- Incluir la parte de la homoclave
END

-- ---------------------------------------------
-- Obtener Digito Verificador
-- ---------------------------------------------
SELECT @viLoops = 0,@viParcial = 0
WHILE @viLoops < 12
BEGIN
   SELECT @viLoops=@viLoops+1
   SET @viNumAsc =
      CASE
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'A' THEN 10
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'B' THEN 11
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'C' THEN 12
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'D' THEN 13
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'E' THEN 14
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'F' THEN 15
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'G' THEN 16
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'H' THEN 17
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'I' THEN 18
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'J' THEN 19
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'K' THEN 20
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'L' THEN 21
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'M' THEN 22
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'N' THEN 23
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'O' THEN 25
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'P' THEN 26
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'Q' THEN 27
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'R' THEN 28
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'S' THEN 29
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'T' THEN 30
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'U' THEN 31
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'V' THEN 32
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'W' THEN 33
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'X' THEN 34
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'Y' THEN 35
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = 'Z' THEN 36
         WHEN SUBSTRING (@vcRFC,@viLoops,1) >= '0' AND 
         SUBSTRING (@vcRFC,@viLoops,1) <= '9' THEN CONVERT(INT,SUBSTRING (@vcRFC,@viLoops,1))
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = '' THEN 24
         WHEN SUBSTRING (@vcRFC,@viLoops,1) = ' ' THEN 37
         ELSE 0
      END
   -- Contabilizar el nuevo digito
   SELECT @viParcial = @viParcial + (@viNumAsc * (14 - @viLoops))
END 

SET @viMod = ROUND(@viParcial%11,1)
IF @viMod = 0
   SET @vcRFC = LTRIM(RTRIM (@vcRFC)) + '0'
ELSE
BEGIN
   SET @viParcial = 11 - @viMod
   IF @viParcial = 10
      SELECT @vcRFC = LTRIM(RTRIM (@vcRFC)) + 'A'
   ELSE
      SELECT @vcRFC = LTRIM(RTRIM (@vcRFC)) + CONVERT(VARCHAR ,@viParcial)
END
RETURN @vcRFC
END
GO
/****** Object:  Table [dbo].[DatosTA]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatosTA](
	[FCTRANSACTIONID] [varchar](50) NULL,
	[FICOUNTRYID] [varchar](50) NULL,
	[FIOPERATORID] [varchar](50) NULL,
	[FIOPERATORDIVID] [varchar](50) NULL,
	[FISYSTEMID] [varchar](50) NULL,
	[FIINSTITUTIONID] [varchar](50) NULL,
	[FIOPERATIONTYPEID] [varchar](50) NULL,
	[FCCLIENTSECUENCE] [varchar](50) NULL,
	[FITYPETOPUPID] [varchar](50) NULL,
	[FDDATETOPOUPCLIENT] [varchar](50) NULL,
	[FDDATETOPUP] [varchar](50) NULL,
	[FDDATERESPONSETOPUP] [varchar](50) NULL,
	[FCNAMEDEVICE] [varchar](50) NULL,
	[FCMACADDRESS] [varchar](50) NULL,
	[FCMIN] [varchar](50) NULL,
	[FIAMOUNTTOPUP] [varchar](50) NULL,
	[FCPRODUCTID] [varchar](50) NULL,
	[FCTRACKPAYMENT] [varchar](50) NULL,
	[FCREFERENCEPAYMENT] [varchar](50) NULL,
	[FISWITCHCODEID] [varchar](50) NULL,
	[FIPROCESSSTATUSID] [varchar](50) NULL,
	[FCTYPEPAYMENTRESPONSEID] [varchar](50) NULL,
	[FIOPERATORRESPONSEID] [varchar](50) NULL,
	[FIOPERATORSECUENCE] [varchar](50) NULL,
	[FITYPEPAYMENTID] [varchar](50) NULL,
	[FCAUTHORIZATIONOPERATOR] [varchar](50) NULL,
	[FCNIPOPERATOR] [varchar](50) NULL,
	[FCPINOPERATOR] [varchar](50) NULL,
	[FCPATHTRANSACTION] [varchar](50) NULL,
	[FCRRN] [varchar](50) NULL,
	[FCSALENUMBER] [varchar](50) NULL,
	[FCLATITUDECOORDINATE] [varchar](50) NULL,
	[FCLONGITUDECOORDINATE] [varchar](50) NULL,
	[FCBDMID] [varchar](50) NULL,
	[FIATTEMPTSSENDING] [varchar](50) NULL,
	[FCPAYMENTCONFIRMATION] [varchar](50) NULL,
	[FCPAYMENTCONFIRMATIONID] [varchar](50) NULL,
	[FCREFERENCEPAYMENTAB] [varchar](50) NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSValidarCompania]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
   Descripción: Función que valida la compañía 
   Fecha: 13 de marzo del 2013
******************************************************************************/
CREATE FUNCTION [dbo].[FNTELSValidarCompania]
(
	@piCompaniaParametro	INT,
	@piCompaniaVendedor		INT,
	@piPuestoVendedor		INT
)
RETURNS INT
AS
BEGIN
   DECLARE	@viValida INT
   IF (
         (@piCompaniaParametro in (11,47) AND @piCompaniaVendedor in (78,@piCompaniaParametro)) 
         OR @piCompaniaVendedor = @piCompaniaParametro
         OR (@piCompaniaParametro = 78 AND @piCompaniaVendedor in (11,47)) 
         OR (@piPuestoVendedor = 635)
	)
		SET @viValida = 1
	ELSE
		SET @viValida = 0

RETURN @viValida

END
GO
/****** Object:  StoredProcedure [dbo].[PATELIConfiguration]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************

   Responsable: Angel Israel López Rosales
   Fecha:       julio del 2010
   Descripcion: (Configuration) Escribe los valores a una seccion de configuracin 
   
**********************************************************************************************/
Create Procedure [dbo].[PATELIConfiguration] (
   @pcName char(50)
  ,@ptValue text
  ,@pcSignature char(100)
)
AS
Declare @vcMensaje VarChar(255)
       ,@viPosInic int
       ,@vcValue varchar(8000)
       ,@viConsec int

Begin transaction
If exists (Select 1 
             From dbo.Configuration
            Where fcName = @pcName)
Begin
   Update dbo.Configuration 
   Set    fcSignature = @pcSignature
   Where  fcName = @pcName 
END
Else
Begin
   Insert Into dbo.Configuration (fcName
                                 ,fcSignature
                        ) Values (@pcName
                                 ,@pcSignature
                                 )
END
If @@Error != 0 
Begin
   Set @vcMensaje = 'Error al insertar "' + @pcName + '"'
   Goto Error
End
delete From dbo.detconfiguration
      Where fcName = @pcName
Set @viPosInic = 1
Set @viConsec = 1
while (@viPosInic < datalength(@ptValue))
Begin
   Select @vcValue = substring(@ptvalue, @viPosInic, 255)
   Insert Into dbo.detConfiguration (fcName
                                    ,ficonsecutive
                                    ,fcValue
                           ) Values (@pcName
                                    ,@viConsec
                                    ,@vcValue
                                    )
   If @@Error != 0 
   Begin
      Select @vcMensaje = 'Error al insertar "' + @pcName + '"'
      Goto Error
   End
   Set @viConsec = @viConsec + 1
   Set @viPosInic = @viPosInic + 255
End
Commit Transaction
Return 0
Error:
   Rollback Transaction
   Raiserror(@vcMensaje, 18, 1)
   Return -1
GO
/****** Object:  UserDefinedFunction [dbo].[getFormattedDate]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getFormattedDate]
 (
 @DateValue AS DATETIME
 )
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN
	  DATENAME(DW, @DateValue)+ ', '+
	  DATENAME(DAY, @DateValue)+ ' '+
	  DATENAME(MONTH, @DateValue) +', '+
	  DATENAME(YEAR, @DateValue)
 
END
GO
/****** Object:  UserDefinedFunction [dbo].[getCalculoEdad]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE FUNCTION [dbo].[getCalculoEdad]
(
	@Nacimiento int 
)
RETURNS  Varchar
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Calculo int
	RETURN 2020-@Nacimiento
END
GO
/****** Object:  Table [dbo].[TATEDatosMail]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEDatosMail](
	[fiTipo] [int] NULL,
	[fiSupervisor] [int] NULL,
	[fcNombreSupervisor] [varchar](255) NULL,
	[fcCorreo] [varchar](255) NULL,
	[fiTiendaNoSupervisada] [int] NULL,
	[fcNombreTienda] [varchar](60) NULL,
	[fiMulta] [int] NULL,
	[fcCorreoCC] [varchar](255) NULL,
	[fcCorreoCCO] [varchar](255) NULL,
	[fcCorreoPadre] [varchar](255) NULL,
	[fiMinutos] [int] NULL,
	[fiNegocio] [int] NULL,
	[fiIdDirector] [int] NULL,
	[fcNombreDirector] [varchar](255) NULL,
	[fcMotivo] [varchar](255) NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEControlAsistenciaCifras]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TATEControlAsistenciaCifras](
	[FechaDia] [datetime] NOT NULL,
	[NumeroEntradas] [int] NULL,
	[NumeroAsistenciaHistorico] [int] NULL,
	[HoraInicio] [datetime] NULL,
	[HoraFin] [datetime] NULL,
 CONSTRAINT [pkTATEControlAsistenciaCifras] PRIMARY KEY CLUSTERED 
(
	[FechaDia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TATEPromoGanadoresBoletoMovistar]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEPromoGanadoresBoletoMovistar](
	[fiNoPais] [int] NOT NULL,
	[fiNoCanal] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiNoPedido] [int] NOT NULL,
	[fiPromoID] [int] NULL,
	[fcNombreCliente] [varchar](100) NULL,
	[fcTelContacto] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[fiNoPais] ASC,
	[fiNoCanal] ASC,
	[fiNoTienda] ASC,
	[fiNoPedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEPromoGanadores]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEPromoGanadores](
	[fiNoPais] [int] NOT NULL,
	[fiNoCanal] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiNoPedido] [int] NOT NULL,
	[fiPromoID] [int] NULL,
	[fcNoCliente] [varchar](100) NULL,
	[fcNombreCliente] [varchar](100) NULL,
	[fcDesPremio] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[fiNoPais] ASC,
	[fiNoCanal] ASC,
	[fiNoTienda] ASC,
	[fiNoPedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEPromocionEspecial]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEPromocionEspecial](
	[fiFolio] [bigint] NOT NULL,
	[fiPais] [int] NOT NULL,
	[fiCanal] [int] NOT NULL,
	[fiSucursal] [int] NOT NULL,
	[fiPromocionId] [int] NOT NULL,
	[fcCliente] [varchar](16) NULL,
	[fiNoPedido] [int] NOT NULL,
	[fnMonto] [decimal](12, 4) NULL,
	[fdInicio] [smalldatetime] NULL,
	[fdVigencia] [smalldatetime] NULL,
	[fiReglaId] [int] NOT NULL,
 CONSTRAINT [pkTATEPromocionEspecial] PRIMARY KEY CLUSTERED 
(
	[fiFolio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEMultasSAP]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEMultasSAP](
	[fiFolio] [int] NOT NULL,
	[fiTipo] [int] NULL,
	[fiNegocio] [int] NULL,
	[fdEnvio] [datetime] NULL,
	[fcRespuestaSAP] [varchar](50) NULL,
	[fcError] [varchar](8000) NULL,
	[fiNumRegistros] [int] NULL,
	[fcFolioSAP] [varchar](50) NULL,
 CONSTRAINT [pkTATEMultasSAP] PRIMARY KEY NONCLUSTERED 
(
	[fiFolio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEMultaNoSupervisadasMovi]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEMultaNoSupervisadasMovi](
	[fiNoTienda] [int] NULL,
	[fcNombreTienda] [varchar](100) NULL,
	[fiMulta] [int] NULL,
	[fdFecha] [datetime] NULL,
	[fcArticulo] [varchar](18) NULL,
	[fcMinutos] [varchar](40) NULL,
	[fcProveedor] [varchar](18) NULL,
	[fiTipo] [int] NULL,
	[fiNumVeces] [int] NULL,
	[fiEstatus] [int] NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEMultaNoSupervisadasIus]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEMultaNoSupervisadasIus](
	[fiNoTienda] [int] NULL,
	[fcNombreTienda] [varchar](100) NULL,
	[fiMulta] [int] NULL,
	[fdFecha] [datetime] NULL,
	[fcArticulo] [varchar](18) NULL,
	[fcMinutos] [varchar](40) NULL,
	[fcProveedor] [varchar](18) NULL,
	[fiTipo] [int] NULL,
	[fiNumVeces] [int] NULL,
	[fiEstatus] [int] NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEMultaNoAsignadasMovi]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEMultaNoAsignadasMovi](
	[fiNoTienda] [int] NULL,
	[fcNombreTienda] [varchar](100) NULL,
	[fiMulta] [int] NULL,
	[fdFecha] [datetime] NULL,
	[fcArticulo] [varchar](18) NULL,
	[fcMinutos] [varchar](40) NULL,
	[fcProveedor] [varchar](18) NULL,
	[fiTipo] [int] NULL,
	[fiNumVeces] [int] NULL,
	[fiEstatus] [int] NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEMultaNoAsignadasIus]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEMultaNoAsignadasIus](
	[fiNoTienda] [int] NULL,
	[fcNombreTienda] [varchar](100) NULL,
	[fiMulta] [int] NULL,
	[fdFecha] [datetime] NULL,
	[fcArticulo] [varchar](18) NULL,
	[fcMinutos] [varchar](40) NULL,
	[fcProveedor] [varchar](18) NULL,
	[fiTipo] [int] NULL,
	[fiNumVeces] [int] NULL,
	[fiEstatus] [int] NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEMultaAsistenciaMovi]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEMultaAsistenciaMovi](
	[fiNoTienda] [int] NULL,
	[fcNombreTienda] [varchar](100) NULL,
	[fiMulta] [int] NULL,
	[fdFecha] [datetime] NULL,
	[fcArticulo] [varchar](18) NULL,
	[fcMinutos] [varchar](40) NULL,
	[fcProveedor] [varchar](18) NULL,
	[fiTipo] [int] NULL,
	[fiNumVeces] [int] NULL,
	[fiEstatus] [int] NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEMultaAsistenciaIus]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEMultaAsistenciaIus](
	[fiNoTienda] [int] NULL,
	[fcNombreTienda] [varchar](100) NULL,
	[fiMulta] [int] NULL,
	[fdFecha] [datetime] NULL,
	[fcArticulo] [varchar](18) NULL,
	[fcMinutos] [varchar](40) NULL,
	[fcProveedor] [varchar](18) NULL,
	[fiTipo] [int] NULL,
	[fiNumVeces] [int] NULL,
	[fiEstatus] [int] NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATELibertad]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATELibertad](
	[fiPais] [int] NOT NULL,
	[fiCanal] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiNoPedido] [int] NOT NULL,
	[fiCodigo] [int] NOT NULL,
	[fcCuenta] [varchar](20) NULL,
	[fcContrato] [varchar](15) NULL,
	[fcDN] [varchar](15) NULL,
	[fcICCID] [varchar](25) NULL,
	[fcSerie] [varchar](30) NULL,
	[fiEstatus] [int] NOT NULL,
	[fdSurtimiento] [datetime] NULL,
	[fiPaisCU] [int] NULL,
	[fiCanalCU] [int] NULL,
	[fiSucursalCU] [int] NULL,
	[fiFolioCU] [int] NULL,
 CONSTRAINT [PKTATELibertad] PRIMARY KEY CLUSTERED 
(
	[fiPais] ASC,
	[fiCanal] ASC,
	[fiNoTienda] ASC,
	[fiNoPedido] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ta]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ta](
	[FCTRANSACTIONID] [nvarchar](255) NULL,
	[FICOUNTRYID] [float] NULL,
	[FIOPERATORID] [float] NULL,
	[FIOPERATORDIVID] [float] NULL,
	[FISYSTEMID] [float] NULL,
	[FIINSTITUTIONID] [float] NULL,
	[FIOPERATIONTYPEID] [float] NULL,
	[FCCLIENTSECUENCE] [nvarchar](255) NULL,
	[FITYPETOPUPID] [float] NULL,
	[FDDATETOPOUPCLIENT] [nvarchar](255) NULL,
	[FDDATETOPUP] [nvarchar](255) NULL,
	[FDDATERESPONSETOPUP] [nvarchar](255) NULL,
	[FCNAMEDEVICE] [nvarchar](255) NULL,
	[FCMACADDRESS] [nvarchar](255) NULL,
	[FCMIN] [nvarchar](255) NULL,
	[FIAMOUNTTOPUP] [float] NULL,
	[FCPRODUCTID] [nvarchar](255) NULL,
	[FCTRACKPAYMENT] [nvarchar](255) NULL,
	[FCREFERENCEPAYMENT] [nvarchar](255) NULL,
	[FISWITCHCODEID] [float] NULL,
	[FIPROCESSSTATUSID] [float] NULL,
	[FCTYPEPAYMENTRESPONSEID] [nvarchar](255) NULL,
	[FIOPERATORRESPONSEID] [float] NULL,
	[FIOPERATORSECUENCE] [float] NULL,
	[FITYPEPAYMENTID] [float] NULL,
	[FCAUTHORIZATIONOPERATOR] [nvarchar](255) NULL,
	[FCNIPOPERATOR] [nvarchar](255) NULL,
	[FCPINOPERATOR] [nvarchar](255) NULL,
	[FCPATHTRANSACTION] [nvarchar](255) NULL,
	[FCRRN] [nvarchar](255) NULL,
	[FCSALENUMBER] [nvarchar](255) NULL,
	[FCLATITUDECOORDINATE] [nvarchar](255) NULL,
	[FCLONGITUDECOORDINATE] [nvarchar](255) NULL,
	[FCBDMID] [nvarchar](255) NULL,
	[FIATTEMPTSSENDING] [float] NULL,
	[FCPAYMENTCONFIRMATION] [nvarchar](255) NULL,
	[FCPAYMENTCONFIRMATIONID] [nvarchar](255) NULL,
	[FCREFERENCEPAYMENTAB] [nvarchar](255) NULL
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[TATEAsistenciasHistorico]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEAsistenciasHistorico](
	[Fecha] [datetime] NOT NULL,
	[NumPromovendedor] [int] NOT NULL,
	[NumTienda] [smallint] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[ApellidoPaterno] [varchar](100) NULL,
	[ApellidoMaterno] [varchar](100) NULL,
	[NombreTienda] [varchar](100) NULL,
	[NombreEmpresa] [varchar](100) NULL,
	[Puesto] [varchar](100) NULL,
	[HoraEntrada] [time](7) NOT NULL,
	[HoraSalidaComer] [time](7) NULL,
	[RegresoComer] [time](7) NULL,
	[Salida] [time](7) NULL,
	[MinutosEntradaSalida] [int] NULL,
	[MinutosComida] [int] NULL,
	[JefeInmediato] [varchar](60) NULL,
	[FechaRegistro] [datetime] NULL,
	[FechaBaja] [datetime] NULL,
 CONSTRAINT [pkTATEAsistenciasHistorico] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC,
	[NumPromovendedor] ASC,
	[NumTienda] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TablePruebas]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TablePruebas](
	[ID] [int] NULL,
	[NOMBRE] [nchar](10) NOT NULL
) ON [SECONDARY]
GO
/****** Object:  StoredProcedure [dbo].[spConEsActivacion]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConEsActivacion]  
AS  
DECLARE @vlRegreso BIT = 1  
SELECT @vlRegreso
GO
/****** Object:  Table [dbo].[TATEPromovendedorIusacell]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEPromovendedorIusacell](
	[fcClaveEconomica] [varchar](10) NULL,
	[fcCvePromovendedor] [varchar](10) NULL,
	[fcNombrePromovendedor] [varchar](8000) NULL,
	[fcTienda] [varchar](10) NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATETipoMovimiento]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATETipoMovimiento](
	[fiTipoMovimiento] [smallint] NOT NULL,
	[fcDescripcion] [varchar](60) NULL,
 CONSTRAINT [pkTATETipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[fiTipoMovimiento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEDetalleVale]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEDetalleVale](
	[fiPais] [int] NOT NULL,
	[fiCanal] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiNoPedido] [int] NOT NULL,
	[fiProdId] [int] NULL,
	[fiCantidad] [int] NULL,
	[fnPrecio] [decimal](12, 2) NULL,
	[fnPrecioDe] [decimal](12, 2) NULL,
	[fnSobreprecio] [decimal](12, 2) NULL,
	[fnCosto] [decimal](12, 2) NULL,
	[fnIntereses] [decimal](12, 2) NULL,
	[fcDescripcion] [varchar](50) NULL,
	[fnEnganche] [decimal](12, 2) NULL,
	[fnDescuento] [decimal](12, 2) NULL,
	[fnDescuentoE] [decimal](12, 2) NULL,
	[fiDepto] [int] NULL,
	[fiSubDepto] [int] NULL,
	[fiClase] [int] NULL,
	[fiSubClase] [int] NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tiendasTotales]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiendasTotales](
	[Tienda] [int] NULL
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[tiendas]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiendas](
	[id] [int] NULL
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[THTEAsistenciaH]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THTEAsistenciaH](
	[fiPromovendedorId] [int] NOT NULL,
	[fcName] [char](125) NOT NULL,
	[fiPuesto] [int] NOT NULL,
	[fcDescPuesto] [char](255) NOT NULL,
	[fcTipoVendedorDesc] [char](40) NOT NULL,
	[fiNoTienda] [smallint] NOT NULL,
	[fcDescTienda] [varchar](100) NOT NULL,
	[fcDescZona] [varchar](100) NOT NULL,
	[fiWeek] [int] NOT NULL,
	[fdFecha] [datetime] NOT NULL,
	[fcEvento] [char](40) NOT NULL,
	[fdFechaInserted] [datetime] NOT NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TemporalCECO]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TemporalCECO](
	[FDFECHAPROCESO] [datetime] NULL,
	[FICECOSUCURSALID] [nvarchar](255) NULL,
	[FIENTIDADID] [float] NULL,
	[FCNOMBRECECO] [nvarchar](255) NULL,
	[FCENTIDAD] [nvarchar](255) NULL,
	[FIESTATUSIDCECO] [float] NULL,
	[FCSTATUSCECO] [nvarchar](255) NULL,
	[FITIPOOPID] [float] NULL,
	[FCTIPOOPERACION] [nvarchar](255) NULL,
	[FICANALID] [float] NULL,
	[FCCANAL] [nvarchar](255) NULL,
	[FIPAISID] [float] NULL,
	[FCPAIS] [nvarchar](255) NULL,
	[FCESTADO] [nvarchar](255) NULL,
	[FIESTADOID] [float] NULL,
	[FCMUNICIPIO] [nvarchar](255) NULL,
	[FCCOLONIA] [nvarchar](255) NULL,
	[FICECODISTRITOID] [nvarchar](255) NULL,
	[FIENTIDADDISTID] [float] NULL,
	[FCNOMBREDIST] [nvarchar](255) NULL,
	[FIRESPDIST] [float] NULL,
	[FICECOJVENTASID] [nvarchar](255) NULL,
	[FIENTIDADJVENTSID] [float] NULL,
	[FCNOMBREJVENTAS] [nvarchar](255) NULL,
	[FICECOPLAZAID] [nvarchar](255) NULL,
	[FIENTIDADPLAZAID] [float] NULL,
	[FCNOMBREPLAZA] [nvarchar](255) NULL
) ON [SECONDARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTelValidaPrepago]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************
   Responsable: Angel Israel López Rosales
   Fecha:       Mayo del 2012
   Descripcion: Agrega Tir de Plan Movistar
*********************************************************************/
CREATE FUNCTION [dbo].[fnTelValidaPrepago](@piNoPedido INT)
RETURNS BIT
AS
BEGIN
DECLARE 
	@viC 		INT, 
	@vcMensaje 	VARCHAR(255)

SET @viC = 1
IF EXISTS (SELECT finopedido FROM DBO.credito WITH (NOLOCK) WHERE finopedido = @piNoPedido AND fitir IN (19,20,39,242,80,94))
BEGIN
	IF EXISTS (SELECT finopedido FROM DBO.telventapospago WITH (NOLOCK) WHERE finopedido = @piNoPedido)
	BEGIN
		SET @viC = 0
	END
	ELSE
	BEGIN
		SELECT @vcMensaje = '(spConTelValTipoVta)Inconsistencia de datos, el pedido no es un prepago, pero tiene la fitir  = ' + CONVERT(VARCHAR,fitir)
		FROM DBO.credito WITH (NOLOCK) WHERE finopedido = @piNoPedido
	END
END
RETURN @viC
END
GO
/****** Object:  Table [dbo].[TCTETipoVendedor]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTETipoVendedor](
	[fiTipoVendedorId] [smallint] NOT NULL,
	[fcTipoVendedorDesc] [char](40) NULL,
 CONSTRAINT [PKTCTETipoVendedor] PRIMARY KEY CLUSTERED 
(
	[fiTipoVendedorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTETipoMovimiento]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTETipoMovimiento](
	[fiMovimientoId] [smallint] NOT NULL,
	[fcMovimientoDesc] [char](40) NULL,
 CONSTRAINT [PKTCTETipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[fiMovimientoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEJefePromotor]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TATEJefePromotor](
	[fiPromotorId] [int] NOT NULL,
	[fiSupervisorId] [int] NOT NULL,
 CONSTRAINT [PK001TATEJefePromotor] PRIMARY KEY CLUSTERED 
(
	[fiPromotorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[virtualClienteMDN]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[virtualClienteMDN](
	[mdn] [varchar](20) NULL,
	[clienteunico] [varchar](200) NULL,
	[nombre] [varchar](50) NULL,
	[monto] [int] NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Venta_ATT]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta_ATT](
	[SUCURSAL] [float] NULL,
	[PAIS] [float] NULL,
	[CANAL] [float] NULL,
	[PEDIDO] [float] NULL,
	[IMEI] [nvarchar](255) NULL,
	[ICCID] [nvarchar](255) NULL,
	[CUENTA_ATT] [nvarchar](255) NULL,
	[CONTRATO_ATT] [nvarchar](255) NULL,
	[MDN_ATT] [nvarchar](255) NULL,
	[FECHA_CANCELACION] [nvarchar](255) NULL,
	[ESTATUS_VENTA] [float] NULL,
	[EMPLEADO_QUE_SURTE] [nvarchar](255) NULL,
	[TIPO_VENTA] [float] NULL,
	[NEGOCIO_ID] [float] NULL,
	[SKU] [float] NULL,
	[FECHA_SURTIMIENTO] [nvarchar](255) NULL,
	[USUARIO_QUE_GENERA_PEDIDO] [nvarchar](255) NULL,
	[USUARIO] [nvarchar](255) NULL,
	[USUARIO_PRESUPUESTO] [nvarchar](255) NULL,
	[ESTATUS_PEDIDO] [float] NULL,
	[FECHA_SURTIMIENTO1] [nvarchar](255) NULL,
	[FECHA_GENERACION_PEDIDO] [nvarchar](255) NULL,
	[FECHA_ACTIVACION] [nvarchar](255) NULL,
	[FECHA_CANCELACION1] [nvarchar](255) NULL,
	[MOTIVO_CANCELACION] [float] NULL,
	[ESTATUS_CANCELACION] [float] NULL,
	[OBSERVACIONES_CANCELACION] [nvarchar](255) NULL,
	[NOMBRE_CLIENTE] [nvarchar](255) NULL,
	[APELLIDO_PATERNO_CLIENTE] [nvarchar](255) NULL,
	[APELLIDO_MATERNO_CLIENTE] [nvarchar](255) NULL
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[TCTEStatusPromo]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTEStatusPromo](
	[fiStatus] [tinyint] NOT NULL,
	[fcStatusDesc] [char](40) NOT NULL,
 CONSTRAINT [PKTCTEStatusPromo] PRIMARY KEY CLUSTERED 
(
	[fiStatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTEPromoGanadores]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTEPromoGanadores](
	[fiPromoID] [int] IDENTITY(1,1) NOT NULL,
	[fiPromoNum] [int] NULL,
	[finoPedido] [int] NULL,
	[fiNumTienda] [int] NULL,
	[fiTipoPremio] [int] NULL,
	[fiNoCliente] [varchar](50) NULL,
	[fcNombreCliente] [varchar](100) NULL,
	[fcDesPremio] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[fiPromoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTEMotivoBaja]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTEMotivoBaja](
	[fiMotivoId] [smallint] NOT NULL,
	[fcMotivoDesc] [char](40) NULL,
	[fiEstatusBaja] [int] NULL,
 CONSTRAINT [PKTCTEMotivoBaja] PRIMARY KEY CLUSTERED 
(
	[fiMotivoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTECatalogoGenerico]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTECatalogoGenerico](
	[fiCatalogoId] [int] NOT NULL,
	[fcDescripcion] [char](100) NOT NULL,
	[fiModulo] [tinyint] NOT NULL,
	[flStatus] [bit] NOT NULL,
 CONSTRAINT [pkTCTECatalogoGenerico] PRIMARY KEY CLUSTERED 
(
	[fiCatalogoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEVentasPromotor]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEVentasPromotor](
	[fiRegistroId] [int] IDENTITY(1,1) NOT NULL,
	[fiPromotorId] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiNoPedido] [int] NOT NULL,
	[fdPedFec] [smalldatetime] NOT NULL,
	[fcNombrePromotor] [varchar](100) NOT NULL,
	[fcApPatvarchar] [varchar](100) NULL,
	[fcApMatProm] [varchar](100) NULL,
	[fiTipoVenta] [int] NOT NULL,
	[fiMontoVenta] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fiRegistroId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEVentaSim]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEVentaSim](
	[fcNoTelefono] [char](15) NOT NULL,
	[fiNegocioId] [tinyint] NOT NULL,
	[fiPais] [int] NOT NULL,
	[fiCanal] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiNoPedido] [int] NOT NULL,
	[fiprodid] [int] NOT NULL,
	[fcNoSerie] [char](30) NOT NULL,
	[fcEmpNo] [char](10) NOT NULL,
	[fnMonto] [decimal](8, 2) NULL,
	[flEsEkt] [bit] NOT NULL,
	[fdFechaVenta] [datetime] NOT NULL,
	[fdFechaCancelacion] [datetime] NULL,
	[flEsValido] [bit] NULL,
	[fdFechaActivacion] [datetime] NULL,
	[fdFechaAbono] [datetime] NULL,
 CONSTRAINT [PKTATEVentaSim] PRIMARY KEY CLUSTERED 
(
	[fcNoTelefono] ASC,
	[fiNegocioId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEVale]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEVale](
	[fiPais] [int] NULL,
	[fiCanal] [int] NULL,
	[fiNoTienda] [int] NULL,
	[fiNoPedido] [int] NULL,
	[fnMontoVale] [decimal](12, 2) NULL,
	[fcVale] [varchar](50) NULL,
	[fcValeCifrado] [varchar](255) NULL,
	[fcVigencia] [varchar](25) NULL,
	[fcConsecMV] [varchar](50) NULL,
	[fdVale] [datetime] NULL,
	[fdSurtimiento] [datetime] NULL
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTEPaises]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTEPaises](
	[fiPaisID] [int] NOT NULL,
	[fcDescripcion] [varchar](20) NOT NULL,
 CONSTRAINT [PKTCTEPaises] PRIMARY KEY NONCLUSTERED 
(
	[fiPaisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTEPaisCanal]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTEPaisCanal](
	[fiCanalId] [int] NOT NULL,
	[fiPaisID] [int] NOT NULL,
	[fcDescripcion] [varchar](80) NOT NULL,
	[fiEstatus] [int] NOT NULL,
 CONSTRAINT [PKTCTEPaisCanal] PRIMARY KEY NONCLUSTERED 
(
	[fiCanalId] ASC,
	[fiPaisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTEPlazas]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTEPlazas](
	[fiPlazaID] [int] NOT NULL,
	[fiPaisID] [int] NOT NULL,
	[fcDescripcion] [varchar](100) NOT NULL,
	[fiEstatus] [int] NOT NULL,
 CONSTRAINT [PKTCTEPlazas] PRIMARY KEY NONCLUSTERED 
(
	[fiPlazaID] ASC,
	[fiPaisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTEDetalleCatalogoGenerico]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTEDetalleCatalogoGenerico](
	[fiCatalogoId] [int] NOT NULL,
	[fiItemId] [smallint] NOT NULL,
	[fcDescripcion] [char](255) NOT NULL,
	[flStatus] [bit] NOT NULL,
 CONSTRAINT [pkTCTEDetalleCatalogoGenerico] PRIMARY KEY CLUSTERED 
(
	[fiCatalogoId] ASC,
	[fiItemId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTECompania]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTECompania](
	[fiCompaniaId] [int] NOT NULL,
	[fcCompaniaDesc] [char](40) NULL,
	[fiPaisID] [int] NULL,
 CONSTRAINT [PKTCTECompania] PRIMARY KEY CLUSTERED 
(
	[fiCompaniaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEDetallePromocionEspecial]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEDetallePromocionEspecial](
	[fiFolio] [bigint] NOT NULL,
	[fiMovimiento] [int] NOT NULL,
	[fiTipoMovimiento] [smallint] NOT NULL,
	[fcDetalle] [varchar](100) NULL,
	[fcWS] [varchar](12) NOT NULL,
	[fcEmpleado] [varchar](10) NOT NULL,
	[fiCantidad] [smallint] NOT NULL,
	[fnMonto] [decimal](12, 4) NULL,
	[fdFecha] [smalldatetime] NULL,
 CONSTRAINT [pkTATEDetallePromocionEspecial] PRIMARY KEY CLUSTERED 
(
	[fiMovimiento] ASC,
	[fiFolio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEPromovendedorHist]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEPromovendedorHist](
	[fiPromovendedorId] [int] NOT NULL,
	[fiConsec] [smallint] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiTipoVendedorId] [smallint] NOT NULL,
	[fcNombre] [char](40) NOT NULL,
	[fcAPaterno] [char](40) NOT NULL,
	[fcAMaterno] [char](40) NOT NULL,
	[fcRFC] [char](20) NOT NULL,
	[fcFechNacimiento] [char](10) NOT NULL,
	[fcTelefono] [char](10) NOT NULL,
	[fcTelefonoCel] [char](10) NULL,
	[fcTelefonoRec] [char](10) NULL,
	[fiCompaniaId] [int] NOT NULL,
	[fcHorario] [char](8) NOT NULL,
	[fiDiaDescanso] [tinyint] NOT NULL,
	[fiStatus] [tinyint] NOT NULL,
	[fcJefeInme] [char](60) NOT NULL,
	[fcEmail] [char](60) NULL,
	[fiNoPromo] [char](10) NULL,
	[fdFecRegistro] [datetime] NULL,
	[fdCambio] [datetime] NOT NULL,
	[fcEmpNo] [varchar](10) NOT NULL,
	[fiMovimientoId] [smallint] NOT NULL,
	[fiPuestoId] [int] NULL,
	[fiPaisID] [int] NULL,
	[fiCanalId] [int] NULL,
	[fcCorreoModifica] [varchar](255) NULL,
	[fcIPModifica] [varchar](50) NULL,
	[fcCURP] [varchar](18) NULL,
 CONSTRAINT [PKTATEPromovendedorHist] PRIMARY KEY CLUSTERED 
(
	[fiPromovendedorId] ASC,
	[fiConsec] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spConVentaVale]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConVentaVale](
	@piPais		INT,
	@piCanal	INT,
	@piNoTienda	INT,
	@piNoPedido	INT
)
AS

SET NOCOUNT ON

IF EXISTS (SELECT fiPais FROM dbo.TATEVale WITH(NOLOCK) WHERE fiPais = @piPais AND fiCanal = @piCanal AND fiNoTienda = @piNoTienda AND fiNoPedido = @piNoPedido)
BEGIN
	SELECT  fiPais, fiCanal, fiNoTienda, fiNoPedido, fnMontoVale, fcVale, fcValeCifrado, fcVigencia, fcConsecMV
	FROM dbo.TATEVale WITH(NOLOCK)
	WHERE fiPais = @piPais AND fiCanal = @piCanal AND fiNoTienda = @piNoTienda AND fiNoPedido = @piNoPedido
END

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsAutEstatus]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Inserta o actualiza registro de la tabla AutEstatus
	----------------------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel Lopez Rosales
	Fecha: agosto de 2019
***********************************************************************************/
CREATE PROCEDURE [dbo].[spInsAutEstatus]
(
	@piIdEstatus	INT,
	@pcEstatusDesc	VARCHAR(50)
)
AS

BEGIN TRY
	IF EXISTS (
		SELECT	fiIdEstatus 
		FROM	dbo.AutEstatus WITH(NOLOCK) 
		WHERE	fiIdEstatus = @piIdEstatus)
	BEGIN 
		UPDATE dbo.AutEstatus SET fcEstatusDesc = @pcEstatusDesc WHERE fiIdEstatus = @piIdEstatus
	END
	ELSE
	BEGIN
		INSERT INTO dbo.AutEstatus (fiIdEstatus, fcEstatusDesc)
		VALUES (@piIdEstatus, @pcEstatusDesc)
	END
END TRY
BEGIN CATCH
	DECLARE @vcError VARCHAR(1000)
	SET @vcError = ERROR_MESSAGE() + '. NumError = ' + CAST(ERROR_NUMBER() AS VARCHAR(100))
	RAISERROR(@vcError, 18, 1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spInsAutAplicacion]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Inserta aplicación en AutAplicacion
	------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel Lopez Rosales
	Fecha: agosto de 2019
***********************************************************************************/
CREATE PROCEDURE [dbo].[spInsAutAplicacion]
(
	@piIdAplicacion			INT,
	@pcNombreAplicacion		VARCHAR(50),
	@pcDescripcion			VARCHAR(100)
)
AS

BEGIN TRY
	IF EXISTS (
		SELECT	fiIdAplicacion 
		FROM	dbo.AutAplicacion WITH(NOLOCK) 
		WHERE fiIdAplicacion = @piIdAplicacion)
	BEGIN 
		UPDATE	dbo.AutAplicacion 
		SET		fcNombreAplicacion	= @pcNombreAplicacion,
				fcDescripcion		= @pcDescripcion
		WHERE fiIdAplicacion = @piIdAplicacion
	END
	ELSE
	BEGIN
		INSERT INTO dbo.AutAplicacion (fiIdAplicacion, fcNombreAplicacion, fcDescripcion)
		VALUES (@piIdAplicacion, @pcNombreAplicacion, @pcDescripcion)
	END
END TRY
BEGIN CATCH
	DECLARE @vcError VARCHAR(1000)
	SET @vcError = ERROR_MESSAGE() + '. NumError = ' + CAST(ERROR_NUMBER() AS VARCHAR(100))
	RAISERROR(@vcError, 18, 1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spConTelValidaClientePromocion]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************
   Descripción: Valida si un cliente es válido para aplicar la promoción
   ----------------------------------------------------------------------
   Fecha: 04/10/2012
   Responsable: Angel Israel López Rosales
*****************************************************************************/
CREATE PROCEDURE [dbo].[spConTelValidaClientePromocion]
(
   @piPais       INT, --Pais del cliente
   @piCanal      INT, --Canal del cliente
   @piSucursal   INT, --Sucursal del cliente
   @piFolio      INT, --Folio del cliente
   @piNegocioTel INT  --Negocio del plan
)
AS
DECLARE @vcMensaje VARCHAR(255),@viAplica TINYINT
BEGIN TRY
   SET @viAplica=0
   IF EXISTS (
      SELECT fiPais 
      FROM   [DBO].[TATEClientesTelcel] WITH(NOLOCK)
      WHERE  fiPais=@piPais
         AND fiCanal=@piCanal
         AND fiSucursal=@piSucursal
         AND fiFolio=@piFolio
         AND CASE 
             WHEN @piNegocioTel IN (47,11) AND flIusacell=0 THEN 1
             WHEN @piNegocioTel IN (31) AND flMovistar=0 THEN 1
             ELSE 0
             END=1
      )
   BEGIN
      SET @viAplica=1
   END
   SELECT Aplica=@viAplica
END TRY
BEGIN CATCH
   SET @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje,18,1)
   RETURN -1
END CATCH
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConTelPromoActivaciones]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConTelPromoActivaciones]
(
   @pcNombrePromo VARCHAR(8000), 
   @pcClavePromo VARCHAR(10)
)
AS
SET NOCOUNT ON
SELECT fcClaveEconomica,fcCvePromovendedor,fcNombrePromovendedor,fcTienda FROM dbo.TATEPromovendedorIusacell
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConsultaLimitePromoganadores]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaLimitePromoganadores]
	@pipromo int
AS

DECLARE 
@viResul int,
@viContador int

SELECT @viResul=0,@viContador=0
SET NOCOUNT ON 
	SELECT @viContador=COUNT(*) FROM TATEPromoGanadores where fiPromoID=@pipromo and fcDesPremio='Set de Cocina' 
	IF(@pipromo=2629)
	BEGIN
		IF(@viContador<50)
			BEGIN
				SET @viResul=1 
			END
	END
	ELSE IF(@pipromo=2627)
	BEGIN
			IF(@viContador<200)
			BEGIN
				SET @viResul=1 
			END
	END
	SELECT @viResul
 
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConPromoGanadores]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConPromoGanadores]
	@piNoPedido		INT,
	@piNoSucrusal	INT
AS
DECLARE 
	@vcTipoPremio varchar(100),
	@vdFechaHoy	smalldatetime,
	@vcNumCliente varchar(50),
	@vcNombreCliente varchar(100),
	@viPromoId INT

IF EXISTS( select fiNoPedido from TATEPromoGanadores with (NOLOCK) where finoPedido= @piNoPedido AND fiNoTienda=@piNoSucrusal)
	BEGIN
	select @viPromoId=ISNULL(fiPromoID,0) , @vcTipoPremio=ISNULL(RTRIM(PGD.fcDesPremio),''),@vcNumCliente=ISNULL(RTRIM(PGD.fcNoCliente),''),@vcNombreCliente=ISNULL(RTRIM(PGD.fcNombreCliente),'')  from TATEPromoGanadores PGD with (NOLOCK) where fiNoPedido= @piNoPedido AND fiNoTienda=@piNoSucrusal
		IF(@viPromoId=2629 and @vcTipoPremio='Set de Cocina Lanix')
		BEGIN
			SET @vcTipoPremio='Lanix'
		END
		ELSE IF(@viPromoId=2627 and @vcTipoPremio='Set de Cocina Sony')
		BEGIN
			SET @vcTipoPremio='Sony'
		END
		select @vdFechaHoy= GETDATE() 
			 select '<Datos><DatosImpresion><Tipo>tck</Tipo></DatosImpresion><TCKBF><NumPedido>'+ convert(varchar(10), @piNoPedido) +'</NumPedido>' +
			 + '<FechaActual>'+Convert(char(10),@vdFechaHoy,103)+  '</FechaActual>'+
			 +'<TipoBoleto>'+@vcTipoPremio+'</TipoBoleto>'+
			 +'<NumCliente>'+@vcNumCliente+'</NumCliente>'+
			 +'<NombreCliente>'+@vcNombreCliente+'</NombreCliente>'+
			 +'</TCKBF></Datos>'   as XMLPROMOMOVI
	END
GO
/****** Object:  UserDefinedFunction [dbo].[Tablas]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Tablas](@IdEmpleado int)
Returns Table
AS
       Return (Select *
       From [dbo].[AutEstatus] WHERE fiIdEstatus=@IdEmpleado)
GO
/****** Object:  UserDefinedFunction [dbo].[Tabla]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[Tabla](@IdEmpleado int)
Returns Table
AS
       Return (Select *
       From [dbo].[AutEstatus] )
GO
/****** Object:  StoredProcedure [dbo].[spUpdCatalogoGenerico]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**************************************************************
   Descripción: Inserta en CatalogoGenerico
   Responsable: Angel Israel López Rosales
   Fecha: 4 de marzo del 2013
***************************************************************/
CREATE PROCEDURE [dbo].[spUpdCatalogoGenerico]
   @piCatalogoId  INT,
   @pcDescripcion CHAR(100),
   @piModulo      TINYINT,
   @plStatus      BIT
AS
SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY
   BEGIN TRAN
      UPDATE cg
      SET    fcDescripcion = @pcDescripcion,
             fiModulo      = @piModulo,
             flStatus      = @plStatus
      FROM   dbo.TCTECatalogoGenerico cg
      WHERE  cg.fiCatalogoId = @piCatalogoId
   COMMIT TRAN
END TRY
BEGIN CATCH
   DECLARE @vcError VARCHAR(255)
   SET @vcError = ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spUpdTelClientePromocion]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************
   Descripción: Actualiza los datos del cliente que obtuvo la promoción
   ----------------------------------------------------------------------
   Fecha: 04/10/2012
   Responsable: Angel Israel López Rosales
*****************************************************************************/
CREATE PROCEDURE [dbo].[spUpdTelClientePromocion]
(
   @piPais       INT,         --Pais del cliente
   @piCanal      INT,         --Canal del cliente
   @piSucursal   INT,         --Sucursal del cliente
   @piFolio      INT,         --Folio del cliente
   @piTienda     INT,         --Tienda donde se surte el pedido
   @piPedido     INT,         --Número de pedido
   @piSku        INT,         --Código del producto
   @pcPlan       VARCHAR(50), --Plan que se vendió
   @piNegocioTel INT  --Negocio del plan
)
AS
SET XACT_ABORT ON;
SET NOCOUNT ON
DECLARE @vcMensaje VARCHAR(255)
BEGIN TRY
   BEGIN TRANSACTION
   IF NOT EXISTS (
      SELECT fiPais 
      FROM   [DBO].[TATEClientesTelcel] WITH(NOLOCK)
      WHERE  fiPais=@piPais
         AND fiCanal=@piCanal
         AND fiSucursal=@piSucursal
         AND fiFolio=@piFolio
      )
   BEGIN
      RAISERROR('No se encuentra el cliente en la base de datos. ',18,1)
   END
   ELSE
   BEGIN
      IF (@piNegocioTel IN (47,11))
      BEGIN
         UPDATE [DBO].[TATEClientesTelcel]
         SET    flIusacell=1,
                fiSucursalI=@piTienda,
                fiNoPedidoI=@piPedido,
                fiProdIdI=@piSku,
                fiIdServADNI=CAST(@pcPlan AS INT),
                fdFechaI=GETDATE()
         WHERE  fiPais=@piPais
            AND fiCanal=@piCanal
            AND fiSucursal=@piSucursal
            AND fiFolio=@piFolio
      END
      IF (@piNegocioTel=31)
      BEGIN
         UPDATE [DBO].[TATEClientesTelcel]
         SET    flMovistar=1,
                fiSucursalM=@piTienda,
                fiNoPedidoM=@piPedido,
                fiProdIdM=@piSku,
                fiIdServADNM=CAST(@pcPlan AS INT),
                fdFechaM=GETDATE()
         WHERE  fiPais=@piPais
            AND fiCanal=@piCanal
            AND fiSucursal=@piSucursal
            AND fiFolio=@piFolio
      END
   END
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SET @vcMensaje=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcMensaje,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spUpdTCTEParametro]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************
   Descripción: Actualiza valores en la tabla TCTEParametro
   ----------------------------------------------------
   Fecha: 20/03/2013
   Responsable: Angel Israel López Rosales
**************************************************************************/
CREATE PROCEDURE [dbo].[spUpdTCTEParametro]
   @piPrmId    SMALLINT,
   @pcPrmDesc  CHAR(45),
   @pcPrmVal   CHAR(45),
   @pcTipoDato CHAR(1)
AS
SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @vcError VARCHAR(255)

BEGIN TRY
   IF NOT EXISTS (SELECT fiPrmId FROM dbo.TCTEParametro WITH(NOLOCK) WHERE fiPrmId = @piPrmId)
   BEGIN
      RAISERROR('El parámetro no existe por lo que no se puede insertar. ', 18, 1)
   END
   BEGIN TRANSACTION 
      UPDATE dbo.TCTEParametro 
      SET    fcPrmDesc  = @pcPrmDesc,
             fcPrmVal   = @pcPrmVal,
             fcTipoDato = @pcTipoDato
      WHERE fiPrmId = @piPrmId
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsTCTEParametro]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************
   Descripción: Inserta en la tabla TCTEParametro
   ----------------------------------------------------
   Última modificación: Agrega lógica para actualizar o borrar
   Responsable: Angel Israel López Rosales
   Fecha: 9 de septiembre del 2013
******************************************************************************************************/
CREATE PROCEDURE [dbo].[spInsTCTEParametro]
   @piPrmId    SMALLINT,
   @pcPrmDesc  CHAR(45),
   @pcPrmVal   CHAR(45),
   @pcTipoDato CHAR(1),
   @piAccion   INT --Tipo de accion a realizar, 1=Insertar o actualizar, 2=Borrar
AS
SET NOCOUNT ON
SET XACT_ABORT ON

DECLARE @vcError VARCHAR(255)

BEGIN TRY
   IF (@piAccion NOT IN (1,2))
      RAISERROR('El tipo de accion proporcionado no existe', 18, 1)
   BEGIN TRANSACTION 
      IF (@piAccion = 1)
      BEGIN
         IF (@piPrmId <= 0)
            RAISERROR('No se puede insertar un parámetro con id menor o igual a cero', 18, 1)
         IF ((@pcPrmDesc IS NULL OR LTRIM(RTRIM(@pcPrmDesc)) = ''))
            RAISERROR('No se puede insertar un parámetro con descripción nula o vacia', 18, 1)
         IF ((@pcPrmVal IS NULL OR LTRIM(RTRIM(@pcPrmVal)) = ''))
            RAISERROR('No se puede insertar un parámetro con valor nulo o vacio', 18, 1)
         IF EXISTS (SELECT fiPrmId FROM dbo.TCTEParametro WITH(NOLOCK) WHERE fiPrmId = @piPrmId)
         BEGIN
            UPDATE dbo.TCTEParametro SET fcPrmDesc = @pcPrmDesc, fcPrmVal = @pcPrmVal, fcTipoDato = @pcTipoDato WHERE fiPrmId = @piPrmId
         END
         ELSE
         BEGIN
            INSERT INTO dbo.TCTEParametro (fiPrmId, fcPrmDesc, fcPrmVal, fcTipoDato) VALUES (@piPrmId, @pcPrmDesc, @pcPrmVal, @pcTipoDato)
         END
      END
      ELSE IF (@piAccion = 2)
      BEGIN
         DELETE dbo.TCTEParametro WHERE fiPrmId = @piPrmId
      END
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsTATEPromoGanadoresBoletoMovistar]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------------------------------------------
---Responsable: Antonio de Jesus Domínguez Cuevas
---Fecha: MAYO 2017
---Descripción: SP Inscripcion a promoganadores
-------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[spInsTATEPromoGanadoresBoletoMovistar]
	@piNoPais INT,
	@piNoCanal INT,
	@piNoTienda INT,
	@piNoPedido INT,
	@piPromoID	INT,
	@pcNombreCliente varchar(100),
	@pcTelContacto varchar(100)
AS
Declare @vcError varchar(100),
@viAplico int
SET NOCOUNT ON
BEGIN TRAN	 InsPromogan
	IF NOT EXISTS (SELECT finoPedido FROM dbo.TATEPromoGanadoresBoletoMovistar WITH (NOLOCK) WHERE finoPedido=@pinopedido and fiNoTienda=@piNoTienda)
		BEGIN
			INSERT INTO dbo.TATEPromoGanadoresBoletoMovistar values (@piNoPais,@piNoCanal,@piNoTienda,@piNoPedido,@piPromoID,@pcNombreCliente,@pcTelContacto)
			IF @@ERROR<>0 GOTO Error
		END
	ELSE
		BEGIN
		set @vcError='Ya existe un pedido en la tabla de promo ganadores'  
		goto Error
		END
	
 COMMIT TRAN  InsPromogan
 
 IF EXISTS (SELECT finoPedido FROM dbo.TATEPromoGanadoresBoletoMovistar WITH (NOLOCK) WHERE finoPedido=@pinopedido )
	BEGIN
		set @viAplico=   1
	END
SELECT Aplica = @viAplico
SET NOCOUNT OFF
Return
Error:
	ROLLBACK TRAN   InsPromogan
	SET NOCOUNT OFF
	RAISERROR(@vcError,18,1)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[spInsTATEPromoGanadores]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsTATEPromoGanadores]
	@piNoPais INT,
	@piNoCanal INT,
	@piNoTienda INT,
	@piNoPedido INT,
	@piPromoID	INT,
	@pcNoCliente varchar(100),	
	@pcNombreCliente varchar(100),
	@pcDesPremio varchar(100)
AS
Declare @vcError varchar(100),
@viAplico int
SET NOCOUNT ON
BEGIN TRAN	 InsPromogan
	IF NOT EXISTS (SELECT finoPedido FROM dbo.TATEPromoGanadores WITH (NOLOCK) WHERE finoPedido=@pinopedido and fiNoTienda=@piNoTienda)
		BEGIN
			INSERT INTO dbo.TATEPromoGanadores values (@piNoPais,@piNoCanal,@piNoTienda,@piNoPedido,@piPromoID,@pcNoCliente,@pcNombreCliente,@pcDesPremio)
			IF @@ERROR<>0 GOTO Error
		END
	ELSE
		BEGIN
		set @vcError='Ya existe un pedido en la tabla de promo ganadores'  
		goto Error
		END
	
 COMMIT TRAN  InsPromogan
 
 IF EXISTS (SELECT finoPedido FROM dbo.TATEPromoGanadores WITH (NOLOCK) WHERE finoPedido=@pinopedido )
	BEGIN
		set @viAplico=   1
	END
SELECT Aplica = @viAplico
SET NOCOUNT OFF
Return
Error:
	ROLLBACK TRAN   InsPromogan
	SET NOCOUNT OFF
	RAISERROR(@vcError,18,1)
	RETURN
GO
/****** Object:  StoredProcedure [dbo].[spInsTATEDetalleVale]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: Angel Israel Lopez Rosales
 Fecha  :     Diciembre 2019
 Descripción: Campos nuevos de promocion
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  
CREATE PROCEDURE [dbo].[spInsTATEDetalleVale]
(	
	@piPais				INT,
	@piCanal			INT,
	@piNoTienda			INT,
	@piNoPedido			INT,
	@piProdId			INT,
	@piCantidad			INT,
	@pnPrecio			DECIMAL(12, 2),
	@pnPrecioDe			DECIMAL(12, 2),
	@pnSobreprecio		DECIMAL(12, 2),
	@pnCosto			DECIMAL(12, 2),
	@pnIntereses		DECIMAL(12, 2),
	@pcDescripcion		VARCHAR(50),
	@pnEnganche			DECIMAL(12, 2),
	@pnDescuento		DECIMAL(12, 2),
	@pnDescuentoE		DECIMAL(12, 2),
	@piDepto			INT,
	@piSubDepto			INT,
	@piClase			INT,
	@piSubClase			INT
)
AS
BEGIN TRY
	INSERT INTO dbo.TATEDetalleVale (fiPais, fiCanal, fiNoTienda, fiNoPedido, fiProdId, fiCantidad, fnPrecio, fnPrecioDe, fnSobreprecio, fnCosto, fnIntereses, fcDescripcion, fnEnganche, fnDescuento, fnDescuentoE, fiDepto, fiSubDepto, fiClase, fiSubClase)   
	VALUES (@piPais, @piCanal, @piNoTienda, @piNoPedido, @piProdId, @piCantidad, @pnPrecio, @pnPrecioDe, @pnSobreprecio, @pnCosto, @pnIntereses, @pcDescripcion, @pnEnganche, @pnDescuento, @pnDescuentoE, @piDepto, @piSubDepto, @piClase, @piSubClase)
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE()
	RETURN 1
END CATCH
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsVentaVale]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsVentaVale](
	@piPais			INT,
	@piCanal		INT,
	@piNoTienda		INT,
	@piNoPedido		INT,
	@pnMontoVale	DECIMAL(12, 2),
	@pcVale			VARCHAR(50),
	@pcValeCifrado	VARCHAR(255),
	@pcVigencia		VARCHAR(25),
	@pcConsecMV		VARCHAR(50),
	@pdSurtimiento	DATETIME = NULL
)
AS

SET NOCOUNT ON

DECLARE @vdVale DATETIME

SET @vdVale = GETDATE()

IF NOT EXISTS (SELECT fiPais FROM dbo.TATEVale WITH(NOLOCK) WHERE fiPais = @piPais AND fiCanal = @piCanal AND fiNoTienda = @piNoTienda AND fiNoPedido = @piNoPedido)
BEGIN
	IF(@pdSurtimiento IS NULL)
	BEGIN
		SET @pdSurtimiento = @vdVale
	END
	INSERT INTO dbo.TATEVale (fiPais, fiCanal, fiNoTienda, fiNoPedido, fnMontoVale, fcVale, fcValeCifrado, fcVigencia, fcConsecMV, fdVale, fdSurtimiento)
	VALUES (@piPais, @piCanal, @piNoTienda, @piNoPedido, @pnMontoVale, @pcVale, @pcValeCifrado, @pcVigencia, @pcConsecMV, @vdVale, @pdSurtimiento)
END

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsAutRoles]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Inserta información de los roles en AutRoles
	---------------------------------------------------------
	Última modificación: creación del stored procedure
	Fecha: agosto de 2019
	Responsable: Angel Israel Lopez Rosales
***********************************************************************************/
CREATE PROCEDURE [dbo].[spInsAutRoles]
(
	@piIdRol		INT,
	@pcRol			VARCHAR(50)
)
AS

BEGIN TRY
	IF EXISTS (
		SELECT	fiIdRol 
		FROM	dbo.AutRoles WITH(NOLOCK) 
		WHERE fiIdRol = @piIdRol)
	BEGIN 
		UPDATE dbo.AutRoles SET fcRol = @pcRol WHERE fiIdRol = @piIdRol
	END
	ELSE
	BEGIN
		INSERT INTO dbo.AutRoles (fiIdRol, fcRol)
		VALUES (@piIdRol, @pcRol)
	END
END TRY
BEGIN CATCH
	DECLARE @vcError VARCHAR(1000)
	SET @vcError = ERROR_MESSAGE() + '. NumError = ' + CAST(ERROR_NUMBER() AS VARCHAR(100))
	RAISERROR(@vcError, 18, 1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spInsCatalogoGenerico]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************************
   Descripción: Inserta, actualiza o borra en TCTECatalogoGenerico
   ---------------------------------------------------------------------------------------------------
   Última modificación: Agrega lógica para actualizar o borrar
   Responsable: Angel Israel López Rosales
   Fecha: 9 de septiembre del 2013
******************************************************************************************************/
CREATE PROCEDURE [dbo].[spInsCatalogoGenerico]
   @piCatalogoId  INT,
   @pcDescripcion CHAR(100),
   @piModulo      TINYINT,
   @plStatus      BIT,
   @piAccion      INT --Tipo de accion a realizar, 1=Insertar o actualizar, 2=Borrar
AS
SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY
   IF (@piAccion NOT IN (1,2))
      RAISERROR('El tipo de accion proporcionado no existe', 18, 1)
   BEGIN TRAN
      IF (@piAccion = 1)
      BEGIN
         IF (@piCatalogoId <= 0)
            RAISERROR('No se puede insertar un catálogo con id menor o igual a cero', 18, 1)
         IF ((@pcDescripcion IS NULL OR LTRIM(RTRIM(@pcDescripcion)) = ''))
            RAISERROR('No se puede insertar un catálogo con descripción nula o vacia', 18, 1)
         IF EXISTS (SELECT fiCatalogoId FROM dbo.TCTECatalogoGenerico WITH (NOLOCK) WHERE fiCatalogoId = @piCatalogoId)
         BEGIN
            UPDATE dbo.TCTECatalogoGenerico SET fcDescripcion = @pcDescripcion, fiModulo = @piModulo, flStatus = @plStatus WHERE fiCatalogoId = @piCatalogoId
         END
         ELSE
         BEGIN
            INSERT INTO dbo.TCTECatalogoGenerico (fiCatalogoId, fcDescripcion, fiModulo, flStatus) VALUES (@piCatalogoId, @pcDescripcion, @piModulo, @plStatus)
         END
      END
      ELSE IF (@piAccion = 2)
      BEGIN
         DELETE dbo.TCTECatalogoGenerico WHERE fiCatalogoId = @piCatalogoId
      END
   COMMIT TRAN
END TRY
BEGIN CATCH
   DECLARE @vcError VARCHAR(255)
   SET @vcError = ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsPromoGanadores]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spInsPromoGanadores]
   @piNumPromo  INT,
   @pinopedido INT,
   @piNumTienda  INT,
   @piTipoPremio INT,
   @piNoCliente  varchar(50),
   @pcNombreCliente varchar(100),
   @pcPremio     varchar (100)
AS
Declare @vcError varchar(100),
@viAplico int
SET NOCOUNT ON
BEGIN TRAN	 InsPromogan
	IF NOT EXISTS (SELECT finoPedido FROM dbo.TCTEPromoGanadores WITH (NOLOCK) WHERE finoPedido=@pinopedido)
		BEGIN
			INSERT INTO dbo.TCTEPromoGanadores values (@piNumPromo,@pinopedido,@piNumTienda,@piTipoPremio,@piNoCliente,@pcNombreCliente,@pcPremio)
			IF @@ERROR<>0 GOTO Error
		END
	ELSE
		BEGIN
		set @vcError='Ya existe un pedido en la tabla de promo ganadores'  
		goto Error
		END
	
 COMMIT TRAN  InsPromogan
 
 IF EXISTS (SELECT finoPedido FROM dbo.TCTEPromoGanadores WITH (NOLOCK) WHERE finoPedido=@pinopedido )
	BEGIN
		set @viAplico=   1
	END
SELECT Aplica = @viAplico
SET NOCOUNT OFF
Return
Error:
	ROLLBACK TRAN   InsPromogan
	SET NOCOUNT OFF
	RAISERROR(@vcError,18,1)
	RETURN
GO
/****** Object:  UserDefinedFunction [dbo].[fnValidaSiAplicaRegla]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************
	Responsable: Angel Israel Lopez Rosales
	Fecha :		 Diciembre 2019
	Descripción: Valida si aplica regla
	Aplicación:  Elektra.Negocio.Entidades.Promovendedor.dll
*************************************************************************************/
CREATE FUNCTION [dbo].[fnValidaSiAplicaRegla]
(
	@piReglaID			INT,
	@piDepartamento		INT,
	@piSubdepartamento	INT,
	@piClase			INT,
	@piSubclase			INT,
	@piSku				INT
)
RETURNS INT
AS
BEGIN

DECLARE @viResult INT

IF EXISTS (
	SELECT CF.fireglaID 
	FROM ProClasificacionFija CF WITH (NOLOCK)
	WHERE   CF.fireglaID = @piReglaID 
		AND (CF.fiDepto = @piDepartamento OR CF.fiDepto=0)
		AND (CF.fiSubDepto = @piSubdepartamento OR CF.fiSubDepto=0)
		AND (CF.fiClase = @piClase OR CF.fiClase =0)
		AND (CF.fiSubClase = @piSubclase OR CF.fiSubClase=0)
		AND (CF.fisku = @pisku OR CF.fiSku=0)
	) 
	SET @viResult= 1
ELSE
	SET @viResult=0

RETURN @viResult
END
GO
/****** Object:  StoredProcedure [dbo].[PATELIMultasSAP]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************
   Descripción: Consulta el folio a insertar en la tabla TATEMultasSAP
   -------------------------------------------------------------------------
   Fecha: 21/05/2013
   Responsable: Angel Israel López Rosales
   Modificación: Inserta nuevos campos y update a la parte de asistencias 
      diarias
****************************************************************************/
CREATE PROCEDURE [dbo].[PATELIMultasSAP]
   @piFolio        INT,
   @piTipo         INT,
   @piNegocio      INT,
   @pdEnvio        DATETIME,
   @pcRespuestaSAP VARCHAR(50),
   @pcError        VARCHAR(8000),
   @piNumRegistros INT,
   @pcFolioSAP     VARCHAR(50)
AS

SET NOCOUNT ON
DECLARE @vcError VARCHAR(255)
BEGIN TRY
   INSERT INTO dbo.TATEMultasSAP (fiFolio, fiTipo, fiNegocio, fdEnvio, fcRespuestaSAP, fcError, fiNumRegistros, fcFolioSAP)
   VALUES (@piFolio, @piTipo, @piNegocio, @pdEnvio, @pcRespuestaSAP, @pcError, @piNumRegistros, @pcFolioSAP)
   
   IF (@piNegocio IN (78,11,47) AND @piTipo=1)
   BEGIN
      UPDATE d
      SET    fiNumVeces = fiNumVeces + 1,
             fiEstatus  = 
             CASE 
                WHEN @pcRespuestaSAP = '3' THEN  1
                ELSE 0
             END
      FROM   dbo.TATEMultaAsistenciaIus d
   END
   ELSE IF (@piNegocio IN (31) AND @piTipo=1)
   BEGIN
      UPDATE d
      SET    fiNumVeces = fiNumVeces + 1,
             fiEstatus  = 
             CASE 
                WHEN @pcRespuestaSAP = '3' THEN  1
                ELSE 0
             END
      FROM   dbo.TATEMultaAsistenciaMovi d
   END 
   
   IF (@piNegocio IN (78,11,47) AND @piTipo=2)
   BEGIN
      UPDATE d
      SET    fiNumVeces = fiNumVeces + 1,
             fiEstatus  = 
             CASE 
                WHEN @pcRespuestaSAP = '3' THEN  1
                ELSE 0
             END
      FROM   dbo.TATEMultaNoSupervisadasIus d
   END
   ELSE IF (@piNegocio IN (31) AND @piTipo=2)
   BEGIN
      UPDATE d
      SET    fiNumVeces = fiNumVeces + 1,
             fiEstatus  = 
             CASE 
                WHEN @pcRespuestaSAP = '3' THEN  1
                ELSE 0
             END
      FROM   dbo.TATEMultaNoSupervisadasMovi d
   END 
   ELSE IF (@piNegocio IN (78,11,47) AND @piTipo=3)
   BEGIN
      UPDATE d
      SET    fiNumVeces = fiNumVeces + 1,
             fiEstatus  = 
             CASE 
                WHEN @pcRespuestaSAP = '3' THEN  1
                ELSE 0
             END
      FROM   dbo.TATEMultaNoAsignadasIus d
   END 
   ELSE IF (@piNegocio IN (31) AND @piTipo=3)
   BEGIN
      UPDATE d
      SET    fiNumVeces = fiNumVeces + 1,
             fiEstatus  = 
             CASE 
                WHEN @pcRespuestaSAP = '3' THEN  1
                ELSE 0
             END
      FROM   dbo.TATEMultaNoAsignadasMovi d
   END
   
END TRY
BEGIN CATCH
    SET @vcError = ERROR_MESSAGE()
    RAISERROR(@vcError, 18, 1)
    SET NOCOUNT OFF
    RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[PATELILibertad]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************
   Descripción: Da de alta plan Libertad 
   ----------------------------------------------------------
   Responsable: Angel Israel López Rosales
   Fecha: 14/02/2013
   Modificación: Agrega validación para cuando exista el registro no intente insertar nuevamente
**************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELILibertad]
   @piPais        INT,
   @piCanal       INT,
   @piNoTienda    INT,
   @piNoPedido    INT,
   @piCodigo      INT,
   @pcCuenta      CHAR(20),
   @pcContrato    CHAR(15),
   @pcDN          CHAR(15),
   @pcICCID       CHAR(25),
   @pcSerie       CHAR(30),
   @pdSurtimiento DATETIME,
   @piPaisCU      INT,
   @piCanalCU     INT,
   @piSucursalCU  INT,
   @piFolioCU     INT
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(255)
SET XACT_ABORT ON
BEGIN TRY
   IF EXISTS (
      SELECT fiPais 
      FROM dbo.TATELibertad WITH (NOLOCK)
      WHERE fiPais = @piPais
         AND fiCanal = @piCanal
         AND fiNoTienda = @piNoTienda
         AND fiNoPedido = @piNoPedido
      )
      RETURN 0
   BEGIN TRANSACTION 
      INSERT INTO dbo.TATELibertad 
      (
         fiPais, 
         fiCanal, 
         fiNoTienda, 
         fiNoPedido,
         fiCodigo, 
         fcCuenta, 
         fcContrato, 
         fcDN, 
         fcICCID, 
         fcSerie, 
         fiEstatus,
         fdSurtimiento, 
         fiPaisCU, 
         fiCanalCU, 
         fiSucursalCU, 
         fiFolioCU
      )
      VALUES
      (
         @piPais,
         @piCanal,
         @piNoTienda,
         @piNoPedido,
         @piCodigo,
         @pcCuenta,
         @pcContrato,
         @pcDN,
         @pcICCID,
         @pcSerie,
         1,
         @pdSurtimiento,
         @piPaisCU,
         @piCanalCU,
         @piSucursalCU,
         @piFolioCU
      )
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELITCTEPuesto]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para alta de puestos.
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELITCTEPuesto] 
(
	@piPuestoId			INT, /*ID del puesto*/
	@pcDescPuesto		VARCHAR(255), /*Descripción del puesto*/
	@piTipoInsercion	TINYINT = 1 /*Tipo de inserción. 0 = Borra, 1 = Inserta - actualiza*/
)
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(100)

BEGIN TRY
	IF(@piTipoInsercion = 0)
	BEGIN
		IF EXISTS (SELECT fiPuestoId FROM dbo.TCTEPuesto WITH(NOLOCK) WHERE fiPuestoId = @piPuestoId)
		BEGIN
			DELETE dbo.TCTEPuesto WHERE fiPuestoId = @piPuestoId
		END
	END
	ELSE IF(@piTipoInsercion = 1)
	BEGIN
		IF EXISTS (SELECT fiPuestoId FROM dbo.TCTEPuesto WITH(NOLOCK) WHERE fiPuestoId = @piPuestoId)
		BEGIN
			UPDATE dbo.TCTEPuesto SET fcDescPuesto = @pcDescPuesto WHERE fiPuestoId = @piPuestoId
		END
		ELSE
		BEGIN
			INSERT INTO dbo.TCTEPuesto (fiPuestoId, fcDescPuesto) VALUES (@piPuestoId, @pcDescPuesto)
		END
	END
END TRY
BEGIN CATCH
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  Table [dbo].[AutUsuario]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AutUsuario](
	[fiIdUsuario] [int] NOT NULL,
	[fiIdAplicacion] [int] NOT NULL,
	[fiIdRol] [int] NOT NULL,
	[fcNombre] [varchar](50) NOT NULL,
	[fcApellidoPaterno] [varchar](50) NOT NULL,
	[fcApellidoMaterno] [varchar](50) NOT NULL,
	[fcCorreoElectronico] [varchar](100) NOT NULL,
 CONSTRAINT [PK001AutUsuario] PRIMARY KEY CLUSTERED 
(
	[fiIdUsuario] ASC,
	[fiIdAplicacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSParametro]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************************************************
   Descripción: Inserta promovendedor en TATEPromovendedor
   -----------------------------------------------------------------------------------------------
   Última modificación: Lee parámetro
   Fecha Modificación: octubre de 2015
   Modifica: ailr
***********************************************************************************************************/  
CREATE FUNCTION [dbo].[FNTELSParametro] (
	@piPrmId INT /*Número de parámetro*/
)
RETURNS VARCHAR(45)
AS
BEGIN
DECLARE @vcPrmId VARCHAR(45)

SET @vcPrmId = NULL

IF EXISTS (SELECT fiPrmId FROM dbo.TCTEParametro WITH(NOLOCK) WHERE fiPrmId = @piPrmId)
BEGIN
	SELECT @vcPrmId = fcPrmVal FROM dbo.TCTEParametro WITH(NOLOCK) WHERE fiPrmId = @piPrmId
END

RETURN @vcPrmId
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaFechas]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FNTELSTablaFechas](
 @FI DATETIME,
 @FF DATETIME
 )
RETURNS @ValueTable TABLE ([Fecha] DATETIME)
BEGIN

 WHILE (@FI <=  @FF)  
 BEGIN
 
  INSERT INTO @ValueTable ( [Fecha]) Values (@FI)
  
  SET @FI = DBO.FNTELSFechaST(DATEADD(DAY, 1, @FI))
  
 END
 
 RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSEstadoLlegadaSegunTiempoActual]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSEstadoLlegadaSegunTiempoActual]
(
	@HR_ENTRADA INT
)
RETURNS		INT
AS
BEGIN
	
	DECLARE  @TIEMPO_ACTUAL  DATETIME
			,@ESTADO_LLEGADA INT
			,@PRMTOLERANCIA  INT
	
	SELECT @PRMTOLERANCIA = CONVERT(INT,ISNULL(fcPrmVal,60)) FROM DBO.TCTEParametro WITH (NOLOCK) WHERE fiPrmId = 15
	SET @TIEMPO_ACTUAL = GETDATE()
	
	IF DATEPART(HOUR, @TIEMPO_ACTUAL) < @HR_ENTRADA
		SET @ESTADO_LLEGADA = 4
	ELSE IF DATEPART(HOUR, @TIEMPO_ACTUAL) = @HR_ENTRADA AND DATEPART(MINUTE, @TIEMPO_ACTUAL) <= @PRMTOLERANCIA
		SET @ESTADO_LLEGADA = 1
	ELSE 
		SET @ESTADO_LLEGADA = 2

RETURN @ESTADO_LLEGADA

END
GO
/****** Object:  Table [dbo].[PROPromocion]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROPromocion](
	[fiPromocionId] [int] NOT NULL,
	[fcNombre] [varchar](30) NULL,
	[fcDescripcion] [varchar](80) NULL,
	[fiTipoPromocionId] [int] NOT NULL,
	[fdVigenciaInicio] [smalldatetime] NOT NULL,
	[fdVigenciaFin] [smalldatetime] NOT NULL,
	[fnMontoMinimo] [decimal](8, 2) NULL,
	[fiActivosDiscontinuos] [tinyint] NULL,
	[fiAlcance] [tinyint] NULL,
	[flSustituta] [bit] NULL,
	[fiPromocionBase] [int] NULL,
	[fnMontoMaximo] [decimal](8, 2) NULL,
 CONSTRAINT [PK4_ProPromocion] PRIMARY KEY CLUSTERED 
(
	[fiPromocionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spConDatosActivacion]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConDatosActivacion]
(
	@piCanal INT, 
	@piPais INT, 
	@piPedido INT, 
	@piNoTienda INT
)
AS
SET NOCOUNT ON
SELECT	fiCanal,fiPais,fiPedido,fiNoTienda,fiEstatus,fiContrato,fcCuenta,fcDN,fcESN,fiSolicitud,fcServAdicionales,fcServPromocion,fnTAIncluido,fcMinTel,fcSID
FROM	ActivacionesIusacell
WHERE	fiCanal=@piCanal AND fiPais=@piPais AND fiPedido=@piPedido AND fiNoTienda=@piNoTienda
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConCatalogoMotivosBaja]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************
	Descripción: Consulta los motivos de baja
	-----------------------------------------
	Responsable: Angel Israel López Rosales
	Fecha: octubre 2019
*********************************************************************/
CREATE PROCEDURE [dbo].[spConCatalogoMotivosBaja]
AS

SET NOCOUNT ON

SELECT	fiMotivoId, fcMotivoDesc, fiEstatusBaja 
FROM	dbo.TCTEMotivoBaja WITH(NOLOCK)

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELULibertad]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************
   Descripción: Actualiza Plan Libertad
   ----------------------------------------------------------
   Responsable: Angel Israel López Rosales
   Fecha: 14/02/2013
   Modificación: Creación del objeto
*************************************************************/
CREATE PROCEDURE [dbo].[PATELULibertad]
   @piPais        INT,
   @piCanal       INT,
   @piNoTienda    INT,
   @piNoPedido    INT,
   @piCodigo      INT,
   @pcCuenta      CHAR(20) = NULL,
   @pcContrato    CHAR(15) = NULL,
   @pcDN          CHAR(15) = NULL,
   @pcICCID       CHAR(25) = NULL,
   @pcSerie       CHAR(30) = NULL,
   @pdSurtimiento DATETIME = NULL,
   @piPaisCU      INT      = NULL,
   @piCanalCU     INT      = NULL,
   @piSucursalCU  INT      = NULL,
   @piFolioCU     INT      = NULL
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(255)
SET XACT_ABORT ON
BEGIN TRY
   IF NOT EXISTS (SELECT fiPais FROM dbo.TATELibertad WITH(NOLOCK) WHERE fiPais=@piPais AND fiCanal=@piCanal AND fiNoTienda=@piNoTienda AND fiNoPedido=@piNoPedido)
      RAISERROR('El pedido que se intenta actualizar no se encuentra, favor de verificar',18,1)
   SELECT 
      @piPais        = CASE WHEN @piPais        IS NULL THEN fiPais        ELSE @piPais        END,
      @piCanal       = CASE WHEN @piCanal       IS NULL THEN fiCanal       ELSE @piCanal       END,
      @piNoTienda    = CASE WHEN @piNoTienda    IS NULL THEN fiNoTienda    ELSE @piNoTienda    END,
      @piNoPedido    = CASE WHEN @piNoPedido    IS NULL THEN fiNoPedido    ELSE @piNoPedido    END,
      @piCodigo      = CASE WHEN @piCodigo      IS NULL THEN fiCodigo      ELSE @piCodigo      END,
      @pcCuenta      = CASE WHEN @pcCuenta      IS NULL THEN fcCuenta      ELSE @pcCuenta      END,
      @pcContrato    = CASE WHEN @pcContrato    IS NULL THEN fcContrato    ELSE @pcContrato    END,
      @pcDN          = CASE WHEN @pcDN          IS NULL THEN fcDN          ELSE @pcDN          END,
      @pcICCID       = CASE WHEN @pcICCID       IS NULL THEN fcICCID       ELSE @pcICCID       END,
      @pcSerie       = CASE WHEN @pcSerie       IS NULL THEN fcSerie       ELSE @pcSerie       END,
      @pdSurtimiento = CASE WHEN @pdSurtimiento IS NULL THEN fdSurtimiento ELSE @pdSurtimiento END,
      @piPaisCU      = CASE WHEN @piPaisCU      IS NULL THEN fiPaisCU      ELSE @piPaisCU      END,
      @piCanalCU     = CASE WHEN @piCanalCU     IS NULL THEN fiCanalCU     ELSE @piCanalCU     END,
      @piSucursalCU  = CASE WHEN @piSucursalCU  IS NULL THEN fiSucursalCU  ELSE @piSucursalCU  END,
      @piFolioCU     = CASE WHEN @piFolioCU     IS NULL THEN fiFolioCU     ELSE @piFolioCU     END
   FROM   dbo.TATELibertad WITH(NOLOCK)
   WHERE  fiPais     = @piPais 
      AND fiCanal    = @piCanal 
      AND fiNoTienda = @piNoTienda 
      AND fiNoPedido = @piNoPedido
   BEGIN TRANSACTION    
      UPDATE dbo.TATELibertad
      SET    fiPais        = @piPais,
             fiCanal       = @piCanal,
             fiNoTienda    = @piNoTienda,
             fiNoPedido    = @piNoPedido,
             fiCodigo      = @piCodigo,
             fcCuenta      = @pcCuenta,
             fcContrato    = @pcContrato,
             fcDN          = @pcDN,
             fcICCID       = @pcICCID,
             fcSerie       = @pcSerie,
             fdSurtimiento = @pdSurtimiento,
             fiPaisCU      = @piPaisCU,
             fiCanalCU     = @piCanalCU,
             fiSucursalCU  = @piSucursalCU,
             fiFolioCU     = @piFolioCU
      WHERE  fiPais     = @piPais 
         AND fiCanal    = @piCanal 
         AND fiNoTienda = @piNoTienda 
         AND fiNoPedido = @piNoPedido      
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSTCTEPaises]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para consulta de paises
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSTCTEPaises]
AS

SET NOCOUNT ON

SELECT fiPaisID, fcDescripcion FROM dbo.TCTEPaises WITH (NOLOCK) ORDER BY fiPaisID

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSPuesto]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************************  
   Descripción: Creacion de Stored Procedure para Consulta de la tabla TCTEPuesto 
   ---------------------------------------------------------------------------------------------------  
   Responsable: ailr 
   Fecha: octubre de 2015
******************************************************************************************************/ 
CREATE PROCEDURE [dbo].[PATELSPuesto]  
(
   @piPuestoId	INT = 0  --Buscar por id de Puesto, 0 para devolver todos los puestos
)
AS
SET NOCOUNT ON

BEGIN TRY
	IF (@piPuestoId < 0)  
		RAISERROR('No se puede consultar un catálogo con id menor a cero', 18, 1)
	ELSE IF (@piPuestoId = 0)  
		SELECT fiPuestoId, fiIdPuestoSec = 0, fcDescPuesto, flEsActivo = 1 FROM TCTEPuesto WITH (NOLOCK)
	ELSE IF (@piPuestoId > 0 )
		SELECT fiPuestoId, fiIdPuestoSec = 0, fcDescPuesto, flEsActivo = 1 FROM TCTEPuesto  WITH (NOLOCK) WHERE fiPuestoId = @piPuestoId
END TRY
BEGIN CATCH
   DECLARE @vcError VARCHAR(255)
   SET @vcError = ERROR_MESSAGE()
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSVentaSim]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSVentaSim]
	@pdFechaInicial		datetime,
	@pdFechaFinal		datetime,
	@piNegocioId		int=0
	
AS
SET NOCOUNT ON


	IF @piNegocioId > 0
	BEGIN 
		SELECT fcNoTelefono,fiNegocioId,fiPais,fiCanal,fiNoTienda,
		fiNoPedido,fiprodid,fcNoSerie,fcEmpNo,fnMonto,flEsEkt,fdFechaVenta 
		FROM dbo.TATEVentaSim WITH (NOLOCK)
		WHERE fdFechaVenta BETWEEN @pdFechaInicial AND @pdFechaFinal AND fiNegocioId=@piNegocioId
	END 
	ELSE
	BEGIN 
		SELECT fcNoTelefono,fiNegocioId,fiPais,fiCanal,fiNoTienda,
		fiNoPedido,fiprodid,fcNoSerie,fcEmpNo,fnMonto,flEsEkt,fdFechaVenta 
		FROM dbo.TATEVentaSim WITH (NOLOCK)
		WHERE fdFechaVenta BETWEEN @pdFechaInicial AND @pdFechaFinal
	END 

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSMultas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
   Descripción: Consulta multas por tipo y negocio para envío a SAP
   Fecha: 22/03/2013
   Responsable: Angel Israel López Rosales
*******************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSMultas]
(
   @piNegocio INT, /*Negocio de la telefonica*/
   @piTipo    INT  /*Tipo de multa, 
                     1 = Asistencias promotores
                     2 = Tiendas sin supervisión 
                     3 = Tiendas sin supervisor asignado
                    */
)
AS
SET NOCOUNT ON

IF (@piNegocio IN (78,11,47) AND @piTipo=2)
BEGIN
   SELECT fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus FROM dbo.TATEMultaNoSupervisadasIus WITH(NOLOCK) WHERE fiNumVeces < 3 AND fiEstatus <> 1
END
ELSE IF (@piNegocio IN (31) AND @piTipo=2)
BEGIN
   SELECT fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus FROM dbo.TATEMultaNoSupervisadasMovi WITH(NOLOCK) WHERE fiNumVeces < 3 AND fiEstatus <> 1
END
ELSE IF (@piNegocio IN (78,11,47) AND @piTipo=3)
BEGIN
   SELECT fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus FROM dbo.TATEMultaNoAsignadasIus WITH(NOLOCK) WHERE fiNumVeces < 3 AND fiEstatus <> 1
END
ELSE IF (@piNegocio IN (31) AND @piTipo=3)
BEGIN
   SELECT fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus FROM dbo.TATEMultaNoAsignadasMovi WITH(NOLOCK) WHERE fiNumVeces < 3 AND fiEstatus <> 1
END
ELSE IF (@piNegocio IN (78,11,47) AND @piTipo=1)
BEGIN
   SELECT fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus FROM dbo.TATEMultaAsistenciaIus WHERE fiNumVeces < 3 AND fiEstatus <> 1
END
ELSE IF (@piNegocio IN (31) AND @piTipo=1)
BEGIN
   SELECT fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus FROM dbo.TATEMultaAsistenciaMovi WHERE fiNumVeces < 3 AND fiEstatus <> 1
END

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSParametroVal]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************
   Responsable:Angel Israel López Rosales
   Fecha: Enero del 2012
   Descripción: Devuelve el valor del parametro dado, 
      sirve para saber si esta encendida o no la funcionalidad.
*******************************************************************/
CREATE PROCEDURE [dbo].[PATELSParametroVal]
   @piPrmId INT /*Número de parámetro*/
AS
SET NOCOUNT ON
DECLARE @vlResultado BIT
IF EXISTS(SELECT fcPrmVal FROM dbo.TCTEParametro WHERE fiPrmId=@piPrmId)
BEGIN
   SELECT @vlResultado=CAST(fcPrmVal AS BIT) FROM dbo.TCTEParametro WHERE fiPrmId=@piPrmId
END
ELSE
BEGIN
   SET @vlResultado=0
END
SELECT Resultado=@vlResultado
SET NOCOUNT OFF
RETURN @vlResultado
GO
/****** Object:  StoredProcedure [dbo].[PATELSFolioMultas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************
   Descripción: Consulta el folio a insertar en la tabla TATEMultasSAP
   Fecha: 21/03/2013
   Responsable: Angel Israel López Rosales
****************************************************************************/
CREATE PROCEDURE [dbo].[PATELSFolioMultas]
AS

SET NOCOUNT ON

DECLARE @viFolio INT
SELECT @viFolio = MAX(fiFolio) FROM TATEMultasSAP WITH(TABLOCK, HOLDLOCK)
SET @viFolio = ISNULL(@viFolio, 0) + 1

SELECT fiFolio = @viFolio

SET NOCOUNT OFF
GO
/****** Object:  StoredProcedure [dbo].[PATELSDNLibertad]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************
   Descripción: Consulta Plan Libertad por teléfono
   ----------------------------------------------------------
   Responsable: Angel Israel López Rosales
   Fecha: 14/02/2013
   Modificación: Creación del objeto
*************************************************************/
CREATE PROCEDURE [dbo].[PATELSDNLibertad]
   @pcDN CHAR(15) /*Número de teléfono del plan*/
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(255)
BEGIN TRY
   SELECT fiPais, 
          fiCanal, 
          fiNoTienda, 
          fiNoPedido, 
          fiCodigo,
          fcCuenta, 
          fcContrato, 
          fcDN, 
          fcICCID, 
          fcSerie, 
          fiEstatus, 
          fdSurtimiento, 
          fiPaisCU, 
          fiCanalCU, 
          fiSucursalCU, 
          fiFolioCU
   FROM   dbo.TATELibertad WITH(NOLOCK)
   WHERE  fcDN = @pcDN
END TRY
BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   RAISERROR(@vcError,18,1)
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELIVentasPromotor]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELIVentasPromotor]
   @piPromotorId     INT,
   @piTiendaId    INT ,
   @piNoPedido INT,   
   @pcNombrePromotor   VARCHAR(100),
   @pcApPaternoProm  VARCHAR(100),
   @pcApMatProm   VARCHAR(100),
   @piTipoVenta  INT,
   @pnMontoVenta FLOAT
AS

SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY
   BEGIN TRANSACTION 
      DECLARE @vcError VARCHAR(255)      
         INSERT INTO dbo.TATEVentasPromotor (fiPromotorId, fiNoTienda, fiNoPedido, fdPedFec, fcNombrePromotor, fcApPatvarchar, fcApMatProm, fiTipoVenta, fiMontoVenta) 
		 VALUES (@piPromotorId,@piTiendaId, @piNoPedido, getdate(), @pcNombrePromotor,@pcApPaternoProm,@pcApMatProm,@piTipoVenta,@pnMontoVenta)
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
END CATCH
SET NOCOUNT OFF
RETURN
GO
/****** Object:  StoredProcedure [dbo].[PATELIVentaSim]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************
   Responsable: wenceslao jimenez vazquez
   Fecha: marzo 2013
   Descripcion : objeto para insertar las ventas de sims en la tabla VentaSims
********************************************************************************************/
CREATE PROCEDURE [dbo].[PATELIVentaSim]
	@fcNoTelefono		char(15),
	@fiNegocioId		tinyint,
	@fiPais				int,
	@fiCanal			int,
	@fiNoTienda			int,
	@fiNoPedido			int,
	@fiprodid			int,	
	@fcNoSerie			char(30),
	@fcEmpNo			char(10),	
	@fnMonto			decimal(8,2),
	@flEsEkt			bit
	
	
AS
SET NOCOUNT ON
DECLARE @vcError			VARCHAR(255)
		,@vdFechaVenta		datetime
SET @vdFechaVenta=GETDATE()
SET XACT_ABORT ON
BEGIN TRY
   BEGIN TRANSACTION 
      INSERT INTO dbo.TATEVentaSim
      (
		fcNoTelefono	,
		fiNegocioId		,
        fiPais			,
		fiCanal			,
		fiNoTienda		,
		fiNoPedido		,
		fiprodid		,		
		fcNoSerie		,
		fcEmpNo			,
		fnMonto			,
		flEsEkt			,		
		fdFechaVenta	
	  )
      VALUES
      (
		@fcNoTelefono	,
		@fiNegocioId	,
        @fiPais			,
		@fiCanal		,
		@fiNoTienda		,
		@fiNoPedido		,
		@fiprodid		,		
		@fcNoSerie		,
		@fcEmpNo		,	
		@fnMonto		,
		@flEsEkt		,
		@vdFechaVenta	
	
      )
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSConfiguration]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************

   Responsable: Angel Israel López Rosales
   Fecha:       julio del 2010
   Descripción: Selecciona todas las configuraciones registradas.
   
**********************************************************************************************/

CREATE PROCEDURE [dbo].[PATELSConfiguration](
	@pcNameSection VARCHAR(50) = null --Nombre de la sección de configuración a consultar
)
As
SELECT
	DBO.TATECFGSection.fcNameSection,
	DBO.TATECFGDetail.fcNameKey,
	DBO.TATECFGDetail.fcValueKey 
  FROM DBO.TATECFGDetail
INNER JOIN DBO.TATECFGSection 
	ON DBO.TATECFGSection.fcNameSection = DBO.TATECFGDetail.fcNameSection
WHERE DBO.TATECFGSection.fcNameSection = @pcNameSection OR @pcNameSection IS NULL
ORDER BY DBO.TATECFGSection.fcNameSection, DBO.TATECFGDetail.fcNameKey ASC
IF @@error != 0 GOTO Error
RETURN 0
Error:
   RAISERROR( 'Error al obtener las configuraciones', 18, 1)
   RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[PATELSCatGenerico]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************
   Responsable:Angel Israel López Rosales
   Fecha: Enero del 2012
   Descripción: Devuelve el valor del parametro dado, 
      sirve para saber si esta encendida o no la funcionalidad.
*******************************************************************/
CREATE PROCEDURE [dbo].[PATELSCatGenerico]
   @piCatalogoId INT   /*Id catalogo*/,
   @piSubItem INT=NULL /*Id catalogo*/
AS
SET NOCOUNT ON
SELECT fiCatalogoId,fiItemId,fcDescripcion,flStatus 
FROM DBO.TCTEDetalleCatalogoGenerico 
WHERE fiCatalogoId=@piCatalogoId
   AND (fiItemId=@piSubItem OR @piSubItem IS NULL)
ORDER BY fiItemId
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSCategorias]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSCategorias] 

	@PAIS INT
	
AS
BEGIN

	
	SELECT fiCompaniaId, fcCompaniaDesc, fiPaisID
		FROM TCTECompania
		WHERE (fiPaisID = @PAIS OR @PAIS = 0)
		
					UNION
		
    SELECT 0 , dbo.FNTELSCadTodos('A'), 0
    
    ORDER BY 1
	
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSVerificaContadorMovi2]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSVerificaContadorMovi2]
	@piNumeroPromo INT  /*NÃºmero de promociÃ³n*/
AS
SET NOCOUNT ON

DECLARE @viValorConteo	INT				= 0, 
		@vlDevuelveBol	BIT				= 0,
		@viLimite		INT				= 0,
		@viCatLimite	INT				= 32,
		@viCatContador	INT				= 33,
		@vcMensaje		varchar(100)	= ''

BEGIN TRY
	BEGIN TRAN ActContador
		UPDATE	Contador
		SET		Contador.fcDescripcion = CAST((CAST(Contador.fcDescripcion AS INT) + 1) AS VARCHAR(10))
		FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
			INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
		WHERE Limite.fiCatalogoId		= @viCatLimite
			AND Contador.fiCatalogoId	= @viCatContador
			AND Limite.fiItemId			= @piNumeroPromo
		IF @@ERROR <> 0 BEGIN SET @vcMensaje = 'Error al actualizar el contador' GOTO ErrTran END
	COMMIT TRAN ActContador
END TRY
BEGIN CATCH
	SET		@vcMensaje = ERROR_MESSAGE()
	GOTO	ErrTran
END CATCH

IF EXISTS (
	SELECT Limite.fiCatalogoId 
	FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
		INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
	WHERE Limite.fiCatalogoId		= @viCatLimite
		AND Contador.fiCatalogoId	= @viCatContador
		AND Limite.fiItemId			= @piNumeroPromo
)
BEGIN 
	SET @vlDevuelveBol = 1
END


SELECT Aplica = @vlDevuelveBol

SET NOCOUNT OFF
RETURN 0

ErrTran:
	ROLLBACK TRAN ActContador
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[PATELSVerificaContadorMovi1]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSVerificaContadorMovi1]
	@piNumeroPromo INT  /*NÃºmero de promociÃ³n*/
AS
SET NOCOUNT ON

DECLARE @viValorConteo	INT				= 0, 
		@vlDevuelveBol	BIT				= 0,
		@viLimite		INT				= 0,
		@viCatLimite	INT				= 30,
		@viCatContador	INT				= 31,
		@vcMensaje		varchar(100)	= ''

BEGIN TRY
	BEGIN TRAN ActContador
		UPDATE	Contador
		SET		Contador.fcDescripcion = CAST((CAST(Contador.fcDescripcion AS INT) + 1) AS VARCHAR(10))
		FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
			INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
		WHERE Limite.fiCatalogoId		= @viCatLimite
			AND Contador.fiCatalogoId	= @viCatContador
			AND Limite.fiItemId			= @piNumeroPromo
		IF @@ERROR <> 0 BEGIN SET @vcMensaje = 'Error al actualizar el contador' GOTO ErrTran END
	COMMIT TRAN ActContador
END TRY
BEGIN CATCH
	SET		@vcMensaje = ERROR_MESSAGE()
	GOTO	ErrTran
END CATCH

IF EXISTS (
	SELECT Limite.fiCatalogoId 
	FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
		INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
	WHERE Limite.fiCatalogoId		= @viCatLimite
		AND Contador.fiCatalogoId	= @viCatContador
		AND Limite.fiItemId			= @piNumeroPromo
)
BEGIN 
	SET @vlDevuelveBol = 1
END


SELECT Aplica = @vlDevuelveBol

SET NOCOUNT OFF
RETURN 0

ErrTran:
	ROLLBACK TRAN ActContador
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[PATELSVerificaContador]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************
   Responsable: Angel Israel López Rosales
   Fecha: 8/12/2015
   Descripcion: Verifica Contador de promociones. Manejo transaccional
*********************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSVerificaContador]
	@piNumeroPromo INT  /*Número de promoción*/
AS
SET NOCOUNT ON

DECLARE @viValorConteo	INT				= 0, 
		@vlDevuelveBol	BIT				= 0,
		@viLimite		INT				= 0,
		@viCatLimite	INT				= 26,
		@viCatContador	INT				= 27,
		@vcMensaje		varchar(100)	= ''

BEGIN TRY
	BEGIN TRAN ActContador
		UPDATE	Contador
		SET		Contador.fcDescripcion = CAST((CAST(Contador.fcDescripcion AS INT) + 1) AS VARCHAR(10))
		FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
			INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
		WHERE Limite.fiCatalogoId		= @viCatLimite
			AND Contador.fiCatalogoId	= @viCatContador
			AND Limite.fiItemId			= @piNumeroPromo
		IF @@ERROR <> 0 BEGIN SET @vcMensaje = 'Error al actualizar el contador' GOTO ErrTran END
	COMMIT TRAN ActContador
END TRY
BEGIN CATCH
	SET		@vcMensaje = ERROR_MESSAGE()
	GOTO	ErrTran
END CATCH

IF EXISTS (
	SELECT Limite.fiCatalogoId 
	FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
		INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
	WHERE Limite.fiCatalogoId		= @viCatLimite
		AND Contador.fiCatalogoId	= @viCatContador
		AND Limite.fiItemId			= @piNumeroPromo
)
BEGIN 
	SET @vlDevuelveBol = 1
END


SELECT Aplica = @vlDevuelveBol

SET NOCOUNT OFF
RETURN 0

ErrTran:
	ROLLBACK TRAN ActContador
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[PATELSTCTEPlazas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para consulta de plazas
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSTCTEPlazas]
(
	@piPaisID INT = 0
)
AS

SET NOCOUNT ON

IF(@piPaisID > 0)
BEGIN
	SELECT	pl.fiPlazaID, pl.fiPaisID, pl.fcDescripcion, pl.fiEstatus
	FROM	dbo.TCTEPlazas pl WITH (NOLOCK) 
	WHERE	(fiPaisID = @piPaisID)
	ORDER BY pl.fiEstatus DESC, pl.fiPlazaID, pl.fiPaisID
END
ELSE IF(@piPaisID = 0)
BEGIN
	SELECT	pl.fiPlazaID, pl.fiPaisID, pl.fcDescripcion, pl.fiEstatus
	FROM	dbo.TCTEPlazas pl WITH (NOLOCK) 
	ORDER BY pl.fiEstatus DESC, pl.fiPlazaID, pl.fiPaisID
END

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSTCTEPaisCanal]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para consulta de canales
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSTCTEPaisCanal]
(
	@piPaisID INT = 0
)
AS

SET NOCOUNT ON

IF(@piPaisID > 0)
BEGIN
	SELECT	fiCanalId, fiPaisID, pc.fcDescripcion 
	FROM	dbo.TCTEPaisCanal pc WITH (NOLOCK) 
	WHERE	(fiPaisID = @piPaisID)
	ORDER BY fiPaisID, fiCanalId
END
ELSE IF(@piPaisID = 0)
BEGIN
	SELECT	fiCanalId, fiPaisID, pc.fcDescripcion 
	FROM	dbo.TCTEPaisCanal pc WITH (NOLOCK) 
	ORDER BY fiPaisID, fiCanalId
END

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  Table [dbo].[PROElemento]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROElemento](
	[fiPromocionId] [int] NOT NULL,
	[fiElementoId] [int] NOT NULL,
	[flIncluyente] [bit] NULL,
	[fiTipo] [int] NOT NULL,
	[fcValor] [varchar](20) NULL,
	[fiCantidadMinima] [int] NULL,
	[fiCantidadMaxima] [int] NULL,
	[fnPrecioDeMinimo] [decimal](8, 2) NULL,
 CONSTRAINT [PK3_PROElemento] PRIMARY KEY CLUSTERED 
(
	[fiElementoId] ASC,
	[fiPromocionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProDetalleVale]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProDetalleVale](
	[fiPromocionId] [int] NOT NULL,
	[fnMontoVale] [decimal](8, 2) NULL,
	[fiElementoId] [int] NULL,
	[fiContadorId] [int] NULL
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[PRODescuento]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODescuento](
	[fiPromocionId] [int] NOT NULL,
	[fnPorcentaje] [decimal](8, 2) NULL,
	[fnMonto] [decimal](8, 2) NULL,
	[flAplica] [bit] NULL,
 CONSTRAINT [PK1_PRODescuento] PRIMARY KEY CLUSTERED 
(
	[fiPromocionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[ProContadorVale]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProContadorVale](
	[fiPromocionId] [int] NOT NULL,
	[fiContadorId] [int] NULL,
	[fdFecha] [datetime] NULL,
	[fiLimite] [int] NULL,
	[fiContador] [int] NULL
) ON [SECONDARY]
GO
/****** Object:  StoredProcedure [dbo].[spBajaPromocion]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: ALEXIS MERCADO PÉREZ
 Fecha  :     11 - ABRIL - 2018
 Descripción: DA DE BAJA UNA PROMOCION
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  

CREATE PROCEDURE [dbo].[spBajaPromocion](
	@piPromocionId int
)
AS
SET NOCOUNT ON
DECLARE
@vcMensaje varchar(255)

IF EXISTS(SELECT fiPromocionId FROM dbo.PROPromocion WITH(NOLOCK) WHERE fiPromocionId = @piPromocionId)
	BEGIN
		UPDATE dbo.PROPromocion SET fdVigenciaFin = CAST(GETDATE() AS SMALLDATETIME) WHERE fiPromocionId = @piPromocionId
		IF (@@ERROR <> 0)
			BEGIN
				SET @vcMensaje = 'Problema al actualizar la promocion ' + CAST(@piPromocionId AS VARCHAR(20))
				GOTO Errores
			END	
	END
ELSE
	BEGIN
		SET @vcMensaje = 'La promocion ' + CAST(@piPromocionId AS VARCHAR(20)) + ' no existe'
		GOTO Errores
	END

SET NOCOUNT OFF
RETURN 0

Errores:
 RAISERROR(@vcMensaje, 18, 1)
 SET NOCOUNT OFF
 RETURN -1
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSCompania]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************
   Descripción: Devuelve la compañía con la que se deben buscar los supervisores
   Fecha: 14/03/2013
   Responsable: Angel Israel López Rosales
*********************************************************************************/
CREATE FUNCTION [dbo].[FNTELSCompania] (
   @piCompaniaId INT
)
RETURNS INT
AS
BEGIN
     IF EXISTS (
      SELECT c.fiItemId
      FROM   dbo.TCTEDetalleCatalogoGenerico c
      WHERE  c.fiCatalogoId = 21
      AND c.fiItemId = @piCompaniaId
   )
   BEGIN
      SELECT @piCompaniaId = CAST(fcDescripcion AS INT)
      FROM   dbo.TCTEDetalleCatalogoGenerico c
      WHERE  c.fiCatalogoId = 21
         AND c.fiItemId = @piCompaniaId
   END   
   RETURN  @piCompaniaId
END
GO
/****** Object:  Table [dbo].[AutMembresia]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AutMembresia](
	[fiIdUsuario] [int] NOT NULL,
	[fiIdAplicacion] [int] NOT NULL,
	[fiIdEstatus] [int] NULL,
	[fcSalt] [varchar](100) NOT NULL,
	[fcClave] [varchar](100) NULL,
	[fcToken] [varchar](100) NULL,
	[fdCambioPassword] [datetime] NULL,
	[fdUltimaSesion] [datetime] NULL,
	[fcUsuario] [varchar](100) NULL,
	[fiSesion] [bigint] NULL,
	[fiCompaniaId] [int] NULL,
 CONSTRAINT [PK001AutMembresia] PRIMARY KEY CLUSTERED 
(
	[fiIdUsuario] ASC,
	[fiIdAplicacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[PATELITCTECompania]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para alta de compañías
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELITCTECompania] 
(
	@piCompaniaId		INT,			/*ID de la compañía*/
	@pcCompaniaDesc		VARCHAR(40),	/*Descripción de la compañía*/
	@piPaisID			INT,			/*ID del país*/
	@piTipoInsercion	TINYINT = 1		/*Tipo de inserción. 0 = Borra, 1 = Inserta - actualiza*/
)
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(100)

BEGIN TRY
	IF(@piTipoInsercion = 0)
	BEGIN
		IF EXISTS (SELECT fiCompaniaId FROM dbo.TCTECompania WITH(NOLOCK) WHERE fiCompaniaId = @piCompaniaId AND fiPaisID = @piPaisID)
		BEGIN
			DELETE dbo.TCTECompania WHERE fiCompaniaId = @piCompaniaId AND fiPaisID = @piPaisID
		END
	END
	ELSE IF(@piTipoInsercion = 1)
	BEGIN
		IF EXISTS (SELECT fiCompaniaId FROM dbo.TCTECompania WITH(NOLOCK) WHERE fiCompaniaId = @piCompaniaId AND fiPaisID = @piPaisID)
		BEGIN
			UPDATE dbo.TCTECompania SET fcCompaniaDesc = @pcCompaniaDesc WHERE fiCompaniaId = @piCompaniaId AND fiPaisID = @piPaisID
		END
		ELSE
		BEGIN
			INSERT INTO dbo.TCTECompania (fiCompaniaId, fcCompaniaDesc, fiPaisID) VALUES (@piCompaniaId, @pcCompaniaDesc, @piPaisID)
		END
	END
END TRY
BEGIN CATCH
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELITCTEPlazas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para alta de plazas.
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELITCTEPlazas] 
(
	@piPlazaID			INT, /*ID de la plaza*/
	@piPaisID			INT,/*ID del país*/
	@pcDescripcion		VARCHAR(100), /*Descripción de la plaza*/
	@piEstatus			INT, /*Estatus*/
	@piTipoInsercion	TINYINT = 1 /*Tipo de inserción. 0 = Borra, 1 = Inserta - actualiza*/
)
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(100)

BEGIN TRY
	IF(@piTipoInsercion = 0)
	BEGIN
		IF EXISTS (SELECT fiPlazaID FROM dbo.TCTEPlazas WITH(NOLOCK) WHERE fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID)
		BEGIN
			DELETE dbo.TCTEPlazas WHERE fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID
		END
	END
	ELSE IF(@piTipoInsercion = 1)
	BEGIN
		IF EXISTS (SELECT fiPlazaID FROM dbo.TCTEPlazas WITH(NOLOCK) WHERE fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID)
		BEGIN
			UPDATE dbo.TCTEPlazas SET fcDescripcion = @pcDescripcion, fiEstatus = @piEstatus WHERE fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID
		END
		ELSE
		BEGIN
			INSERT INTO dbo.TCTEPlazas (fiPlazaID, fiPaisID, fcDescripcion, fiEstatus) VALUES (@piPlazaID, @piPaisID, @pcDescripcion, @piEstatus)
		END
	END
END TRY
BEGIN CATCH
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELITCTEPaisCanal]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para alta de país-canal
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELITCTEPaisCanal]
(
	@piCanalId			INT,			/*ID del canal*/
	@piPaisID			INT,			/*ID del país*/
	@pcDescripcion		VARCHAR(80),	/*Descripción del canal*/
	@piEstatus			INT, /*Estatus*/
	@piTipoInsercion	TINYINT = 1		/*Tipo de inserción. 0 = Borra, 1 = Inserta - actualiza*/
)
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(100)

BEGIN TRY
	IF(@piTipoInsercion = 0)
	BEGIN
		IF EXISTS (SELECT fiCanalId FROM dbo.TCTEPaisCanal WITH(NOLOCK) WHERE fiCanalId = @piCanalId AND fiPaisID = @piPaisID)
		BEGIN
			DELETE dbo.TCTEPaisCanal WHERE fiCanalId = @piCanalId AND fiPaisID = @piPaisID
		END
	END
	ELSE IF(@piTipoInsercion = 1)
	BEGIN
		IF EXISTS (SELECT fiCanalId FROM dbo.TCTEPaisCanal WITH(NOLOCK) WHERE fiCanalId = @piCanalId AND fiPaisID = @piPaisID)
		BEGIN
			UPDATE dbo.TCTEPaisCanal SET fcDescripcion = @pcDescripcion, fiEstatus = @piEstatus WHERE fiCanalId = @piCanalId AND fiPaisID = @piPaisID
		END
		ELSE
		BEGIN
			INSERT INTO dbo.TCTEPaisCanal (fiCanalId, fiPaisID, fcDescripcion, fiEstatus) VALUES (@piCanalId, @piPaisID, @pcDescripcion, @piEstatus)
		END
	END
END TRY
BEGIN CATCH
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsPromocionEspecial]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------
---RESPONSABLE: AMEHT SAID ESCAMILLA ARELLANO
---FECHA: MAYO DEL 2017
---DESCRIPCION: 
------------------------------------------------
CREATE PROCEDURE [dbo].[spInsPromocionEspecial]	(
												@piNoPedido		INT,
												@piFolio		BIGINT,
												@piPais			INT,
												@piCanal		INT,
												@piSucursal		INT,
												@piPromocion	INT,
												@pcCliente		VARCHAR(16),
												@pcWS			VARCHAR(12),
												@pcEmpleado		VARCHAR(10),
												@pnMonto		DECIMAL(12,4),
												@pdVigencia		SMALLDATETIME,
												@piReglaId		INT = 773
												)
AS

	SET NOCOUNT ON  
	
	DECLARE @vcAhora	SMALLDATETIME,
			@vcMsjError VARCHAR(100),
			@viValida	INT 
	
	SET @vcAhora = GETDATE()
		
	BEGIN TRAN TranTel
	----------------------------------------------
	---- SE VALIDA QUE NO EXISTA LA PROMOCION ----
	----------------------------------------------
	IF EXISTS(	SELECT fiFolio  
					FROM dbo.TATEPromocionEspecial WITH(NOLOCK)
					WHERE	fiPais = @piPais AND 
							fiCanal = @piCanal AND 
							fiSucursal = @piSucursal AND 
							fiPromocionId = @piPromocion AND 
							fiNoPedido = @piNoPedido AND 
							fiFolio = @piFolio)
		BEGIN
		
			--------------------------------------
			---- SE ASIGNA EL FOLIO DUPLICADO ----
			--------------------------------------			
				
			SELECT @viValida = SUM(fiTipoMovimiento) 
			FROM dbo.TATEDetallePromocionEspecial
			WHERE fiFolio = @piFolio
			
			IF @viValida > 1
				BEGIN 
					SET @vcMsjError = 'Ya existe una promocion en central con el folio No. ' + CONVERT(VARCHAR,@piFolio)
					GOTO ERROR 
				END
			
		
			DELETE FROM dbo.TATEDetallePromocionEspecial
			WHERE fiFolio = @piFolio
				IF @@ERROR <> 0 
					BEGIN 
						SET @vcMsjError = 'Error en central al generar la promocion ' +  CONVERT(VARCHAR,@piPromocion) + 'spInsPromocionEspecial - BORRAR TATEPromocionEspecial'
						GOTO ERROR 
					END		
					
			DELETE FROM dbo.TATEPromocionEspecial
			WHERE fiFolio = @piFolio
				IF @@ERROR <> 0 
					BEGIN 
						SET @vcMsjError = 'Error en central al generar la promocion ' +  CONVERT(VARCHAR,@piPromocion) + 'spInsPromocionEspecial - BORRAR TATEPromocionEspecial'
						GOTO ERROR 
					END											
		END
	
			------------------------------------------------
			---- SE INSERTA EL REGISTRO DE LA PROMOCION ----
			------------------------------------------------
			INSERT INTO  dbo.TATEPromocionEspecial(
												fiFolio,
												fiPais,
												fiCanal,
												fiSucursal,
												fiPromocionId,
												fcCliente,
												fiNoPedido,
												fnMonto,
												fdInicio,
												fdVigencia,
												fiReglaId
												 )	
			VALUES	(
					@piFolio,
					@piPais,
					@piCanal,
					@piSucursal,
					@piPromocion,
					@pcCliente,
					@piNoPedido,
					@pnMonto,
					@vcAhora,
					@pdVigencia,
					@piReglaId
					)
						IF @@ERROR <> 0 
							BEGIN 
								SET @vcMsjError = 'Error en central al generar la promocion ' +  CONVERT(VARCHAR,@piPromocion) + 'spInsPromocionEspecial - TATEPromocionEspecial'
								GOTO ERROR 
							END
							
			------------------------------------------------
			---- SE INSERTA EL DETALLE DE LA PROMOCION ----
			------------------------------------------------
			INSERT INTO dbo.TATEDetallePromocionEspecial(
													fiFolio,
													fiMovimiento,
													fiTipoMovimiento,
													fcDetalle,
													fcWS,
													fcEmpleado,
													fnMonto,
													fdFecha
													)
			SELECT TP.fiFolio,
				   COUNT(ISNULL(TD.fifolio,0)),
				   1,
				   'GENERA SALDO PEDIDO: ' + CONVERT(VARCHAR,@piNoPedido),
				   @pcWS,
				   @pcEmpleado,
				   @pnMonto,
				   @vcAhora
			FROM dbo.TATEPromocionEspecial TP WITH(NOLOCK)
			LEFT OUTER JOIN dbo.TATEDetallePromocionEspecial TD WITH(NOLOCK) ON TP.fiFolio = TD.fiFolio
			WHERE TP.fiFolio = @piFolio
			GROUP BY TP.fiFolio		
				IF @@ERROR <> 0 
					BEGIN 
						SET @vcMsjError = 'Error en central al generar la promocion ' +  CONVERT(VARCHAR,@piPromocion) + 'spInsPromocionEspecial - TATEDetallePromocionEspecial'
						GOTO ERROR 
					END					
		 	--------------------------------
			---- REGRESA FOLIO Y PEDIDO ----
			--------------------------------
			SELECT	fiFolio AS Folio,
					@piNoPedido AS Pedido
			FROM dbo.TATEPromocionEspecial WITH(NOLOCK)
			WHERE	fiPais = @piPais AND 
					fiCanal = @piCanal AND 
					fiSucursal = @piSucursal AND 
					fiPromocionId = @piPromocion AND 
					fiNoPedido = @piNoPedido AND 
					fiFolio = @piFolio	
								
	COMMIT TRAN TranTel
	SET NOCOUNT OFF
	RETURN 0
 ERROR:
	ROLLBACK TRAN TranTel
	SET NOCOUNT OFF
	RAISERROR(@vcMsjError,18,1)
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spInsAutUsuario]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Inserta o actualiza registro en la tabla Autusuario
	----------------------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel Lopez Rosales
	Fecha: agosto de 2019
***********************************************************************************/
CREATE PROCEDURE [dbo].[spInsAutUsuario]
(
	@piIdUsuario			INT,
	@piIdAplicacion			INT,
	@piIdRol				INT,
	@pcNombre				VARCHAR(50),
	@pcApellidoPaterno		VARCHAR(50),
	@pcApellidoMaterno		VARCHAR(50),
	@pcCorreoElectronico	VARCHAR(100)
)
AS

BEGIN TRY
	IF EXISTS (
		SELECT	fiIdUsuario 
		FROM	dbo.AutUsuario WITH(NOLOCK) 
		WHERE	fiIdUsuario = @piIdUsuario 
			AND fiIdAplicacion = @piIdAplicacion)
	BEGIN 
		UPDATE	dbo.AutUsuario 
		SET		fiIdRol					= @piIdRol, 
				fcNombre				= @pcNombre,
				fcApellidoPaterno		= @pcApellidoPaterno,
				fcApellidoMaterno		= @pcApellidoMaterno,
				fcCorreoElectronico		= @pcCorreoElectronico
		WHERE	fiIdUsuario = @piIdUsuario 
			AND fiIdAplicacion = @piIdAplicacion
	END
	ELSE
	BEGIN
		INSERT INTO dbo.AutUsuario (fiIdUsuario, fiIdAplicacion, fiIdRol, fcNombre, fcApellidoPaterno, fcApellidoMaterno, fcCorreoElectronico) 
		VALUES (@piIdUsuario, @piIdAplicacion, @piIdRol, @pcNombre, @pcApellidoPaterno, @pcApellidoMaterno, @pcCorreoElectronico)
	END
END TRY
BEGIN CATCH
	DECLARE @vcError VARCHAR(1000)
	SET @vcError = ERROR_MESSAGE() + '. NumError = ' + CAST(ERROR_NUMBER() AS VARCHAR(100))
	RAISERROR(@vcError, 18, 1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spInsDetCatalogoGenerico]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************************************
   Descripción: Inserta en CatalogoGenerico
   ---------------------------------------------------------------------------------------------------
   Última modificación: Agrega lógica para actualizar o borrar
   Responsable: Angel Israel López Rosales
   Fecha: 9 de septiembre del 2013
******************************************************************************************************/
CREATE PROCEDURE [dbo].[spInsDetCatalogoGenerico]
   @piCatalogoId  INT,
   @piItemId      SMALLINT,
   @pcDescripcion CHAR(255),
   @plStatus      BIT,
   @piAccion      INT --1=Inserta o actualiza, 2=Borra el registro tomando en cuenta el @piItemId, 3=Borra el registro sin tomar en cuenta el @piItemId
AS
SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY
   IF (@piAccion NOT IN (1,2,3))
      RAISERROR('El tipo de accion proporcionado no existe', 18, 1)
   BEGIN TRAN
      IF (@piAccion = 1)
      BEGIN
         IF (@piCatalogoId <= 0)
            RAISERROR('No se puede insertar un catálogo con id menor o igual a cero', 18, 1)
         IF ((@pcDescripcion IS NULL OR LTRIM(RTRIM(@pcDescripcion)) = ''))
            RAISERROR('No se puede insertar un catálogo con descripción nula o vacia', 18, 1)
         IF EXISTS (SELECT fiCatalogoId FROM dbo.TCTEDetalleCatalogoGenerico WITH (NOLOCK) WHERE fiCatalogoId = @piCatalogoId and fiItemId=@piItemId)
         BEGIN
            UPDATE dbo.TCTEDetalleCatalogoGenerico SET fcDescripcion = @pcDescripcion, flStatus = @plStatus WHERE fiCatalogoId = @piCatalogoId and fiItemId=@piItemId
         END
         ELSE
         BEGIN
            INSERT INTO dbo.TCTEDetalleCatalogoGenerico (fiCatalogoId, fiItemId, fcDescripcion, flStatus) VALUES (@piCatalogoId, @piItemId, @pcDescripcion, @plStatus)
         END
      END
      ELSE IF (@piAccion = 2)
      BEGIN
         DELETE dbo.TCTEDetalleCatalogoGenerico WHERE fiCatalogoId = @piCatalogoId and fiItemId=@piItemId
      END
      ELSE IF (@piAccion = 3)
      BEGIN
         DELETE dbo.TCTEDetalleCatalogoGenerico WHERE fiCatalogoId = @piCatalogoId
      END
   COMMIT TRAN
END TRY
BEGIN CATCH
   DECLARE @vcError VARCHAR(255)
   SET @vcError = ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsDetallePromocionEspecial]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------
---RESPONSABLE: AMEHT SAID ESCAMILLA ARELLANO
---FECHA: MAYO DEL 2017
---DESCRIPCION: 
------------------------------------------------
CREATE PROCEDURE [dbo].[spInsDetallePromocionEspecial]	(
													@piFolio			BIGINT,
													@piTipoMovimiento	SMALLINT,
													@pcDescripcion		VARCHAR(100),
													@piCantidad			SMALLINT,
													@pcWS				VARCHAR(12),
													@piTienda			INT,
													@pcEmpleado			VARCHAR(10),
													@pnMonto			DECIMAL (12,4)
													)
AS
	SET NOCOUNT ON  
	
	DECLARE @vcAhora	SMALLDATETIME,
			@vcMsjError VARCHAR(100),
			@vnMonto	DECIMAL(12,4),
			@viCalcel	INT

	SET @vcAhora = GETDATE()
		
	BEGIN TRAN TranTel
					
			SELECT	@vnMonto =	CASE 
									WHEN SUM(ISNULL(C.fiTipoMovimiento,0)) > 0 THEN - 99999.00
								ELSE
									SUM(ISNULL(A.fnMonto,0)) - SUM(ISNULL(B.fnMonto,0)) - @pnMonto
								END
			FROM (
				SELECT	SUM(fnMonto) AS fnMonto,
						fiFolio,
						fiTipoMovimiento 
				FROM dbo.TATEDetallePromocionEspecial WITH(NOLOCK)
				WHERE	fiFolio = @piFolio AND
						fiTipoMovimiento = 1
				GROUP BY fiFolio,fiTipoMovimiento
			) A 
			LEFT OUTER JOIN(SELECT	SUM(fnMonto * fiCantidad) AS fnMonto,
									fiFolio,
									fiTipoMovimiento 
							FROM dbo.TATEDetallePromocionEspecial WITH(NOLOCK)
							WHERE	fiFolio = @piFolio AND
									fiTipoMovimiento = 2
							GROUP BY fiFolio,fiTipoMovimiento
			) B  ON B.fiFolio = A.fiFolio
			LEFT OUTER JOIN (
							SELECT	SUM(fnMonto) AS fnMonto,
									fiFolio,
									fiTipoMovimiento 
							FROM dbo.TATEDetallePromocionEspecial WITH(NOLOCK)
							WHERE	fiFolio = @piFolio AND
									fiTipoMovimiento =3
							GROUP BY fiFolio,fiTipoMovimiento
			) C ON C.fiFolio = A.fiFolio AND C.fiTipoMovimiento = 3
							
			IF @vnMonto >= 0
				BEGIN
				
					IF @pnMonto =  0 AND @piTipoMovimiento <> 3
						BEGIN 
							SET @vcMsjError = 'no se puede realizar un moviminto con monto 0.'
							GOTO ERROR 
						END	
						
					IF NOT EXISTS (	SELECT fiFolio FROM dbo.TATEPromocionEspecial WITH(NOLOCK) 
									WHERE fiFolio = @piFolio AND fiSucursal = @piTienda )
						BEGIN
							SET @vcMsjError = 'El folio No. ' + CONVERT(VARCHAR,@piFolio) + ' no corresponde a esta tienda.'
							GOTO ERROR 
						END											
					------------------------------------------------
					---- SE INSERTA EL DETALLE DE LA PROMOCION -----
					------------------------------------------------
					INSERT INTO dbo.TATEDetallePromocionEspecial(
															fiFolio,
															fiMovimiento,
															fiTipoMovimiento,
															fcWS,
															fcEmpleado,
															fcDetalle,
															fiCantidad,
															fnMonto,
															fdFecha
															)
					SELECT fiFolio,
						   COUNT(ISNULL(fifolio,0)) + 1,
						   @piTipoMovimiento,
						   @pcWS,
						   @pcEmpleado,
						   @pcDescripcion,
						   @piCantidad,
						   @pnMonto,
						   @vcAhora
					FROM dbo.TATEDetallePromocionEspecial WITH(NOLOCK)
					WHERE	fiFolio = @piFolio
					GROUP BY fiFolio
						IF @@ERROR <> 0 
							BEGIN 
								SET @vcMsjError = 'Error al insertar el detalle en central spInsDetallePromocionEspecial - TATEDetallePromocionEspecial'
								GOTO ERROR 
							END		

					IF @vnMonto = 0
						BEGIN
							------------------------------------------------
							---- SE INSERTA EL DETALLE DE LA PROMOCION -----
							------------------------------------------------
							INSERT INTO dbo.TATEDetallePromocionEspecial(
																	fiFolio,
																	fiMovimiento,
																	fiTipoMovimiento,
																	fcWS,
																	fcEmpleado,
																	fcDetalle,
																	fnMonto,
																	fdFecha
																	)
							SELECT fiFolio,
								   COUNT(ISNULL(fifolio,0)) + 1,
								   3,
								   @pcWS,
								   @pcEmpleado,								   
								   'FOLIO CANCELADO POR SALDO',
								   0,
								   @vcAhora
							FROM dbo.TATEDetallePromocionEspecial WITH(NOLOCK)
							WHERE	fiFolio = @piFolio
							GROUP BY fiFolio
								IF @@ERROR <> 0 
									BEGIN 
										SET @vcMsjError = 'Error al insertar el detalle en central spInsDetallePromocionEspecial - TATEDetallePromocionEspecial'
										GOTO ERROR 
									END							
						END	
												
						SELECT	@piFolio AS Folio,
								@vnMonto AS Saldo,
								'Operación realizada con exito' AS Mensaje
										
				END
			ELSE
				BEGIN
					IF @vnMonto =  -99999
						BEGIN 
							SET @vcMsjError = 'El folio No. ' + CONVERT(VARCHAR,@piFolio) + ' se encuentra cancelado.'
							GOTO ERROR 
						END
					ELSE IF @vnMonto IS NULL
						BEGIN
							SET @vcMsjError = 'No se encontro el folio de promoción  No.' + CONVERT(VARCHAR,@piFolio) + ' en central.'
							GOTO ERROR 								
						END
					ELSE
						BEGIN
							SET @vcMsjError = 'No se pude realizar la operación no hay suficiente saldo.'
							GOTO ERROR 						
						END	
				END

	COMMIT TRAN TranTel
	
	SET NOCOUNT OFF
	RETURN 0
 ERROR:
	ROLLBACK TRAN TranTel
	SET NOCOUNT OFF
	RAISERROR(@vcMsjError,18,1)
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spUpdRegaloPromocion]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------------------------------------------------------------------------   
---Responsable: Israel Toledo Gómez 
---Fecha:       Abril del 2020  
---Descripción: Actualiza inventario de regalo
---Aplicación:  Cotizador (Elektra.Negocio.Entidades.TelefoniaEpos)  
----------------------------------------------------------------------------------------------------------------------------------   
CREATE PROCEDURE [dbo].[spUpdRegaloPromocion] (
			@piFolio   BIGINT,
			@piRegla	 INT,
			@piMonto	INT
)
AS
DECLARE   
        @vcMensajeError varchar (150)  

	SET NOCOUNT ON
	
	IF NOT EXISTS (
		SELECT P.fiFolio FROM TATEPromocionEspecial P INNER JOIN 
		TATEDetallePromocionEspecial D WITH(NOLOCK) ON P.fiFolio = D.fiFolio WHERE P.fiFolio = @piFolio AND D.fiTipoMovimiento IN (2,3) 
	)
	BEGIN
		BEGIN TRAN UpdTran
		UPDATE TATEPromocionEspecial SET fiReglaId = @piRegla, fnMonto = @piMonto WHERE fiFolio = @piFolio
		IF @@ERROR <> 0    
            BEGIN    
                SET @vcMensajeError = 'Error al Actualizar el regalo en TATEPromocionEspecial'    
                GOTO ERROR  
            END  
		UPDATE TATEDetallePromocionEspecial SET fnMonto = @piMonto WHERE fiFolio = @piFolio
		IF @@ERROR <> 0    
            BEGIN    
                SET @vcMensajeError = 'Error al Actualizar el monto en TATEDetallePromocionEspecial'    
                GOTO ERROR  
            END  
		SELECT 'Regla y Monto actualizado' AS Resultado
		COMMIT TRAN UpdTran
	END


	SET NOCOUNT OFF
	RETURN 0

	ERROR:
	ROLLBACK TRAN UpdTran
	SET NOCOUNT OFF
	RAISERROR(@vcMensajeError,18,1)
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spUpdDetCatalogoGenerico]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**************************************************************
   Descripción: Inserta en CatalogoGenerico
   Responsable: Angel Israel López Rosales
   Fecha: 4 de marzo del 2013
***************************************************************/
CREATE PROCEDURE [dbo].[spUpdDetCatalogoGenerico]
   @piCatalogoId  INT,
   @piItemId      SMALLINT,
   @pcDescripcion CHAR(255),
   @plStatus      BIT
AS
SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY
   BEGIN TRAN
      UPDATE cd
      SET    fcDescripcion = @pcDescripcion,
             flStatus      = @plStatus
      FROM   dbo.TCTEDetalleCatalogoGenerico cd
      WHERE  cd.fiCatalogoId = @piCatalogoId
         AND cd.fiItemId = @piItemId
   COMMIT TRAN
END TRY
BEGIN CATCH
   DECLARE @vcError VARCHAR(255)
   SET @vcError = ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConDatosCorreoInformativo]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************
   Descripción: Stored procedure para traer los datos para el envío de los
      correos informativos
**************************************************************************/
CREATE PROCEDURE [dbo].[spConDatosCorreoInformativo]
(
   @piTipoCorreo INT
)
AS
SET NOCOUNT ON

SELECT 
       Cuentas = correo.fcDescripcion,
       CuentasCC = cc.fcDescripcion,
       CuentasCCO = cco.fcDescripcion,
       Asunto = asunto.fcDescripcion,
       Mensaje = txt1.fcDescripcion
FROM   dbo.TCTEDetalleCatalogoGenerico correo WITH(NOLOCK)
   INNER JOIN dbo.TCTEDetalleCatalogoGenerico cc WITH(NOLOCK)
      ON cc.fiItemId = correo.fiItemId
   INNER JOIN dbo.TCTEDetalleCatalogoGenerico cco WITH(NOLOCK)
      ON cco.fiItemId = correo.fiItemId
   INNER JOIN dbo.TCTEDetalleCatalogoGenerico asunto WITH(NOLOCK)
      ON asunto.fiItemId = correo.fiItemId
   INNER JOIN dbo.TCTEDetalleCatalogoGenerico catMen WITH(NOLOCK)
      ON catMen.fiItemId = correo.fiItemId
   INNER JOIN dbo.TCTEDetalleCatalogoGenerico txt1 WITH(NOLOCK)
      ON CAST(LTRIM(RTRIM(catMen.fcDescripcion)) AS INT) = txt1.fiCatalogoId
WHERE  correo.fiCatalogoId = 15
   AND correo.fiItemId = @piTipoCorreo
   AND cc.fiCatalogoId = 16
   AND cco.fiCatalogoId = 13
   AND asunto.fiCatalogoId = 14
   AND catMen.fiCatalogoId = 17
   AND txt1.fiItemId = 1
SET NOCOUNT OFF   
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spVerificaContadorTelcel]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------------------------------------------------------------------------------------------
---Responsable: Antonio de Jesus DomÃ­nguez Cuevas
---Fecha: Abril 2017
---DescripciÃ³n: Valida Contador de promocion Telcel
-------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[spVerificaContadorTelcel]
	@piNumeroPromo INT,  /*NÃºmero de promociÃ³n*/
	@Tipo	VARCHAR(10)
AS
SET NOCOUNT ON

DECLARE @viValorConteo	INT				= 0, 
		@vlDevuelveBol	BIT				= 0,
		@viLimite		INT				= 0,
		@viCatLimite	INT				= 0,
		@viCatContador	INT				= 0,
		@vcMensaje		varchar(100)	= ''
		
IF(@Tipo ='Lanix')
BEGIN
SELECT @viCatLimite=36,@viCatContador=37
END
ELSE IF(@Tipo ='Sony')
BEGIN
SELECT @viCatLimite=38,@viCatContador=39
END

BEGIN TRY
	BEGIN TRAN ActContador
		UPDATE	Contador
		SET		Contador.fcDescripcion = CAST((CAST(Contador.fcDescripcion AS INT) + 1) AS VARCHAR(10))
		FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
			INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
		WHERE Limite.fiCatalogoId		= @viCatLimite
			AND Contador.fiCatalogoId	= @viCatContador
			AND Limite.fiItemId			= @piNumeroPromo
		IF @@ERROR <> 0 BEGIN SET @vcMensaje = 'Error al actualizar el contador' GOTO ErrTran END
	COMMIT TRAN ActContador
END TRY
BEGIN CATCH
	SET		@vcMensaje = ERROR_MESSAGE()
	GOTO	ErrTran
END CATCH

IF EXISTS (
	SELECT Limite.fiCatalogoId 
	FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
		INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
	WHERE Limite.fiCatalogoId		= @viCatLimite
		AND Contador.fiCatalogoId	= @viCatContador
		AND Limite.fiItemId			= @piNumeroPromo
)
BEGIN 
	SET @vlDevuelveBol = 1
END


SELECT Aplica = @vlDevuelveBol

SET NOCOUNT OFF
RETURN 0

ErrTran:
	ROLLBACK TRAN ActContador
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spValidaSiAplicaRegla]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************
	Responsable: Angel Israel Lopez Rosales
	Fecha :		 Diciembre 2019
	Descripción: Valida si aplica regla
	Aplicación:  Elektra.Negocio.Entidades.Promovendedor.dll
*************************************************************************************/
CREATE PROCEDURE [dbo].[spValidaSiAplicaRegla]
(
	@piReglaID INT,
	@piDepartamento INT,
	@piSubdepartamento INT,
	@piClase INT,
	@piSubclase INT,
	@piSku INT
)

AS

DECLARE @viRespuesta INT

SET @viRespuesta = dbo.fnValidaSiAplicaRegla(@piReglaID, @piDepartamento, @piSubdepartamento, @piClase, @piSubclase, @piSku)

SELECT Respuesta = @viRespuesta
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConPromocionEspecial]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------
---RESPONSABLE: AMEHT SAID ESCAMILLA ARELLANO
---FECHA: MAYO DEL 2017
---DESCRIPCION: 
------------------------------------------------
CREATE PROCEDURE [dbo].[spConPromocionEspecial]	(
											@piFolio	BIGINT
					 						)
AS
	SET NOCOUNT ON
						 					
	SELECT	P.fiFolio AS Folio,
			P.fiSucursal AS Tienda,
			P.fiNoPedido AS Pedido,
			P.fiPromocionId AS Promocion,
			P.fcCliente AS Cliente,			
			A.fnMonto AS MontoPromocion,
			SUM(ISNULL(A.fnMonto,0)) - SUM(ISNULL(B.fnMonto,0)) AS Saldo,
			P.fdInicio AS FechaInicio,
			P.fdVigencia AS Vigencia,
			P.fiReglaId AS Regla
	FROM dbo.TATEPromocionEspecial P
	INNER JOIN (
		SELECT	SUM(fnMonto) AS fnMonto,
				fiFolio,
				fiTipoMovimiento
		FROM dbo.TATEDetallePromocionEspecial WITH(NOLOCK)
		WHERE	fiTipoMovimiento = 1
		GROUP BY fiFolio,fiTipoMovimiento
	) A ON A.fiFolio = P.fiFolio
	LEFT OUTER JOIN(SELECT	SUM(fnMonto * fiCantidad) AS fnMonto,
							fiFolio,
							fiTipoMovimiento
					FROM dbo.TATEDetallePromocionEspecial WITH(NOLOCK)
					WHERE fiTipoMovimiento = 2
					GROUP BY fiFolio,fiTipoMovimiento
	) B  ON B.fiFolio = A.fiFolio
	WHERE P.fiFolio = @piFolio
	GROUP BY	P.fiFolio,
				P.fiSucursal,
				P.fiNoPedido,
				P.fiPromocionId,
				P.fcCliente,			
				A.fnMonto,
				P.fdInicio,
				P.fdVigencia,
				P.fiReglaId
				
	SET NOCOUNT OFF
	RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConMovimientosPromocionEspecial]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------
---RESPONSABLE: AMEHT SAID ESCAMILLA ARELLANO
---FECHA: MAYO DEL 2017
---DESCRIPCION: 
------------------------------------------------
CREATE PROCEDURE [dbo].[spConMovimientosPromocionEspecial]	(
														@piFolio		BIGINT,
														@pitipo			INT
					 									)
AS
	SET NOCOUNT ON
						 	
	IF EXISTS(	SELECT fiFolio FROM dbo.TATEDetallePromocionEspecial WITH(NOLOCK)
				WHERE fiFolio = @piFolio AND fiTipoMovimiento = @pitipo)
		BEGIN
			SELECT	fcdetalle AS Descipcion,
					fnMonto AS Monto,
					fcWS AS Estacion,
					fiCantidad AS Cantidad,
					fcEmpleado AS Empleado,
					fdFecha AS FechaMovimiento 
			FROM dbo.TATEDetallePromocionEspecial WITH(NOLOCK)
			WHERE fiFolio = @piFolio AND fiTipoMovimiento = @pitipo
		END
	ELSE
		BEGIN
			GOTO ERROR	
		END
		
	SET NOCOUNT OFF
	RETURN 0
 ERROR:
	SET NOCOUNT OFF
	RAISERROR('No hay movimientos registrados.',18,1)
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spConPromocionesVigentes]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: ALEXIS MERCADO PÉREZ
 Fecha  :     27 - ABRIL - 2018
 Descripción: CONSULTA PROMOCIONES VIGENTES
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  

CREATE PROCEDURE [dbo].[spConPromocionesVigentes]

AS
	SET NOCOUNT ON
	SELECT fiPromocionId, fcNombre, fcDescripcion, fiTipoPromocionId, fdVigenciaInicio, fdVigenciaFin, fnMontoMinimo,
	fiActivosDiscontinuos, fiAlcance, flSustituta, fiPromocionBase, fnMontoMaximo 
	FROM DBO.PROPROMOCION WITH(NOLOCK) WHERE GETDATE() BETWEEN fdVigenciaInicio AND fdVigenciaFin

	SET NOCOUNT OFF
	RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConsultaLimitePromo]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaLimitePromo]
	@pipromo int
AS

SET NOCOUNT ON 
IF EXISTS (select DCG.fiItemId from TCTEDetalleCatalogoGenerico DCG with (nolock)  where fiItemId=   @pipromo)
 BEGIN
	 select DECAT.fcDescripcion from  dbo.TCTEDetalleCatalogoGenerico DECAT WITH(NOLOCK)
	inner join dbo.TCTECatalogoGenerico CGEn WITH(NOLOCK) on DECAT.fiCatalogoId=CGEn.fiCatalogoId
	where	CGEn.fcDescripcion like '%Contador promocion movi limite%' and   DECAT.fiItemId=   @pipromo
 END
 
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConsultaContadorTA]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaContadorTA]
	@pipromo int
AS
DECLARE @vcDescripcion VARCHAR(100)
SET @vcDescripcion='Contador de Recargas Movistar'
SET NOCOUNT ON 
IF EXISTS (select DCG.fiItemId from TCTEDetalleCatalogoGenerico DCG WITH(NOLOCK) where fiItemId=   @pipromo)
 BEGIN	
	 select DECAT.fcDescripcion from  dbo.TCTEDetalleCatalogoGenerico DECAT WITH(NOLOCK)
	 inner join dbo.TCTECatalogoGenerico CGEn WITH(NOLOCK) on DECAT.fiCatalogoId=CGEn.fiCatalogoId
	 where	CGEn.fcDescripcion = @vcDescripcion and  DECAT.fiItemId=   @pipromo
 END
 
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConsultaContadorPromoTelcel]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultaContadorPromoTelcel]
	@pipromo int
AS
DECLARE @vcDescripcion VARCHAR(100)
SET @vcDescripcion=''
SET NOCOUNT ON 
IF EXISTS (select DCG.fiItemId from TCTEDetalleCatalogoGenerico DCG with (nolock)  where fiItemId=   @pipromo)
 BEGIN
	IF(@pipromo=2629)
	BEGIN
		SET @vcDescripcion = 'Contador promocion Telcel Lanix contador'
	END
	IF(@pipromo=2627)
	BEGIN
		SET @vcDescripcion = 'Contador promocion Telcel Sony contador'
	END
	
	 select DECAT.fcDescripcion from  dbo.TCTEDetalleCatalogoGenerico DECAT WITH(NOLOCK)
	inner join dbo.TCTECatalogoGenerico CGEn WITH(NOLOCK) on DECAT.fiCatalogoId=CGEn.fiCatalogoId
	where	CGEn.fcDescripcion = @vcDescripcion and  DECAT.fiItemId=   @pipromo
 END
 
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConsultaContadorPromo]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Sp Obtiene el contador de una promocion

CREATE PROCEDURE [dbo].[spConsultaContadorPromo]
	@pipromo int
AS

SET NOCOUNT ON 
IF EXISTS (select DCG.fiItemId from TCTEDetalleCatalogoGenerico DCG with (nolock)  where fiItemId=   @pipromo)
 BEGIN
	 select DECAT.fcDescripcion from  dbo.TCTEDetalleCatalogoGenerico DECAT WITH(NOLOCK)
	inner join dbo.TCTECatalogoGenerico CGEn WITH(NOLOCK) on DECAT.fiCatalogoId=CGEn.fiCatalogoId
	where	CGEn.fcDescripcion like '%Contador promocion movi contador%' and  DECAT.fiItemId=   @pipromo
 END
 
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spIncrementaContadorTA]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spIncrementaContadorTA]
	@piNumeroPromo INT  /*Número de promoción*/	
AS
SET NOCOUNT ON

DECLARE @vlDevuelveBol	BIT				= 0,		
		@viCatLimite	INT				= 0,
		@viCatContador	INT				= 0,
		@vcMensaje		varchar(100)	= ''

SELECT @viCatLimite=40,@viCatContador=41

BEGIN TRY
	BEGIN TRAN ActContador
		UPDATE	Contador
		SET		Contador.fcDescripcion = CAST((CAST(Contador.fcDescripcion AS INT) + 1) AS VARCHAR(10))
		FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
			INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
		WHERE Limite.fiCatalogoId		= @viCatLimite
			AND Contador.fiCatalogoId	= @viCatContador
			AND Limite.fiItemId			= @piNumeroPromo
		IF @@ERROR <> 0 BEGIN SET @vcMensaje = 'Error al actualizar el contador' GOTO ErrTran END
	COMMIT TRAN ActContador
END TRY
BEGIN CATCH
	SET		@vcMensaje = ERROR_MESSAGE()
	GOTO	ErrTran
END CATCH

IF EXISTS (
	SELECT Limite.fiCatalogoId 
	FROM dbo.TCTEDetalleCatalogoGenerico Limite WITH (NOLOCK) 
		INNER JOIN  dbo.TCTEDetalleCatalogoGenerico Contador WITH (NOLOCK) ON Limite.fiItemId = Contador.fiItemId AND CAST(Limite.fcDescripcion AS INT) > CAST(Contador.fcDescripcion AS INT)
	WHERE Limite.fiCatalogoId		= @viCatLimite
		AND Contador.fiCatalogoId	= @viCatContador
		AND Limite.fiItemId			= @piNumeroPromo
)
BEGIN 
	SET @vlDevuelveBol = 1
END


SELECT Aplica = @vlDevuelveBol

SET NOCOUNT OFF
RETURN 0

ErrTran:
	ROLLBACK TRAN ActContador
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Venta](
	[fiPresupuestoId] [int] NOT NULL,
	[fiPromocionId] [int] NOT NULL,
	[fcFolio] [varchar](20) NOT NULL,
	[fiEstatus] [tinyint] NULL,
	[fiNoPedido] [int] NULL,
	[fcCliente] [varchar](20) NULL,
	[fiTienda] [int] NULL,
	[fiPlazo] [int] NULL,
	[fiPlan] [int] NULL,
	[fiEquipo] [int] NULL,
	[fcSistema] [varchar](20) NULL,
	[fdFechaVenta] [smalldatetime] NULL,
 CONSTRAINT [PK7_Venta] PRIMARY KEY CLUSTERED 
(
	[fiPresupuestoId] ASC,
	[fiPromocionId] ASC,
	[fcFolio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTEJefeVentas]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTEJefeVentas](
	[fiJefeVtaID] [int] NOT NULL,
	[fiPlazaID] [int] NOT NULL,
	[fiPaisID] [int] NOT NULL,
	[fcDescripcion] [varchar](100) NOT NULL,
	[fiEstatus] [int] NOT NULL,
 CONSTRAINT [PKTCTEJefeVentas] PRIMARY KEY NONCLUSTERED 
(
	[fiJefeVtaID] ASC,
	[fiPlazaID] ASC,
	[fiPaisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCTEDistritales]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTEDistritales](
	[fiDistritoId] [int] NOT NULL,
	[fiJefeVtaID] [int] NOT NULL,
	[fiPlazaID] [int] NOT NULL,
	[fiPaisID] [int] NOT NULL,
	[fcDescripcion] [varchar](100) NOT NULL,
	[fiEstatus] [int] NOT NULL,
 CONSTRAINT [PKTCTEDistritales] PRIMARY KEY NONCLUSTERED 
(
	[fiDistritoId] ASC,
	[fiJefeVtaID] ASC,
	[fiPlazaID] ASC,
	[fiPaisID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[spDelVenta]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: ALEXIS MERCADO PÉREZ
 Fecha  :     10 - ABRIL - 2018
 Descripción: BORRA LA VENTA REALIZADA
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  

CREATE PROCEDURE [dbo].[spDelVenta]
(
	@piPresupuestoId int
)
AS
SET NOCOUNT ON

DECLARE
@vcMensaje VARCHAR(255)

	DELETE dbo.Venta WHERE fiPresupuestoId = @piPresupuestoId
	IF (@@ERROR <> 0)
		BEGIN
			SET @vcMensaje = 'Ocurrio un problema al intentar borrar el presupuesto ' + cast(@piPresupuestoId as varchar(20))
			GOTO Errores
		END

SET NOCOUNT OFF    
RETURN 0


Errores:    
 RAISERROR(@vcMensaje, 18, 1)    
 SET NOCOUNT OFF    
 RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spConVigenteVale]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************
	Responsable: Angel Israel Lopez Rosales
	Fecha :		 Diciembre 2019
	Descripción: Consulta promociones vigentes de vales
	Aplicación:  Elektra.Negocio.Entidades.Promovendedor.dll
*************************************************************************************/
CREATE PROCEDURE [dbo].[spConVigenteVale]
AS
SET NOCOUNT ON
DECLARE @vdActual DATETIME

SET @vdActual = GETDATE()

SELECT	PE.fiPromocionId,
		PE.fiElementoId,
		PE.fiTipo,
		PE.fcValor,
		PE.fiCantidadMinima,
		PE.fiCantidadMaxima,
		PE.fnPrecioDeMinimo,
		D.fiContadorId,
		D.fnMontoVale
FROM	dbo.PROPromocion PP WITH(NOLOCK)
	INNER JOIN dbo.PROElemento PE WITH(NOLOCK)
		ON PP.fiPromocionId = PE.fiPromocionId
	INNER JOIN dbo.ProDetalleVale D WITH(NOLOCK)
		ON D.fiPromocionId = PE.fiPromocionId
			AND D.fiElementoId = PE.fiElementoId
WHERE	fiTipoPromocionId = 2
	AND @vdActual BETWEEN PP.fdVigenciaInicio AND PP.fdVigenciaFin

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConPromocionesVale]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************
	Responsable: Angel Israel Lopez Rosales
	Fecha :		 Diciembre 2019
	Descripción: Valida vale por contador/día
	Aplicación:  Elektra.Negocio.Entidades.Promovendedor.dll
*************************************************************************************/
CREATE PROCEDURE [dbo].[spConPromocionesVale]
(
	@piPromocionId	INT,
	@pdSurtimiento	DATETIME,
	@pnMonto		DECIMAL(8, 2) = 0.0,
	@piContadorId	INT = 0
)
AS
SET NOCOUNT ON
DECLARE @vdFecha			DATETIME,
		@vcValor			VARCHAR(10)

SELECT @vdFecha = CONVERT(DATETIME, CONVERT(VARCHAR(10), @pdSurtimiento, 103),103)

IF EXISTS (
	SELECT	v.fiPromocionId 
	FROM	dbo.ProContadorVale v WITH (NOLOCK) 
	WHERE v.fiLimite > v.fiContador 
		AND v.fiContadorId = @piContadorId
		AND fdFecha = @vdFecha 
	)
BEGIN
	BEGIN TRY
		UPDATE	dbo.ProContadorVale 
		SET		fiContador = fiContador + 1 
		WHERE	fiContadorId = @piContadorId
			AND fdFecha = @vdFecha
	END TRY
	BEGIN CATCH
		SET @pnMonto = 0;
	END CATCH
END
ELSE
BEGIN
	SET @pnMonto = 0;
END
SELECT MontoVale = @pnMonto
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConPromoVale]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************
	Fecha :		 21 - OCTUBRE - 2019
	Descripción: Consulta promoción de Elektravale.
	Aplicación:  Promoción Buen Fin Telcel 2019.
*************************************************************************************/

CREATE PROCEDURE [dbo].[spConPromoVale]
(
@piPromocionId int = '2681'
)
AS
SET NOCOUNT ON
DECLARE 
@vnMontoVale DECIMAL(8,2),
@vldFecha DATE = CAST(GETDATE() AS DATE);

IF EXISTS (SELECT pp.fiPromocionId from PROPromocion pp INNER JOIN ProContadorVale v ON v.fiPromocionId 
			= @piPromocionId WHERE GETDATE() BETWEEN fdVigenciaInicio AND fdVigenciaFin AND v.fiLimite > 
			v.fiContador AND fdFecha =  @vldFecha AND pp.fiTipoPromocionId = 2)
BEGIN
	
	SELECT @vnMontoVale = fnMontoVale FROM dbo.ProDetalleVale;
	UPDATE dbo.ProContadorVale SET  fiContador = fiContador + 1 WHERE fdFecha = @vldFecha;

END

SET NOCOUNT OFF

RETURN @vnMontoVale
GO
/****** Object:  StoredProcedure [dbo].[spUpdVenta]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: Angel Israel Lopez Rosales
 Fecha  :     16/07/2020
 Descripción: Valida por tienda
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  
CREATE PROCEDURE [dbo].[spUpdVenta]
	@piPresupuestoId	INT,
	@piNoPedido			INT,
	@piEstatus			INT,
	@piNoTienda			INT = 0,
	@piEsReverso		TINYINT = 0
 
AS
SET NOCOUNT ON

DECLARE 
@vt table ( 
	fiPresupuestoId      INT  NOT NULL ,
	fiPromocionId        INT  NOT NULL ,
	fcFolio              varchar(20) NOT NULL ,
	fiEstatus            tinyint  NULL ,
	fiNoPedido           INT  NULL ,
	fcCliente            varchar(20)  NULL,
	fiTienda			 INT  NULL ,
	fiPlazo				 INT  NULL ,
	fiPlan				 INT  NULL ,
	fiEquipo			 INT  NULL ,
	fcSistema			 varchar(20) NULL,
	fdFechaVenta		 smalldatetime NULL
)
DECLARE 
	@viPresupuesto	INT,
	@viPromocionId	INT,
	@vcFolio		VARCHAR(20),
	@viEstatus		INT,
	@viContador		INT,
	@viRegistroId	INT,
	@vcMensaje		VARCHAR(255),
	@vdFecha		DATETIME,
	@viDias			INT

SELECT @viRegistroId = 1, @vdFecha = GETDATE(), @viDias = 15

IF(@piEsReverso = 1)
BEGIN
	IF EXISTS (
		SELECT	fipresupuestoid 
		FROM	dbo.Venta v WITH(NOLOCK) 
		WHERE	fiPresupuestoId = @piPresupuestoId 
			AND v.fiEstatus = 1
			AND (
				(v.fiTienda = @piNoTienda) OR 
				(DATEDIFF(DAY, fdFechaVenta, @vdFecha) <= @viDias AND @piNoTienda = 0)
			)
	)
	BEGIN
		UPDATE	v
		SET		v.fiEstatus = 0
		FROM	dbo.Venta v WITH(NOLOCK) 
		WHERE	fiPresupuestoId = @piPresupuestoId 
			AND v.fiEstatus = 1
			AND (
				(v.fiTienda = @piNoTienda) OR 
				(DATEDIFF(DAY, fdFechaVenta, @vdFecha) <= @viDias AND @piNoTienda = 0)
			)
	END
END

IF EXISTS (
	SELECT	fipresupuestoid 
	FROM	dbo.Venta v WITH(NOLOCK) 
	WHERE	fiPresupuestoId = @piPresupuestoId 
		AND (
			(v.fiTienda = @piNoTienda) OR 
			(DATEDIFF(DAY, fdFechaVenta, @vdFecha) <= @viDias AND @piNoTienda = 0)
		)
)
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION ACTUALIZAR
		INSERT INTO @vt 
		SELECT	fiPresupuestoId, 
			fiPromocionId, 
			fcFolio, 
			fiEstatus, 
			fiNoPedido, 
			fcCliente, 
			fiTienda, 
			fiPlazo,
			fiPlan, 
			fiEquipo, 
			fcSistema, 
			fdFechaVenta 
		FROM dbo.Venta v WITH(NOLOCK) 
		WHERE fiPresupuestoId = @piPresupuestoId
			AND (
				(v.fiTienda = @piNoTienda) OR 
				(DATEDIFF(DAY, fdFechaVenta, @vdFecha) <= @viDias AND @piNoTienda = 0)
			)
		
		SELECT @viContador = COUNT(fiPresupuestoId) FROM @vt
		
		WHILE @viRegistroId <= @viContador 
		BEGIN 
			SELECT	@viPromocionId = fiPromocionId, 
					@vcFolio = fcFolio, 
					@viEstatus = fiEstatus 
			FROM (
				SELECT fiPromocionId, fcFolio, fiEstatus , RANK() OVER (ORDER BY fiPromocionId ASC) AS RANK from @vt
			) AS TEMP 
			WHERE RANK = @viRegistroId
				
			IF EXISTS (SELECT fcFolio FROM dbo.Venta WITH(NOLOCK) WHERE fcFolio = @vcFolio AND fiEstatus = 1)
			BEGIN
				SET @vcMensaje = 'El Folio ' + CAST(@vcFolio AS VARCHAR(20)) + ' ya se encuentra surtido'
				RAISERROR(@vcMensaje, 18, 1)
			END
			IF (@viEstatus = 1)
			BEGIN
				SET @vcMensaje = 'El presupuesto ' + CAST(@piPresupuestoId AS VARCHAR(20)) + ' ya se encuentra surtido'
				RAISERROR(@vcMensaje, 18, 1)
			END
			ELSE 
			BEGIN 
				IF (@viEstatus = 0)
				BEGIN
					UPDATE	dbo.Venta 
					SET		fiEstatus = @piEstatus, 
							fiNoPedido = @piNoPedido, 
							fdFechaVenta = CAST(GETDATE() AS SMALLDATETIME)
					WHERE fiPresupuestoId = @piPresupuestoId 
						AND fiPromocionId = @viPromocionId 
						AND fcFolio = @vcFolio
				END
				ELSE
				BEGIN
					SET @vcMensaje = 'El presupuesto ya fue cancelado previamente'
					RAISERROR(@vcMensaje, 18, 1)
				END
			END
			SET @viRegistroId = @viRegistroId + 1 
		END
		COMMIT TRANSACTION ACTUALIZAR
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION ACTUALIZAR
		SET @vcMensaje = ERROR_MESSAGE()
		RAISERROR(@vcMensaje, 18, 1)    
		SET NOCOUNT OFF
		RETURN -1
	END CATCH
END
SET NOCOUNT OFF    
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsVenta]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************      
 Responsable: ALEXIS MERCADO PÉREZ  
 Fecha  :     16 - MAYO - 2018  
 Descripción: INSERTA O ACTUALIZA LA INFORMACION DE LA VENTA (se agrega campo fdFechaVenta)  
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI  
*****************************************************************************************/    
 CREATE PROCEDURE [dbo].[spInsVenta]  
 @piPresupuestoId int,  
 @piPromocionId int,  
 @pcFolio varchar(20),  
 @piNoPedido int,  
 @pcCliente varchar(20),  
 @piTienda int,  
 @piPlazo int,  
 @piPlan int,  
 @piEquipo int,  
 @piEstatus int,   
 @pcSistema varchar(20) = '' 
   
AS  
SET NOCOUNT ON  
  
DECLARE   
@viPresupuestoId int,  
@vcMensaje varchar(255)  
  
  
IF NOT EXISTS (SELECT fiPresupuestoId FROM dbo.Venta WITH(NOLOCK) WHERE fiPromocionId = @piPromocionId AND fcFolio = @pcFolio AND fiEstatus = 1)  
 BEGIN   
  IF NOT EXISTS (SELECT fiPresupuestoId FROM dbo.Venta WITH(NOLOCK) WHERE fiPresupuestoId = @piPresupuestoId)  
   BEGIN  
    INSERT INTO dbo.Venta (fiPresupuestoId, fiPromocionId, fcFolio, fiEstatus, fiNoPedido, fcCliente, fiTienda, fiPlazo, fiPlan, fiEquipo, fcSistema)  
    VALUES (@piPresupuestoId, @piPromocionId, @pcFolio, @piEstatus, @piNoPedido, @pcCliente, @piTienda, @piPlazo, @piPlan, @piEquipo, @pcSistema)  
    IF (@@ERROR <> 0)  
     BEGIN  
      GOTO Errores  
     END     
   END  
  ELSE   
   BEGIN  
    IF EXISTS (SELECT fipresupuestoid FROM dbo.Venta WITH(NOLOCK) WHERE fiPresupuestoId = @piPresupuestoId and fiEstatus = 0)  
     BEGIN  
      UPDATE dbo.Venta SET fiEstatus = @piEstatus , fiNoPedido = @piNoPedido, fcCliente = @pcCliente, fiTienda = @piTienda,  
      fiPlazo = @piPlazo, fiPlan = @piPlan, fiEquipo = @piEquipo, fdFechaVenta = CAST (GETDATE() AS SMALLDATETIME)   
      WHERE fiPresupuestoId = @piPresupuestoId AND fiPromocionId = @piPromocionId AND fcFolio = @pcFolio AND fiEstatus IN (0)  
      IF (@@ERROR <> 0)  
       BEGIN  
        SET @vcMensaje = 'Error al actualizar la venta '  
        GOTO Errores  
       END   
     END  
    ELSE  
     BEGIN  
      IF EXISTS (SELECT fipresupuestoid FROM dbo.Venta WITH(NOLOCK) WHERE fiPresupuestoId = @piPresupuestoId and fiEstatus IN(1))  
      BEGIN  
       SET @vcMensaje = 'Ya se realizo el descuento para el presupuesto ' + cast(@piPresupuestoId as varchar(20))   
       GOTO Errores  
      END  
     END   
   END  
 END  
ELSE  
 BEGIN  
  SELECT @viPresupuestoId = fiPresupuestoId FROM dbo.Venta WITH(NOLOCK) WHERE fcCliente = @pcCliente and fiEstatus = 1  
  SET @vcMensaje = 'Ya se realizo el descuento al cliente en el presupuesto '   
       + cast(@viPresupuestoId as varchar(20))   
  GOTO Errores  
 END  
  
SET NOCOUNT OFF      
RETURN 0  
  
Errores:      
 RAISERROR(@vcMensaje, 18, 1)      
 SET NOCOUNT OFF      
 RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spInsPROPromocion]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: ALEXIS MERCADO PÉREZ
 Fecha  :     09 - ABRIL - 2018
 Descripción: INSERTA PROMOCIONES NUEVAS
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  

CREATE PROCEDURE [dbo].[spInsPROPromocion]
 @piTipoPromocionId int,
 @piPromocionId int,
 @pcNombre varchar(30),
 @pcDescripcion varchar(80),
 @pdVigenciaInicio smalldatetime,
 @pdVigenciaFin smalldatetime,
 @pnMontoMinimo decimal(6,2),
 @piActivosDiscontinuos	int,
 @piAlcance int,
 @plsustituta bit,
 @piPromocionBase int,
 @pnMontoMaximo decimal(6,2),	
 @pnPorcentaje decimal(6,2),
 @pnMonto decimal(6,2),
 @plAplica bit
AS
SET NOCOUNT ON

DECLARE 
@vcMensaje varchar(255)

	-- VALIDACION DE VARIABLES IMPRESINDIBLES
	IF (@pcNombre is NULL or @pcNombre = ' ' or LEN(@pcNombre) <= 0)
		BEGIN
			SET @vcMensaje = '@pcNombre invalido'
			goto Errores
		END
	IF (@pcDescripcion is NULL or @pcDescripcion = ' ' or LEN(@pcDescripcion) <= 0)
		BEGIN
			SET @vcMensaje = '@pcDescripcion invalido'
			goto Errores
		END
	IF (@piTipoPromocionId is NULL or @piTipoPromocionId <= 0)
		BEGIN
			SET @vcMensaje = '@piTipoPromocionId invalido'
			goto Errores
		END
	IF (@piPromocionId is NULL or @piPromocionId <= 0)
		BEGIN
			SET @vcMensaje = '@piPromocionId invalido'
			goto Errores
		END	
	IF (@pdVigenciaInicio is NULL or CAST(@pdVigenciaInicio AS date) < CAST (getdate() AS date))
		BEGIN
			SET @vcMensaje = '@pdVigenciaInicio invalida'
			goto Errores
		END	
	IF (@pdVigenciaFin is NULL)
	BEGIN
		SET @vcMensaje = '@pdVigenciaFin invalida'
		goto Errores
	END	
	IF (@pnMontoMinimo is NULL or @pnMontoMinimo < 0 or @pnMontoMinimo > @pnMontoMaximo)
	BEGIN
		SET @vcMensaje = '@pnMontoMinimo invalido'
		goto Errores
	END
	IF (@pnMontoMaximo is NULL or @pnMontoMaximo < 0 or @pnMontoMinimo > @pnMontoMaximo)
	BEGIN
		SET @vcMensaje = '@pnMontoMaximo invalido'
		goto Errores
	END
	-- INSERTA DATOS

BEGIN TRANSACTION PROMOCIONES

	IF NOT EXISTS (SELECT fiPromocionId FROM dbo.PROPromocion WITH(NOLOCK) WHERE fiTipoPromocionId = @piTipoPromocionId AND fiPromocionId = @piPromocionId)
		BEGIN
			INSERT INTO dbo.PROPromocion (fiTipoPromocionId , fiPromocionId , fcNombre , fcDescripcion , fdVigenciaInicio , fdVigenciaFin , 
								fnMontoMinimo , fiActivosDiscontinuos	, fiAlcance , flsustituta , fiPromocionBase , fnMontoMaximo)
			VALUES(@piTipoPromocionId , @piPromocionId , @pcNombre , @pcDescripcion , @pdVigenciaInicio , @pdVigenciaFin , @pnMontoMinimo , 
				ISNULL(@piActivosDiscontinuos,0), ISNULL(@piAlcance,0) , ISNULL(@plsustituta,0), ISNULL(@piPromocionBase,0), @pnMontoMaximo)
				
			IF (@@ERROR <> 0)
				BEGIN
					SET @vcMensaje = 'Ocurrio un problema al insertar la promocion ' + CAST(@piPromocionId AS varchar(20))
					goto Errores
				END
				
			INSERT INTO dbo.PRODescuento (fiPromocionId, fnPorcentaje, fnMonto, flAplica) VALUES (@piPromocionId, @pnPorcentaje ,@pnMonto, ISNULL(@plAplica, 1))
			IF (@@ERROR <> 0)
				BEGIN
					SET @vcMensaje = 'Ocurrio un problema al insertar el detalle de la promocion ' + CAST(@piPromocionId AS varchar(20))
					goto Errores
				END
		END
	ELSE
		BEGIN
			UPDATE dbo.PROPromocion SET fcNombre = @pcNombre, fcDescripcion = @pcDescripcion, fdVigenciaInicio = @pdVigenciaInicio, 
				fdVigenciaFin = @pdVigenciaFin,fnMontoMinimo = @pnMontoMinimo, fiActivosDiscontinuos = ISNULL(@piActivosDiscontinuos,0), 
				fiAlcance = ISNULL(@piAlcance,0), flsustituta = ISNULL(@plsustituta,0), fiPromocionBase = ISNULL(@piPromocionBase,0), fnMontoMaximo = @pnMontoMaximo
			WHERE fiTipoPromocionId = @piTipoPromocionId AND fiPromocionId = @piPromocionId
			IF (@@ERROR <> 0)
				BEGIN
					SET @vcMensaje = 'Ocurrio un problema al actualizar la promocion ' + CAST(@piPromocionId AS varchar(20))
					goto Errores
				END
				
			UPDATE dbo.PRODescuento SET fnPorcentaje = @pnPorcentaje , fnMonto = @pnMonto, flAplica = ISNULL(@plAplica, 1) 
				WHERE fipromocionId = @piPromocionId 
			IF (@@ERROR <> 0)
				BEGIN
					SET @vcMensaje = 'Ocurrio un problema al insertar el detalle de la promocion ' + CAST(@piPromocionId AS varchar(20))
					goto Errores
				END	
		END
COMMIT TRANSACTION PROMOCIONES 
SET NOCOUNT OFF    
RETURN 0

Errores:
 ROLLBACK TRANSACTION PROMOCIONES    
 RAISERROR(@vcMensaje, 18, 1)    
 SET NOCOUNT OFF    
 RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spInsAutMembresia]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************
	Descripción: Inserta registro en la tabla AutMembresia
	------------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel López Rosales
	Fecha: agosto de 2019
***************************************************************************/
CREATE PROCEDURE [dbo].[spInsAutMembresia]
(
	@piIdUsuario		INT,			/*Identificador de usuario, número de empleado*/
	@piIdAplicacion		INT,			/*Identificador de la aplicación*/
	@pcSalt				VARCHAR(100),	/*Clave salt*/
	@pcClave			VARCHAR(100),	/*Contraseña del empleado encriptada*/
	@pcToken			VARCHAR(100),	/*Token del usuario encriptado*/
	@piIdEstatus		INT,			/*Estatus de la membresia*/
	@pcUsuario			VARCHAR(100),	/*Usuario encriptado*/
	@piSesion			BIGINT,			/*Fecha y hora encriptada de la última sesión*/
	@pdCambioPassword	DATETIME,		/*Fecha de último cambio de password*/
	@pdUltimaSesion		DATETIME,		/*Fecha de última sesión*/
	@piCompaniaId		INT				/*Identificador de la empresa asociada a la membresía*/
)
AS
BEGIN TRY
	IF EXISTS (
		SELECT	fiIdUsuario 
		FROM	dbo.AutMembresia WITH(NOLOCK)
		WHERE fiIdUsuario = @piIdUsuario 
			AND fiIdAplicacion = @piIdAplicacion)
	BEGIN
		UPDATE	dbo.AutMembresia 
		SET		fiIdEstatus			= @piIdEstatus,
				fcSalt				= @pcSalt,
				fcClave				= @pcClave,
				fcToken				= @pcToken,
				fdCambioPassword	= @pdCambioPassword,
				fdUltimaSesion		= @pdUltimaSesion,
				fcUsuario			= @pcUsuario,
				fiSesion			= @piSesion,
				fiCompaniaId		= @piCompaniaId
		WHERE fiIdUsuario = @piIdUsuario AND fiIdAplicacion = @piIdAplicacion
	END
	ELSE
	BEGIN
		INSERT INTO dbo.AutMembresia (fiIdUsuario, fiIdAplicacion, fiIdEstatus, fcSalt, fcClave, fcToken, fdCambioPassword, fdUltimaSesion, fcUsuario, fiSesion, fiCompaniaId)
		VALUES (@piIdUsuario, @piIdAplicacion, @piIdEstatus, @pcSalt, @pcClave, @pcToken, @pdCambioPassword, @pdUltimaSesion, @pcUsuario, @piSesion, @piCompaniaId)
	END
	RETURN 0
END TRY
BEGIN CATCH
	DECLARE @vcError VARCHAR(100)
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
	RETURN -1
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spInsProElemento]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: Angel Israel Lopez Rosales
 Fecha  :     Diciembre 2019
 Descripción: Campos nuevos de promocion
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  
CREATE PROCEDURE [dbo].[spInsProElemento] 
(	
	@piPromocionId			INT,
	@plIncluyente			BIT, 
	@piTipo					INT, 
	@pcValor				VARCHAR(20),
	@picantidadminima		INT, 
	@piElementoid			INT OUTPUT,
	@pnPrecioDeMinimo		DECIMAL(8, 2) = 0,
	@piCantidadMaxima		INT = 0
)
AS
SET NOCOUNT ON

DECLARE @viElementoid INT, @vcMensaje VARCHAR(255)

BEGIN TRY
	---Obtiene Maximo Elemento ID   
	SELECT @viElementoid = COALESCE(MAX(fiElementoId)+1,1) FROM dbo.PROElemento WITH (ROWLOCK,UPDLOCK)  WHERE fiPromocionId =@piPromocionId 
  
	IF NOT EXISTS(SELECT fcValor FROM dbo.PROElemento WITH(NOLOCK) WHERE fiPromocionId = @piPromocionId AND fcValor = @pcValor AND fiTipo=@piTipo)
	BEGIN
		-- Alta de los elementos (skus, o familias [fiidAdn]) que participan en la promocion
		INSERT INTO DBO.Proelemento (fiPromocionId,fiElementoId,flIncluyente,fiTipo,fcValor,ficantidadminima, fnPrecioDeMinimo, fiCantidadMaxima) 
		VALUES (@piPromocionId, @viElementoid, @plIncluyente, @piTipo, @pcValor, @picantidadminima, @pnPrecioDeMinimo, @piCantidadMaxima)  
	END
	ELSE
	BEGIN
		SELECT @viElementoid = fiElementoId FROM dbo.PROElemento WITH(NOLOCK) WHERE fiPromocionId = @piPromocionId AND fcValor = @pcValor AND fiTipo = @piTipo
		UPDATE	dbo.proelemento 
		SET		flIncluyente = @plIncluyente,
				ficantidadminima = @picantidadminima,
				fnPrecioDeMinimo = @pnPrecioDeMinimo,
				fiCantidadMaxima = @piCantidadMaxima
		WHERE fiPromocionId =@piPromocionId and fcValor = @pcValor and fiTipo=@piTipo
	END
	
	SET @piElementoid=@viElementoid
END TRY
BEGIN CATCH
	SET @vcMensaje = ERROR_MESSAGE()
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELITCTEJefeVentas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para alta de jefe de ventas.
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELITCTEJefeVentas]
(
	@piJefeVtaID		INT,
	@piPlazaID			INT,
	@piPaisID			INT,
	@pcDescripcion		VARCHAR(100),
	@piEstatus			INT, /*Estatus*/
	@piTipoInsercion	TINYINT = 1 /*Tipo de inserción. 0 = Borra, 1 = Inserta - actualiza*/
)
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(100)

BEGIN TRY
	IF(@piTipoInsercion = 0)
	BEGIN
		IF EXISTS (SELECT fiPlazaID FROM dbo.TCTEJefeVentas WITH(NOLOCK) WHERE fiJefeVtaID = @piJefeVtaID AND fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID)
		BEGIN
			DELETE dbo.TCTEJefeVentas WHERE fiJefeVtaID = @piJefeVtaID AND fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID
		END
	END
	ELSE IF(@piTipoInsercion = 1)
	BEGIN
		IF EXISTS (SELECT fiPlazaID FROM dbo.TCTEJefeVentas WITH(NOLOCK) WHERE fiJefeVtaID = @piJefeVtaID AND fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID)
		BEGIN
			UPDATE dbo.TCTEJefeVentas SET fcDescripcion = @pcDescripcion, fiEstatus = @piEstatus WHERE fiJefeVtaID = @piJefeVtaID AND fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID
		END
		ELSE
		BEGIN
			INSERT INTO dbo.TCTEJefeVentas (fiJefeVtaID, fiPlazaID, fiPaisID, fcDescripcion, fiEstatus) VALUES (@piJefeVtaID, @piPlazaID, @piPaisID, @pcDescripcion, @piEstatus)
		END
	END
END TRY
BEGIN CATCH
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  Table [dbo].[ProElementoCliente]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProElementoCliente](
	[fiPromocionId] [int] NOT NULL,
	[fiElementoId] [int] NOT NULL,
	[fiClienteId] [int] NOT NULL
) ON [SECONDARY]
GO
/****** Object:  StoredProcedure [dbo].[spConAutMembresiaPorUsuario]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************
	Descripción: Consulta Membresia por usuario
	------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel López Rosales
	Fecha: agosto de 2019
****************************************************************************/
CREATE PROCEDURE [dbo].[spConAutMembresiaPorUsuario]
(
	@pcUsuario		VARCHAR(100)
)
AS
BEGIN TRY
	IF EXISTS (
		SELECT	fiIdUsuario 
		FROM	dbo.AutMembresia WITH(NOLOCK) 
		WHERE	fcUsuario = @pcUsuario)
	BEGIN
		SELECT	m.fiIdUsuario,m.fiIdAplicacion,m.fiIdEstatus,m.fcSalt,m.fcClave,m.fcToken,m.fdCambioPassword,m.fdUltimaSesion,m.fcUsuario,m.fiSesion,m.fiCompaniaId,
				u.fcApellidoMaterno,u.fcApellidoPaterno,u.fcCorreoElectronico,u.fcNombre,
				r.fcRol
		FROM	dbo.AutMembresia m WITH(NOLOCK)
			INNER JOIN dbo.AutUsuario u WITH(NOLOCK)
				ON m.fiIdUsuario = u.fiIdUsuario
			INNER JOIN dbo.AutRoles r WITH(NOLOCK)
				ON r.fiIdRol = u.fiIdRol
		WHERE	m.fcUsuario = @pcUsuario
	END
END TRY
BEGIN CATCH
	DECLARE @vcError VARCHAR(100)
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[spConAutMembresia]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************
	Descripción: Consulta registro de la tabla AutMembresia
	-------------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel López Rosales
	Fecha: agosto de 2019
***************************************************************************/
CREATE PROCEDURE [dbo].[spConAutMembresia]
(
	@piIdUsuario		INT,
	@piIdAplicacion		INT
)
AS
BEGIN TRY
	IF EXISTS (
		SELECT	fiIdUsuario 
		FROM	dbo.AutMembresia WITH(NOLOCK)
		WHERE fiIdUsuario = @piIdUsuario 
			AND fiIdAplicacion = @piIdAplicacion)
	BEGIN
		SELECT	m.fiIdUsuario,m.fiIdAplicacion,m.fiIdEstatus,m.fcSalt,m.fcClave,m.fcToken,m.fdCambioPassword,m.fdUltimaSesion,m.fcUsuario,m.fiSesion,m.fiCompaniaId,
				u.fcApellidoMaterno,u.fcApellidoPaterno,u.fcCorreoElectronico,u.fcNombre,
				r.fcRol
		FROM	dbo.AutMembresia m WITH(NOLOCK)
			INNER JOIN dbo.AutUsuario u WITH(NOLOCK)
				ON m.fiIdUsuario = u.fiIdUsuario
			INNER JOIN dbo.AutRoles r WITH(NOLOCK)
				ON r.fiIdRol = u.fiIdRol
		WHERE	m.fiIdUsuario = @piIdUsuario AND m.fiIdAplicacion = @piIdAplicacion
	END
END TRY
BEGIN CATCH
	DECLARE @vcError VARCHAR(100)
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
END CATCH
GO
/****** Object:  Table [dbo].[PRODetalleDescuento]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODetalleDescuento](
	[fiPromocionId] [int] NOT NULL,
	[fiElementoId] [int] NOT NULL,
	[fnPorcentaje] [decimal](8, 2) NULL,
	[fnMonto] [decimal](8, 2) NULL,
 CONSTRAINT [PK2_PRODetalleDescuento] PRIMARY KEY CLUSTERED 
(
	[fiPromocionId] ASC,
	[fiElementoId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
/****** Object:  StoredProcedure [dbo].[PATELSTCTEJefeVentas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para consulta de plazas
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSTCTEJefeVentas]
(
	@piPaisID	INT,	/*País*/
	@piPlazaID	INT		/*Plaza*/
)
AS

SET NOCOUNT ON

IF(@piPaisID > 0)
BEGIN
	SELECT	jv.fcDescripcion, jv.fiEstatus, jv.fiJefeVtaID, jv.fiPaisID, jv.fiPlazaID
	FROM	dbo.TCTEJefeVentas jv WITH (NOLOCK) 
	WHERE	fiPaisID = @piPaisID
		AND jv.fiPlazaID = @piPlazaID
	ORDER BY jv.fiPaisID, jv.fiPlazaID
END

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSTCTEDistritales]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para consulta de plazas
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSTCTEDistritales]
(
	@piPaisID		INT,	/*País*/
	@piPlazaID		INT,	/*Plaza*/
	@piJefeVtaID	INT		/*Identificador de jefe de ventas*/
)
AS

SET NOCOUNT ON

IF(@piPaisID > 0)
BEGIN
	SELECT	d.fcDescripcion, d.fiDistritoId, d.fiEstatus, d.fiJefeVtaID, d.fiPaisID, d.fiPlazaID
	FROM	dbo.TCTEDistritales d WITH (NOLOCK) 
	WHERE	d.fiPaisID = @piPaisID
		AND d.fiPlazaID = @piPlazaID
		AND d.fiJefeVtaID = @piJefeVtaID
	ORDER BY d.fiPaisID, d.fiPlazaID
END

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELITCTEDistritales]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para alta de distritales
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELITCTEDistritales]
(
	@piDistritoId		INT,
	@piJefeVtaID		INT,
	@piPlazaID			INT,
	@piPaisID			INT,
	@pcDescripcion		VARCHAR(100),
	@piEstatus			INT, /*Estatus*/
	@piTipoInsercion	TINYINT = 1 /*Tipo de inserción. 0 = Borra, 1 = Inserta - actualiza*/
)
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(100)

BEGIN TRY
	IF(@piTipoInsercion = 0)
	BEGIN
		IF EXISTS (SELECT fiPlazaID FROM dbo.TCTEDistritales WITH(NOLOCK) WHERE fiDistritoId = @piDistritoId AND fiJefeVtaID = @piJefeVtaID AND fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID)
		BEGIN
			DELETE dbo.TCTEDistritales WHERE fiDistritoId = @piDistritoId AND fiJefeVtaID = @piJefeVtaID AND fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID
		END
	END
	ELSE IF(@piTipoInsercion = 1)
	BEGIN
		IF EXISTS (SELECT fiPlazaID FROM dbo.TCTEDistritales WITH(NOLOCK) WHERE fiDistritoId = @piDistritoId AND fiJefeVtaID = @piJefeVtaID AND fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID)
		BEGIN
			UPDATE dbo.TCTEDistritales SET fcDescripcion = @pcDescripcion, fiEstatus = @piEstatus WHERE fiDistritoId = @piDistritoId AND fiJefeVtaID = @piJefeVtaID AND fiPlazaID = @piPlazaID AND fiPaisID = @piPaisID
		END
		ELSE
		BEGIN
			INSERT INTO dbo.TCTEDistritales (fiDistritoId, fiJefeVtaID, fiPlazaID, fiPaisID, fcDescripcion, fiEstatus) VALUES (@piDistritoId, @piJefeVtaID, @piPlazaID, @piPaisID, @pcDescripcion, @piEstatus)
		END
	END
END TRY
BEGIN CATCH
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELIPlazasJefeDistrital]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************
   Descripción objeto: Alta de Plazas, jefes de ventas y Distrtiales
   Responsable: Angel Israel López Rosales
   Fecha: 30/11/2012
*******************************************************************************************/
CREATE PROCEDURE [dbo].[PATELIPlazasJefeDistrital]
   @piPaisId     INT,
   @piPlazaId    INT ,
   @pcPlaza      VARCHAR(100),
   @piJefeVtaID  INT,
   @pcJefeVentas VARCHAR(100),
   @piDistritoId INT,
   @pcDistrital  VARCHAR(100)
AS

SET NOCOUNT ON
SET XACT_ABORT ON
BEGIN TRY
   BEGIN TRANSACTION 
      DECLARE @vcError VARCHAR(255)
      IF NOT EXISTS (SELECT fiPlazaID FROM dbo.TCTEPlazas WHERE fiPlazaID=@piPlazaId)
         INSERT INTO dbo.TCTEPlazas (fiPlazaID,fiPaisID,fcDescripcion) VALUES (@piPlazaId,@piPaisId,@pcPlaza)
      IF NOT EXISTS (SELECT fiPlazaID FROM dbo.TCTEJefeVentas WHERE fiJefeVtaID=@piJefeVtaID)
         INSERT INTO dbo.TCTEJefeVentas (fiJefeVtaID,fiPlazaID,fiPaisID,fcDescripcion) VALUES (@piJefeVtaID,@piPlazaId,@piPaisId,@pcJefeVentas)
      IF NOT EXISTS (SELECT fiPlazaID FROM dbo.TCTEDistritales WHERE fiDistritoId=@piDistritoId)
         INSERT INTO dbo.TCTEDistritales (fiDistritoId,fiJefeVtaID,fiPlazaID,fiPaisID,fcDescripcion) VALUES (@piDistritoId,@piJefeVtaID,@piPlazaId,@piPaisId,@pcDistrital)
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
END CATCH
SET NOCOUNT OFF
RETURN
GO
/****** Object:  StoredProcedure [dbo].[insProDetalleDescuento]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: ALEXIS MERCADO PÉREZ
 Fecha  :     11 - MAYO - 2018
 Descripción: INSERTA DESCUENTO PERSONALIZADO DE UN ELEMENTO DE UNA PROMOCION
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  
CREATE PROCEDURE [dbo].[insProDetalleDescuento]
(
	@piPromocionId		INT,			/*Número de promoción*/
	@piElemento			INT,			/*Id de ProElemento*/
	@pnPorcentaje		DECIMAL(8,2),	/*Porcentaje*/
	@pnMonto			DECIMAL(8,2)
)
AS 
SET NOCOUNT ON

DECLARE @vcMensaje VARCHAR(255)

IF EXISTS (SELECT fiElementoId FROM dbo.PROElemento WITH(NOLOCK) 
			WHERE fiElementoId = @piElemento AND fiPromocionId = @piPromocionId
)
BEGIN
	IF EXISTS(	SELECT fiPromocionId 
				FROM dbo.PRODetalleDescuento WITH(NOLOCK) 
				WHERE fiPromocionId = @piPromocionId AND fiElementoId = @piElemento
	)
	BEGIN
		UPDATE	dbo.PRODetalleDescuento 
		SET		fnPorcentaje = @pnPorcentaje, fnMonto = @pnMonto
		WHERE	fiPromocionId = @piPromocionId 
			AND fiElementoId = @piElemento
		IF @@ERROR <> 0
		BEGIN
			SET @vcMensaje = 'Error al actualizar PRODetalleDescuento'
			GOTO ERRORES
		END
	END
	ELSE
	BEGIN
		INSERT INTO dbo.PRODetalleDescuento (fiPromocionId, fiElementoId, fnPorcentaje, fnMonto) 
		VALUES (@piPromocionId, @piElemento, @pnPorcentaje, @pnMonto)
		IF @@ERROR <> 0
		BEGIN
			SET @vcMensaje = 'Error al insertar en PRODetalleDescuento'
			GOTO ERRORES
		END
	END
END
ELSE
BEGIN
	SET @vcMensaje = 'El elemento ' + CAST(@piElemento AS VARCHAR(12)) + 'no existe en la tabla PROElemento'
	GOTO ERRORES
END

SET NOCOUNT OFF
RETURN 0

ERRORES:
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spInsMonto]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************      
 Responsable: MARIO ARTURO ZAVALETA BERMÚDEZ
 Fecha  :     JUNIO 2018  
 Descripción: INSERTA O ACTUALIZA EL MONTO / PORCENTAJE DE UNA PROMOCIÓN 
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI  
*****************************************************************************************/    
  
CREATE PROCEDURE [dbo].[spInsMonto]   
 @piPromocionId int,  
 @pcFolio varchar(20),  
 @pnMonto decimal = 0,
 @pnPorcentaje decimal = 0
   
AS  
SET NOCOUNT ON  
  
DECLARE   
@viElemento int,
@vcMensaje varchar(255)  


IF EXISTS (SELECT fiPresupuestoId FROM dbo.Venta WHERE fcFolio = @pcFolio AND fiPromocionId = @piPromocionId AND fiEstatus = 1)
BEGIN
	SET @vcMensaje = 'El folio ya se ha surtido.'
	GOTO Errores	
END

SELECT @viElemento = fiElementoId FROM dbo.ProElemento WHERE fiPromocionId= @piPromocionId AND fcValor= @pcFolio
IF EXISTS (SELECT fiElementoId FROM dbo.ProDetalleDescuento WHERE fiPromocionId = @piPromocionId AND fiElementoId = @viElemento)
BEGIN
	UPDATE dbo.ProDetalleDescuento SET fnMonto = @pnMonto, fnPorcentaje = @pnPorcentaje WHERE fiElementoId = @viElemento AND fiPromocionId = @piPromocionId
	IF @@ERROR <> 0
	BEGIN
		SET @vcMensaje = 'Error al actualizar ProDetalleDescuento.' 
		GOTO Errores
	END
END
ELSE
BEGIN
	IF EXISTS (SELECT fiElementoId FROM dbo.ProElemento where fiPromocionId = @piPromocionId AND fcValor = @pcFolio)
	BEGIN
		SET @vcMensaje = 'El folio no puede ser modificado.'
		GOTO Errores
	END

	SELECT @viElemento = (MAX(fiElementoId)+1) FROM dbo.ProElemento WHERE fiPromocionId = @piPromocionId

	INSERT INTO dbo.ProElemento (fiPromocionId, fiElementoId, flIncluyente, fiTipo, fcValor, fiCantidadMinima)
	VALUES (@piPromocionId, @viElemento, 1, 1000, @pcFolio, 1)
	IF @@ERROR <> 0
	BEGIN
		SET @vcMensaje = 'Error al insertar en ProElemento.'
		GOTO Errores
	END		
	INSERT INTO dbo.ProDetalleDescuento (fiPromocionId, fiElementoId, fnPorcentaje, fnMonto)
	VALUES(@piPromocionId, @viElemento, @pnPorcentaje, @pnMonto)
	IF @@ERROR <> 0
	BEGIN
		SET @vcMensaje = 'Error al insertar en ProDetalleDescuento'
		GOTO Errores
	END
END
  
SET NOCOUNT OFF      
RETURN 0  
  
Errores:      
 RAISERROR(@vcMensaje, 18, 1)      
 SET NOCOUNT OFF      
 RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[spConPromosDescuento]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: ALEXIS MERCADO PÉREZ
 Fecha  :     10 - MAYO - 2018
 Descripción: CONSULTA LAS PROMOCIONES CON DESCUENTO
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/ 

CREATE PROCEDURE [dbo].[spConPromosDescuento]
(
	@pcValor VARCHAR(20)
)
AS
SET NOCOUNT ON
SELECT	pp.fiPromocionId,
		pp.fcDescripcion,
		pp.fiTipoPromocionId,
		fnMonto =
			CASE 
				WHEN pdd.fnMonto IS NOT NULL THEN pdd.fnMonto
				ELSE PD.fnMonto
			END,
		fnPorcentaje = CASE 
				WHEN pdd.fnPorcentaje IS NOT NULL THEN pdd.fnPorcentaje
				ELSE PD.fnPorcentaje
			END
FROM	dbo.PROPromocion pp WITH(NOLOCK)
	INNER JOIN dbo.PROElemento pe WITH(NOLOCK)
		ON pe.fiPromocionId = pp.fiPromocionId
	INNER JOIN dbo.PRODescuento pd WITH(NOLOCK)
		ON pd.fiPromocionId = PP.fiPromocionId
	LEFT OUTER JOIN dbo.PRODetalleDescuento pdd WITH(NOLOCK)
		ON pp.fiPromocionId = pdd.fiPromocionId
			AND pe.fiElementoId = pdd.fiElementoId
	LEFT OUTER JOIN (	SELECT	fcFolio,
							CASE 
								WHEN fiEstatus IN(2,3) THEN 0
								ELSE fiEstatus
							 END AS fiEstatus
						FROM dbo.Venta  WITH(NOLOCK)
					)v
		ON pe.fcValor = v.fcFolio
WHERE	pp.fiTipoPromocionId = 1
	AND GETDATE() BETWEEN fdVigenciaInicio AND fdVigenciaFin
	AND fcValor = @pcValor
		GROUP BY pp.fiPromocionId,
		pp.fcDescripcion,
		pp.fiTipoPromocionId,		
			CASE 
				WHEN pdd.fnMonto IS NOT NULL THEN pdd.fnMonto
				ELSE PD.fnMonto
			END,
			CASE 
				WHEN pdd.fnPorcentaje IS NOT NULL THEN pdd.fnPorcentaje
				ELSE PD.fnPorcentaje
			END
	HAVING
	SUM(ISNULL(v.fiEstatus,0)) < 1

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  Table [dbo].[TCTETiendas]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCTETiendas](
	[fiNoTienda] [int] NOT NULL,
	[fiPaisID] [int] NOT NULL,
	[fiCanalId] [int] NOT NULL,
	[fcDescripcion] [varchar](100) NOT NULL,
	[fiActivo] [int] NOT NULL,
	[fiDistritoID] [int] NOT NULL,
	[fiJefeVtaID] [int] NOT NULL,
	[fiPlazaID] [int] NOT NULL,
	[flEsTiendaIus] [bit] NOT NULL,
	[flEsTiendaUne] [bit] NOT NULL,
	[flEsTiendaMovi] [bit] NOT NULL,
	[flEsTiendaTelcel] [bit] NOT NULL,
	[flEsTiendaOUI] [bit] NOT NULL,
 CONSTRAINT [PKTCTETiendas] PRIMARY KEY NONCLUSTERED 
(
	[fiNoTienda] ASC,
	[fiPaisID] ASC,
	[fiCanalId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATETotalPromotoresTienda]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TATETotalPromotoresTienda](
	[fiNoTienda] [int] NOT NULL,
	[fiPaisID] [int] NOT NULL,
	[fiCanalId] [int] NOT NULL,
	[fiCompaniaId] [int] NOT NULL,
	[fiTotalPromotores] [int] NOT NULL,
	[fiTiendaCompania] [bit] NOT NULL,
 CONSTRAINT [PKTATETotalPromotoresTienda] PRIMARY KEY CLUSTERED 
(
	[fiNoTienda] ASC,
	[fiPaisID] ASC,
	[fiCanalId] ASC,
	[fiCompaniaId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
/****** Object:  StoredProcedure [dbo].[spConPromocionesCliente]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: MARIO ARTURO ZAVALETA BERMÚDEZ
 Fecha  :     AGOSTO 2018
 Descripción: CONSULTA LAS PROMOCIONES CON EL CLIENTE
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  

CREATE PROCEDURE [dbo].[spConPromocionesCliente]
(
	@pcValor VARCHAR(20),
	@pcCliente VARCHAR(50)
)
AS
SET NOCOUNT ON
	DECLARE @viElementoId INT, @viPromocionId INT, @viClienteId INT

	DECLARE @vtPromociones TABLE (fiPromocionId INT, fiTipoPromocion INT, fcDescripcion VARCHAR(80), fnMonto DECIMAL(12,2), fnPorcentaje DECIMAL(12, 2))
	
	SELECT @viElementoId = fiElementoId, @viPromocionId = fiPromocionId FROM dbo.PROElemento WITH(NOLOCK) WHERE fcValor = @pcValor
	select @viClienteId = fiClienteId FROM dbo.ProCliente WITH(NOLOCK) WHERE fcClienteUnico = @pcCliente
	
	IF EXISTS (select fiPromocionId from dbo.ProElementoCliente with(nolock) where fiElementoId = @viElementoId AND fiPromocionId = @viPromocionId AND fiClienteId = @viClienteId)
	BEGIN
		INSERT INTO @vtPromociones (fiPromocionId, fcDescripcion, fiTipoPromocion, fnMonto, fnPorcentaje)
		EXEC dbo.spConPromosDescuento @pcValor = @pcValor
	END

	SELECT fiPromocionId, fiTipoPromocion, fcDescripcion, fnMonto, fnPorcentaje FROM @vtPromociones

SET NOCOUNT OFF    
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConPromociones]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************    
 Responsable: ALEXIS MERCADO PÉREZ
 Fecha  :     09 - ABRIL - 2018
 Descripción: CONSULTA LAS PROMOCIONES
 Aplicacion:  SERVICIO DE BONO DE DESCUENTO OUI
*****************************************************************************************/  

CREATE PROCEDURE [dbo].[spConPromociones]
(
	@pcValor VARCHAR(20)
)
AS
SET NOCOUNT ON

	DECLARE @vtPromociones TABLE (fiPromocionId INT, fiTipoPromocion INT, fcDescripcion VARCHAR(80), fnMonto DECIMAL(12,2), fnPorcentaje DECIMAL(12, 2))

	INSERT INTO @vtPromociones (fiPromocionId, fcDescripcion, fiTipoPromocion, fnMonto, fnPorcentaje)
	EXEC dbo.spConPromosDescuento @pcValor = @pcValor

	SELECT fiPromocionId, fiTipoPromocion, fcDescripcion, fnMonto, fnPorcentaje FROM @vtPromociones

SET NOCOUNT OFF    
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConTiendas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Devuelve las tiendas por plaza, jefe de ventas y distrito
	--------------------------------------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel Lopez Rosales
	Fecha: agosto de 2019
***********************************************************************************/
CREATE PROCEDURE [dbo].[spConTiendas] 
(
	@piPaisId			INT,
	@piPlazaID			INT,
	@piJefeVtaID		INT,
	@piDistritoID		INT
)
AS

SELECT	t.fiNoTienda, 
		t.fcDescripcion, 
		t.fiActivo, 
		t.fiCanalId,
		t.fiDistritoID, 
		t.fiJefeVtaID, 
		t.fiPaisID,
		t.fiPlazaID,
		t.flEsTiendaIus,
		t.flEsTiendaMovi,
		t.flEsTiendaOUI,
		t.flEsTiendaTelcel,
		t.flEsTiendaUne,
		fcPlazaDesc = p.fcDescripcion,
		fcJefeVentasDesc = j.fcDescripcion,
		fcDistritoDesc = d.fcDescripcion
FROM	dbo.TCTETiendas t WITH(NOLOCK)
	INNER JOIN dbo.TCTEPlazas p WITH(NOLOCK)
		ON p.fiPlazaID = t.fiPlazaID
	INNER JOIN dbo.TCTEJefeVentas j WITH(NOLOCK)
		ON j.fiPlazaID = t.fiPlazaID 
			AND j.fiJefeVtaID = t.fiJefeVtaID
	INNER JOIN dbo.TCTEDistritales d WITH(NOLOCK)
		ON d.fiDistritoId = t.fiDistritoID
			AND d.fiJefeVtaID = t.fiJefeVtaID
			AND d.fiPlazaID = t.fiPlazaID
			AND d.fiPaisID = t.fiPaisID
WHERE	t.fiPlazaID		= @piPlazaID
	AND t.fiJefeVtaID	= @piJefeVtaID
	AND t.fiDistritoID	= @piDistritoID
	AND t.fiPaisID		= @piPaisId
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaTiendasXNegocio]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************
   Descripción: Agrega negocio OUI
   Fecha: abril de 2017
   Responsable: Angel Israel López Rosales
**********************************************************************************/
CREATE FUNCTION [dbo].[FNTELSTablaTiendasXNegocio](
 @piCompaniaId int
 )
RETURNS @ValueTable TABLE ([fiNoTienda] INT, [fiPaisID] INT, [fiCanalId] INT)
BEGIN
   INSERT INTO @ValueTable ([fiNoTienda], [fiPaisID], [fiCanalId])
   SELECT fiNoTienda, fiPaisID, fiCanalId 
   FROM   dbo.TCTETiendas WITH(NOLOCK) 
   WHERE  fiCanalID in (1,143,17)  
      AND fiActivo = 1 
      AND (
           (@piCompaniaId = 11 and flEsTiendaUne = 1)
           OR (@piCompaniaId = 30 and flEsTiendaTelcel = 1)
           OR (@piCompaniaId = 47 and flEsTiendaIus = 1)
           OR (@piCompaniaId = 31 and flEsTiendaMovi = 1)
		   OR (@piCompaniaId = 107 and flEsTiendaOUI = 1)
           OR (@piCompaniaId = 78 and (flEsTiendaUne = 1 OR flEsTiendaIus = 1))
           )
   RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[PATELIPromoVendedorHist]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************************************************
   Descripción: Inserta en la bitácora las modificaciones al promovendedor
	-------------------------------------------------------------------
	Última modificación: Cambia insert para evitar que se cambien los registros históricos
	Responsable: Angel Israel López Rosales
	Fecha: Marzo de 2020
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELIPromoVendedorHist]
	@piPromovendedorId	INT,
	@piNoTienda			SMALLINT,
	@piTipoVendedorId	SMALLINT,
	@pcNombre           CHAR(40),
	@pcAPaterno         CHAR(40),
	@pcAMaterno         CHAR(40),
	@pcRFC              CHAR(20),
	@pcFechNacimiento   CHAR(10),
	@pcTelefono         CHAR(10),
	@piCompaniaId       INT,
	@pcHorario          CHAR(8),
	@piDiaDescanso      TINYINT,
	@piStatus			TINYINT,
	@pcJefeInme         CHAR(60),
	@pdFecRegistro		DATETIME,
	@pcEmpNo			VARCHAR(10),
	@piTipoMovimiento	SMALLINT,
	@pcEmail            CHAR(60) = NULL,
	@piNoPromo          CHAR(10) = NULL,
	@pcTelefonoCel      CHAR(10) = NULL,
	@pcTelefonoRec      CHAR(10) = NULL,
	@piPuesto			INT = NULL,
	@piPaisID           INT = NULL,
	@piCanalId			INT = NULL
   ,@pcCorreoModifica   VARCHAR(255) = NULL /*Correo de la persona que modifica*/
   ,@pcIPModifica       VARCHAR(50)  = NULL, /*IP de la maquina de la persona que modifica*/
   @pcCURP				VARCHAR(18) = NULL /*CURP DEL EMPLEADO*/
AS
SET NOCOUNT ON
DECLARE
   @viConsec		INT,
   @vcMensaje		VARCHAR(200),
   @viPaisID		INT,
   @viCanalId		INT,
   @vdFechaActual	DATETIME

BEGIN TRY
	SELECT @viConsec = fiConsec FROM TATEPromovendedorHist WHERE fiPromovendedorId = @piPromovendedorId
	SELECT @viConsec = ISNULL(@viConsec, 0) + 1, @vdFechaActual = GETDATE();

	IF(@piPaisID IS NULL OR @piCanalId IS NULL)
	BEGIN
		SELECT @viPaisID = fiPaisID, @viCanalId = fiCanalId FROM dbo.TCTETiendas WITH(NOLOCK) WHERE fiNoTienda=@piNoTienda
	END
	ELSE
	BEGIN
		SELECT @viPaisID=@piPaisID,@viCanalId=@piCanalId
	END;

	WITH TBLHISTORICO(fiPromovendedorId,fiConsec,fiNoTienda,fiTipoVendedorId,fcNombre,fcAPaterno,fcAMaterno,fcRFC,fcFechNacimiento,fcTelefono,fcTelefonoCel,fcTelefonoRec,fiCompaniaId,fcHorario,fiDiaDescanso,fiStatus,fcJefeInme,fcEmail,fiNoPromo,fdFecRegistro,fdCambio,fcEmpNo,fiMovimientoId,fiPuestoId,fiPaisID,fiCanalId,fcCorreoModifica,fcIPModifica,fcCURP)
	AS
	(
		SELECT 
			@piPromovendedorId,
			@viConsec,
			@piNoTienda,
			@piTipoVendedorId,
			LTRIM(RTRIM(@pcNombre)),
			LTRIM(RTRIM(@pcAPaterno)),
			LTRIM(RTRIM(@pcAMaterno)),
			@pcRFC,
			@pcFechNacimiento,
			@pcTelefono,
			@pcTelefonoCel,
			@pcTelefonoRec,				
			@piCompaniaId,
			@pcHorario,
			@piDiaDescanso,
			@piStatus,
			@pcJefeInme,
			@pcEmail,
			@piNoPromo,
			@pdFecRegistro,
			@vdFechaActual,
			@pcEmpNo,
			@piTipoMovimiento,
			@piPuesto,
			@viPaisID,
			@viCanalId,
			@pcCorreoModifica,
			@pcIPModifica,
			@pcCURP
	)
	INSERT INTO dbo.TATEPromovendedorHist (fiPromovendedorId,fiConsec,fiNoTienda,fiTipoVendedorId,fcNombre,fcAPaterno,fcAMaterno,fcRFC,fcFechNacimiento,fcTelefono,fcTelefonoCel,fcTelefonoRec,fiCompaniaId,fcHorario,fiDiaDescanso,fiStatus,fcJefeInme,fcEmail,fiNoPromo,fdFecRegistro,fdCambio,fcEmpNo,fiMovimientoId,fiPuestoId,fiPaisID,fiCanalId,fcCorreoModifica,fcIPModifica,fcCURP)
	SELECT	fiPromovendedorId,fiConsec,fiNoTienda,fiTipoVendedorId,fcNombre,fcAPaterno,fcAMaterno,fcRFC,fcFechNacimiento,fcTelefono,fcTelefonoCel,fcTelefonoRec,fiCompaniaId,fcHorario,fiDiaDescanso,fiStatus,fcJefeInme,fcEmail,fiNoPromo,fdFecRegistro,fdCambio,fcEmpNo,fiMovimientoId,fiPuestoId,fiPaisID,fiCanalId,fcCorreoModifica,fcIPModifica,fcCURP 
	FROM	TBLHISTORICO H
END TRY
BEGIN CATCH
   SELECT @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELIAltaTiendas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELIAltaTiendas] 
    @piNoTienda       INT          /*Número ecónomico de la tienda*/
   ,@piPaisId         INT          /*Id del pais*/
   ,@piCanalId        INT          /*Canal de la tienda*/
   ,@pcNombreTienda   VARCHAR(100) /*Nombre de la tienda*/
   ,@piActivo         INT          /*Bandera que indica si la tienda esta activa*/
   ,@piDistritoId     INT          /*Id del distrito asociado a la tienda*/
   ,@piJefeVtaID      INT          /*Id de jefe de ventas*/
   ,@piPlazaID        INT          /*Id de la plaza*/
   ,@plEsTiendaIus    BIT=0        /*Bandera para indicar que es una tienda donde se vende Iusacell*/
   ,@plEsTiendaUne    BIT=0        /*Bandera para indicar que es una tienda donde se vende Unefon*/
   ,@plEsTiendaMovi   BIT=0        /*Bandera para indicar que es una tienda donde se vende Movistar*/
   ,@plEsTiendaTelcel BIT=0        /*Bandera para indicar que es una tienda donde se vende Telcel*/
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(255)
SET XACT_ABORT ON
BEGIN TRY
   IF EXISTS (SELECT fiNoTienda FROM dbo.TCTETiendas WITH(NOLOCK) WHERE fiNoTienda=@piNoTienda)
   BEGIN
      SET @vcError='La tienda ' + CAST(@piNoTienda AS VARCHAR(10)) + ' ya se encuentra dada de alta en el catálogo'
      RAISERROR(@vcError,18,1)
   END
   IF NOT EXISTS (SELECT fiPaisID FROM dbo.TCTEPaisCanal WITH(NOLOCK) WHERE fiPaisID=@piPaisId AND fiCanalId=@piCanalId)
   BEGIN
      SET @vcError='La combinación país=' + CAST(@piPaisId AS VARCHAR(10)) + ', canal=' + CAST(@piCanalId AS VARCHAR(10)) + ' no existe en el catálogo PaisCanal'
      RAISERROR(@vcError,18,1)
   END
   IF NOT EXISTS (SELECT fiPaisID FROM dbo.TCTEDistritales WITH(NOLOCK) WHERE fiPaisID=@piPaisId AND fiPlazaID=@piPlazaID AND fiJefeVtaID=@piJefeVtaID AND fiDistritoId=@piDistritoId)
   BEGIN
      SET @vcError='No existe el distrito ' + CAST(@piDistritoId AS VARCHAR(10)) + ' en el catálogo de distritales, verifique que tenga un pais, plaza y jefe de ventas existentes.'
      RAISERROR(@vcError,18,1)
   END    
   BEGIN TRANSACTION
      INSERT INTO dbo.TCTETiendas (fiNoTienda,fiPaisID,fiCanalId,fcDescripcion,fiActivo,fiDistritoID,fiJefeVtaID,fiPlazaID,flEsTiendaIus,flEsTiendaUne,flEsTiendaMovi,flEsTiendaTelcel)
      VALUES (@piNoTienda,@piPaisId,@piCanalId,@pcNombreTienda,@piActivo,@piDistritoId,@piJefeVtaID,@piPlazaID,@plEsTiendaIus,@plEsTiendaUne,@plEsTiendaMovi,@plEsTiendaTelcel)
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   IF(LTRIM(RTRIM(ERROR_PROCEDURE()))<>'')
      SELECT @vcError=ERROR_MESSAGE() + ' (' + ERROR_PROCEDURE() + ')'
   ELSE
      SELECT @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUTiendas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELUTiendas] 
    @piNoTienda       INT          /*Número ecónomico de la tienda*/
   ,@piPaisId         INT          /*Id del pais*/
   ,@piCanalId        INT          /*Canal de la tienda*/
   ,@pcNombreTienda   VARCHAR(100) /*Nombre de la tienda*/
   ,@piActivo         INT          /*Bandera que indica si la tienda esta activa*/
   ,@piDistritoId     INT          /*Id del distrito asociado a la tienda*/
   ,@piJefeVtaID      INT          /*Id de jefe de ventas*/
   ,@piPlazaID        INT          /*Id de la plaza*/
   ,@plEsTiendaIus    BIT=0        /*Bandera para indicar que es una tienda donde se vende Iusacell*/
   ,@plEsTiendaUne    BIT=0        /*Bandera para indicar que es una tienda donde se vende Unefon*/
   ,@plEsTiendaMovi   BIT=0        /*Bandera para indicar que es una tienda donde se vende Movistar*/
   ,@plEsTiendaTelcel BIT=0        /*Bandera para indicar que es una tienda donde se vende Telcel*/
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(255)
SET XACT_ABORT ON
BEGIN TRY
   IF NOT EXISTS (SELECT fiNoTienda FROM dbo.TCTETiendas WITH(NOLOCK) WHERE fiNoTienda=@piNoTienda)
   BEGIN
      SET @vcError='La tienda ' + CAST(@piNoTienda AS VARCHAR(10)) + ' no existe.'
      RAISERROR(@vcError,18,1)
   END
   IF NOT EXISTS (SELECT fiPaisID FROM dbo.TCTEPaisCanal WITH(NOLOCK) WHERE fiPaisID=@piPaisId AND fiCanalId=@piCanalId)
   BEGIN
      SET @vcError='La combinación país=' + CAST(@piPaisId AS VARCHAR(10)) + ', canal=' + CAST(@piCanalId AS VARCHAR(10)) + ' no existe en el catálogo PaisCanal'
      RAISERROR(@vcError,18,1)
   END
   IF NOT EXISTS (SELECT fiPaisID FROM dbo.TCTEDistritales WITH(NOLOCK) WHERE fiPaisID=@piPaisId AND fiPlazaID=@piPlazaID AND fiJefeVtaID=@piJefeVtaID AND fiDistritoId=@piDistritoId)
   BEGIN
      SET @vcError='No existe el distrito ' + CAST(@piDistritoId AS VARCHAR(10)) + ' en el catálogo de distritales, verifique que tenga un pais, plaza y jefe de ventas existentes.'
      RAISERROR(@vcError,18,1)
   END    
   BEGIN TRANSACTION
      UPDATE dbo.TCTETiendas
      SET    fiPaisID         = @piPaisId,
             fiCanalId        = @piCanalId,
             fcDescripcion    = @pcNombreTienda,
             fiActivo         = @piActivo,
             fiDistritoID     = @piDistritoId,
             fiJefeVtaID      = @piJefeVtaID,
             fiPlazaID        = @piPlazaID,
             flEsTiendaIus    = @plEsTiendaIus,
             flEsTiendaUne    = @plEsTiendaUne,
             flEsTiendaMovi   = @plEsTiendaMovi,
             flEsTiendaTelcel = @plEsTiendaTelcel
      WHERE fiNoTienda=@piNoTienda
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   IF(LTRIM(RTRIM(ERROR_PROCEDURE()))<>'')
      SELECT @vcError=ERROR_MESSAGE() + ' (' + ERROR_PROCEDURE() + ')'
   ELSE
      SELECT @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConAsistenciaHist]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**************************************************************************************
	Descripción: Inserta asistencia del día
**************************************************************************************/
CREATE PROCEDURE [dbo].[spConAsistenciaHist]
(
	@pdFechaInicial	DATETIME,	/*Fecha inicial*/
	@pdFechaFinal	DATETIME	/*Fecha final*/
)
AS
SET NOCOUNT ON
SELECT	NumPromovendedor, 
		Nombre = LTRIM(RTRIM(Nombre)),
		ApellidoPaterno = LTRIM(RTRIM(ApellidoPaterno)), 
		ApellidoMaterno = LTRIM(RTRIM(ApellidoMaterno)), 
		Fecha,  
		HoraEntrada = ISNULL(HoraEntrada, ''), 
		HoraSalidaComer = ISNULL(HoraSalidaComer, ''), 
		RegresoComer = ISNULL(RegresoComer, ''), 
		Salida = ISNULL(Salida, ''), 
		MinutosEntradaSalida = ISNULL(MinutosEntradaSalida, 0), 
		MinutosComida = ISNULL(MinutosComida, 0), 
		NombreEmpresa = LTRIM(RTRIM(NombreEmpresa)), 
		Puesto = LTRIM(RTRIM(Puesto)),
		NumTienda, 
		NombreTienda = LTRIM(RTRIM(ISNULL(NombreTienda, 'SIN DESCRIPCIÓN'))),
		Zona = ISNULL(j.fcDescripcion, 'SIN DESCRIPCIÓN'),
		Región = ISNULL(d.fcDescripcion, 'SIN DESCRIPCIÓN'),
		JefeInmediato
FROM	[TATEAsistenciasHistorico] h WITH(NOLOCK) 
	LEFT OUTER JOIN dbo.TCTETiendas t
		ON t.fiNoTienda = h.NumTienda
	LEFT OUTER JOIN dbo.TCTEJefeVentas j
		ON j.fiJefeVtaID = t.fiJefeVtaID
			AND j.fiPaisID = t.fiPaisID
			AND j.fiPlazaID = t.fiPlazaID
	LEFT OUTER JOIN dbo.TCTEDistritales d
		ON d.fiPlazaID = j.fiPlazaID
			AND d.fiPaisID = j.fiPaisID
			AND t.fiDistritoID = d.fiDistritoId
WHERE	FECHA BETWEEN @pdFechaInicial AND @pdFechaFinal
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELITCTETiendas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: marzo 2017
	Descripción: Creación de objeto para alta de tiendas.
*********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELITCTETiendas]
    @piNoTienda			INT				/*Número ecónomico de la tienda*/
   ,@piPaisId			INT				/*Id del pais*/
   ,@piCanalId			INT				/*Canal de la tienda*/
   ,@pcNombreTienda		VARCHAR(100)	/*Nombre de la tienda*/
   ,@piActivo			INT				/*Bandera que indica si la tienda esta activa*/
   ,@piDistritoId		INT				/*Id del distrito asociado a la tienda*/
   ,@piJefeVtaID		INT				/*Id de jefe de ventas*/
   ,@piPlazaID			INT				/*Id de la plaza*/
   ,@plEsTiendaIus		BIT = 0			/*Bandera para indicar que es una tienda donde se vende Iusacell*/
   ,@plEsTiendaUne		BIT = 0			/*Bandera para indicar que es una tienda donde se vende Unefon*/
   ,@plEsTiendaMovi		BIT = 0			/*Bandera para indicar que es una tienda donde se vende Movistar*/
   ,@plEsTiendaTelcel	BIT = 0			/*Bandera para indicar que es una tienda donde se vende Telcel*/
   ,@plEsTiendaOUI		BIT = 0			/*Bandera para indicar que es una tienda donde se vende Telcel*/
   ,@piTipoInsercion	TINYINT = 1		/*Tipo de inserción. 0 = Borra, 1 = Inserta - actualiza*/
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(255)
SET XACT_ABORT ON
BEGIN TRY
	IF (@piTipoInsercion NOT IN (0, 1))
		RETURN 0
	IF NOT EXISTS (SELECT fiPaisID FROM dbo.TCTEPaisCanal WITH(NOLOCK) WHERE fiPaisID=@piPaisId AND fiCanalId=@piCanalId)
	BEGIN
		SET @vcError='La combinación país=' + CAST(@piPaisId AS VARCHAR(10)) + ', canal=' + CAST(@piCanalId AS VARCHAR(10)) + ' no existe en el catálogo PaisCanal'
		RAISERROR(@vcError,18,1)
	END
	IF NOT EXISTS (SELECT fiPaisID FROM dbo.TCTEDistritales WITH(NOLOCK) WHERE fiPaisID=@piPaisId AND fiPlazaID=@piPlazaID AND fiJefeVtaID=@piJefeVtaID AND fiDistritoId=@piDistritoId)
	BEGIN
		SET @vcError='No existe el distrito ' + CAST(@piDistritoId AS VARCHAR(10)) + ' en el catálogo de distritales, verifique que tenga un pais, plaza y jefe de ventas existentes.'
		RAISERROR(@vcError,18,1)
	END    
	BEGIN TRANSACTION
		IF (@piTipoInsercion = 0)
		BEGIN
			IF EXISTS (SELECT fiNoTienda FROM dbo.TCTETiendas WITH(NOLOCK) WHERE fiNoTienda = @piNoTienda)
			BEGIN
				DELETE dbo.TCTETiendas WHERE fiNoTienda = @piNoTienda
			END
		END
		ELSE IF (@piTipoInsercion = 1)
		BEGIN
			IF EXISTS (SELECT fiNoTienda FROM dbo.TCTETiendas WITH(NOLOCK) WHERE fiNoTienda = @piNoTienda)
			BEGIN
				UPDATE	dbo.TCTETiendas 
				SET		fiPaisID			= @piPaisId, 
						fiCanalId			= @piCanalId, 
						fcDescripcion		= @pcNombreTienda, 
						fiActivo			= @piActivo, 
						fiDistritoID		= @piDistritoId, 
						fiJefeVtaID			= @piJefeVtaID, 
						fiPlazaID			= @piPlazaID, 
						flEsTiendaIus		= @plEsTiendaIus, 
						flEsTiendaUne		= @plEsTiendaUne, 
						flEsTiendaMovi		= @plEsTiendaMovi, 
						flEsTiendaTelcel	= @plEsTiendaTelcel,
						flEsTiendaOUI		= @plEsTiendaOUI
				WHERE	fiNoTienda = @piNoTienda
			END
			ELSE
			BEGIN
				INSERT INTO dbo.TCTETiendas (fiNoTienda, fiPaisID, fiCanalId, fcDescripcion, fiActivo, fiDistritoID, fiJefeVtaID, fiPlazaID, flEsTiendaIus, flEsTiendaUne, flEsTiendaMovi, flEsTiendaTelcel, flEsTiendaOUI)
				VALUES (@piNoTienda, @piPaisId, @piCanalId, @pcNombreTienda, @piActivo, @piDistritoId, @piJefeVtaID, @piPlazaID, @plEsTiendaIus, @plEsTiendaUne, @plEsTiendaMovi, @plEsTiendaTelcel, @plEsTiendaOUI)
			END
		END
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
   IF(LTRIM(RTRIM(ERROR_PROCEDURE()))<>'')
      SELECT @vcError=ERROR_MESSAGE() + ' (' + ERROR_PROCEDURE() + ')'
   ELSE
      SELECT @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSPlazas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSPlazas] 

	@PAIS INT
	
AS
BEGIN

	
	--SELECT fiPlazaId, fcDescripcion, fiPaisID
	--	FROM TCTEPlazas
	--	WHERE (fiPaisID = @PAIS OR @PAIS = 0)
	
	SELECT DISTINCT P.fiPlazaId, P.fcDescripcion, P.fiPaisID
		FROM TCTEPlazas P INNER JOIN TCTETiendas T on
		(P.fiPlazaID = T.fiPlazaID and P.fiPaisID = T.fiPaisID)
		WHERE (P.fiPaisID = @PAIS OR @PAIS = 0)
		  AND T.fiCanalID in (1,143,17)  
		  AND T.fiActivo = 1 	
		
					UNION
		
    SELECT 0 , dbo.FNTELSCadTodos('A'), 0
    
    ORDER BY 1
	
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSObtienePaisPorTienda]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************
   Responsable:Angel Israel López Rosales
   Fecha: Enero del 2012
   Descripción: Devuelve el valor del parametro dado, 
      sirve para saber si esta encendida o no la funcionalidad.
*******************************************************************/
CREATE PROCEDURE [dbo].[PATELSObtienePaisPorTienda]
   @piNoTienda INT   /*Id catalogo*/
AS
SET NOCOUNT ON
SELECT fiPaisID FROM DBO.TCTETiendas WHERE fiNoTienda=@piNoTienda
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSDistritos]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSDistritos] 

	@PAIS INT,
	@PLAZA INT
	
AS
BEGIN

	
	--SELECT fiDistritoId, fcDescripcion, fiPlazaID, fiPaisID
	--	FROM TCTEDistritales
	--	WHERE (fiPaisID = @PAIS OR @PAIS = 0)
	--	  AND (fiPlazaID = @PLAZA OR @PLAZA = 0)
	
	SELECT Distinct D.fiDistritoId, D.fcDescripcion, D.fiPlazaID, D.fiPaisID
		FROM TCTEDistritales D INNER JOIN TCTETiendas T on
		(D.fiDistritoId = T.fiDistritoID and D.fiJefeVtaID = T.fiJefeVtaID and D.fiPlazaID = T.fiPlazaID and D.fiPaisID = T.fiPaisID)
		WHERE (D.fiPaisID = @PAIS OR @PAIS = 0)
		  AND (D.fiPlazaID = @PLAZA OR @PLAZA = 0)
		  AND T.fiCanalID in (1,143,17)  
		  AND T.fiActivo = 1
		
				--	UNION
		
    --SELECT 0 , dbo.FNTELSCadTodos('O'), 0, 0
    
    ORDER BY 1
	
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSTiendas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSTiendas] 

	@PAIS INT,
	@PLAZA INT,
	@DISTRITO INT
	
AS
BEGIN

	
	SELECT fiNoTienda, fcDescripcion, fiDistritoID, fiPlazaID, fiPaisID, fiCanalId
		FROM TCTETiendas
		WHERE (fiPaisID = @PAIS OR @PAIS = 0)
		  AND (fiPlazaID = @PLAZA OR @PLAZA = 0)
		  AND (fiDistritoID = @DISTRITO OR @DISTRITO = 0)
		  AND fiCanalID in (1,143,17)  
		  AND fiActivo = 1
		
				--	UNION
		
    --SELECT 0 , dbo.FNTELSCadTodos('A'), 0, 0, 0, 0
    
    ORDER BY 1
	
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSTiendasXNegocio]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSTiendasXNegocio] 

	@piCompaniaId INT
	
AS
BEGIN

	SELECT T.fiNoTienda, T.fcDescripcion, T.fiDistritoID, T.fiPlazaID, T.fiPaisID, T.fiCanalId
		FROM dbo.FNTELSTablaTiendasXNegocio(@piCompaniaId) TxN
		INNER JOIN TCTETiendas T WITH(NOLOCK)
		ON (TxN.fiNoTienda = T.fiNoTienda AND TxN.fiPaisID = T.fiPaisID AND TxN.fiCanalId = T.fiCanalId)
	ORDER BY 1
	
END
GO
/****** Object:  Table [dbo].[TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEPromovendedor](
	[fiPromovendedorId] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiTipoVendedorId] [smallint] NOT NULL,
	[fcNombre] [char](40) NOT NULL,
	[fcAPaterno] [char](40) NOT NULL,
	[fcAMaterno] [char](40) NOT NULL,
	[fcRFC] [char](20) NOT NULL,
	[fcFechNacimiento] [char](10) NOT NULL,
	[fcTelefono] [char](10) NOT NULL,
	[fcTelefonoCel] [char](10) NULL,
	[fcTelefonoRec] [char](10) NULL,
	[fiCompaniaId] [int] NULL,
	[fcHorario] [char](8) NOT NULL,
	[fiDiaDescanso] [tinyint] NOT NULL,
	[fiStatus] [tinyint] NOT NULL,
	[fcJefeInme] [char](60) NOT NULL,
	[fcEmail] [char](60) NULL,
	[fiNoPromo] [char](10) NULL,
	[fdFecRegistro] [datetime] NOT NULL,
	[fdUltimoCambio] [datetime] NULL,
	[fiPuestoId] [int] NULL,
	[fiPaisID] [int] NULL,
	[fiCanalId] [int] NULL,
	[flActualiza] [bit] NOT NULL,
	[flHuellaValida] [bit] NOT NULL,
	[fcCURP] [varchar](18) NULL,
 CONSTRAINT [PKTATEPromovendedor] PRIMARY KEY CLUSTERED 
(
	[fiPromovendedorId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATESupervisor]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TATESupervisor](
	[fiPromovendedorId] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiPaisID] [int] NOT NULL,
	[fiCanalId] [int] NOT NULL,
 CONSTRAINT [pkTATESupervisor] PRIMARY KEY CLUSTERED 
(
	[fiPromovendedorId] ASC,
	[fiNoTienda] ASC,
	[fiPaisID] ASC,
	[fiCanalId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[TATEBajaPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TATEBajaPromovendedor](
	[fiIdBajaPromo] [int] IDENTITY(1,1) NOT NULL,
	[fiPromovendedorId] [int] NOT NULL,
	[fdFecBaja] [datetime] NOT NULL,
	[fiMotivoId] [smallint] NOT NULL,
	[fcMotivoDesc] [varchar](200) NULL,
 CONSTRAINT [PKTATEBajaPromovendedor] PRIMARY KEY CLUSTERED 
(
	[fiIdBajaPromo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TATEPromotoresTienda]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TATEPromotoresTienda](
	[fiPromovendedorId] [int] NOT NULL,
	[fiNoTienda] [int] NOT NULL,
	[fiPaisID] [int] NOT NULL,
	[fiCanalId] [int] NOT NULL,
	[fiCompaniaId] [int] NOT NULL,
 CONSTRAINT [PKTATEPromotoresTienda] PRIMARY KEY CLUSTERED 
(
	[fiPromovendedorId] ASC,
	[fiNoTienda] ASC,
	[fiPaisID] ASC,
	[fiCanalId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[TATEJerarquia]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TATEJerarquia](
	[fiPadreID] [int] NOT NULL,
	[fiHijoID] [int] NOT NULL,
 CONSTRAINT [pkTATEJerarquia] PRIMARY KEY CLUSTERED 
(
	[fiPadreID] ASC,
	[fiHijoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [SECONDARY]
) ON [SECONDARY]
GO
/****** Object:  Table [dbo].[TATEControlAsistencia]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TATEControlAsistencia](
	[fiPromovendedorId] [int] NOT NULL,
	[fiAsistenciaId] [smallint] NOT NULL,
	[fdFecha] [datetime] NOT NULL,
	[fiNoTienda] [smallint] NULL,
	[fiMinutos] [int] NULL,
	[fiEstatus] [smallint] NULL
) ON [SECONDARY]
GO
/****** Object:  StoredProcedure [dbo].[spUpdBajaHistPendiente]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************************************************
	Descripción: Elimina duplicados con estatus 1
	-------------------------------------------------------------------
	Última modificación: Creación de objetos
	Responsable: Angel Israel López Rosales
	Fecha: Marzo de 2020
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[spUpdBajaHistPendiente]
AS
WITH TBLPROMOTORES(fiPromovendedorId)
AS
(
	SELECT	fiPromovendedorId
	FROM	dbo.TATEPromovendedor T WITH(NOLOCK)
	WHERE	T.fiStatus = 2
),
TBLHISTORICOMAX(fiPromovendedorId, fiConsec)
AS
(
	SELECT	H.fiPromovendedorId, fiConsec = MAX(H.fiConsec)
	FROM	dbo.TATEPromovendedorHist H
	GROUP BY H.fiPromovendedorId
),
TBLHISTORICO(fiPromovendedorId,fiConsec,fiNoTienda,fiTipoVendedorId,fcNombre,fcAPaterno,fcAMaterno,fcRFC,fcFechNacimiento,fcTelefono,fcTelefonoCel,fcTelefonoRec,fiCompaniaId,fcHorario,fiDiaDescanso,fiStatus,fcJefeInme,fcEmail,fiNoPromo,fdFecRegistro,fdCambio,fcEmpNo,fiMovimientoId,fiPuestoId,fiPaisID,fiCanalId,fcCorreoModifica,fcIPModifica,fcCURP)
AS
(
	SELECT	fiPromovendedorId,fiConsec,fiNoTienda,fiTipoVendedorId,fcNombre,fcAPaterno,fcAMaterno,fcRFC,fcFechNacimiento,fcTelefono,fcTelefonoCel,fcTelefonoRec,fiCompaniaId,fcHorario,fiDiaDescanso,fiStatus,fcJefeInme,fcEmail,fiNoPromo,fdFecRegistro,fdCambio,fcEmpNo,fiMovimientoId,fiPuestoId,fiPaisID,fiCanalId,fcCorreoModifica,fcIPModifica,fcCURP 
	FROM	dbo.TATEPromovendedorHist 
),
TBLPARAINSERTAR(fiPromovendedorId,fiConsec,fiNoTienda,fiTipoVendedorId,fcNombre,fcAPaterno,fcAMaterno,fcRFC,fcFechNacimiento,fcTelefono,fcTelefonoCel,fcTelefonoRec,fiCompaniaId,fcHorario,fiDiaDescanso,fiStatus,fcJefeInme,fcEmail,fiNoPromo,fdFecRegistro,fdCambio,fcEmpNo,fiMovimientoId,fiPuestoId,fiPaisID,fiCanalId,fcCorreoModifica,fcIPModifica,fcCURP)
AS
(
	SELECT	H.fiPromovendedorId,
			M.fiConsec + 1,
			fiNoTienda,
			fiTipoVendedorId,
			fcNombre,
			fcAPaterno,
			fcAMaterno,
			fcRFC,
			fcFechNacimiento,
			fcTelefono,
			fcTelefonoCel,
			fcTelefonoRec,
			fiCompaniaId,
			fcHorario,
			fiDiaDescanso,
			fiStatus = 2,
			fcJefeInme,
			fcEmail,
			fiNoPromo,
			fdFecRegistro,
			fdCambio = GETDATE(),
			fcEmpNo = '999990',
			fiMovimientoId = 2,
			fiPuestoId,
			fiPaisID,
			fiCanalId,
			fcCorreoModifica,
			fcIPModifica,
			fcCURP
	FROM	TBLPROMOTORES P
		INNER JOIN TBLHISTORICOMAX M
			ON P.fiPromovendedorId = M.fiPromovendedorId
		INNER JOIN TBLHISTORICO H
			ON H.fiPromovendedorId = M.fiPromovendedorId
				AND H.fiConsec = M.fiConsec
	WHERE H.fiStatus IN (1, 3)
)

INSERT INTO dbo.TATEPromovendedorHist(fiPromovendedorId,fiConsec,fiNoTienda,fiTipoVendedorId,fcNombre,fcAPaterno,fcAMaterno,fcRFC,fcFechNacimiento,fcTelefono,fcTelefonoCel,fcTelefonoRec,fiCompaniaId,fcHorario,fiDiaDescanso,fiStatus,fcJefeInme,fcEmail,fiNoPromo,fdFecRegistro,fdCambio,fcEmpNo,fiMovimientoId,fiPuestoId,fiPaisID,fiCanalId,fcCorreoModifica,fcIPModifica,fcCURP)
SELECT	fiPromovendedorId,fiConsec,fiNoTienda,fiTipoVendedorId,fcNombre,fcAPaterno,fcAMaterno,fcRFC,fcFechNacimiento,fcTelefono,fcTelefonoCel,fcTelefonoRec,fiCompaniaId,fcHorario,fiDiaDescanso,fiStatus,fcJefeInme,fcEmail,fiNoPromo,fdFecRegistro,fdCambio,fcEmpNo,fiMovimientoId,fiPuestoId,fiPaisID,fiCanalId,fcCorreoModifica,fcIPModifica,fcCURP 
FROM	TBLPARAINSERTAR
GO
/****** Object:  StoredProcedure [dbo].[spConSHermanosJerarquia]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Consulta los empleados del puesto del empleado dado
	----------------------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel Lopez Rosales
	Fecha: agosto de 2019	
***********************************************************************************/
CREATE PROCEDURE [dbo].[spConSHermanosJerarquia]
(
	@piEmpleadoId INT
)
AS

WITH tblEmpleadoBaja(PromotorId, PuestoId, CompaniaId)
AS
(
	SELECT	p.fiPromovendedorId, p.fiPuestoId, p.fiCompaniaId 
	FROM	dbo.TATEPromovendedor p WITH(NOLOCK)
	WHERE	p.fiPromovendedorId = @piEmpleadoId
),
tblEmpleadosHermanos(fiPromovendedorId, Nombre, APaterno, AMaterno, PuestoId, CompaniaId)
AS
(
	SELECT fiPromovendedorId, fcNombre, fcAPaterno, fcAMaterno, fiPuestoId, fiCompaniaId
	FROM dbo.TATEPromovendedor WITH(NOLOCK)
)

SELECT	h.fiPromovendedorId, 
		h.CompaniaId,
		h.PuestoId,
		Nombre = LTRIM(RTRIM(h.Nombre)) + ' ' + LTRIM(RTRIM(h.APaterno)) + ' ' + LTRIM(RTRIM(h.AMaterno))
FROM	tblEmpleadoBaja b
	INNER JOIN tblEmpleadosHermanos h
		ON b.CompaniaId = h.CompaniaId
			AND b.PuestoId = h.PuestoId
ORDER BY Nombre
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConPadresPorPuestoEmpresa]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Consulta los padres del puesto del empleado dado
	-------------------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel Lopez Rosales
	Fecha: agosto de 2019
***********************************************************************************/
CREATE PROCEDURE [dbo].[spConPadresPorPuestoEmpresa]
(
	@piPuestoHijo INT, 
	@piCompaniaId INT
)
AS

DECLARE @viPuestoPadre INT

SELECT @viPuestoPadre = 
	CASE @piPuestoHijo
		WHEN 634 THEN 635
		WHEN 633 THEN 634
		WHEN 632 THEN 633
		WHEN 631 THEN 632
		ELSE 0
	END

IF(@viPuestoPadre != 0 AND @viPuestoPadre != 635)
BEGIN
	SELECT	fiPromovendedorId,
			fiNoTienda,
			fiTipoVendedorId,
			fcNombre,
			fcAPaterno,
			fcAMaterno,
			fcRFC,
			fcFechNacimiento,
			fcTelefono,
			fcTelefonoCel,
			fcTelefonoRec,
			fiCompaniaId,
			fcHorario,
			fiDiaDescanso,
			fiStatus,
			fcJefeInme,
			fcEmail,
			fiNoPromo,
			fdFecRegistro,
			fdUltimoCambio,
			fiPuestoId,
			fiPaisID,
			fiCanalId,
			flActualiza,
			flHuellaValida,
			fcCURP
	FROM	dbo.TATEPromovendedor t WITH(NOLOCK) 
	WHERE	fiPuestoId = @viPuestoPadre 
		AND fiCompaniaId = @piCompaniaId
	ORDER BY LTRIM(RTRIM(fcNombre)) + ' ' + LTRIM(RTRIM(fcAPaterno)) + ' ' + LTRIM(RTRIM(fcAMaterno))
END
ELSE IF(@viPuestoPadre = 635)
BEGIN
	SELECT	fiPromovendedorId,
			fiNoTienda,
			fiTipoVendedorId,
			fcNombre,
			fcAPaterno,
			fcAMaterno,
			fcRFC,
			fcFechNacimiento,
			fcTelefono,
			fcTelefonoCel,
			fcTelefonoRec,
			fiCompaniaId,
			fcHorario,
			fiDiaDescanso,
			fiStatus,
			fcJefeInme,
			fcEmail,
			fiNoPromo,
			fdFecRegistro,
			fdUltimoCambio,
			fiPuestoId,
			fiPaisID,
			fiCanalId,
			flActualiza,
			flHuellaValida,
			fcCURP
	FROM	dbo.TATEPromovendedor t WITH(NOLOCK) 
	WHERE	fiPuestoId = @viPuestoPadre
	ORDER BY LTRIM(RTRIM(fcNombre)) + ' ' + LTRIM(RTRIM(fcAPaterno)) + ' ' + LTRIM(RTRIM(fcAMaterno))
END
GO
/****** Object:  StoredProcedure [dbo].[spConEmpleadosPorPuesto]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************
	Descripción: Consulta los empleados por puesto
*******************************************************************/
CREATE PROCEDURE [dbo].[spConEmpleadosPorPuesto]
(
	@piPuestoPadre INT, 
	@piCompaniaId INT
)
AS

DECLARE @viPuestoHijo INT

SELECT @viPuestoHijo = 
	CASE @piPuestoPadre
		WHEN 634 THEN 633
		WHEN 633 THEN 632
		WHEN 632 THEN 631
		ELSE 0
	END
IF(@viPuestoHijo != 0)
BEGIN
	SELECT	fiPromovendedorId,
			fiNoTienda,
			fiTipoVendedorId,
			fcNombre,
			fcAPaterno,
			fcAMaterno,
			fcRFC,
			fcFechNacimiento,
			fcTelefono,
			fcTelefonoCel,
			fcTelefonoRec,
			fiCompaniaId,
			fcHorario,
			fiDiaDescanso,
			fiStatus,
			fcJefeInme,
			fcEmail,
			fiNoPromo,
			fdFecRegistro,
			fdUltimoCambio,
			fiPuestoId,
			fiPaisID,
			fiCanalId,
			flActualiza,
			flHuellaValida,
			fcCURP
	FROM	dbo.TATEPromovendedor t WITH(NOLOCK) 
	WHERE	fiPuestoId = @viPuestoHijo AND fiCompaniaId = @piCompaniaId
END
GO
/****** Object:  StoredProcedure [dbo].[PATELUActualizaEstatus]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************************************
   Reponsable: Angel Israel López Rosales
   Fecha: 26/05/2015
   Descripción: Actualiza el estatus de un promovendedor
*********************************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUActualizaEstatus] 
   @piPromovendedorId INT, 
   @piStatus INT
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(255)
BEGIN TRY 
   BEGIN TRAN updPromo 
      UPDATE DBO.TATEPromovendedor 
      SET fiStatus = @piStatus
      WHERE fiPromovendedorId = @piPromovendedorId
      IF @@ROWCOUNT > 1 
      BEGIN 
         RAISERROR('No se debe actualizar más de un registro', 18, 1) 
      END 
   COMMIT TRAN updPromo 
END TRY 
BEGIN CATCH 
   ROLLBACK TRAN updPromo 
   SET @vcError = 'Sucedió un error al actualizar el estatus del promotor: ' + ERROR_MESSAGE()
   RAISERROR(@vcError, 18, 1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH 
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUPromoVendedor]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************************
   Descripción: Actualiza los datos del promovendedor indicado
   -----------------------------------------------------------------------------------------------
   Última Modificación: Permite cambiar de puesto a empleado de jerarquia
   Fecha Modificación: septiembre 2019
   Modifica: Angel Israel López Rosales
**************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUPromoVendedor]
	@piPromovendedorId	int,
	@piNoTienda			smallint,
	@piTipoVendedorId	smallint,
	@pcNombre           char(40),
	@pcAPaterno         char(40),
	@pcAMaterno         char(40),
	@pcRFC              char(20),
	@pcFechNacimiento   char(10),
	@pcTelefono         char(10),
	@piCompaniaId       INT,
	@pcHorario          char(8),
	@piDiaDescanso      tinyint,
	@pcJefeInme         char(60),
	@piStatus			tinyint,
	@pcEmpNo			char(6),
	@pcEmail            char(60) = null,
	@piNoPromo          char(10) = null,
	@pcTelefonoCel      char(10) = null,
	@pcTelefonoRec      char(10) = null,
	@piPuestoId         INT = 0,
	@pcCURP				VARCHAR(18)	= NULL,
	@pcCorreoModifica	VARCHAR(255)	= NULL,
	@pcIPModifica		VARCHAR(50)	= NULL
AS
SET NOCOUNT ON
DECLARE
   @vcMensaje     		VARCHAR(200),
   @vdFecRegistro		DATETIME,
   @viStatus			TINYINT,
   @viTipoMovimiento	SMALLINT,
   @viPuesto			INT,
   @viPaisId            INT,
   @viCanalId           INT

BEGIN TRY
	IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId)
	BEGIN
		SET @viTipoMovimiento = 3
		IF(@piPuestoId=0)
		BEGIN
			SELECT @viStatus=fiStatus,@viPuesto=fiPuestoId FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId
		END
		ELSE
		BEGIN
			SELECT @viStatus=fiStatus FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId
			SET @viPuesto=@piPuestoId
		END   
		IF @viStatus = 2
		BEGIN
			RAISERROR('EL PROMOVENDEDOR ESTA DADO DE BAJA PERMANENTEMENTE, NO SE PERMITE NINGUN CAMBIO.',18,1)
		END
		IF @viStatus = 0
		BEGIN
			IF @viStatus = @piStatus
			BEGIN
				RAISERROR('EL PROMOVENDEDOR ESTA DADO DE BAJA TEMPORAL, NO SE PERMITE NINGUNA ACTUALIZACION DE SUS DATOS.',18,1)
			END
			ELSE
			BEGIN
				SET @viTipoMovimiento = 4
			END
		END
		IF EXISTS(SELECT fiNoTienda FROM dbo.TCTETiendas WITH(NOLOCK) WHERE fiNoTienda=@piNoTienda)
		BEGIN
			SELECT	@viPaisID	= fiPaisID,
					@viCanalId	= fiCanalId 
			FROM	dbo.TCTETiendas WITH(NOLOCK) 
			WHERE	fiNoTienda=@piNoTienda
		END
		ELSE
		BEGIN
			SET @vcMensaje='No existe la tienda ' + CAST(@piNoTienda AS VARCHAR(10)) + ' en el catálogo de tiendas de la base de datos central. '
			RAISERROR(@vcMensaje,18,1)
		END
		--IF((dbo.fnEsPuestoJerarquia(@piPromovendedorId))=1)
		--BEGIN
		--   SELECT @viPuesto     = fiPuestoId,
		--          @piCompaniaId = fiCompaniaId
		--   FROM   dbo.TATEPromovendedor
		--   WHERE fiPromovendedorId = @piPromovendedorId
		--END
		UPDATE DBO.TATEPromovendedor 
		SET 
			fiNoTienda       = @piNoTienda,
			fiTipoVendedorId = @piTipoVendedorId,
			fcNombre         = LTRIM(RTRIM(@pcNombre)),
			fcAPaterno       = LTRIM(RTRIM(@pcAPaterno)),
			fcAMaterno       = LTRIM(RTRIM(@pcAMaterno)),
			fcRFC            = @pcRFC,
			fcFechNacimiento = @pcFechNacimiento,
			fcTelefono       = @pcTelefono,
			fcTelefonoCel    = @pcTelefonoCel,
			fcTelefonoRec    = @pcTelefonoRec,
			fiCompaniaId     = @piCompaniaId,
			fcHorario        = @pcHorario,
			fiDiaDescanso    = @piDiaDescanso,
			fiStatus		  = @piStatus,
			fcJefeInme       = @pcJefeInme,
			fcEmail          = @pcEmail,
			fiNoPromo        = @piNoPromo,
			fdUltimoCambio   = GETDATE(),
			fiPuestoId       = @viPuesto,
			fiPaisID         = @viPaisID,
			fiCanalId        = @viCanalId,
			fcCURP			  = @pcCURP
		WHERE fiPromovendedorId = @piPromovendedorId      
		-- GRABAMOS LA BITACORA
		SELECT @vdFecRegistro = fdFecRegistro FROM DBO.TATEPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId = @piPromovendedorId

		IF EXISTS(
			SELECT	fiPromovendedorId 
			FROM	dbo.TATEPromovendedorHist WITH (NOLOCK) 
			WHERE	fiPromovendedorId = @piPromovendedorId
				AND fcEmpNo = '10000001'
		) AND @piStatus = 2
		BEGIN
			UPDATE	dbo.TATEPromovendedorHist 
			SET		fcEmpNo				= @pcEmpNo,
					fcCorreoModifica	= @pcCorreoModifica,
					fcIPModifica		= @pcIPModifica
			WHERE	fiPromovendedorId	= @piPromovendedorId
				AND fcEmpNo = '10000001'
		END
		ELSE
		BEGIN
			EXECUTE dbo.PATELIPromoVendedorHist
				@piPromovendedorId  = @piPromovendedorId,
				@piNoTienda         = @piNoTienda,
				@piTipoVendedorId   = @piTipoVendedorId,
				@pcNombre           = @pcNombre,
				@pcAPaterno         = @pcAPaterno,
				@pcAMaterno         = @pcAMaterno,
				@pcRFC              = @pcRFC,
				@pcFechNacimiento   = @pcFechNacimiento,
				@pcTelefono         = @pcTelefono,
				@piCompaniaId       = @piCompaniaId,
				@pcHorario          = @pcHorario,
				@piDiaDescanso      = @piDiaDescanso,
				@piStatus           = @piStatus,
				@pcJefeInme         = @pcJefeInme,
				@pdFecRegistro      = @vdFecRegistro,
				@pcEmpNo            = @pcEmpNo,
				@piTipoMovimiento   = @viTipoMovimiento,
				@pcEmail            = @pcEmail,
				@piNoPromo          = @piNoPromo,
				@pcTelefonoCel      = @pcTelefonoCel,
				@pcTelefonoRec      = @pcTelefonoRec,
				@piPuesto           = @viPuesto,
				@piPaisID           = @viPaisID,
				@piCanalId          = @viCanalId,
				@pcCURP				= @pcCURP
		END
	END
	ELSE
	BEGIN
		RAISERROR('NO EXISTE INFORMACION CON ESTE NUMERO DE PROMOVENDEDOR.',18,1)
	END
END TRY
BEGIN CATCH
   SELECT @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
      
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUHuellaValida]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************************************************
   Descripción: Inserta promovendedor en TATEPromovendedor
   -----------------------------------------------------------------------------------------------
   Última modificación: Agrega campo de captura de huella. Req. drivers nuevos
   Fecha Modificación: julio 2017
   Modifica: ailr
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUHuellaValida] 
	@piPromovendedorId  INT		--Número de promotor
AS
DECLARE @vcError VARCHAR(100)
BEGIN TRY
	UPDATE dbo.TATEPromovendedor SET flHuellaValida = 0	WHERE fiPromovendedorId = @piPromovendedorId
END TRY
BEGIN CATCH
	SET @vcError = 'Error al actualizar bandera de huella válida'
	RAISERROR(@vcError, 18, 1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PATELUPromoVendedorHuella]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Actualiza bandera para indicar que se captura huella
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
***********************************************************************************/
CREATE PROCEDURE [dbo].[PATELUPromoVendedorHuella]
	@piPromovendedorId	INT,
	@pcEmpNo			VARCHAR(10)
AS
SET NOCOUNT ON

DECLARE
	@vcMensaje     		VARCHAR(200),
	@vdFecRegistro		DATETIME,
	@viStatus			TINYINT,
	@viTipoMovimiento	SMALLINT

BEGIN TRY
	UPDATE dbo.TATEPromovendedor SET flHuellaValida = 0 WHERE fiPromovendedorId = @piPromovendedorId
END TRY
BEGIN CATCH
	SET @vcMensaje = ERROR_MESSAGE()
	GOTO ERRORES
END CATCH	

-- REGRESAMOS EL NUMERO DE PROMOVENDEDOR QUE SE GENERO.
SELECT @piPromovendedorId AS fiPromovendedorId

SET NOCOUNT OFF		
RETURN 0
ERRORESTRAN:
	ROLLBACK TRAN
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
ERRORES:
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[PATELUEmpleadoJerarquico]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************************************
   Descripción: Actualiza datos empleado jerarquico
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUEmpleadoJerarquico]
    @piPromovendedorID INT
   ,@pcEmail           VARCHAR(60)
   ,@pcTelefonoCel    char(10) = ''
   ,@pcCorreoModifica VARCHAR(255) = NULL /*Correo de la persona que modifica*/
   ,@pcIPModifica     VARCHAR(50)  = NULL /*IP de la maquina de la persona que modifica*/
   ,@pcEmpNo          VARCHAR(10)   = '999993' /*Número de empleado quué modifica*/
AS
SET NOCOUNT ON

DECLARE @vcMensaje         VARCHAR(255),
        -- VARIABLES DE LA BITACORA
        @viNoTienda        smallint,
        @viTipoVendedorId  smallint,
        @vcNombre          char(40),
        @vcAPaterno        char(40),
        @vcAMaterno        char(40),
        @vcRFC             char(20),
        @vcFechNacimiento  char(10),
        @vcTelefono        char(10),
        @viCompaniaId      INT,
        @vcHorario         char(8),
        @viDiaDescanso     tinyint,
        @viStatus          tinyint,
        @vcJefeInme        char(60),
        @vdFecRegistro     datetime,
        @vcEmail           char(60),
        @viNoPromo         char(10),
        @vcTelefonoCel     char(10) = null,
        @vcTelefonoRec     char(10) = null,
        @viPuesto          INT

BEGIN TRY
   UPDATE P
   SET    P.fcEmail = @pcEmail,
          P.fcTelefonoCel = @pcTelefonoCel
   FROM   dbo.TATEPromovendedor P
   WHERE  fiPromovendedorId=@piPromovendedorID

   -- GRABAMOS LA BITACORA
   SELECT @viNoTienda       = fiNoTienda,
       @viTipoVendedorId = fiTipoVendedorId,
       @vcNombre         = fcNombre,
       @vcAPaterno       = fcAPaterno,
       @vcAMaterno       = fcAMaterno,
       @vcRFC            = fcRFC,
       @vcFechNacimiento = fcFechNacimiento,
       @vcTelefono       = fcTelefono,
       @viCompaniaId     = fiCompaniaId,
       @vcHorario        = fcHorario,
       @viDiaDescanso    = fiDiaDescanso,
       @viStatus         = fiStatus,
       @vcJefeInme       = fcJefeInme,
       @vdFecRegistro    = fdFecRegistro,
       @vcEmail          = fcEmail,
       @viNoPromo        = fiNoPromo,
       @vcTelefonoCel    = fcTelefonoCel,
       @vcTelefonoRec    = fcTelefonoRec,
       @viPuesto         = fiPuestoId
   FROM DBO.TATEPromovendedor WITH(NOLOCK)
   WHERE fiPromovendedorId = @piPromovendedorId
       
   EXECUTE PATELIPromoVendedorHist
     @piPromovendedorId = @piPromovendedorId,
     @piNoTienda        = @viNoTienda,
     @piTipoVendedorId  = @viTipoVendedorId,
     @pcNombre          = @vcNombre,
     @pcAPaterno        = @vcAPaterno,
     @pcAMaterno        = @vcAMaterno,
     @pcRFC             = @vcRFC,
     @pcFechNacimiento  = @vcFechNacimiento,
     @pcTelefono        = @vcTelefono,
     @piCompaniaId      = @viCompaniaId,
     @pcHorario         = @vcHorario,
     @piDiaDescanso     = @viDiaDescanso,
     @piStatus          = @viStatus,
     @pcJefeInme        = @vcJefeInme,
     @pdFecRegistro     = @vdFecRegistro,
     @pcEmpNo           = @pcEmpNo,
     @piTipoMovimiento  = 7,
     @pcEmail           = @vcEmail,
     @piNoPromo         = @viNoPromo,
     @pcTelefonoCel     = @vcTelefonoCel,
     @pcTelefonoRec     = @vcTelefonoRec,
     @piPuesto          = @viPuesto,
     @pcCorreoModifica  = @pcCorreoModifica,
     @pcIPModifica      = @pcIPModifica

END TRY
BEGIN CATCH
   SET @vcMensaje = ERROR_MESSAGE()
   RAISERROR(@vcMensaje, 18, 1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSValidaPromoRH]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************
   Responsable:Angel Israel López Rosales
   Fecha: Enero del 2012
   Descripción: Devuelve el valor del parametro dado, 
      sirve para saber si esta encendida o no la funcionalidad.
*******************************************************************/
CREATE PROCEDURE [dbo].[PATELSValidaPromoRH]
   @piPromovendedorID INT /*Número de parámetro*/
AS
SET NOCOUNT ON
DECLARE @vlResultado BIT
IF EXISTS(SELECT fiPromovendedorId FROM dbo.TATEPromovendedor WHERE fiPromovendedorId=@piPromovendedorID AND fiStatus=1)
BEGIN
   SET @vlResultado=1
END
ELSE
BEGIN
   SET @vlResultado=0
END
SELECT Resultado=@vlResultado
SET NOCOUNT OFF
RETURN @vlResultado
GO
/****** Object:  StoredProcedure [dbo].[PATELSPromoPorTienda]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSPromoPorTienda]
   @piNoTienda INT /*Número ecónomico de tienda*/
AS
SET NOCOUNT ON
SELECT 
   NoEmpleado=fiPromovendedorId, 
   Nombre=LTRIM(RTRIM(fcNombre)) + ' ' + LTRIM(RTRIM(fcAPaterno)) + ' ' + LTRIM(RTRIM(fcAMaterno)),
   Empresa=tc.fcCompaniaDesc,
   FechaIngreso=CONVERT(CHAR,t.fdFecRegistro,103),
   Estatus=tv.fcTipoVendedorDesc,
   Horario=fcHorario,
   DiaDescanso=
   CASE fiDiaDescanso
      WHEN 1 THEN 'Lunes'
      WHEN 2 THEN 'Martes'
      WHEN 3 THEN 'Miércoles'
      WHEN 4 THEN 'Jueves'
      WHEN 5 THEN 'Viernes'
      WHEN 6 THEN 'Sábado'
      WHEN 7 THEN 'Domingo'
   END
FROM TATEPromovendedor t WITH(NOLOCK)
	INNER JOIN TCTECompania tc WITH(NOLOCK) ON t.fiCompaniaId=tc.fiCompaniaId
	INNER JOIN TCTETipoVendedor tv WITH(NOLOCK) ON tv.fiTipoVendedorId=t.fiTipoVendedorId
	INNER JOIN TCTEDetalleCatalogoGenerico DC WITH(NOLOCK) ON (DC.fiItemId = t.fiPuestoId AND DC.fiCatalogoId = 7)
WHERE fiNoTienda=@piNoTienda
	AND fiStatus=1

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSEmpleado]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSEmpleado] 

	@pcEmail VARCHAR(30)
	
AS
BEGIN

SET NOCOUNT ON

	SELECT	P.fiPromovendedorId AS EmpleadoId, 
			RTRIM(fcNombre) + ' ' + RTRIM(fcAPaterno) + ' ' + RTRIM(fcAMaterno) AS Nombre  
	FROM TATEPromovendedor P WITH(NOLOCK)
		WHERE LTRIM(RTRIM(P.fcEmail)) = LTRIM(RTRIM(@pcEmail))
	ORDER BY P.fiPromovendedorId desc
	
SET NOCOUNT OFF		
	
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSHorarioVendedor]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSHorarioVendedor]
	-- Add the parameters for the stored procedure here
	@ID_PROMO_VEND	INT
AS
BEGIN
	SELECT CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) AS HR_ENTRADA,
		   CONVERT(INTEGER, SUBSTRING(fcHorario, 7, 2)) AS HR_SALIDA
	FROM TATEPromovendedor p
		WHERE p.fiPromovendedorId = @ID_PROMO_VEND
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSPromoVendedorHuella]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------------------------------------------------------------------------
---Responsable: CLEMENTE JONATHAN NAVARRETE DIAZ
---Fecha: Julio 2010
---Descripcion Modificacion: Generación del Objeto, se busca el promovendedor por id para actualización de huella
----------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[PATELSPromoVendedorHuella]
	@piPromovendedorId	INT
AS
DECLARE
	@vcMensaje     		VARCHAR(200),
	@vcNombre           char(40),
	@vcAPaterno         char(40),
	@vcAMaterno         char(40),
	@viStatus			tinyint

	IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId =  @piPromovendedorId)
	BEGIN
		-- REGRESAMOS EL NUMERO DE PROMOVENDEDOR QUE SE GENERO.
		SELECT	@vcNombre = fcNombre, 
				@vcAPaterno = fcAPaterno, 
				@vcAMaterno = fcAMaterno,
				@viStatus = fiStatus 
		FROM DBO.TATEPromovendedor WITH (NOLOCK) 
		WHERE fiPromovendedorId =  @piPromovendedorId
		
		IF @viStatus NOT IN  (1,3)
		BEGIN
			SET @vcMensaje = 'ESTE PROMOVENDEDOR NO ESTA ACTIVO.'
			GOTO ERRORES
		END
	END
	ELSE
	BEGIN
		SET @vcMensaje = 'ESTE NUMERO DE PROMOVENDEDOR NO EXISTE.'
		GOTO ERRORES
	END
				
	SELECT	@piPromovendedorId AS fiPromovendedorId,
			@vcNombre AS fcNombre, 
			@vcAPaterno AS fcAPaterno, 
			@vcAMaterno AS fcAMaterno
	
	RETURN 0
ERRORES:
  RAISERROR(@vcMensaje, 18, 1)
  RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[PATELSSupervisores]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSSupervisores] 

	@piCompaniaId INT
	
AS
BEGIN

SET NOCOUNT ON

	DECLARE @viPuestoSupervisor INT
 
	SELECT @viPuestoSupervisor = CONVERT(INTEGER, fcPrmVal) FROM TCTEParametro WITH(NOLOCK) WHERE fiPrmId = 13

	SELECT	P.fiPromovendedorId AS SupervisorId, 
			RTRIM(fcNombre) + ' ' + RTRIM(fcAPaterno) + ' ' + RTRIM(fcAMaterno) AS Nombre  
	FROM TATEPromovendedor P WITH(NOLOCK)
		WHERE dbo.FNTELSValidarCompania(@piCompaniaId,P.fiCompaniaId,P.fiPuestoId) = 1
		  AND P.fiPuestoId = @viPuestoSupervisor
	ORDER BY 1
	
SET NOCOUNT OFF		
	
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaTiendasPreOPenalizadasHoy]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FNTELSTablaTiendasPreOPenalizadasHoy](
 @piCompaniaId INT
 )
RETURNS @ValueTable TABLE ([fiNoTienda] INT, [PenalizacionHoy] INT)
BEGIN
 
  INSERT INTO @ValueTable ([fiNoTienda], [PenalizacionHoy])
  SELECT P.fiNoTienda, CASE WHEN DATEPART(HOUR, GETDATE()) >= MAX(CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2))) + 3 THEN 2 ELSE 1 END as PenalizacionHoy
	FROM TATEPromovendedor P WITH(NOLOCK)
	INNER JOIN FNTELSTablaTiendasXNegocio(@piCompaniaId) TxN on (TxN.fiNoTienda = P.fiNoTienda AND P.fiPaisID = TxN.fiPaisID)
	WHERE P.fiPaisID = 1
	  --AND fiTipoVendedorId <> 2
	  AND (fiCompaniaId = @piCompaniaId OR @piCompaniaId = 0)
	  AND DBO.FNTELSFechaST(fdFecRegistro) <=  dbo.FNTELSFechaST(GETDATE())
	  GROUP BY P.fiNoTienda
  
 
 RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[fnEsPuestoJerarquia]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************************
   Descripción: Valida si es puesto de supervisor
   Fecha: 18/09/2012
   Responsable: Angel Israel López Rosales
*********************************************************************************************************/
CREATE FUNCTION [dbo].[fnEsPuestoJerarquia] 
(
   @piPromovendedorId INT
)
RETURNS BIT
AS
BEGIN
   DECLARE @vlEsPuestoJerarquia BIT
   SET @vlEsPuestoJerarquia=0

   IF EXISTS(
          SELECT fiCatalogoId
          FROM   dbo.TCTEDetalleCatalogoGenerico T WITH(NOLOCK)
             INNER JOIN dbo.TATEPromovendedor p WITH(NOLOCK) ON p.fiPuestoId=T.fiItemId
          WHERE  T.fiCatalogoId=8 AND flStatus=1
             AND fiPromovendedorId = @piPromovendedorId 
   ) 
   BEGIN SET @vlEsPuestoJerarquia=1 END
   RETURN @vlEsPuestoJerarquia
END
GO
/****** Object:  Table [dbo].[TATEIdPromReciclados]    Script Date: 08/14/2020 09:06:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TATEIdPromReciclados](
	[fiPromovendedorId] [int] NOT NULL,
	[fdFecha] [date] NULL,
	[fiPaisID] [int] NOT NULL
) ON [SECONDARY]
GO
/****** Object:  StoredProcedure [dbo].[spUpdPromotorAJerarquia]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************
	Descripción: Cambia de puesto a un promotor
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
******************************************************************************************/
CREATE PROCEDURE [dbo].[spUpdPromotorAJerarquia]
	@piPromovendedorId	INT,						/*Número de promotor*/
	@piPuestoId			INT,						/*Puesto de jerarquia*/
	@pcCorreoPromotor	VARCHAR(60),				/*Correo del promotor*/
	@pcNombrePromotor	VARCHAR(60),				/*Nombres del promotor*/
	@pcAPaterno			VARCHAR(60),				/*Apellido paterno del promotor*/
	@pcAMaterno			VARCHAR(60),				/*Apellido materno del promotor*/
	@pcCorreoModifica   VARCHAR(255) = NULL,		/*Correo de la persona que modifica la información*/
	@pcIPModifica       VARCHAR(50)  = NULL,		/*IP desde la máquina donde se modifica la información*/
	@pcEmpNo            VARCHAR(10)   = '999992'		/*Número de empleado que modifica la información*/
AS

SET NOCOUNT ON

DECLARE @viPais				INT,
        @viCanal			INT,
        @vcMensaje			VARCHAR(200),
        -- VARIABLES DE LA BITACORA
        @viNoTienda			SMALLINT,
        @viTipoVendedorId  SMALLINT,
        @vcNombre          VARCHAR(40),
        @vcAPaterno        VARCHAR(40),
        @vcAMaterno        VARCHAR(40),
        @vcRFC             VARCHAR(20),
        @vcFechNacimiento  VARCHAR(10),
        @vcTelefono        VARCHAR(10),
        @viCompaniaId      INT,
        @vcHorario         VARCHAR(8),
        @viDiaDescanso     TINYINT,
        @viStatus          TINYINT,
        @vcJefeInme        VARCHAR(60),
        @vdFecRegistro     DATETIME,
        @vcEmail           VARCHAR(60),
        @viNoPromo         VARCHAR(10),
        @vcTelefonoCel     VARCHAR(10) = null,
        @vcTelefonoRec     VARCHAR(10) = null,
        @viPuesto          INT

BEGIN TRY
	IF EXISTS(
		SELECT	fiPromovendedorId 
		FROM	dbo.TATEPromovendedor p WITH(NOLOCK)
			INNER JOIN dbo.TCTEDetalleCatalogoGenerico c WITH(NOLOCK) 
				ON c.fiItemId = p.fiPuestoId
		WHERE fiPromovendedorId = @piPromovendedorId
			AND c.fiCatalogoId = 7
	)
	BEGIN
		IF NOT EXISTS(
			SELECT	c.fiCatalogoId 
			FROM	dbo.TCTEDetalleCatalogoGenerico c WITH(NOLOCK) 
			WHERE	c.fiItemId = @piPuestoId
				AND c.fiCatalogoId = 8
		)
		BEGIN
			RAISERROR('El puesto al que se quiere cambiar el promotor no es de jerarquía. ', 18, 1)
		END
		UPDATE	dbo.TATEPromovendedor 
		SET		fiPuestoId		= @piPuestoId, 
				fcEmail			= @pcCorreoPromotor,
				fcNombre		= @pcNombrePromotor,
				fcAPaterno		= @pcAPaterno,
				fcAMaterno		= @pcAMaterno
		WHERE fiPromovendedorId = @piPromovendedorId
		-- GRABAMOS LA BITACORA
	   SELECT @viNoTienda       = fiNoTienda,
			  @viTipoVendedorId = fiTipoVendedorId,
			  @vcNombre         = fcNombre,
			  @vcAPaterno       = fcAPaterno,
			  @vcAMaterno       = fcAMaterno,
			  @vcRFC            = fcRFC,
			  @vcFechNacimiento = fcFechNacimiento,
			  @vcTelefono       = fcTelefono,
			  @viCompaniaId     = fiCompaniaId,
			  @vcHorario        = fcHorario,
			  @viDiaDescanso    = fiDiaDescanso,
			  @viStatus         = fiStatus,
			  @vcJefeInme       = fcJefeInme,
			  @vdFecRegistro    = fdFecRegistro,
			  @vcEmail          = fcEmail,
			  @viNoPromo        = fiNoPromo,
			  @vcTelefonoCel    = fcTelefonoCel,
			  @vcTelefonoRec    = fcTelefonoRec,
			  @viPuesto         = fiPuestoId
	   FROM dbo.TATEPromovendedor WITH(NOLOCK)
	   WHERE fiPromovendedorId = @piPromovendedorId
       
	   EXECUTE dbo.PATELIPromoVendedorHist
			@piPromovendedorId = @piPromovendedorId,
			@piNoTienda        = @viNoTienda,
			@piTipoVendedorId  = @viTipoVendedorId,
			@pcNombre          = @vcNombre,
			@pcAPaterno        = @vcAPaterno,
			@pcAMaterno        = @vcAMaterno,
			@pcRFC             = @vcRFC,
			@pcFechNacimiento  = @vcFechNacimiento,
			@pcTelefono        = @vcTelefono,
			@piCompaniaId      = @viCompaniaId,
			@pcHorario         = @vcHorario,
			@piDiaDescanso     = @viDiaDescanso,
			@piStatus          = @viStatus,
			@pcJefeInme        = @vcJefeInme,
			@pdFecRegistro     = @vdFecRegistro,
			@pcEmpNo           = @pcEmpNo,
			@piTipoMovimiento  = 6,
			@pcEmail           = @vcEmail,
			@piNoPromo         = @viNoPromo,
			@pcTelefonoCel     = @vcTelefonoCel,
			@pcTelefonoRec     = @vcTelefonoRec,
			@piPuesto          = @viPuesto,
			@pcCorreoModifica  = @pcCorreoModifica,
			@pcIPModifica      = @pcIPModifica
	END
	ELSE
	BEGIN
		RAISERROR('El número de empleado introducido no es un promotor.', 18, 1)
	END
END TRY
BEGIN CATCH
	SET @vcMensaje = ERROR_MESSAGE()
	RAISERROR(@vcMensaje, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  View [dbo].[VWTEAsistenciasIusacell]    Script Date: 08/14/2020 09:06:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VWTEAsistenciasIusacell]
AS
SELECT 
   Empleado=LTRIM(RTRIM(fiNoPromo)),
   Fecha=CONVERT(DATETIME,LTRIM(RTRIM(CONVERT(CHAR,A.fdFecha,112)))),
   Hora=SUBSTRING(CONVERT(CHAR,A.fdFecha,108),1,2) + SUBSTRING(CONVERT(CHAR,A.fdFecha,108),4,2),
   [Ent/SAL]=CAST(
   CASE A.fiAsistenciaId WHEN 4 THEN 2 ELSE A.fiAsistenciaId END
   AS VARCHAR(1)),
   Torniquete='176',
   Observaciones='NA'
FROM 
(
   SELECT fiPromovendedorId, fiNoPromo
   FROM dbo.TATEPromovendedor WITH(NOLOCK)
   WHERE fiCompaniaId IN (11,47)
      AND fiNoPromo IS NOT NULL AND LEN(fiNoPromo)>=6
) AS Promo
INNER JOIN
(
   SELECT fiPromovendedorId,fiAsistenciaId,fdFecha,fiNoTienda
   FROM dbo.TATEControlAsistencia WITH(NOLOCK)
) AS A
ON A.fiPromovendedorId=Promo.fiPromovendedorId
WHERE A.fiAsistenciaId IN (1,4)
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaNivelesJerarquia]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FNTELSTablaNivelesJerarquia](@piPadreID INT)

RETURNS @ValueTable TABLE ([fiPadreID] INT, [fiHijoID] INT, [Nivel] INT)
BEGIN

WITH JerarquiaNiveles (fiPadreID, fiHijoID, Nivel)
AS
(
	-- Base
    SELECT e.fiPadreID, e.fiHijoID, 0 AS Nivel
    FROM dbo.TATEJerarquia AS e WITH(NOLOCK)
    WHERE e.fiPadreID = @piPadreID
	UNION ALL
	-- Recursivo
    SELECT e.fiPadreID, e.fiHijoID, Nivel + 1
    FROM dbo.TATEJerarquia AS e WITH(NOLOCK)
    INNER JOIN JerarquiaNiveles AS jn --WITH(NOLOCK)
        ON e.fiPadreID = jn.fiHijoID
        AND NIVEL <= 2 --REVISAR que no le pegue en nada!!!!!
)

INSERT INTO @ValueTable ([fiPadreID], [fiHijoID], [Nivel])
SELECT	fiPadreID, fiHijoID, Nivel 
FROM	JerarquiaNiveles e WITH(NOLOCK)
	INNER JOIN dbo.TATEPromovendedor p WITH(NOLOCK)
			ON e.fiHijoID = p.fiPromovendedorId
WHERE p.fiCompaniaId = 107
UNION ALL
SELECT	fiPadreID, fiHijoID, Nivel 
FROM	JerarquiaNiveles e WITH(NOLOCK)
WHERE e.fiPadreID = 0
RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaNiveles]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSTablaNiveles](@piPadreID INT, @piCompaniaId INT)

RETURNS @ValueTable TABLE ([fiPadreID] INT, [fiHijoID] INT, [Nivel] INT)
BEGIN

WITH JerarquiaNiveles (fiPadreID, fiHijoID, Nivel)
AS
(
	-- Base
    SELECT e.fiPadreID, e.fiHijoID, 0 AS Nivel
    FROM dbo.TATEJerarquia AS e WITH(NOLOCK)
    WHERE e.fiPadreID = @piPadreID
	UNION ALL
	-- Recursivo
    SELECT e.fiPadreID, e.fiHijoID, Nivel + 1
    FROM dbo.TATEJerarquia AS e WITH(NOLOCK)
    INNER JOIN JerarquiaNiveles AS jn --WITH(NOLOCK)
        ON e.fiPadreID = jn.fiHijoID
        AND NIVEL <= 2 --REVISAR que no le pegue en nada!!!!!
)

INSERT INTO @ValueTable ([fiPadreID], [fiHijoID], [Nivel])
SELECT	fiPadreID, fiHijoID, Nivel 
FROM	JerarquiaNiveles e WITH(NOLOCK)
	INNER JOIN dbo.TATEPromovendedor p WITH(NOLOCK)
			ON e.fiHijoID = p.fiPromovendedorId
WHERE p.fiCompaniaId = @piCompaniaId
UNION ALL
SELECT	fiPadreID, fiHijoID, Nivel 
FROM	JerarquiaNiveles e WITH(NOLOCK)
WHERE e.fiPadreID = 0
RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaFechasVendedorConsiderandoAltaBaja]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSTablaFechasVendedorConsiderandoAltaBaja](
   	@ID_PROMO_VEND	INT,
	@FI             DATETIME,
	@FF             DATETIME
 )
RETURNS @ValueTable TABLE ([FECHA_INICIAL] DATETIME, [FECHA_FINAL] DATETIME)
BEGIN

	DECLARE	 @FECHA_ALTA DATETIME
	DECLARE	 @FECHA_BAJA DATETIME
	DECLARE	 @FECHA_INICIAL DATETIME
	DECLARE	 @FECHA_FINAL DATETIME


	--------------------------------------------------------------------------------------------------------------------------------------------------		
    --Obtener día de descanso (fiDiaDescanso), hrEntrada(fchorario), hrSalida(fchorario), fecha de alta, fecha de baja (si es que existe) del vendedor
    --------------------------------------------------------------------------------------------------------------------------------------------------	
	SELECT  @FECHA_ALTA = DBO.FNTELSFechaST(fdFecRegistro),--DBO.FECHAST(DATEADD(DAY, 1, fdFecRegistro)),--???Que empiece a contar un día después de la fecha de alta
	        @FECHA_BAJA = DBO.FNTELSFechaST(ISNULL(B.fdFecBaja, GETDATE()))--DBO.FECHAST(DATEADD(DAY, -1,ISNULL(B.fdFecBaja, GETDATE())))--???Que empiece a contar hasta un día antes de la fecha de baja (o al día actual)
	FROM TATEPromovendedor  P
		LEFT JOIN TATEBajaPromovendedor B ON (P.fiPromovendedorId = B.fiPromovendedorId)
	WHERE P.fiPromovendedorId = @ID_PROMO_VEND
	
    ---------------------------------------------------------------------
           /*ASIGNAR VARIABLES DE FECHA_INICIAL Y FECHA_FINAL*/
    ---------------------------------------------------------------------	
	IF @FI > @FECHA_ALTA
		SET @FECHA_INICIAL = @FI
	ELSE
		SET @FECHA_INICIAL = @FECHA_ALTA

	IF @FF < @FECHA_BAJA
		SET @FECHA_FINAL = @FF
	ELSE
		SET @FECHA_FINAL = @FECHA_BAJA
 
  INSERT INTO @ValueTable ([FECHA_INICIAL], [FECHA_FINAL])
  SELECT @FECHA_INICIAL, @FECHA_FINAL
 
 RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[PATELDSupervisorTienda]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
	Descripción: Borra tienda asignada
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
***************************************************************************/
CREATE PROCEDURE [dbo].[PATELDSupervisorTienda] 
   @piNoTienda			INT,					/*Número de Tienda*/
   @piPromovendedorId	INT,					/*Id del promotor*/
   @pcCorreoModifica	VARCHAR(255) = NULL,	/*Correo de la persona que modifica*/
   @pcIPModifica		VARCHAR(50)  = NULL,	/*IP de la maquina de la persona que modifica*/
   @pcEmpNo				VARCHAR(10)  = '999995' /*Número de empleado quué modifica*/
AS
BEGIN

SET NOCOUNT ON

DECLARE @vcMensaje			VARCHAR(200),
        -- VARIABLES DE LA BITACORA
        @viNoTienda			SMALLINT,
        @viTipoVendedorId	SMALLINT,
        @vcNombre			char(40),
        @vcAPaterno			char(40),
        @vcAMaterno			char(40),
        @vcRFC				char(20),
        @vcFechNacimiento	char(10),
        @vcTelefono			char(10),
        @viCompaniaId		INT,
        @vcHorario			char(8),
        @viDiaDescanso		tinyint,
        @viStatus			tinyint,
        @vcJefeInme			char(60),
        @vdFecRegistro		datetime,
        @vcEmail			char(60),
        @viNoPromo			char(10),
        @vcTelefonoCel		char(10) = null,
        @vcTelefonoRec		char(10) = null,
        @viPuesto			INT

BEGIN TRY
   DELETE 
   FROM   dbo.TATESupervisor
   WHERE  fiNoTienda = @piNoTienda
      AND fiPromovendedorId = @piPromovendedorId
      
   -- GRABAMOS LA BITACORA
   SELECT @viNoTienda       = fiNoTienda,
       @viTipoVendedorId = fiTipoVendedorId,
       @vcNombre         = fcNombre,
       @vcAPaterno       = fcAPaterno,
       @vcAMaterno       = fcAMaterno,
       @vcRFC            = fcRFC,
       @vcFechNacimiento = fcFechNacimiento,
       @vcTelefono       = fcTelefono,
       @viCompaniaId     = fiCompaniaId,
       @vcHorario        = fcHorario,
       @viDiaDescanso    = fiDiaDescanso,
       @viStatus         = fiStatus,
       @vcJefeInme       = fcJefeInme,
       @vdFecRegistro    = fdFecRegistro,
       @vcEmail          = fcEmail,
       @viNoPromo        = fiNoPromo,
       @vcTelefonoCel    = fcTelefonoCel,
       @vcTelefonoRec    = fcTelefonoRec,
       @viPuesto         = fiPuestoId
   FROM dbo.TATEPromovendedor WITH(NOLOCK)
   WHERE fiPromovendedorId = @piPromovendedorId
       
   EXECUTE dbo.PATELIPromoVendedorHist
     @piPromovendedorId = @piPromovendedorId,
     @piNoTienda        = @viNoTienda,
     @piTipoVendedorId  = @viTipoVendedorId,
     @pcNombre          = @vcNombre,
     @pcAPaterno        = @vcAPaterno,
     @pcAMaterno        = @vcAMaterno,
     @pcRFC             = @vcRFC,
     @pcFechNacimiento  = @vcFechNacimiento,
     @pcTelefono        = @vcTelefono,
     @piCompaniaId      = @viCompaniaId,
     @pcHorario         = @vcHorario,
     @piDiaDescanso     = @viDiaDescanso,
     @piStatus          = @viStatus,
     @pcJefeInme        = @vcJefeInme,
     @pdFecRegistro     = @vdFecRegistro,
     @pcEmpNo           = @pcEmpNo,
     @piTipoMovimiento  = 9,
     @pcEmail           = @vcEmail,
     @piNoPromo         = @viNoPromo,
     @pcTelefonoCel     = @vcTelefonoCel,
     @pcTelefonoRec     = @vcTelefonoRec,
     @piPuesto          = @viPuesto,
     @pcCorreoModifica  = @pcCorreoModifica,
     @pcIPModifica      = @pcIPModifica
END TRY
BEGIN CATCH
   SET @vcMensaje = ERROR_PROCEDURE() + ','  + ERROR_MESSAGE()
   RAISERROR(@vcMensaje, 18, 1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[PATELIBajaPromovendedor]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************************************************
	Descripción: Da de baja al promovendedor indicado, puede ser baja temporal o permanente
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELIBajaPromovendedor]
   @piPromovendedorId	INT,					/*Número de promovendedor*/
   @pcEmpNo				VARCHAR(10),			/*Empleado que da de baja desde la tienda*/
   @piMotivoId			INT,					/*Motivo de baja*/
   @pcMotivoDesc		VARCHAR(200)='',		/*Observaciones de la baja*/
   @plEsJerarquia		BIT = 0,				/*Indica si es de jerarquia el empleado*/
   @pcCorreoModifica	VARCHAR(255) = NULL,	/*Correo de la persona que modifica*/
   @pcIPModifica		VARCHAR(50) = NULL		/*IP de la maquina de la persona que modifica*/
AS
SET NOCOUNT ON
DECLARE
   @vcMensaje			VARCHAR(200),
   @vdFecha				DATETIME,
   -- VARIABLES DE LA BITACORA
   @viNoTienda			smallint,
   @viTipoVendedorId	smallint,
   @vcNombre			char(40),
   @vcAPaterno			char(40),
   @vcAMaterno			char(40),
   @vcRFC				char(20),
   @vcFechNacimiento	char(10),
   @vcTelefono			char(10),
   @viCompaniaId		INT,
   @vcHorario			char(8),
   @viDiaDescanso		tinyint,
   @viStatus			tinyint,
   @vcJefeInme			char(60),
   @vdFecRegistro		datetime,
   @vcEmail				char(60),
   @viNoPromo			char(10),
   @vcTelefonoCel		char(10) = null,
   @vcTelefonoRec		char(10) = null,
   @viPuesto			INT,
   @vcCURP				VARCHAR(18)
	
BEGIN TRY
	IF EXISTS (
		SELECT	fiPromovendedorId 
		FROM	DBO.TATEPromovendedor WITH(NOLOCK) 
		WHERE	fiPromovendedorId=@piPromovendedorId)
	BEGIN
		IF(@piMotivoId = 3)
		BEGIN
			RAISERROR('La baja temporal no está pemitida, debe seleccionar la baja permanente', 18, 1);
		END 

		IF NOT EXISTS(SELECT fiMotivoId FROM dbo.TCTEMotivoBaja WITH(NOLOCK) WHERE fiMotivoId = @piMotivoId) 
		BEGIN RAISERROR('El motivo seleccionado no es válido', 18, 1) END
		SELECT @viStatus = fiEstatusBaja FROM dbo.TCTEMotivoBaja WITH(NOLOCK) WHERE fiMotivoId = @piMotivoId
		IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND ((fiStatus=0 AND @viStatus=0) OR (fiStatus=2 AND @viStatus=2) OR (fiStatus=2 AND @viStatus=0)))
		BEGIN
			RAISERROR('EL PROMOVENDEDOR YA FUE DADO DE BAJA ANTERIORMENTE.',18,1)
		END
		IF EXISTS 
			(
			SELECT fiPromovendedorId 
			FROM   DBO.TATEPromovendedor p WITH(NOLOCK) 
				INNER JOIN dbo.TCTEDetalleCatalogoGenerico d WITH(NOLOCK) 
					ON p.fiPuestoId = d.fiItemId
			WHERE fiPromovendedorId=@piPromovendedorId 
				AND d.fiCatalogoId = 8
				AND @plEsJerarquia = 0
			)
		BEGIN
			RAISERROR('Un empleado jerarquico solamente se puede dar de baja desde el portal de proveedores por lo tanto no procede la baja.',18,1)
		END
		--IF(@piMotivoId=0)
		--	SET @piMotivoId=3   
		SET @vdFecha = GETDATE()
		-- ACTUALIZAMOS EL ESTATUS DEL PROMOVENDEDOR
		UPDATE	DBO.TATEPromovendedor 
		SET		fiStatus		= @viStatus,
				fdUltimoCambio	= @vdFecha 
		WHERE	fiPromovendedorId = @piPromovendedorId
		-- INSERTAMOS LA BAJA
		INSERT INTO dbo.TATEBajaPromovendedor (fiPromovendedorId,fdFecBaja,fiMotivoId,fcMotivoDesc) VALUES (@piPromovendedorId,@vdFecha,@piMotivoId,@pcMotivoDesc)
		-- GRABAMOS LA BITACORA
		IF EXISTS(
			SELECT	fiPromovendedorId 
			FROM	dbo.TATEPromovendedorHist WITH (NOLOCK) 
			WHERE	fiPromovendedorId = @piPromovendedorId
				AND fcEmpNo = '10000001'
		) AND @viStatus = 2
		BEGIN
			UPDATE	dbo.TATEPromovendedorHist 
			SET		fcEmpNo				= @pcEmpNo,
					fcCorreoModifica	= @pcCorreoModifica,
					fcIPModifica		= @pcIPModifica
			WHERE	fiPromovendedorId	= @piPromovendedorId
				AND fcEmpNo = '10000001'
		END
		ELSE
		BEGIN
			SELECT @viNoTienda			= fiNoTienda,
					@viPuesto			= fiPuestoId,
					@viTipoVendedorId	= fiTipoVendedorId,
					@vcNombre			= fcNombre,
					@vcAPaterno			= fcAPaterno,
					@vcAMaterno			= fcAMaterno,
					@vcRFC				= fcRFC,
					@vcFechNacimiento	= fcFechNacimiento,
					@vcTelefono			= fcTelefono,
					@viCompaniaId		= fiCompaniaId,
					@vcHorario			= fcHorario,
					@viDiaDescanso		= fiDiaDescanso,
					@viStatus			= fiStatus,
					@vcJefeInme			= fcJefeInme,
					@vdFecRegistro		= fdFecRegistro,
					@vcEmail			= fcEmail,
					@viNoPromo			= fiNoPromo,
					@vcTelefonoCel		= fcTelefonoCel,
					@vcTelefonoRec		= fcTelefonoRec,
					@vcCURP				= fcCURP
			FROM DBO.TATEPromovendedor WITH(NOLOCK)
			WHERE fiPromovendedorId = @piPromovendedorId
       
			EXECUTE dbo.PATELIPromoVendedorHist
				@piPromovendedorId	= @piPromovendedorId,
				@piNoTienda			= @viNoTienda,
				@piTipoVendedorId	= @viTipoVendedorId,
				@pcNombre			= @vcNombre,
				@pcAPaterno			= @vcAPaterno,
				@pcAMaterno			= @vcAMaterno,
				@pcRFC				= @vcRFC,
				@pcFechNacimiento	= @vcFechNacimiento,
				@pcTelefono			= @vcTelefono,
				@piCompaniaId		= @viCompaniaId,
				@pcHorario			= @vcHorario,
				@piDiaDescanso		= @viDiaDescanso,
				@piStatus			= @viStatus,
				@pcJefeInme			= @vcJefeInme,
				@pdFecRegistro		= @vdFecRegistro,
				@pcEmpNo			= @pcEmpNo,
				@piTipoMovimiento	= 2,
				@pcEmail			= @vcEmail,
				@piNoPromo			= @viNoPromo,
				@pcTelefonoCel		= @vcTelefonoCel,
				@pcTelefonoRec		= @vcTelefonoRec,
				@piPuesto			= @viPuesto,
				@pcCorreoModifica	= @pcCorreoModifica,
				@pcIPModifica		= @pcIPModifica,
				@pcCURP				= @vcCURP
		END
	END
	ELSE
	BEGIN
		RAISERROR('NO EXISTE EL PROMOVENDEDOR INDICADO.',18,1)
	END
END TRY
BEGIN CATCH
   SELECT @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTiempoSupervision]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************
   Descripción: Función para indentificar el tiempo de supervisión de supervisor dado
   Fecha: mayo del 2017
   Responsable: Angel Israel López Rosales
   Modificación: Cambia performance 2
****************************************************************************************/
CREATE FUNCTION [dbo].[FNTELSTiempoSupervision]
(
   @pdFecha           DATETIME, /*Fecha a verificar*/
   @piPromovendedorId INT,      /*Id de Promovendedor */
   @piNoTienda        INT       /*Tienda a verificar*/
)
RETURNS		INT
AS
BEGIN 
	DECLARE	@viMinSupervisados INT,
			@vdFechaEnt        DATETIME,
			@vdFechaSal        DATETIME

	DECLARE @vtAsistencia TABLE (fiNoTienda INT, fiPromovendedorId INT, fiAsistenciaId INT, fdFecha DATETIME) 
    
	INSERT INTO @vtAsistencia (fiNoTienda, fiPromovendedorId, fiAsistenciaId, fdFecha)
	SELECT	fiNoTienda, fiPromovendedorId, fiAsistenciaId, fdFecha 
	FROM	dbo.TATEControlAsistencia WITH(NOLOCK)
	WHERE	fiPromovendedorId = @piPromovendedorId
		AND fiNoTienda = @piNoTienda
	       
	SELECT @vdFechaEnt = fdFecha 
	FROM @vtAsistencia
	WHERE CONVERT(DATETIME, CONVERT(VARCHAR(10), fdFecha, 103),103) = @pdFecha
		AND fiAsistenciaId = 1
   
   SELECT @vdFechaSal = fdFecha 
   FROM @vtAsistencia
   WHERE CONVERT(DATETIME, CONVERT(VARCHAR(10), fdFecha, 103),103) = @pdFecha
      AND fiAsistenciaId = 4
      
   IF (@vdFechaEnt IS NOT NULL AND @vdFechaSal IS NULL)
      SET @viMinSupervisados = 0
   ELSE
      SET @viMinSupervisados = DATEDIFF(MINUTE, @vdFechaEnt, @vdFechaSal)

RETURN @viMinSupervisados
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaVendedoresTienda]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FNTELSTablaVendedoresTienda](
	@piPaisID		INT,
	@piCompaniaId	INT,
	@pdFechaInicial DATETIME,
	@pdFechaFinal	DATETIME
 )
RETURNS @ValueTable TABLE ([fiPromovendedorId] INT, [fiNoTienda] INT, [fiCompaniaId] INT, [fcHorario] CHAR(8))
BEGIN


 
  INSERT INTO @ValueTable ([fiPromovendedorId], [fiNoTienda], [fiCompaniaId], [fcHorario])		
  SELECT fiPromovendedorId, fiNoTienda, fiCompaniaId, fcHorario
		FROM TATEPromovendedor P WITH(NOLOCK)
		INNER JOIN TCTEDetalleCatalogoGenerico DC WITH(NOLOCK) on (DC.fiItemId = P.fiPuestoId AND DC.fiCatalogoId = 7)
		WHERE fiPaisID = @piPaisID
		  AND fiTipoVendedorId <> 2
		  AND (fiCompaniaId = @piCompaniaId OR @piCompaniaId = 0)
		  AND DBO.FNTELSFechaST(fdFecRegistro) <=  @pdFechaFinal
						UNION
  SELECT  A.fiPromovendedorId, A.fiNoTienda, P.fiCompaniaId, P.fcHorario
		FROM TATEControlAsistencia A WITH(NOLOCK) INNER JOIN TATEPromovendedor P WITH(NOLOCK)
		ON (A.fiPromovendedorId = P.fiPromovendedorId)	
		INNER JOIN TCTEDetalleCatalogoGenerico DC WITH(NOLOCK) on (DC.fiItemId = P.fiPuestoId AND DC.fiCatalogoId = 7)
		WHERE 
		P.fiTipoVendedorId = 2 
		AND (P.fiCompaniaId = @piCompaniaId OR @piCompaniaId = 0)
		AND DBO.FNTELSFechaST(A.fdFecha) BETWEEN @pdFechaInicial and @pdFechaFinal	

 
 RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaTiendasSinSupervisor]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*****************************************************************************
   Descripción: Función que devuelve las tiendas sin supervisor asignado
   Fecha: 13 de marzo del 2013
******************************************************************************/
CREATE function [dbo].[FNTELSTablaTiendasSinSupervisor](
 @piCompaniaId int
 )

RETURNS @ValueTable TABLE ([fiNoTienda] INT, [fiPaisID] INT, [fiCanalId] INT)
BEGIN
   SELECT @piCompaniaId = dbo.FNTELSCompania(@piCompaniaId)
   INSERT INTO @ValueTable ([fiNoTienda], [fiPaisID], [fiCanalId])
   SELECT fiNoTienda, fiPaisID, fiCanalId FROM dbo.FNTELSTablaTiendasXNegocio(@piCompaniaId)
   EXCEPT
   SELECT S.fiNoTienda, S.fiPaisID, S.fiCanalId 
   FROM   TATESupervisor S WITH(NOLOCK)
      INNER JOIN TATEPromovendedor P WITH(NOLOCK)
      ON (
            P.fipromovendedorId = S.fipromovendedorid 
            AND dbo.FNTELSValidarCompania(
               @piCompaniaId, 
               dbo.FNTELSCompania(P.fiCompaniaId),
               P.fiPuestoId
            ) = 1
         )
  
RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSValidacionesSupervisorTienda]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	Modificación: Quita la tienda asignada del actual supervisor
*/
CREATE FUNCTION [dbo].[FNTELSValidacionesSupervisorTienda]
(
	@piNoTienda			INT,
	@piPromovendedorId	INT,
	@piPaisID			INT,
	@piCanalID			INT
)
RETURNS		VARCHAR(200)
AS
BEGIN
	DECLARE @vcMensaje          VARCHAR(200)
	DECLARE @viCompania			INT
	DECLARE @viPuesto			INT
	DECLARE @viExisteSup		INT
	DECLARE @viPuestoSupervisor INT
 
	SELECT	@viPuestoSupervisor = CONVERT(INTEGER, fcPrmVal) 
	FROM	dbo.TCTEParametro WITH(NOLOCK) 
	WHERE	fiPrmId = 13
	
	SET @vcMensaje = ''
	
	SELECT	@viCompania = fiCompaniaId,
			@viPuesto = fiPuestoId
	 FROM	dbo.TATEPromovendedor WITH(NOLOCK) 
	 WHERE	fiPromovendedorId = @piPromovendedorId
	
	SELECT	@viExisteSup = COUNT(P.fiPromovendedorId)
	FROM	dbo.TATESupervisor S WITH(NOLOCK) 
		INNER JOIN dbo.TATEPromovendedor P WITH(NOLOCK) ON (S.fiPromovendedorId = P.fiPromovendedorId)
	WHERE	/*P.fiCompaniaId = @viCompania*/ dbo.FNTELSValidarCompania(@viCompania,P.fiCompaniaId,P.fiPuestoId) = 1  
		AND S.fiNoTienda = @piNoTienda 
		AND S.fiCanalId = @piCanalID 
		AND S.fiPaisId = @piPaisID
	
	IF @viPuesto <> @viPuestoSupervisor
		SET @vcMensaje = 'El empleado que quiere asignar no tiene puesto de supervisor.'
		
	IF (@viExisteSup > 0 AND @viCompania <> 107)
		SET @vcMensaje = 'Ya existe un supervisor asignado a esta tienda de la misma compañía, si desea asignar un nuevo supervisor, por favor, primero elimine el registrado actualmente.'
	IF (@viExisteSup > 0 AND @viCompania = 107)
		SET @vcMensaje = 'Tienda OUI'

RETURN @vcMensaje

END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSValidacionesEmpJerarquico]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSValidacionesEmpJerarquico]
(
	@piCompaniaId	INT,
	@piPadreId		INT,
	@piPuestoId		INT
)
RETURNS		VARCHAR(200)
AS
BEGIN
	
	DECLARE @vcMensaje          VARCHAR(200)
	DECLARE @vcDescPuesto		VARCHAR(255)
	DECLARE @viExisteDirector   INT
	DECLARE @viPuestoPadre		INT
	DECLARE @vcDescPuestoPadre	VARCHAR(255)
	DECLARE @viExistePadre		INT
	DECLARE @viNegocioPadre		INT
	DECLARE @viPuestoDirGral	INT
 
	SELECT @viPuestoDirGral = CONVERT(INTEGER, fcPrmVal) FROM TCTEParametro WITH(NOLOCK) WHERE fiPrmId = 14
	
	SET @vcMensaje = ''
	
	SELECT @vcDescPuesto = fcDescPuesto from TctePuesto WITH(NOLOCK) where fiPuestoId = @piPuestoId
		
	IF @piPuestoId <> @viPuestoDirGral AND @piPadreId = 0
		SET @vcMensaje = 'No se puede insertar sin empleado padre a un ' + RTRIM(@vcDescPuesto)
		
	IF @piPadreId <> 0
		BEGIN
			SELECT @viExistePadre = COUNT(fiPromovendedorId) FROM TATEPromovendedor WITH(NOLOCK) WHERE fiPromovendedorID = @piPadreId
			IF (@viExistePadre = 0)
				SET @vcMensaje = 'No existe el empleado padre, favor de verificar.'
		END
		
	IF @piPuestoId = @viPuestoDirGral AND @piPadreId <> 0
		SET @vcMensaje = 'Si desea insertar un director general, el empleado padre debe ser 0 (cero).'
	
	IF @piPuestoId = @viPuestoDirGral AND @piPadreId = 0
		BEGIN
			SELECT @viExisteDirector = COUNT(J.fiPadreID) FROM TATEJerarquia J WITH(NOLOCK)
				INNER JOIN TATEPromovendedor P WITH(NOLOCK) ON (J.fiHijoID = P.fiPromovendedorId) 
				WHERE fiPadreID = 0 
					--AND P.fiCompaniaId = @piCompaniaId
					AND dbo.FNTELSValidarCompania(@piCompaniaId,P.fiCompaniaId,P.fiPuestoId) = 1
			
			IF @viExisteDirector > 0
				SET @vcMensaje = 'Ya existe un Director General para esta compañía. Elimine el anterior e intente de nuevo.'
		END
		
	IF @piPuestoId <> @viPuestoDirGral AND @piPadreId <> 0
		BEGIN
			SELECT @viPuestoPadre = P.fiPuestoId, @vcDescPuestoPadre = Pu.fcDescPuesto, @viNegocioPadre = P.fiCompaniaId
				FROM TATEPromovendedor P WITH(NOLOCK) INNER JOIN TCTEPuesto Pu WITH(NOLOCK) on (P.fiPuestoId = Pu.fiPuestoId) 
				WHERE P.fiPromovendedorId = @piPadreId
			
			IF @piPuestoId >= @viPuestoPadre
				SET @vcMensaje = 'No se puede insertar un empleado de mayor o igual jerarquía (' + RTRIM(@vcDescPuesto) + ') con un padre de menor (' + RTRIM(@vcDescPuestoPadre) + ').'
			ELSE IF (@piPuestoId + 1) <> @viPuestoPadre
				SET @vcMensaje = 'No se puede asignar un ' + RTRIM(@vcDescPuesto) + ' a un ' + RTRIM(@vcDescPuestoPadre)
			--ELSE IF @viNegocioPadre <> @piCompaniaId
			ELSE IF dbo.FNTELSValidarCompania(@piCompaniaId,@viNegocioPadre,@viPuestoPadre) = 0--REVISAR!!!
				SET @vcMensaje = 'La compañía que quiere asignar al ' + RTRIM(@vcDescPuesto) + ' es distinta a la que pertenece el ' + RTRIM(@vcDescPuestoPadre)
		END

RETURN @vcMensaje

END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTiendaSupervisada]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSTiendaSupervisada]
(
	@piNoTienda	INT,
	@piPaisID   INT,
	@piCanalID  INT,
	@pdFecha	DATETIME
	
)
RETURNS		INT
AS
BEGIN
	
	DECLARE	 @viTiendaSupervisada INT
		
	--SELECT @viTiendaSupervisada = CASE WHEN @piNoTienda > 6189 then 1 else 0 end
	
	--Aquí deberá ir la consulta de los supervisores asignados a una tienda y que presenten registros
	--de entrada y salida en dicha fecha en la tabla del control de asistencia (TATECONTROLASISTENCIA)
	
	SELECT @viTiendaSupervisada = CASE WHEN COUNT(C.fiNoTienda) > 0 THEN 1 ELSE 0 END
	FROM TATEControlAsistencia C WITH(NOLOCK) INNER JOIN
		 TATESupervisor S WITH(NOLOCK) ON (C.fiNoTienda = S.fiNoTienda AND C.fiPromovendedorId = S.fiPromovendedorId)
	WHERE S.fiNoTienda = @piNoTienda and S.fiPaisID = @piPaisID and S.fiCanalId = @piCanalID and dbo.FNTELSFechaST(C.fdFecha) = @pdFecha


RETURN @viTiendaSupervisada

END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSNumPromovendedor]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************************************************
   Descripción: Inserta promovendedor en TATEPromovendedor
   -----------------------------------------------------------------------------------------------
   Última modificación: Reciclar promotores de acuerdo a fecha de baja. Corrección
   Fecha Modificación: octubre de 2015
   Modifica: ailr
***********************************************************************************************************/  
CREATE FUNCTION [dbo].[FNTELSNumPromovendedor] (
	@piPais INT
)
RETURNS @vtTablaPromovendedor TABLE (fiPromovendedorId INT, flReciclado BIT, fiStatus INT, fiTipoMovimiento INT, fcMensaje VARCHAR(255))
BEGIN
	DECLARE @viCatalogoRango		INT, 
			@viRangoMinimo			INT, 
			@viRangoMaximo			INT, 
			@viCatalogoPaisesRango	INT, 
			@viItemRangoMin			INT, 
			@viItemRangoMax			INT,
			@viStatus				INT, 
			@viTipoMovimiento		INT,
			@viPromovendedorId		INT,
			@vlReciclado			BIT,
			@vcMensaje				VARCHAR(255)

	DECLARE @vtBajas TABLE (fiPromovendedorId INT, fdFechaBaja DATETIME)
	SELECT	@viCatalogoPaisesRango	=	1, 
			@viItemRangoMin			=	1, 
			@viItemRangoMax			=	2, 
			@viRangoMinimo			=	0,
			@viRangoMaximo			=	0,
			@viStatus				=	0,
			@viTipoMovimiento		=	0,
			@viPromovendedorId		=	0,
			@vlReciclado			=	0,
			@vcMensaje				=	''

	/*Rangos de números de promovendedor*/
	IF EXISTS(SELECT fiCatalogoId FROM dbo.TCTEDetalleCatalogoGenerico WITH (NOLOCK) WHERE fiCatalogoId = @viCatalogoPaisesRango AND fiItemId = @piPais)
	BEGIN   
		SELECT @viCatalogoRango = CAST(fcDescripcion AS INT) FROM dbo.TCTEDetalleCatalogoGenerico WITH (NOLOCK) WHERE fiCatalogoId = @viCatalogoPaisesRango AND fiItemId = @piPais
		IF EXISTS (SELECT fiCatalogoId FROM dbo.TCTEDetalleCatalogoGenerico WITH (NOLOCK) WHERE fiCatalogoId = @viCatalogoRango AND fiItemId = @viItemRangoMin)
		BEGIN
			SELECT @viRangoMinimo = CAST(fcDescripcion AS INT) FROM dbo.TCTEDetalleCatalogoGenerico WITH (NOLOCK) WHERE fiCatalogoId = @viCatalogoRango AND fiItemId = @viItemRangoMin  
		END
		ELSE
		BEGIN
			SET @vcMensaje = 'No se encontró el rango mínimo de número promotores'
		END   
		IF EXISTS (SELECT fiCatalogoId FROM dbo.TCTEDetalleCatalogoGenerico WITH (NOLOCK) WHERE fiCatalogoId = @viCatalogoRango AND fiItemId = @viItemRangoMax)  
		BEGIN
			SELECT @viRangoMaximo = CAST(fcDescripcion AS INT) FROM dbo.TCTEDetalleCatalogoGenerico WITH (NOLOCK) WHERE fiCatalogoId = @viCatalogoRango AND fiItemId = @viItemRangoMax  
		END
		ELSE
		BEGIN
			SET @vcMensaje = 'No se encontró el rango máximo de número promotores'
		END 
	END  
	ELSE  
	BEGIN  
		SET @vcMensaje = 'No existe información del catalogo de rangos'
	END
	
	INSERT INTO @vtBajas
	SELECT	fiPromovendedorId, fdFecBaja = MAX(fdFecBaja)
	FROM	TATEBajaPromovendedor 
	GROUP BY fiPromovendedorId 

	---Sin reciclado  
	IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId >= @viRangoMinimo AND fiPromovendedorId <= @viRangoMaximo AND fiPaisID = @piPais)  
	BEGIN  
		--Si hay promos con estatus 2 lo tomo para poder reciclarlo  
		IF EXISTS(  
			SELECT	p.fiPromovendedorId 
			FROM	dbo.TATEPromovendedor p WITH (NOLOCK) 
				INNER JOIN @vtBajas b ON b.fiPromovendedorId = p.fiPromovendedorId
			WHERE	fiStatus = 2 AND p.fiPromovendedorId >= @viRangoMinimo AND p.fiPromovendedorId <= @viRangoMaximo AND fiPaisID = @piPais
				AND fdFechaBaja <= DATEADD(DAY, CAST(ISNULL(dbo.FNTELSParametro(16), 0) AS INT), dbo.FNTELSFechaST(GETDATE()))
			)  
		BEGIN  
			SELECT	@viPromovendedorId = MIN(p.fiPromovendedorId), @vlReciclado = 1, @viStatus = 1, @viTipoMovimiento = 5  
			FROM	DBO.TATEPromovendedor p WITH (NOLOCK)
				INNER JOIN @vtBajas b ON b.fiPromovendedorId = p.fiPromovendedorId
			WHERE	p.fiPromovendedorId >= @viRangoMinimo   
				AND p.fiPromovendedorId <= @viRangoMaximo   
				AND fiPaisID=@piPais  
				AND fiStatus = 2
				AND fdFechaBaja <= DATEADD(DAY, CAST(ISNULL(dbo.FNTELSParametro(16), 0) AS INT), dbo.FNTELSFechaST(GETDATE()))
		END  
		ELSE  
		BEGIN  
			SELECT @viPromovendedorId = MAX(fiPromovendedorId) + 1, @vlReciclado = 0, @viStatus = 1, @viTipoMovimiento = 1
			FROM DBO.TATEPromovendedor WITH (NOLOCK)
			WHERE fiPromovendedorId >= @viRangoMinimo   
				AND fiPromovendedorId <= @viRangoMaximo
				AND fiPaisID = @piPais
		END
	END  
	ELSE  
	BEGIN  
		SELECT @viPromovendedorId = @viRangoMinimo, @vlReciclado = 0, @viStatus = 1, @viTipoMovimiento = 1  
	END  
	IF @viPromovendedorId > @viRangoMaximo 
	BEGIN  
		SET @vcMensaje = 'YA SE SUPERO EL MAXIMO DE NUMERO DE EMPLEADOS DISPONIBLES, FAVOR DE AVISAR A SOPORTE.'
	END
	INSERT INTO @vtTablaPromovendedor (fiPromovendedorId, flReciclado, fiStatus, fiTipoMovimiento, fcMensaje) VALUES (@viPromovendedorId, @vlReciclado, @viStatus, @viTipoMovimiento, @vcMensaje)
	
	RETURN

END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaCubrimiento]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************
	Responsable: Angel Israel López Rosales	
	Fecha: mayo 2017
	Modificación: Se agrega el canal SYR
	--------------------------------------
	Descripción: Cubrimiento de tiendas
**********************************************************************************/
CREATE FUNCTION [dbo].[FNTELSTablaCubrimiento](
	@CATEGORIA INT,
	@PAIS INT,
	@PLAZA INT,
	@DISTRITO INT,
	@FI DATETIME,
	@FF DATETIME
 )
RETURNS @ValueTable TABLE ([ID] INT, [SUMA_CUBRIMIENTO] INT)
BEGIN

DECLARE @vtControlAsistencia TABLE (fiPromovendedorId INT, fiAsistenciaId SMALLINT, fdFecha DATETIME, fiNoTienda SMALLINT, fiMinutos INT, fiEstatus SMALLINT)

INSERT INTO @vtControlAsistencia (fiPromovendedorId, fiAsistenciaId, fdFecha, fiNoTienda, fiMinutos, fiEstatus)
SELECT fiPromovendedorId, fiAsistenciaId, fdFecha, fiNoTienda, fiMinutos, fiEstatus FROM dbo.TATEControlAsistencia WHERE fdFecha BETWEEN @FI AND @FF

IF @DISTRITO > 0 AND @PLAZA > 0 AND @PAIS > 0
	INSERT INTO @ValueTable ([ID], [SUMA_CUBRIMIENTO])
	SELECT ID, SUM(CUBRIMIENTO_X_TIENDA) AS CUBRIMIENTO_X_TIENDA 
	FROM 
	(
		SELECT ID, Fecha, COUNT(*) AS CUBRIMIENTO_X_TIENDA 
		FROM (
			SELECT DISTINCT ID, FECHA, Compania 
			FROM
			(
				SELECT  T.fiNoTienda AS ID,
						P.fiCompaniaId AS Compania,
						DBO.FNTELSFechaST(A.fdFecha) AS Fecha,
						A.fiPromovendedorId AS PromoVendedor
				FROM	dbo.TATEPromovendedorHist P WITH (NOLOCK) 
					INNER JOIN dbo.TCTETiendas T WITH (NOLOCK)
						ON  T.fiNoTienda = P.fiNoTienda
							AND T.fiPaisID = P.fiPaisID
							AND T.fiCanalId = P.fiCanalId
					INNER JOIN @vtControlAsistencia A
						ON A.fiPromovendedorId = P.fiPromovendedorId
							AND A.fiNoTienda = T.fiNoTienda
					INNER JOIN dbo.TCTEDetalleCatalogoGenerico cc WITH (NOLOCK) 
						ON T.fiCanalId = cc.fiItemId
				WHERE	T.fiPaisID = @PAIS
					AND T.fiPlazaID = @PLAZA
					AND T.fiDistritoID = @DISTRITO
					AND cc.fiCatalogoId = 35
					AND T.fiActivo = 1
					AND (
							fiCompaniaId = @CATEGORIA 
							OR 0 = @CATEGORIA
						)
					AND (
							(	fiAsistenciaId = 1 
								AND (
									DATEPART(HOUR,FDFECHA) < (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1) 
									OR (DATEPART(HOUR,FDFECHA) = (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1) AND DATEPART(MINUTE,FDFECHA) = 0)
									)
							)
							OR (
								fiAsistenciaId = 4 
								AND DATEPART(HOUR,FDFECHA) >= CONVERT(INTEGER, SUBSTRING(fcHorario, 7, 2))
							)
					)
					AND dbo.FNTELSFechaST(A.fdFecha) BETWEEN @FI AND @FF
				GROUP BY T.fiNoTienda, P.fiCompaniaId, DBO.FNTELSFechaST(A.fdFecha), A.fiPromovendedorId
				HAVING (
					COUNT(*) = 2 
					OR (
						COUNT(*) = 1 
						AND NOT EXISTS (
							SELECT fiPromovendedorId 
							FROM @vtControlAsistencia 
							WHERE fiAsistenciaId = 4 
								AND fiPromovendedorId = A.fiPromovendedorId 
								AND dbo.FNTELSFechaST(fdFecha) = dbo.FNTELSFechaST(GETDATE()))
								AND DBO.FNTELSFechaST(fdFecha) = DBO.FNTELSFechaST(GETDATE()))
					)
				) AS Tabla0
			) AS Tabla1
		GROUP BY ID, Fecha
		) AS Tabla2
	GROUP BY ID
ELSE IF @PLAZA > 0 AND @PAIS > 0
BEGIN
	INSERT INTO @ValueTable ([ID], [SUMA_CUBRIMIENTO])
	SELECT ID, SUM(CUBRIMIENTO_X_TIENDA) AS CUBRIMIENTO_X_DISTRITO 
	FROM (
		SELECT ID, Fecha, COUNT(*) AS CUBRIMIENTO_X_TIENDA 
		FROM (
			SELECT DISTINCT ID, FECHA, Compania, Tienda 
			FROM (
				SELECT  T.fiDistritoID AS ID,
						P.fiCompaniaId AS Compania,
						DBO.FNTELSFechaST(A.fdFecha) AS Fecha,
						T.fiNoTienda AS Tienda,
						A.fiPromovendedorId AS PromoVendedor
				FROM	dbo.TATEPromovendedorHist P WITH (NOLOCK) 
					INNER JOIN dbo.TCTETiendas T WITH (NOLOCK)
						ON  T.fiNoTienda = P.fiNoTienda
							AND T.fiPaisID = P.fiPaisID
							AND T.fiCanalId = P.fiCanalId
					INNER JOIN @vtControlAsistencia A
						ON (
							A.fiPromovendedorId = P.fiPromovendedorId
							AND A.fiNoTienda = T.fiNoTienda		
						)
					INNER JOIN dbo.TCTEDetalleCatalogoGenerico cc WITH (NOLOCK) 
						ON T.fiCanalId = cc.fiItemId
				WHERE	T.fiPaisID = @PAIS
					AND T.fiPlazaID = @PLAZA
					AND cc.fiItemId = T.fiCanalId
					AND cc.fiCatalogoId = 35
					AND T.fiActivo = 1
					AND (
						fiCompaniaId = @CATEGORIA 
						OR 0 = @CATEGORIA
					)
					AND dbo.FNTELSFechaST(A.fdFecha) BETWEEN @FI AND @FF
					AND (
							(
								fiAsistenciaId = 1 AND (DATEPART(HOUR,FDFECHA) < (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1) 
									OR (DATEPART(HOUR,FDFECHA) = (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1) AND DATEPART(MINUTE,FDFECHA) = 0))
							)
							OR (fiAsistenciaId = 4 AND DATEPART(HOUR,FDFECHA) >= CONVERT(INTEGER, SUBSTRING(fcHorario, 7, 2)))
					)	
				GROUP BY T.fiDistritoID, P.fiCompaniaId, DBO.FNTELSFechaST(A.fdFecha), T.fiNoTienda, A.fiPromovendedorId
				HAVING (COUNT(*) = 2 OR (COUNT(*) = 1 
					AND NOT EXISTS (SELECT * FROM TATEControlAsistencia WITH (NOLOCK) WHERE fiAsistenciaId = 4 AND fiPromovendedorId = A.fiPromovendedorId AND dbo.FNTELSFechaST(fdFecha) = dbo.FNTELSFechaST(GETDATE()))
					AND DBO.FNTELSFechaST(fdFecha) = DBO.FNTELSFechaST(GETDATE())))
			) AS Tabla0
		) AS Tabla1
		GROUP BY ID, Fecha
	) AS Tabla2
	GROUP BY ID
END
ELSE IF @PAIS > 0
BEGIN
	INSERT INTO @ValueTable ([ID], [SUMA_CUBRIMIENTO])
	SELECT ID, SUM(CUBRIMIENTO_X_TIENDA) AS CUBRIMIENTO_X_PLAZA 
	FROM (
		SELECT ID, Fecha, COUNT(*) AS CUBRIMIENTO_X_TIENDA 
		FROM (
			SELECT DISTINCT ID, FECHA, Compania, Tienda 
			FROM (
				SELECT  T.fiPlazaID AS ID,
						P.fiCompaniaId AS Compania,
						DBO.FNTELSFechaST(A.fdFecha) AS Fecha,
						T.fiNoTienda AS Tienda,
						A.fiPromovendedorId AS PromoVendedor
				FROM	dbo.TATEPromovendedorHist P WITH (NOLOCK) 
					INNER JOIN dbo.TCTETiendas T WITH (NOLOCK)
						ON T.fiNoTienda = P.fiNoTienda
							AND T.fiPaisID = P.fiPaisID
							AND T.fiCanalId = P.fiCanalId
					INNER JOIN @vtControlAsistencia A
						ON A.fiPromovendedorId = P.fiPromovendedorId
							AND A.fiNoTienda = T.fiNoTienda
					INNER JOIN dbo.TCTEDetalleCatalogoGenerico cc WITH (NOLOCK) 
						ON T.fiCanalId = cc.fiItemId
				WHERE T.fiPaisID = @PAIS
					AND cc.fiCatalogoId = 35
					AND T.fiActivo = 1
					AND (fiCompaniaId = @CATEGORIA OR 0 = @CATEGORIA)
					AND dbo.FNTELSFechaST(A.fdFecha) BETWEEN @FI AND @FF
					AND (
							(
								fiAsistenciaId = 1 
								AND (
									DATEPART(HOUR,FDFECHA) < (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1) 
									OR (
										DATEPART(HOUR,FDFECHA) = (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1) 
										AND DATEPART(MINUTE,FDFECHA) = 0
									)
								)
							)
						OR (
							fiAsistenciaId = 4 
							AND DATEPART(HOUR,FDFECHA) >= CONVERT(INTEGER, SUBSTRING(fcHorario, 7, 2))
						)
					)
				GROUP BY T.fiPlazaID, P.fiCompaniaId, DBO.FNTELSFechaST(A.fdFecha), T.fiNoTienda, A.fiPromovendedorId
				HAVING (
					COUNT(*) = 2 
					OR (
						COUNT(*) = 1
						AND NOT EXISTS (
							SELECT fiPromovendedorId
							FROM @vtControlAsistencia
							WHERE fiAsistenciaId = 4 
								AND fiPromovendedorId = A.fiPromovendedorId
								AND dbo.FNTELSFechaST(fdFecha) = dbo.FNTELSFechaST(GETDATE())
							)
						AND DBO.FNTELSFechaST(fdFecha) = DBO.FNTELSFechaST(GETDATE())
						)
				)
			) AS Tabla0
		) AS Tabla1
		GROUP BY ID, Fecha
	) AS Tabla2
	GROUP BY ID
END
RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSPorcPuntualidad]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSPorcPuntualidad]
(
	@ID_PROMO_VEND	INT,
	@FI             DATETIME,
	@FF             DATETIME
)
RETURNS		DECIMAL(10,2)
AS
BEGIN
	
	DECLARE	 @DIA_DESCANSO INT
	DECLARE	 @HR_ENTRADA INT
	DECLARE	 @HR_SALIDA INT
	DECLARE	 @FECHA_ALTA DATETIME
	DECLARE	 @FECHA_BAJA DATETIME
	
	DECLARE @DIAS_TOTAL INT
	--DECLARE @DIAS_COMPLETOS INT
	DECLARE @DIAS_PUNTUAL INT
	
	DECLARE @PROMEDIO INT
	
	DECLARE @FECHA_INICIAL DATETIME
	DECLARE @FECHA_FINAL DATETIME
		
--------------------------------------------------------------------------------------------------------------------------------------------------		
--Obtener día de descanso (fiDiaDescanso), hrEntrada(fchorario), hrSalida(fchorario), fecha de alta, fecha de baja (si es que existe) del vendedor
--------------------------------------------------------------------------------------------------------------------------------------------------	
	SELECT  @DIA_DESCANSO = CASE WHEN fiDiaDescanso = 7 THEN 1 ELSE fiDiaDescanso + 1 END, --DIA DE DESCANSO DE ACUERDO A SQL SERVER => DOM = 1, LUN = 2, MAR = 3...SAB = 7, Y EN LA TABLA ESTÁ COMO LUN = 1...DOM = 7
	        @HR_ENTRADA = CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)),
	        @HR_SALIDA = CONVERT(INTEGER, SUBSTRING(fcHorario, 7, 2)),
	        @FECHA_ALTA = DBO.FNTELSFechaST(fdFecRegistro),--DBO.FNTELSFechaST(DATEADD(DAY, 1, fdFecRegistro)),--???Que empiece a contar un día después de la fecha de alta
	        @FECHA_BAJA = DBO.FNTELSFechaST(ISNULL(B.fdFecBaja, GETDATE()))--DBO.FNTELSFechaST(DATEADD(DAY, -1,ISNULL(B.fdFecBaja, GETDATE())))--???Que empiece a contar hasta un día antes de la fecha de baja (o al día actual)
	FROM TATEPromovendedor  P
		LEFT JOIN TATEBajaPromovendedor B ON (P.fiPromovendedorId = B.fiPromovendedorId)
	WHERE P.fiPromovendedorId = @ID_PROMO_VEND
	
-------------------------------------------------------------------------
----ASIGNAR VARIABLES DE FECHA_INICIAL Y FECHA_FINAL
-------------------------------------------------------------------------	
IF @FI > @FECHA_ALTA
	SET @FECHA_INICIAL = @FI
ELSE
	SET @FECHA_INICIAL = @FECHA_ALTA

IF @FF < @FECHA_BAJA
	SET @FECHA_FINAL = @FF
ELSE
	SET @FECHA_FINAL = @FECHA_BAJA

-----------------------------------------------------------------------
--Obtener TOTAL de las fechas en un rango menos los días de descanso =
-----------------------------------------------------------------------	
DECLARE @FechasTodosDias TABLE ([Fecha] DATETIME)

INSERT INTO @FechasTodosDias ([Fecha])
SELECT Fecha FROM dbo.FNTELSTablaFechas(@FECHA_INICIAL, @FECHA_FINAL)
WHERE DATEPART(WEEKDAY, Fecha) <> @DIA_DESCANSO

SELECT @DIAS_TOTAL = COUNT(*) FROM @FechasTodosDias

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Obtener DÍAS que asistió PUNTUALMENTE = de los días que asistió completos.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT @DIAS_PUNTUAL = COUNT(*) FROM
(
SELECT DBO.FNTELSFechaST(fdFecha) AS FECHA, COUNT(*) AS CONT FROM TATEControlAsistencia WHERE fiPromovendedorId = @ID_PROMO_VEND
AND 
(
(
fiAsistenciaId = 1 AND
(
DATEPART(HOUR, fdFecha) < @HR_ENTRADA OR (DATEPART(HOUR, fdFecha) = @HR_ENTRADA  AND DATEPART(MINUTE, fdFecha) = 0)
)
)--ENTRADA
OR 
(
fiAsistenciaId = 4 AND
(
DATEPART(HOUR, fdFecha) >= @HR_SALIDA
)
)--SALIDA
)
AND DBO.FNTELSFechaST(fdFecha) IN (SELECT Fecha FROM @FechasTodosDias)
GROUP BY DBO.FNTELSFechaST(fdFecha)
HAVING (COUNT(*) = 2 OR (COUNT(*) = 1 
				AND NOT EXISTS (SELECT * FROM TATEControlAsistencia where fiAsistenciaId = 4 AND fiPromovendedorId = @ID_PROMO_VEND AND dbo.FNTELSFechaST(fdFecha) = dbo.FNTELSFechaST(GETDATE()))
				AND DBO.FNTELSFechaST(fdFecha) = DBO.FNTELSFechaST(GETDATE())))
) AS TABLA

IF @DIAS_TOTAL <> 0
	SET @PROMEDIO = @DIAS_PUNTUAL * 100 / @DIAS_TOTAL
ELSE
	SET @PROMEDIO = -1;

RETURN @PROMEDIO

END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaTiendasNoPenalizadas]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************
   Responsable: Angel Israel López Rosales
   Fecha: 6 de noviembre del 2012
************************************************************/
CREATE function [dbo].[FNTELSTablaTiendasNoPenalizadas](
 @piCompaniaId	INT,
 @pdFecha		DATETIME
 )
RETURNS @ValueTable TABLE ([fiNoTienda] INT, [NoPenalizada] INT)
BEGIN

DECLARE @vtTiendasNegocio TABLE (fiNotienda INT, fiPaisID INT, fiCanalId INT)

INSERT INTO @vtTiendasNegocio (fiNotienda,fiPaisID,fiCanalId)
SELECT fiNoTienda, fiPaisID, fiCanalId 
FROM   dbo.TCTETiendas WITH(NOLOCK) 
WHERE fiCanalID in (1,143,17)  
   AND fiActivo = 1 AND
	((@piCompaniaId = 11 and flEsTiendaUne = 1)
	OR (@piCompaniaId = 30 and flEsTiendaTelcel = 1)
	OR (@piCompaniaId = 47 and flEsTiendaIus = 1)
	OR (@piCompaniaId = 31 and flEsTiendaMovi = 1))

INSERT INTO @ValueTable ([fiNoTienda], [NoPenalizada])
SELECT Asistencias.fiNoTienda, CASE WHEN count(Asistencias.fiNoTienda) > 0 THEN 0 ELSE 1 END FROM 
(
	SELECT fdFecha, fiPromovendedorId, fiNoTienda 
	FROM dbo.TATEControlAsistencia WITH(NOLOCK) 
	WHERE dbo.FNTELSFechaST(fdFecha) = @pdFecha AND fiAsistenciaId = 1
) AS Asistencias
INNER JOIN 
(
   SELECT fiPromovendedorId, fiNoTienda, fcHorario FROM dbo.TATEPromovendedor tp WITH(NOLOCK)
      INNER JOIN dbo.TCTEDetalleCatalogoGenerico cg WITH(NOLOCK) ON tp.fiPuestoId=cg.fiItemId
   WHERE cg.fiCatalogoId=7 
      AND tp.fiCompaniaId=@piCompaniaId
) AS Promos ON Promos.fiPromovendedorId=Asistencias.fiPromovendedorId
INNER JOIN @vtTiendasNegocio Tdas ON Tdas.fiNotienda=Promos.fiNoTienda
WHERE DATEPART(HOUR, fdFecha) < CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 3
GROUP BY Asistencias.fiNoTienda

RETURN
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSSupervisorCorreo]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
   Descripción: Consulta los supervisores penalizados
   --------------------------------------------------
   Fecha: Abril de 2017
   Responsable: Angel Israel López Rosales
   Modificación: Trae asietencias de OUI
************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSSupervisorCorreo]
   @piHora INT /*Hora en que corre*/
AS
SET NOCOUNT ON

DECLARE @viPromo INT, @viAsignada INT, @viNoSupervisada INT, @viMulta INT, @viSinSupervisor INT, @viPuestoSupervisor INT, @vdFechaInicial DATETIME, 
@vdFechaFinal DATETIME, @vdFechaHoraEntr DATETIME, @viMultaTienda INT, @viDiaSemana INT
   
SET DATEFIRST 1
SET @viDiaSemana = DATEPART(WEEKDAY, SYSDATETIME())

SELECT @viPuestoSupervisor = CONVERT(INTEGER, fcPrmVal) FROM TCTEParametro WITH(NOLOCK) WHERE fiPrmId = 13
SELECT @viMultaTienda = CONVERT(INTEGER, fcPrmVal) FROM TCTEParametro WITH(NOLOCK) WHERE fiPrmId = 11
SELECT @vdFechaInicial = GETDATE(), @vdFechaFinal = GETDATE()
SELECT @vdFechaFinal = DATEADD(DAY, 1, CONVERT(DATETIME, CONVERT(VARCHAR(10), @vdFechaFinal, 103), 103)),
       @vdFechaInicial = CONVERT(DATETIME, CONVERT(VARCHAR(10), @vdFechaInicial, 103), 103),
       @vdFechaHoraEntr = DATEADD(HOUR, @piHora, CONVERT(DATETIME, CONVERT(VARCHAR(10), @vdFechaInicial, 103), 103));

WITH cteSuper (Supervisor, TiendaNoSupervisada, NombreTienda, Promo, CorreoPadre, NombreSupervisor, Correo)
AS
(
   SELECT
      Supervisor = s.fiPromovendedorId,
      TiendaNoSupervisada = s.fiNoTienda,
      NombreTienda = tda.fcDescripcion,
      Promo=tp.fiPromovendedorId,
      CorreoPadre = iPadre.fcEmail,
      NombreSupervisor = LTRIM(RTRIM(tp.fcNombre)) + ' ' + LTRIM(RTRIM(tp.fcAPaterno)) + ' ' + LTRIM(RTRIM(tp.fcAMaterno)),
      Correo = tp.fcEmail
   FROM dbo.TATESupervisor s WITH(NOLOCK)
      INNER JOIN dbo.TATEPromovendedor tp WITH(NOLOCK) ON s.fiPromovendedorId = tp.fiPromovendedorId
      INNER JOIN dbo.TCTETiendas tda WITH(NOLOCK) ON tda.fiNoTienda = s.fiNoTienda
      INNER JOIN dbo.TATEPromovendedor promo WITH(NOLOCK) ON promo.fiNoTienda = s.fiNoTienda
      INNER JOIN dbo.TATEJerarquia j WITH(NOLOCK) ON j.fiHijoID = s.fiPromovendedorId
      INNER JOIN dbo.TATEPromovendedor iPadre WITH(NOLOCK) ON iPadre.fiPromovendedorId = j.fiPadreID
   WHERE tp.fiPuestoId=@viPuestoSupervisor
      AND CAST(SUBSTRING(promo.fcHorario,1,2) AS INT) <= @piHora
      AND promo.fiPuestoId BETWEEN 619 AND 625
      AND promo.fiStatus NOT IN (2)
      AND tp.fcEmail LIKE '%@%'
      AND promo.fiDiaDescanso <> @viDiaSemana
      AND 
         CASE 
            WHEN tp.fiCompaniaId = 11 AND promo.fiCompaniaId = 11 THEN 1
            WHEN tp.fiCompaniaId = 47 AND (promo.fiCompaniaId = 47 OR promo.fiCompaniaId = 78) THEN 1
            WHEN tp.fiCompaniaId = 31 AND promo.fiCompaniaId = 31 THEN 1
			WHEN tp.fiCompaniaId = 107 AND promo.fiCompaniaId = 107 THEN 1
            WHEN tp.fiCompaniaId = 78 AND (promo.fiCompaniaId = 11 OR promo.fiCompaniaId = 47 OR promo.fiCompaniaId = 78) THEN 1
            ELSE 0
         END = 1 
),
cteEntr (PromoTienda, TiendaAsistencia, FechaDia)
AS
(
   SELECT 
      PromoTienda = Asi.fiPromovendedorId, 
      TiendaAsistencia = Asi.fiNoTienda, 
      FechaDia = fdFecha
   FROM   dbo.TATEControlAsistencia Asi WITH(NOLOCK)
      INNER JOIN dbo.TATEPromovendedor info WITH(NOLOCK)
         ON info.fiPromovendedorId = Asi.fiPromovendedorId
   WHERE  fiAsistenciaId = 1
      AND Asi.fdFecha BETWEEN @vdFechaInicial AND @vdFechaFinal
      AND info.fiPuestoId IN (619, 620, 621, 622, 623, 624, 625)
),
cteFecMenores (TiendaAsistencia, FechaMenor)
AS
(
   SELECT 
      TiendaAsistencia = Asi.fiNoTienda,
      FechaMenor = MIN(fdFecha)
   FROM   dbo.TATEControlAsistencia Asi WITH(NOLOCK)
      INNER JOIN dbo.TATEPromovendedor info WITH(NOLOCK)
         ON info.fiPromovendedorId = Asi.fiPromovendedorId
   WHERE  fiAsistenciaId = 1
      AND fdFecha BETWEEN @vdFechaInicial AND @vdFechaFinal
      AND info.fiPuestoId IN (619, 620, 621, 622, 623, 624, 625)
   GROUP BY Asi.fiNoTienda
)
,cteAsistencias (PromoTienda, FechaDia, TiendaAsistencia)
AS
(
   SELECT
         PromoTienda, 
         cteEntr.FechaDia, 
         cteEntr.TiendaAsistencia
   FROM cteEntr 
      INNER JOIN cteFecMenores 
         ON cteEntr.TiendaAsistencia = cteFecMenores.TiendaAsistencia
            AND cteEntr.FechaDia = cteFecMenores.FechaMenor
)

SELECT DISTINCT
   cteSuper.Supervisor,
   cteSuper.NombreSupervisor,
   cteSuper.Correo,
   cteSuper.TiendaNoSupervisada,
   cteSuper.NombreTienda,
   Multa = @viMultaTienda,
   cteSuper.CorreoPadre
FROM   cteSuper
   LEFT OUTER JOIN cteAsistencias
      ON cteAsistencias.TiendaAsistencia = cteSuper.TiendaNoSupervisada
WHERE 
    CASE WHEN DATEDIFF(MINUTE, @vdFechaHoraEntr, cteAsistencias.FechaDia)<=0 THEN 1 
    ELSE 0
    END = 0
ORDER BY cteSuper.Supervisor, cteSuper.TiendaNoSupervisada;

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSResumenCubrimiento]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: mayo de 2017
	Descripción: Inserta OUI, mejora performance
********************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSResumenCubrimiento] 
	@piCompaniaId		INT,		/*Compañia id*/
	@piPaisID			INT,		/*Pais id*/
	@piPlazaID			INT,		/*Plaza id*/
	@pdFechaInicial		DATETIME,	/*Fecha inicial*/
	@pdFechaFinal		DATETIME	/*Fecha final*/
AS
BEGIN
SET NOCOUNT ON
DECLARE @viCatPuestosPromotores		INT, 
		@viCatCanalesValidosCubre	INT,
		@viNegocioUnefon			INT,
		@viNegocioATT				INT,
		@viNegocioTelcel			INT,
		@viNegocioMovistar			INT,
		@viNegocioOUI				INT

DECLARE @vtAsistencia TABLE (fiPromovendedorId INT, fiAsistenciaId SMALLINT, fdFecha DATETIME, fiNoTienda SMALLINT, fiMinutos INT, fiEstatus SMALLINT)
DECLARE @vtTiendaValida TABLE (fiNoTienda INT, fiDistritoID INT, fiPaisID INT, fiPlazaID INT, fiJefeVtaID INT, fiCanalId INT)

SELECT	@viCatPuestosPromotores		= 7, 
		@viCatCanalesValidosCubre	= 35,
		@viNegocioUnefon			= 11,
		@viNegocioATT				= 47,
		@viNegocioTelcel			= 30,
		@viNegocioMovistar			= 31,
		@viNegocioOUI				= 107

INSERT INTO @vtAsistencia (fiPromovendedorId, fiAsistenciaId, fdFecha, fiNoTienda, fiMinutos, fiEstatus)
SELECT	fiPromovendedorId, fiAsistenciaId, fdFecha, fiNoTienda, fiMinutos, fiEstatus 
FROM	dbo.TATEControlAsistencia A WITH(NOLOCK) 
WHERE	a.fdFecha BETWEEN @pdFechaInicial AND @pdFechaFinal

INSERT INTO @vtTiendaValida (fiNoTienda, fiDistritoID, fiPaisID, fiPlazaID, fiJefeVtaID, fiCanalId)
SELECT	T.fiNoTienda, T.fiDistritoID, fiPaisID, fiPlazaID, fiJefeVtaID, fiCanalId
FROM	dbo.TCTETiendas T WITH(NOLOCK)
	INNER JOIN dbo.TCTEDetalleCatalogoGenerico can WITH(NOLOCK)
		ON can.fiItemId = T.fiCanalId
WHERE can.fiCatalogoId = @viCatCanalesValidosCubre
	AND T.fiActivo = 1
	AND (
		@piCompaniaId NOT IN (@viNegocioUnefon, @viNegocioATT, @viNegocioTelcel, @viNegocioMovistar, @viNegocioOUI) 
		OR (@piCompaniaId = @viNegocioUnefon AND flEsTiendaUne = 1) 
		OR (@piCompaniaId = @viNegocioATT AND flEsTiendaIus = 1)
		OR (@piCompaniaId = @viNegocioTelcel AND flEsTiendaTelcel = 1) 
		OR (@piCompaniaId = @viNegocioMovistar AND flEsTiendaMovi = 1)
		OR (@piCompaniaId = @viNegocioOUI AND flEsTiendaOUI = 1)
	)

SELECT	Distrito, 
		D.fcDescripcion AS DistritoDesc, 
		Tienda, 
		T.fcDescripcion AS TiendaDesc, 
		Fecha, 
		Cubrimiento 
FROM (
	SELECT Distrito, Tienda, Fecha, SUM(Cubrimiento) AS Cubrimiento 
	FROM
	(
		SELECT Distrito, Tienda, Fecha, COUNT(Tienda) AS Cubrimiento
		FROM (
			SELECT	T.fiDistritoID AS Distrito,
					T.fiNoTienda AS Tienda,
					dbo.FNTELSFechaST(A.fdFecha) AS Fecha,
					A.fiPromovendedorId AS PromoVendedor
			FROM	dbo.TATEPromovendedor P WITH(NOLOCK)
				INNER JOIN dbo.TCTEDetalleCatalogoGenerico DC WITH(NOLOCK) 
					ON DC.fiItemId = P.fiPuestoId 
				INNER JOIN @vtAsistencia A
					ON A.fiPromovendedorId = P.fiPromovendedorId
				INNER JOIN @vtTiendaValida T
					ON  T.fiNoTienda = A.fiNoTienda
			WHERE T.fiPaisID = @piPaisID
				AND T.fiPlazaID = @piPlazaID
				AND DC.fiCatalogoId = @viCatPuestosPromotores
				AND (
					(
						fiAsistenciaId = 1 
						AND (DATEPART(HOUR,FDFECHA) < (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1
					) 
					OR (
						DATEPART(HOUR,FDFECHA) = (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1) 
						AND DATEPART(MINUTE,FDFECHA) = 0))
					)
					OR (
						fiAsistenciaId = 4 
						AND DATEPART(HOUR,FDFECHA) >= (CONVERT(INTEGER, SUBSTRING(fcHorario, 7, 2)) - 1)
					)
				)
				--AND dbo.FNTELSFechaST(A.fdFecha) BETWEEN @pdFechaInicial AND @pdFechaFinal
				AND (
					fiCompaniaId = @piCompaniaId 
					OR 0 = @piCompaniaId
				)
			GROUP BY	T.fiDistritoID, 
						P.fiCompaniaId, 
						dbo.FNTELSFechaST(A.fdFecha), 
						T.fiNoTienda, 
						A.fiPromovendedorId
			HAVING (COUNT(A.fiPromovendedorId) = 2 OR (COUNT(A.fiPromovendedorId) = 1 
				AND NOT EXISTS (
					SELECT	fiPromovendedorId 
					FROM	@vtAsistencia
					WHERE fiAsistenciaId = 4 
						AND fiPromovendedorId = A.fiPromovendedorId 
						AND dbo.FNTELSFechaST(fdFecha) = dbo.FNTELSFechaST(GETDATE()))
						AND dbo.FNTELSFechaST(fdFecha) = dbo.FNTELSFechaST(GETDATE()))
					)
			) AS T1
			GROUP BY Distrito, Tienda, Fecha
			UNION
			SELECT	D.fiDistritoId AS Distrito,
					T.fiNoTienda AS Tienda,
					Fecha AS Fecha,
					CASE 
						WHEN Fecha <= dbo.FNTELSFechaST(GETDATE()) THEN 0 
						ELSE -1 
					END AS Cubrimiento
			FROM dbo.TCTEDistritales D WITH(NOLOCK) 
				INNER JOIN @vtTiendaValida T
					ON D.fiDistritoId = T.fiDistritoID 
						AND D.fiJefeVtaID = T.fiJefeVtaID 
						AND D.fiPlazaID = T.fiPlazaID 
						AND D.fiPaisID = T.fiPaisID
				INNER JOIN dbo.FNTELSTablaFechas(@pdFechaInicial, @pdFechaFinal) ON (1 = 1)
		    WHERE D.fiPaisID = @piPaisID
				AND D.fiPlazaID = @piPlazaID
		) AS T2
	GROUP BY Distrito, Tienda, Fecha
	) C
	INNER JOIN dbo.TCTEDistritales D WITH(NOLOCK) 
		ON D.fiDistritoId = C.Distrito
	INNER JOIN dbo.TCTETiendas T WITH(NOLOCK) 
		ON (T.fiNoTienda = C.Tienda 
			AND T.fiDistritoID = C.Distrito 
)
WHERE T.fiPlazaID = @piPlazaID 
	AND T.fiPaisID = @piPaisID
	AND D.fiPlazaID = @piPlazaID 
	AND D.fiPaisID = @piPaisID
ORDER BY Distrito, Tienda, Fecha	

SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSPromoPorTiendaConAsistencia]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************************************************
    Descripción: Consulta asistencias de promovendedores por tienda
    Fecha: abril 2017
    Responsable: Angel Israel López Rosales
    ----------------------------------------------
    Ultima modificación: Agrega OUI sin validar fiNoPromo
**************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSPromoPorTiendaConAsistencia]
	@piPais				SMALLINT,	/*Número del pais*/
	@piCanal			SMALLINT,	/*Número de canal*/
	@piNoTienda			INT			/*Número económico de la tienda donde se esta consultando la asistencia*/
AS
SELECT	P.fiPromovendedorId, 
		fiNoPromo, 
		fcNombre, 
		fcAPaterno, 
		fcAMaterno, 
		P.fiNoTienda, 
		fiCompaniaId
FROM dbo.TATEPromovendedor P WITH (NOLOCK) 
	INNER JOIN dbo.TATEControlAsistencia A  WITH (NOLOCK)
ON P.fiPromovendedorId = A.fiPromovendedorId 
WHERE p.fiPaisID = @piPais 
	AND P.fiNoTienda = @piNoTienda 
	AND P.fiNoPromo <> ''
	AND	A.fiAsistenciaId = 1 
	AND DATEDIFF(day,A.fdfecha,getdate()) = 0
	AND P.fiCompaniaId IN (11, 47)
UNION ALL
SELECT	P.fiPromovendedorId, 
		fiNoPromo = 
			CASE  
				WHEN p.fiNoPromo IS NULL THEN '0'
				WHEN LTRIM(RTRIM(p.fiNoPromo)) = '' THEN '0'
				ELSE p.fiNoPromo
			END, 
		fcNombre, 
		fcAPaterno, 
		fcAMaterno, 
		P.fiNoTienda, 
		fiCompaniaId
FROM dbo.TATEPromovendedor P WITH (NOLOCK) 
	INNER JOIN dbo.TATEControlAsistencia A  WITH (NOLOCK)
ON P.fiPromovendedorId = A.fiPromovendedorId 
WHERE p.fiPaisID = @piPais 
	AND P.fiNoTienda = @piNoTienda 
	AND	A.fiAsistenciaId = 1 
	AND DATEDIFF(day,A.fdfecha,getdate()) = 0
	AND P.fiCompaniaId = 107

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSGenteTienda]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************
	Responsable: Angel Israel López Rosales
	Fecha: mayo del 2017
	Descripción: Mejora performance
**********************************************************/
CREATE PROCEDURE [dbo].[PATELSGenteTienda] 
	@piCompaniaId		INT,
	@piPaisID			INT,
	@piPlazaID			INT,
	@piDistritoID		INT,
	@piNoTienda			INT,
	@pdFechaInicial		DATETIME,
	@pdFechaFinal		DATETIME
AS
BEGIN
SET NOCOUNT ON

DECLARE @vtExistenEnControlAsistencias TABLE ([Fecha] DATETIME)
DECLARE @vtAsistencia TABLE (fiPromovendedorId INT, fiAsistenciaId SMALLINT, fdFecha DATETIME, fiNoTienda SMALLINT, fiMinutos INT, fiEstatus SMALLINT)

INSERT INTO @vtAsistencia (fiPromovendedorId, fiAsistenciaId, fdFecha, fiNoTienda, fiMinutos, fiEstatus)
SELECT	fiPromovendedorId, fiAsistenciaId, fdFecha, fiNoTienda, fiMinutos, fiEstatus 
FROM	dbo.TATEControlAsistencia A WITH(NOLOCK) 
WHERE	CONVERT(DATETIME, CONVERT(VARCHAR(10), A.fdFecha, 103),103) BETWEEN @pdFechaInicial AND @pdFechaFinal

INSERT INTO @vtExistenEnControlAsistencias
SELECT DISTINCT FECHA FROM (
	SELECT	CONVERT(DATETIME, CONVERT(VARCHAR(10), A.fdFecha, 103),103) as FECHA, 
			A.fiPromovendedorId AS PromovendedorId
	FROM
		/*Join de vendedor con asistencia*/
		dbo.TATEPromovendedor P WITH(NOLOCK)
		INNER JOIN dbo.TCTEDetalleCatalogoGenerico DC WITH(NOLOCK) 
			ON DC.fiItemId = P.fiPuestoId 
		INNER JOIN @vtAsistencia A
			ON A.fiPromovendedorId = P.fiPromovendedorId/*Vendedor*/
			/*Join de vendedor o asistencia con tienda dependiendo el tipo de vendedor*/
		INNER JOIN dbo.TCTETiendas T WITH(NOLOCK)
				ON (((P.fiNoTienda = T.fiNoTienda AND P.fiTipoVendedorId <> 2 ) OR (A.fiNoTienda = T.fiNoTienda AND P.fiTipoVendedorId = 2)))
	WHERE (fiCompaniaId = @piCompaniaId /*Compañía*/ OR 0 = @piCompaniaId)
		AND DC.fiCatalogoId = 7
		AND T.fiPaisID = @piPaisID
		AND T.fiPlazaID = @piPlazaID
		AND T.fiDistritoID = @piDistritoID
		AND T.fiNoTienda = @piNoTienda 
		/*Horario*/
		AND (
				(
					fiAsistenciaId = 1 
					AND (
						DATEPART(HOUR,FDFECHA) < (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1) 
						OR (DATEPART(HOUR,FDFECHA) = (CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 1) 
					AND DATEPART(MINUTE,FDFECHA) = 0))
				) 
				OR (
					fiAsistenciaId = 4 
					AND DATEPART(HOUR,FDFECHA) >= (CONVERT(INTEGER, SUBSTRING(fcHorario, 7, 2)) - 1)
				)
		)
	/*Agrupación*/
	GROUP BY CONVERT(DATETIME, CONVERT(VARCHAR(10), A.fdFecha, 103),103), A.fiPromovendedorId
	HAVING (
			COUNT(A.fiPromovendedorId) = 2 
			OR (
					COUNT(A.fiPromovendedorId) = 1 
					AND NOT EXISTS (
						SELECT	fiPromovendedorId 
						FROM	@vtAsistencia 
						WHERE	fiAsistenciaId = 4 
							AND fiPromovendedorId = A.fiPromovendedorId 
							AND CONVERT(DATETIME, CONVERT(VARCHAR(10), fdFecha, 103),103) = CONVERT(DATETIME, CONVERT(VARCHAR(10), GETDATE(), 103),103)
					)
					AND CONVERT(DATETIME, CONVERT(VARCHAR(10), fdFecha, 103),103) = CONVERT(DATETIME, CONVERT(VARCHAR(10), GETDATE(), 103),103)
			)
	)
)AS Tabla

SELECT Fecha, 1 AS GenteEnTienda 
FROM @vtExistenEnControlAsistencias
UNION
SELECT	Fecha, 0 AS GenteEnTienda 
FROM	dbo.FNTELSTablaFechas(@pdFechaInicial, @pdFechaFinal)
WHERE Fecha NOT IN (
	SELECT Fecha FROM @vtExistenEnControlAsistencias
)
ORDER BY Fecha
				
SET NOCOUNT OFF				
	
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSJefe]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSJefe] 

	@piHijoId	INT
	
AS
BEGIN

SET NOCOUNT ON	

	SELECT J.fiPadreID AS IdEmpleado, 
		   RTRIM(fcNombre) + ' ' + RTRIM(fcAPaterno) + ' ' + RTRIM(fcAMaterno) AS Nombre,
		   P.fiPuestoId,
		   RTRIM(Pu.fcDescPuesto) AS fcDescPuesto,
		   RTRIM(P.fcEmail) AS fcEmail,
		   P.fdUltimoCambio,
		   P.fiCompaniaId,
		   -1 AS Nivel
     FROM TATEPromovendedor P WITH(NOLOCK) INNER JOIN TATEJerarquia J WITH(NOLOCK) ON (J.fiPadreID = P.fiPromovendedorId)
     INNER JOIN TCTEPuesto Pu WITH(NOLOCK) ON (P.fiPuestoId = Pu.fiPuestoId)
     WHERE J.fiHijoID = @piHijoId
	
SET NOCOUNT OFF		
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSCalendarioPenalizaciones]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************
   Descripción: Obtiene la asistencia de supervisores
   ----------------------------------------------------
   Responsable: Clemente Jonathan Navarrete Díaz
   Fecha: 27/02/2013
   Modificación: Se toman las asistencias de los supervisores
**********************************************************************************/
CREATE PROCEDURE [dbo].[PATELSCalendarioPenalizaciones] 

	@piNoTienda INT,
	@pdFechaInicial DATETIME,
	@pdFechaFinal DATETIME,
	@piCompaniaId INT
	
AS
BEGIN

SET NOCOUNT ON

	/*Tablas temporales para usarlas en el "SELECT" general*/
	DECLARE @TBL_CTRL_ASIST TABLE ([Fecha] DATETIME, [Penalizacion] INT)
	DECLARE @TBL_FECHAS TABLE ([Fecha] DATETIME)
	
	INSERT INTO @TBL_CTRL_ASIST([Fecha], [Penalizacion])
	SELECT F.Fecha, 
		   CASE WHEN DATEDIFF(MI,A.fdFecha,B.fdFecha) >= 60 THEN 0 
				WHEN DATEDIFF(MI,A.fdFecha,B.fdFecha) < 60  THEN 1
				ELSE 2 END AS Penalizacion
	FROM TATEControlAsistencia A WITH(NOLOCK)
		INNER JOIN TATEControlAsistencia B WITH(NOLOCK) ON A.fiPromovendedorId = B.fiPromovendedorId 
													AND dbo.FNTELSFechaST(A.fdFecha) = dbo.FNTELSFechaST(B.fdFecha) 
													AND A.fiNoTienda = B.fiNoTienda 
													AND B.fiAsistenciaId = 4
		INNER JOIN TATEPromovendedor P WITH(NOLOCK) ON A.fiPromovendedorId = P.fiPromovendedorId AND A.fiAsistenciaId = 1 AND P.fiPuestoId = 631
		INNER JOIN TATESupervisor S WITH (NOLOCK) ON A.fiPromovendedorId = S.fiPromovendedorId AND S.fiNoTienda = @piNoTienda
		INNER JOIN dbo.FNTELSTablaFechas(@pdFechaInicial,@pdFechaFinal) F ON (dbo.FNTELSFechaST(A.fdFecha) = F.Fecha)
	WHERE A.fiNoTienda = @piNoTienda
		AND P.fiCompaniaId = @piCompaniaId

		 
    INSERT INTO @TBL_FECHAS([Fecha])
    SELECT Fecha from dbo.FNTELSTablaFechas(@pdFechaInicial,@pdFechaFinal)
    
	SELECT DATEPART(DAY,TABLA2.Fecha) AS Dia, 
		   CASE WHEN TABLA2.Fecha <= dbo.FNTELSFechaST(GetDate()) 
		   THEN 
				CASE WHEN dbo.FNTELSFechaST(GETDATE()) <> TABLA2.Fecha THEN ISNULL(TABLA1.Penalizacion,2) 
				ELSE ISNULL(TABLA1.Penalizacion,1)  END
		   ELSE -1 END AS Penalizacion
	FROM @TBL_CTRL_ASIST TABLA1 RIGHT JOIN @TBL_FECHAS TABLA2 ON (TABLA1.Fecha = TABLA2.Fecha)
    ORDER BY 1
    
SET NOCOUNT OFF    
	
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSAsistenciasTienda]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: OCTUBRE de 2015
	Descripción: Consulta las asistencias de los promotores de una tienda dada
********************************************************************************/
CREATE PROCEDURE [dbo].[PATELSAsistenciasTienda]
(
	@piNoTienda INT /*Tienda a consultar*/
)
AS

SET NOCOUNT ON

DECLARE @vdFechaHoy		DATETIME /*Fecha de hoy*/,
		@vdFechaNuevo	DATETIME /*Fecha de mañana*/

SET @vdFechaHoy = dbo.FNTELSFechaST(GETDATE());
SET @vdFechaNuevo = @vdFechaHoy + 1;

WITH tblPromos(PromovendedorId, Nombre, APaterno, AMaterno, Empresa, Puesto)
AS
(
	SELECT 
		P.fiPromovendedorId, 
		fcNombre,
		fcAPaterno,
		fcAMaterno,
		C.fcCompaniaDesc,
		fiPuestoId
	FROM dbo.TATEPromovendedor P WITH(NOLOCK)
		INNER JOIN dbo.TCTECompania C WITH(NOLOCK) 
			ON C.fiCompaniaId = P.fiCompaniaId
	WHERE P.fiNoTienda = @piNoTienda
		AND P.fiStatus IN (1, 3)
),
tblPuesto (PuestoID)
AS
(
	SELECT fiItemId FROM TCTEDetalleCatalogoGenerico cat WITH(NOLOCK) WHERE fiCatalogoId = 7
),
tblAsisEntrada (fiPromovendedorId, Movimiento)
AS
(
	SELECT	fiPromovendedorId, Movimiento = CAST(1 AS BIT)
	FROM	dbo.TATEControlAsistencia A WITH(NOLOCK) 
	WHERE	fiNoTienda = @piNoTienda
		AND A.fdFecha BETWEEN @vdFechaHoy AND @vdFechaNuevo
		AND A.fiAsistenciaId = 1
)
,
tblAsisComida (fiPromovendedorId, Movimiento)
AS
(
	SELECT	fiPromovendedorId, Movimiento = CAST(1 AS BIT)
	FROM	dbo.TATEControlAsistencia A WITH(NOLOCK) 
	WHERE	fiNoTienda = @piNoTienda
		AND A.fdFecha BETWEEN @vdFechaHoy AND @vdFechaNuevo
		AND A.fiAsistenciaId = 2
),
tblAsisRegreso (fiPromovendedorId, Movimiento)
AS
(
	SELECT	fiPromovendedorId, Movimiento = CAST(1 AS BIT)
	FROM	dbo.TATEControlAsistencia A WITH(NOLOCK) 
	WHERE	fiNoTienda = @piNoTienda
		AND A.fdFecha BETWEEN @vdFechaHoy AND @vdFechaNuevo
		AND A.fiAsistenciaId = 3
),
tblAsisSalida (fiPromovendedorId, Movimiento)
AS
(
	SELECT	fiPromovendedorId, Movimiento = CAST(1 AS BIT)
	FROM	dbo.TATEControlAsistencia A WITH(NOLOCK) 
	WHERE	fiNoTienda = @piNoTienda
		AND A.fdFecha BETWEEN @vdFechaHoy AND @vdFechaNuevo
		AND A.fiAsistenciaId = 4
)

SELECT DISTINCT 
	promo.PromovendedorId, 
	promo.Nombre,
	promo.APaterno,
	promo.AMaterno,
	promo.Empresa,
	Entrada = ISNULL(AsiEnt.Movimiento, CAST(0 AS BIT)),
	Comida = ISNULL(AsiCom.Movimiento, CAST(0 AS BIT)),
	Regreso = ISNULL(AsiReg.Movimiento, CAST(0 AS BIT)),
	Salida = ISNULL(AsiSal.Movimiento, CAST(0 AS BIT))
FROM tblPromos promo 
	INNER JOIN tblPuesto pu 
		ON pu.PuestoID = promo.Puesto
	LEFT OUTER JOIN tblAsisEntrada AsiEnt
		ON AsiEnt.fiPromovendedorId = promo.PromovendedorId
	LEFT OUTER JOIN tblAsisComida AsiCom
		ON AsiCom.fiPromovendedorId = promo.PromovendedorId
	LEFT OUTER JOIN tblAsisRegreso AsiReg
		ON AsiReg.fiPromovendedorId = promo.PromovendedorId
	LEFT OUTER JOIN tblAsisSalida AsiSal
		ON AsiSal.fiPromovendedorId = promo.PromovendedorId
ORDER BY promo.PromovendedorId

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSAsistenciaOUI]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSAsistenciaOUI] (
	@pdFecha DATETIME /*Fecha de consulta*/
)
AS
WITH T1 (FCZONE, FIIDSTATUS, FCSTATUS, FNCOUNT, FDDATE)
AS
(
	SELECT  j.fcDescripcion AS FCZONE,
			CASE 
				WHEN DATEDIFF(hh, MIN(CA.fdFecha), MAX(CA.fdFecha)) >= 9 THEN '1'
				ELSE '2'
			END AS FIIDSTATUS,
			CASE 
				WHEN DATEDIFF(hh,MIN(CA.fdFecha),MAX(CA.fdFecha)) >= 9 THEN 'Horario Cumplido'
				ELSE 'Horario NO Cumplido'
			END AS FCSTATUS,
			1 AS FNCOUNT,
			CAST(CA.fdFecha as date) AS FDDATE		
	FROM dbo.TATEPromovendedor P WITH (NOLOCK) 
		INNER JOIN dbo.TCTETiendas T WITH (NOLOCK) 
			ON P.fiNoTienda = T.fiNoTienda 
		INNER JOIN dbo.TCTEPlazas pl WITH(NOLOCK) 
			ON Pl.fiPlazaID = t.fiPlazaID 
				AND pl.fiPaisID = t.fiPaisID
		INNER JOIN dbo.TCTEJefeVentas j WITH(NOLOCK) 
			ON j.fiJefeVtaID = t.fiJefeVtaID 
				AND j.fiPaisID = t.fiPaisID 
				AND j.fiPlazaID = pl.fiPlazaID
		INNER JOIN dbo.TATEControlAsistencia CA  WITH (NOLOCK)
			ON P.fiPromovendedorId = CA.fiPromovendedorId
	WHERE CA.fdFecha >= '20170101'
		AND p.fiCompaniaId = 107
	GROUP BY	P.fiPromovendedorId, 
				(rtrim(ltrim(P.fcNombre))+' '+rtrim(ltrim(P.fcAPaterno))+' '+rtrim(ltrim(P.fcAMaterno))) , 
				P.fiNoTienda, 
				T.fcDescripcion ,
				j.fcDescripcion,
				CAST(CA.fdFecha as date) , (DATENAME(yyyy,CA.fdFecha)+DATENAME(wk,CA.fdFecha-1))
)
SELECT	FCZONE,
		FIIDSTATUS,
		FCSTATUS,
		SUM(FNCOUNT) FNCOUNT,
		FDDATE	
FROM	T1
WHERE	FDDATE =  @pdFecha
GROUP BY FCZONE,
		 FIIDSTATUS,
		 FCSTATUS,
	     FDDATE	
ORDER BY 1,4
GO
/****** Object:  StoredProcedure [dbo].[PATELSAsistencia]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*******************************************************************************************
   Responsable: Angel Israel López Rosales
   Fecha: Octubre de 2015
   Descripción: Agrega validación para que solo consulte los promotores activos
********************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSAsistencia]
	@piNoTienda			SMALLINT, /*Número económico de la tienda donde se esta consultando la asistencia*/
	@piPromovendedorId	INT       /*Número de promovendedor del cual se quiere consultar las asistencias del día actual*/
AS
DECLARE
   @viRtn             INT,
   @vcMensaje         VARCHAR(200),
   @vcNombre          char(40),
   @vcAPaterno        char(40),
   @vcAMaterno        char(40),
   @vdFecEntrada      datetime,
   @vdFecSalidaComida datetime, 
   @vdFechaRegComida  datetime,
   @vdFechaSalida     datetime,
   @viCompaniaId      INT,
   @viPuesto          INT

IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId = @piPromovendedorId AND fiStatus IN (1, 3))
BEGIN
   SELECT
      @vcNombre = fcNombre,
      @vcAPaterno = fcAPaterno, 
      @vcAMaterno = fcAMaterno, 
      @viCompaniaId = fiCompaniaId,
      @viPuesto = fiPuestoId
   FROM DBO.TATEPromovendedor WITH (NOLOCK) 
   WHERE fiPromovendedorId=@piPromovendedorId
   IF (dbo.fnEsPuestoJerarquia(@piPromovendedorId))=0
   BEGIN
      SELECT @vdFecEntrada=fdFecha      FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND DATEDIFF(DAY,fdFecha,GETDATE())=0 AND fiAsistenciaId=1
      SELECT @vdFecSalidaComida=fdFecha FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND DATEDIFF(DAY,fdFecha,GETDATE())=0 AND fiAsistenciaId=2
      SELECT @vdFechaRegComida=fdFecha  FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND DATEDIFF(DAY,fdFecha,GETDATE())=0 AND fiAsistenciaId=3
      SELECT @vdFechaSalida=fdFecha     FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND DATEDIFF(DAY,fdFecha,GETDATE())=0 AND fiAsistenciaId=4
   END
   ELSE IF (dbo.fnEsPuestoJerarquia(@piPromovendedorId))=1
   BEGIN
      SELECT @vdFecEntrada=fdFecha      FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND DATEDIFF(DAY,fdFecha,GETDATE())=0 AND fiAsistenciaId=1 AND fiNoTienda=@piNoTienda
      SELECT @vdFecSalidaComida=fdFecha FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND DATEDIFF(DAY,fdFecha,GETDATE())=0 AND fiAsistenciaId=2 AND fiNoTienda=@piNoTienda
      SELECT @vdFechaRegComida=fdFecha  FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND DATEDIFF(DAY,fdFecha,GETDATE())=0 AND fiAsistenciaId=3 AND fiNoTienda=@piNoTienda
      SELECT @vdFechaSalida=fdFecha     FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND DATEDIFF(DAY,fdFecha,GETDATE())=0 AND fiAsistenciaId=4 AND fiNoTienda=@piNoTienda
   END
END
ELSE
BEGIN
   SET @vcMensaje = 'ESTE NUMERO DE PROMOVENDEDOR NO EXISTE O NO ESTÁ ACTIVO.'
   GOTO ERRORES
END

SELECT	
       @piNoTienda AS fiNoTienda,
       @vcNombre AS fcNombre, 
       @vcAPaterno AS fcAPaterno, 
       @vcAMaterno AS fcAMaterno, 
       RTRIM(LTRIM(CONVERT(CHAR,@vdFecEntrada,103))) + ' '+ RTRIM(LTRIM(CONVERT(CHAR,@vdFecEntrada,108))) AS fdFecEntrada,
       RTRIM(LTRIM(CONVERT(CHAR,@vdFecSalidaComida,103))) + ' '+ RTRIM(LTRIM(CONVERT(CHAR,@vdFecSalidaComida,108))) AS fdFecSalidaComida,
       RTRIM(LTRIM(CONVERT(CHAR,@vdFechaRegComida,103))) + ' '+ RTRIM(LTRIM(CONVERT(CHAR,@vdFechaRegComida,108))) AS fdFechaRegComida,
       RTRIM(LTRIM(CONVERT(CHAR,@vdFechaSalida,103))) + ' '+ RTRIM(LTRIM(CONVERT(CHAR,@vdFechaSalida,108))) AS fdFechaSalida,
       @viCompaniaId AS fiCompaniaId,
       @viPuesto AS fiPuesto
RETURN 0
ERRORES:
  RAISERROR(@vcMensaje, 18, 1)
  RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[PATELSPromoVendedorNom]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************************
   Descripción objeto: Consulta promovendedores por nombre
   ------------------------------------------------------------------------------------------
   Última modificación: Devuelve id del padre y curp
   Responsable: Angel Israel López Rosales
   Fecha: agosto del 2019
*****************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSPromoVendedorNom]
   @pcNombre           char(40), /*Nombre del promendedor*/
   @pcAPaterno         char(40), /*Apellido paterno del promovendedor*/
   @pcAMaterno         char(40)  /*Apellido materno del promovendedor*/
AS

SET NOCOUNT ON 
BEGIN TRY
DECLARE
   @viRtn	  			INT,
   @vcMensaje     		VARCHAR(200),
   @viPadreId			INT
   
   IF EXISTS (
      SELECT fiPromovendedorId 
      FROM   [DBO].[TATEPromovendedor] WITH(NOLOCK) 
      WHERE  fcNombre LIKE RTRIM(LTRIM(@pcNombre)) + '%'  
         AND fcAPaterno LIKE RTRIM(LTRIM(@pcAPaterno)) + '%' 
         AND fcAMaterno LIKE RTRIM(LTRIM(@pcAMaterno)) + '%' )
   BEGIN
      SELECT TOP 10 
         fiPromovendedorId, 
         fcNombre = LTRIM(RTRIM(fcNombre)), 
         fcAPaterno = LTRIM(RTRIM(fcAPaterno)), 
         fcAMaterno = LTRIM(RTRIM(fcAMaterno)), 
         CASE 
            WHEN fiStatus=4 THEN 2
            ELSE fiStatus 
         END AS fiStatus,
		 fiNoTienda,
		 fiCanalId,
		 fiPaisID,
		 fiCompaniaId, 
		 fcEmail = LTRIM(RTRIM(fcEmail)),
		 fcCURP = LTRIM(RTRIM(fcCURP)),
		 fiDiaDescanso,
		 fcFechNacimiento = LTRIM(RTRIM(fcFechNacimiento)),
		 fcHorario = LTRIM(RTRIM(fcHorario)),
		 fcJefeInme = LTRIM(RTRIM(fcJefeInme)),
		 fiNoPromo,
		 fiPuestoId,
		 fcRFC = LTRIM(RTRIM(fcRFC)),
		 fcTelefonoCel = LTRIM(RTRIM(fcTelefonoCel)),
		 fcTelefono = LTRIM(RTRIM(fcTelefono)),
		 fcTelefonoRec = LTRIM(RTRIM(fcTelefonoRec)),
		 fiTipoVendedorId,
		 fiPadreId = CASE WHEN j.fiPadreID IS NULL THEN 0 ELSE j.fiPadreID END
      FROM [DBO].[TATEPromovendedor] p WITH(NOLOCK) 
		LEFT OUTER JOIN dbo.TATEJerarquia j WITH(NOLOCK) 
		ON j.fiHijoID = p.fiPromovendedorId
      WHERE  fcNombre   LIKE RTRIM(LTRIM(@pcNombre)) + '%'  
         AND fcAPaterno LIKE RTRIM(LTRIM(@pcAPaterno)) + '%' 
         AND fcAMaterno LIKE RTRIM(LTRIM(@pcAMaterno)) + '%'
	END
	ELSE 
	BEGIN
	    RAISERROR('NO SE ENCONTRO NINGUNA COINCIDENCIA PARA LOS DATOS PROPORCIONADOS.', 18, 1)
	END
END TRY
BEGIN CATCH
   SET @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje, 18, 1)
   RETURN -1
END CATCH

SET NOCOUNT ON 
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSPromoVendedorID]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Agrega inserción de CURP y devuelve id del padre
	-------------------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel Lopez Rosales
	Fecha: agosto de 2019	
***********************************************************************************/
CREATE PROCEDURE [dbo].[PATELSPromoVendedorID]
	@piNoTienda			SMALLINT,  /*Número económico Tienda */
	@piPromovendedorId	INT,       /*Número promovendedor*/
	@plValidar			BIT = 0    /*Validar tienda, 1=Valida tienda, 0=No valida tienda*/
AS
DECLARE
   @viRtn             INT,
   @vcMensaje         VARCHAR(200),
   @viNoTienda        SMALLINT,
   @viTipoVendedorId  smallint,
   @vcNombre          char(40),
   @vcAPaterno        char(40),
   @vcAMaterno        char(40),
   @vcRFC             char(20),
   @vcFechNacimiento  char(10),
   @vcTelefono        char(10),
   @vcTelefonoCel     char(10),
   @vcTelefonoRec     char(10),
   @viCompaniaId      INT,
   @vcHorario         char(8),
   @viDiaDescanso     tinyint,
   @viStatus          tinyint,
   @vcJefeInme        char(60),
   @vcEmail           char(60),
   @viNoPromo         char(10),
   @vdFecRegistro     datetime, 
   @vdFecBaja         datetime, 
   @vdUltimoCambio    datetime,
   @viPuestoId        int,
   @vlHuellaValida		BIT,
   @vcCURP				VARCHAR(18),
   @viPadreId			INT

BEGIN TRY
	IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId =  @piPromovendedorId )
	BEGIN
		-- REGRESAMOS EL NUMERO DE PROMOVENDEDOR QUE SE GENERO.
      SELECT @viNoTienda       = fiNoTienda,
             @viTipoVendedorId = fiTipoVendedorId,
             @vcNombre         = LTRIM(RTRIM(fcNombre)),
             @vcAPaterno       = LTRIM(RTRIM(fcAPaterno)),
             @vcAMaterno       = LTRIM(RTRIM(fcAMaterno)),
             @vcRFC            = LTRIM(RTRIM(fcRFC)),
             @vcFechNacimiento = LTRIM(RTRIM(fcFechNacimiento)),
             @vcTelefono       = LTRIM(RTRIM(fcTelefono)),
             @vcTelefonoCel    = LTRIM(RTRIM(fcTelefonoCel)),
             @vcTelefonoRec    = LTRIM(RTRIM(fcTelefonoRec)),
             @viCompaniaId     = fiCompaniaId, 
             @vcHorario        = LTRIM(RTRIM(fcHorario)), 
             @viDiaDescanso    = fiDiaDescanso, 
             @viStatus         = fiStatus, 
             @vcJefeInme       = LTRIM(RTRIM(fcJefeInme)), 
             @vcEmail          = LTRIM(RTRIM(fcEmail)), 
             @viNoPromo        = fiNoPromo, 
             @vdFecRegistro    = fdFecRegistro,
             @vdUltimoCambio   = fdUltimoCambio,
             @viPuestoId		=	fiPuestoId,
			 @vlHuellaValida	= flHuellaValida,
			 @vcCURP			= LTRIM(RTRIM(fcCURP)),
			 @viPadreId			= CASE WHEN j.fiPadreID IS NULL THEN 0 ELSE j.fiPadreID END
      FROM DBO.TATEPromovendedor p WITH(NOLOCK)
		LEFT OUTER JOIN dbo.TATEJerarquia j WITH(NOLOCK) 
		ON j.fiHijoID = p.fiPromovendedorId
      WHERE fiPromovendedorId=@piPromovendedorId
      
	  IF(@viStatus IN(0, 2))
	  BEGIN 
         IF EXISTS (SELECT fiPromovendedorId FROM dbo.TATEBajaPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId = @piPromovendedorId)
         BEGIN
            SELECT @vdFecBaja = MAX(fdFecBaja) FROM dbo.TATEBajaPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId = @piPromovendedorId 
         END
	  END
      IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId =  @piPromovendedorId and fiStatus=4)
      BEGIN
         SET @viStatus=2
      END
   END
   ELSE
   BEGIN
      RAISERROR('ESTE NUMERO DE PROMOVENDEDOR NO EXISTE.',18,1)
   END
   IF (@plValidar=1)
   BEGIN
      IF (@viNoTienda<>@piNoTienda)
      BEGIN
         RAISERROR('ESTE PROMOVENDEDOR NO PERTENECE A ESTA TIENDA.',18,1)
      END
      IF ( @viStatus NOT IN  (1,0,3) )
      BEGIN
         RAISERROR('ESTE PROMOVENDEDOR NO ESTA ACTIVO.',18,1)
      END
   END
   SELECT
      @viNoTienda						AS fiNoTienda,
      @viTipoVendedorId					AS fiTipoVendedorId,
      LTRIM(RTRIM(@vcNombre))			AS fcNombre,
      LTRIM(RTRIM(@vcAPaterno))			AS fcAPaterno,
      LTRIM(RTRIM(@vcAMaterno))			AS fcAMaterno,
      LTRIM(RTRIM(@vcRFC))				AS fcRFC,
      LTRIM(RTRIM(@vcFechNacimiento))	AS fcFechNacimiento,
      LTRIM(RTRIM(@vcTelefono))			AS fcTelefono,
      LTRIM(RTRIM(@vcTelefonoCel))		AS fcTelefonoCel,
	  LTRIM(RTRIM(@vcTelefonoRec))		AS fcTelefonoRec,
      @viCompaniaId						AS fiCompaniaId,
      LTRIM(RTRIM(@vcHorario))			AS fcHorario, 
      @viDiaDescanso    AS fiDiaDescanso,
      @viStatus         AS fiStatus,
      LTRIM(RTRIM(@vcJefeInme))       AS fcJefeInme,
   LTRIM(RTRIM(@vcEmail))          AS fcEmail,
      @viNoPromo        AS fiNoPromo,
      @vdFecRegistro    AS fdFecRegistro,
      @vdFecBaja        AS fdFecBaja,
      @vdUltimoCambio   AS fdUltimoCambio,
      @viPuestoId       AS fiPuestoId,
	  @vlHuellaValida	AS flHuellaValida,
	  LTRIM(RTRIM(@vcCURP))			AS fcCURP,
	  @viPadreId		AS fiPadreId
END TRY
BEGIN CATCH
   SET @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje, 18, 1)
END CATCH

RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUPromovendedores]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************
   Descripción: Actualiza los campos de TATEPromovendedor
   -------------------------------------------------------------------------
   Fecha: julio 2019
   Modifico: Angel Israel López Rosales 
****************************************************************************/
CREATE PROCEDURE [dbo].[PATELUPromovendedores]
	@piPromovendedorId       int,
	@pcEmpModifica           CHAR(30),
	@piNoTienda              int     =NULL,
	@piTipoVendedorId        smallint=NULL,
	@pcNombre                char(40)=NULL,
	@pcAPaterno              char(40)=NULL,
	@pcAMaterno              char(40)=NULL,
	@pcRFC                   char(20)=NULL,
	@pcFechNacimiento        char(10)=NULL,
	@pcTelefono              char(10)=NULL,
	@pcTelefonoCel           char(10)=NULL,
	@pcTelefonoRec           char(10)=NULL,
	@piCompaniaId            int     =NULL,
	@pcHorario               char(8) =NULL,
	@piDiaDescanso           tinyint =NULL,
	@piStatus                tinyint =NULL,
	@pcJefeInme              char(60)=NULL,
	@pcEmail                 char(60)=NULL,
	@pcNoPromo               char(10)=NULL,
	@pdFecRegistro           datetime=NULL,
	@pdUltimoCambio          datetime=NULL,
	@piPuestoId              int     =NULL,
	@piPaisID                int     =NULL,
	@piCanalId               int     =NULL,
	@pcCURP					VARCHAR(18) = NULL
AS

SET NOCOUNT ON

DECLARE @vcMensajeError VARCHAR(255),@vcEmpModifica CHAR(30)

BEGIN TRY
   SELECT @piNoTienda         = CASE WHEN @piNoTienda       IS NULL THEN fiNoTienda       ELSE @piNoTienda       END,
          @piTipoVendedorId   = CASE WHEN @piTipoVendedorId IS NULL THEN fiTipoVendedorId ELSE @piTipoVendedorId END,
          @pcNombre           = CASE WHEN @pcNombre         IS NULL THEN fcNombre         ELSE @pcNombre         END,
          @pcAPaterno         = CASE WHEN @pcAPaterno       IS NULL THEN fcAPaterno       ELSE @pcAPaterno       END,
          @pcAMaterno         = CASE WHEN @pcAMaterno       IS NULL THEN fcAMaterno       ELSE @pcAMaterno       END,
          @pcRFC              = CASE WHEN @pcRFC            IS NULL THEN fcRFC            ELSE @pcRFC            END,
          @pcFechNacimiento   = CASE WHEN @pcFechNacimiento IS NULL THEN fcFechNacimiento ELSE @pcFechNacimiento END,
          @pcTelefono         = CASE WHEN @pcTelefono       IS NULL THEN fcTelefono       ELSE @pcTelefono       END,
          @pcTelefonoCel      = CASE WHEN @pcTelefonoCel    IS NULL THEN fcTelefonoCel    ELSE @pcTelefonoCel    END,
          @pcTelefonoRec      = CASE WHEN @pcTelefonoRec    IS NULL THEN fcTelefonoRec    ELSE @pcTelefonoRec    END,
          @piCompaniaId       = CASE WHEN @piCompaniaId     IS NULL THEN fiCompaniaId     ELSE @piCompaniaId     END,
          @pcHorario          = CASE WHEN @pcHorario        IS NULL THEN fcHorario        ELSE @pcHorario        END,
          @piDiaDescanso      = CASE WHEN @piDiaDescanso    IS NULL THEN fiDiaDescanso    ELSE @piDiaDescanso    END,
          @piStatus           = CASE WHEN @piStatus         IS NULL THEN fiStatus         ELSE @piStatus         END,
          @pcJefeInme         = CASE WHEN @pcJefeInme       IS NULL THEN fcJefeInme       ELSE @pcJefeInme       END,
          @pcEmail            = CASE WHEN @pcEmail          IS NULL THEN fcEmail          ELSE @pcEmail          END,
          @pcNoPromo          = CASE WHEN @pcNoPromo        IS NULL THEN fiNoPromo        ELSE @pcNoPromo        END,
          @pdFecRegistro      = CASE WHEN @pdFecRegistro    IS NULL THEN fdFecRegistro    ELSE @pdFecRegistro    END,
          @pdUltimoCambio     = CASE WHEN @pdUltimoCambio   IS NULL THEN fdUltimoCambio   ELSE @pdUltimoCambio   END,
          @piPuestoId         = CASE WHEN @piPuestoId       IS NULL THEN fiPuestoId       ELSE @piPuestoId       END,
          @piPaisID           = CASE WHEN @piPaisID         IS NULL THEN fiPaisID    ELSE @piPaisID         END,
          @piCanalId          = CASE WHEN @piCanalId        IS NULL THEN fiCanalId        ELSE @piCanalId        END,
		  @pcCURP             = CASE WHEN @pcCURP           IS NULL THEN fcCURP           ELSE @pcCURP           END
   FROM   [dbo].[TATEPromovendedor] WITH(NOLOCK)
   WHERE  fiPromovendedorId=@piPromovendedorId
   EXEC [DBO].[PATELUPromoVendedor]
        @piPromovendedorId  = @piPromovendedorId,
        @piNoTienda         = @piNoTienda,
        @piTipoVendedorId   = @piTipoVendedorId,
        @pcNombre           = @pcNombre,
        @pcAPaterno         = @pcAPaterno,
        @pcAMaterno         = @pcAMaterno,
        @pcRFC              = @pcRFC,
        @pcFechNacimiento   = @pcFechNacimiento,
        @pcTelefono         = @pcTelefono,
        @piCompaniaId       = @piCompaniaId,
        @pcHorario          = @pcHorario,
        @piDiaDescanso      = @piDiaDescanso,
        @pcJefeInme         = @pcJefeInme,
        @piStatus           = @piStatus,
        @pcEmpNo            = @pcEmpModifica,
        @pcEmail            = @pcEmail,
        @piNoPromo          = @pcNoPromo,
        @pcTelefonoCel      = @pcTelefonoCel,
        @pcTelefonoRec      = @pcTelefonoRec,
        @piPuestoId         = @piPuestoId,
		@pcCURP				= @pcCURP
END TRY
BEGIN CATCH
   SET @vcMensajeError=ERROR_MESSAGE()
   RAISERROR(@vcMensajeError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUReciclaFolios]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*--------------------------------------------------------------------------------------------------------------------------------
Responsable: Angel Israel López Rosales
Fecha: 		 OCTUBRE 2011
Descripcion  Manejo por pais
--------------------------------------------------------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[PATELUReciclaFolios]
	@piPaisId INT,
	@piRanMin INT,
	@piRanMax INT
AS
DECLARE
	@viRtn	  			INT,
	@vcMensaje     		VARCHAR(200),
	--@viRanMin			INT, 
	--@viRanMax			INT,
	@viDiasR			INT,
	@viRecInactivo		INT,
	@viCompania			INT,
	@vimaxCons			INT	,
	@viActivaReciclado	INT
	
Declare @vtTable1 table
(	
	fiPromovendedorId int,fdUltimoLogin	datetime,fdUltimoCambio	datetime
)	

--SELECT @viRanMin = CONVERT(INT,ISNULL(fcPrmVal,0)) FROM DBO.TCTEParametro WITH (NOLOCK) WHERE fiPrmId = 2
--SELECT @viRanMax = CONVERT(INT,ISNULL(fcPrmVal,0)) FROM DBO.TCTEParametro WITH (NOLOCK) WHERE fiPrmId = 3
SELECT @viDiasR = CONVERT(INT,ISNULL(fcPrmVal,15)) FROM DBO.TCTEParametro WITH (NOLOCK) WHERE fiPrmId = 4
SELECT @viRecInactivo = CONVERT(INT,ISNULL(fcPrmVal,0)) FROM DBO.TCTEParametro WITH (NOLOCK) WHERE fiPrmId = 5
SELECT @viActivaReciclado = CONVERT(INT,ISNULL(fcPrmVal,0)) FROM DBO.TCTEParametro WITH (NOLOCK) WHERE fiPrmId = 8
set @viCompania=30

SET  NOCOUNT ON
BEGIN TRAN 

IF @viActivaReciclado>0
BEGIN 
			
	/*---------------------RECICLADO PROMOVENDEDORES DADOS DE BAJA----------------------------------------------------------------*/
		IF EXISTS(SELECT fiPromovendedorId FROM dbo.TATEPromovendedor WITH(NOLOCK) WHERE fiStatus=2 AND fiPromovendedorId >= @piRanMin AND fiPromovendedorId <= @piRanMax AND fiPaisID = @piPaisId)
		BEGIN 
				INSERT INTO DBO.TATEIdPromReciclados (fiPromovendedorId,fdFecha,fiPaisID)
				SELECT t1.fiPromovendedorId,GETDATE() as fdFecha, fiPaisID from DBO.TATEPromovendedor t1 WITH(NOLOCK) WHERE  fiStatus=2 AND fiPromovendedorId >= @piRanMin AND fiPromovendedorId <= @piRanMax
				AND fiPaisID = @piPaisId
				AND fiPromovendedorId NOT IN (SELECT fiPromovendedorId FROM TATEIdPromReciclados WITH(NOLOCK) WHERE fiPaisID= @piPaisId)
				IF @@ERROR<>0 
				BEGIN 
					SET @vcMensaje = 'NO SE PUDO GUARDAR LOS NUMEROS DE PROMOVENDEDORES EN TATEIdPromReciclados'
					GOTO ERRORESTRAN
				END
				
				UPDATE dbo.TATEPromovendedor SET fiStatus=4 WHERE fiStatus=2 AND fiPromovendedorId >= @piRanMin AND fiPromovendedorId <= @piRanMax AND fiPaisID = @piPaisId
				IF @@ERROR<>0 
				BEGIN 
					SET @vcMensaje = 'NO SE PUDO ACTUALIZAR LA TABLA TATEPromovendedor '
					GOTO ERRORESTRAN
				END
		END
	
		IF (@viRecInactivo>0)
		BEGIN 
			/*---------------------RECICLADO PROMOVENDEDORES INACTIVOS----------------------------------------------------------------*/
			-----------Busca Promovendedores inactivos y sin cambios por 15 dias
			
			INSERT @vtTable1
			SELECT a.fiPromovendedorId,fdUltimoLogin,fdUltimoCambio  FROM
			(
			SELECT TP.fiPromovendedorId,MAX(fdFecha) AS fdUltimoLogin
			FROM dbo.TATEControlAsistencia TA inner join DBO.TATEPromovendedor TP on TA.fiPromovendedorId=TP.fiPromovendedorId
			WHERE fiAsistenciaId=1 and TP.fiPromovendedorId >= @piRanMin AND TP.fiPromovendedorId <= @piRanMax and TP.fiStatus<>4
			and TP.fiCompaniaId = @viCompania AND TP.fiPaisID=@piPaisId
			GROUP BY TP.fiPromovendedorId
			) a INNER JOIN
			(
			SELECT TP.fiPromovendedorId, MAX (fdCambio) AS fdUltimoCambio FROM 
			DBO.TATEPromovendedor TP inner join DBO.TATEPromovendedorHist TPH on TP.fiPromovendedorId=TPH.fiPromovendedorId
			INNER JOIN DBO.TATEControlAsistencia TA on TP.fiPromovendedorId=TA.fiPromovendedorId
			WHERE TP.fiPromovendedorId >= @piRanMin AND TP.fiPromovendedorId <= @piRanMax and TP.fiStatus<>4
			AND tp.fiPaisID = @piPaisId
			and TP.fiCompaniaId =@viCompania
			GROUP BY TP.fiPromovendedorId
			) b  on a.fiPromovendedorId=b.fiPromovendedorId
			WHERE DATEDIFF(DAY,A.fdUltimoLogin,GETDATE())>=@viDiasR AND DATEDIFF(DAY,b.fdUltimoCambio,GETDATE())>=@viDiasR
			--select * from @vtTable1
		--------------------------------Busca Promovendedores que ya fueron reciclados-------------------------------------------------------------------------------
			INSERT INTO DBO.TATEIdPromReciclados (fiPromovendedorId,fdFecha,fiPaisID)
			SELECT t1.fiPromovendedorId,GETDATE(), @piPaisId as fdFecha  from @vtTable1 t1 WHERE fiPromovendedorId
			NOT IN (SELECT fiPromovendedorId FROM TATEIdPromReciclados WHERE fiPaisID = @piPaisId)
			IF @@ERROR<>0 
			BEGIN 
				SET @vcMensaje = 'NO SE PUDO GUARDAR LOS NUMEROS DE PROMOVENDEDORES EN TATEIdPromReciclados'
				GOTO ERRORESTRAN
			END

			IF EXISTS(SELECT fiPromovendedorId FROM @vtTable1)
					BEGIN 	
							UPDATE dbo.TATEPromovendedor SET fiStatus=4	
							FROM DBO.TATEPromovendedor TP 
								INNER JOIN @vtTable1 VT ON TP.fiPromovendedorId=VT.fiPromovendedorId
							WHERE fiPaisID=@piPaisId
							IF @@ERROR<>0 
							BEGIN 
								SET @vcMensaje = 'NO SE PUDO ACTUALIZAR LA TABLA TATEPromovendedor '
								GOTO ERRORESTRAN
							END
					END 

		END

END 

COMMIT TRAN
SET  NOCOUNT OFF		
RETURN 0

ERRORESTRAN:	
  ROLLBACK TRAN
  RAISERROR(@vcMensaje, 18, 1)
  SET  NOCOUNT OFF
  RETURN -1
	
ERRORES:
  RAISERROR(@vcMensaje, 18, 1)
  SET  NOCOUNT OFF
  RETURN -1
GO
/****** Object:  StoredProcedure [dbo].[PATHIHistoriaAsistencia]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* ************************************************************************************************
   DescripciÃ³n:  Almacena las asistencias de los promovendedores 
   ----------------------------------------------------------
   Responsable: Arely HernÃ¡ndez Maldonado
   Fecha: 13/03/2018
   ModificaciÃ³n : 
************************************************************************************************* */

CREATE PROCEDURE [dbo].[PATHIHistoriaAsistencia]
AS

SET NOCOUNT ON

DECLARE @vcError VARCHAR(255)

SET XACT_ABORT ON

BEGIN TRY

   BEGIN TRANSACTION 
      INSERT INTO dbo.THTEAsistenciaH 
      (
			fiPromovendedorId, 
			fcName, 
			fiPuesto,
			fcDescPuesto,
			fcTipoVendedorDesc,
			fiNoTienda,
			fcDescTienda,
			fcDescZona, 
			fiWeek, 
			fdFecha,
			fcEvento,
			fdFechaInserted 
      )
		SELECT  
			P.FIPROMOVENDEDORID , 
			(RTRIM(LTRIM(P.FCNOMBRE))+' '+RTRIM(LTRIM(P.FCAPATERNO))+' '+RTRIM(LTRIM(P.FCAMATERNO))) , 
			U.FIPUESTOID,
			U.FCDESCPUESTO ,
			RTRIM(LTRIM(TV.FCTIPOVENDEDORDESC)) ,        
			CA.FINOTIENDA , 
			T.FCDESCRIPCION ,
			J.FCDESCRIPCION,
			DATENAME(yyyy,CA.fdFecha) + RIGHT(REPLICATE('0', 2) + DATENAME(wk,CA.fdFecha-1),2) SEMANA, 
			CA.FDFECHA,
			TMA.FCASISTENCIADESC EVENTO,
			GETDATE()
		FROM TATEPROMOVENDEDOR P WITH (NOLOCK) 
		INNER JOIN TATECONTROLASISTENCIA CA  WITH (NOLOCK) ON P.FIPROMOVENDEDORID = CA.FIPROMOVENDEDORID
		INNER JOIN TCTEMOVASISTENCIA TMA WITH(NOLOCK) ON CA.FIASISTENCIAID = TMA.FIASISTENCIAID
		INNER JOIN TCTETIENDAS T  WITH (NOLOCK) ON CA.FINOTIENDA = T.FINOTIENDA 
		INNER JOIN DBO.TCTEPLAZAS PL WITH(NOLOCK) ON PL.FIPLAZAID = T.FIPLAZAID AND PL.FIPAISID = T.FIPAISID
		INNER JOIN DBO.TCTEJEFEVENTAS J WITH(NOLOCK) ON J.FIJEFEVTAID = T.FIJEFEVTAID AND J.FIPAISID = T.FIPAISID AND J.FIPLAZAID = PL.FIPLAZAID
		INNER JOIN TCTEPUESTO U WITH (NOLOCK) ON  P.FIPUESTOID = U.FIPUESTOID
		INNER JOIN TCTETIPOVENDEDOR TV WITH (NOLOCK)ON P.FITIPOVENDEDORID = TV.FITIPOVENDEDORID
		WHERE P.FICOMPANIAID= 107
			AND DATENAME(YYYY,CA.fdFecha) + RIGHT(REPLICATE('0', 2) + DATENAME(ISOWK,CA.fdFecha),2) = DATENAME(YYYY,GETDATE()-1)+ RIGHT(REPLICATE('0', 2) + DATENAME(ISOWK,GETDATE()-1),2)
		;
   COMMIT TRANSACTION
   
END TRY

BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcError,18,1)
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConBajasDefinitivas]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConBajasDefinitivas]
AS
SET NOCOUNT ON

DECLARE @viDias INT

SET @viDias = 21


IF EXISTS (SELECT fcPrmVal FROM dbo.TCTEParametro WITH(NOLOCK) WHERE fiPrmId = 21)
BEGIN
	SELECT @viDias = fcPrmVal FROM dbo.TCTEParametro WITH(NOLOCK) WHERE fiPrmId = 21
END

SELECT DISTINCT Total.fiPromovendedorId, 
	flProcesada = 0, 
	fiTipo = 1, 
	fiCompaniaId 
FROM (   
	SELECT Promo.fiPromovendedorId, 
		Reg = Promo.fdFecRegistro,
		Promo.fiCompaniaId,
		FechaMaxima = MAX(ISNULL(A.fdFecha,DATEADD(DAY,-(@viDias + 1),GETDATE())))   
	FROM (
		SELECT	fiPromovendedorId,
				fdFecRegistro,
				fiCompaniaId       
		FROM   dbo.TATEPromovendedor WITH(NOLOCK)      
		WHERE  DATEDIFF(DAY,fdFecRegistro,GETDATE()) > @viDias
			AND fiPaisID=1
			AND fiStatus<>2
			AND fiPuestoId NOT IN (631,632,633,634,635,104,106)
			AND fiPromovendedorId NOT IN (121001)
		) AS Promo   
	LEFT OUTER JOIN 
		(
			SELECT fiPromovendedorId,fdFecha
			FROM   dbo.TATEControlAsistencia WITH(NOLOCK)
			WHERE  fiAsistenciaId=1
	) AS A   
	ON A.fiPromovendedorId=Promo.fiPromovendedorId   
GROUP BY Promo.fiPromovendedorId,Promo.fdFecRegistro,Promo.fiCompaniaId) AS Total 
WHERE DATEDIFF(DAY,Total.FechaMaxima,GETDATE()) > @viDias 
ORDER BY Total.fiPromovendedorId

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConInformacionOUI]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------
------------------------------------------------
---Responsable: Israel Toledo Gómez
---Fecha: Junio 2017
---Descripción: Consulta información de tiendas y promovendedores OUI
------------------------------------------------

CREATE PROCEDURE [dbo].[spConInformacionOUI]										
					 						
AS

declare @vTTiendas as table (fiCantidad int, fiJefeVtaID int , fcDescripcion  varchar(100))

declare @vTTiendasOUI as table (fiCantidad int, fiJefeVtaID int )

declare @vTTiendasOUIPromo as table (fiCantidad int, fiJefeVtaID int )

declare @vTTiendasOUIPromoAsignado as table (fiCantidad int, fiJefeVtaID int )

declare @vTPromoDist as table (fiNoTienda int, fiPaisID int , fiCanalId  int)

-- Todas las tiendas
insert into @vTTiendas
select count(*) , T.fiJefeVtaID , J.fcDescripcion 
from TCTETiendas  T with (nolock) inner join TCTEJefeVentas J with (nolock) on T.fiJefeVtaID = J.fiJefeVtaID and T.fiPaisID = J.fiPaisID and T.fiPlazaID = J.fiPlazaID
where T.fiPaisID = 1 and T.fiActivo = 1 and T.fiPlazaID = 186336
group by T.fiJefeVtaID, J.fcDescripcion  
order by T.fiJefeVtaID

-- Tiendas OUI
insert into @vTTiendasOUI
select count(*) , T.fiJefeVtaID 
from TCTETiendas  T with (nolock) inner join TCTEJefeVentas J with (nolock) on T.fiJefeVtaID = J.fiJefeVtaID and T.fiPaisID = J.fiPaisID and T.fiPlazaID = J.fiPlazaID
where T.fiPaisID = 1 and T.fiActivo = 1 and T.fiPlazaID = 186336 and T.flEsTiendaOUI = 1
group by T.fiJefeVtaID, J.fcDescripcion  
order by T.fiJefeVtaID

-- Tiendas OUI con promotor
insert into @vTTiendasOUIPromo 
select count(*) , T.fiJefeVtaID 
from TCTETiendas  T with (nolock) inner join TCTEJefeVentas J with (nolock) on T.fiJefeVtaID = J.fiJefeVtaID and T.fiPaisID = J.fiPaisID and T.fiPlazaID = J.fiPlazaID
inner join TATETotalPromotoresTienda TP with (nolock) on T.fiNoTienda = TP.fiNoTienda and T.fiPaisID = TP.fiPaisID and T.fiCanalId = TP.fiCanalId 
where T.fiPaisID = 1 and T.fiActivo = 1 and T.fiPlazaID = 186336 and T.flEsTiendaOUI = 1
group by T.fiJefeVtaID, J.fcDescripcion  
order by T.fiJefeVtaID


insert into @vTPromoDist
select DISTINCT fiNoTienda, fiPaisID , fiCanalId   
from TATEPromotoresTienda

-- Tiendas OUI con promotor ya asignado
insert into @vTTiendasOUIPromoAsignado
select count(*) , T.fiJefeVtaID 
from TCTETiendas  T with (nolock) inner join TCTEJefeVentas J with (nolock) on T.fiJefeVtaID = J.fiJefeVtaID and T.fiPaisID = J.fiPaisID and T.fiPlazaID = J.fiPlazaID
inner join TATETotalPromotoresTienda TP with (nolock) on T.fiNoTienda = TP.fiNoTienda and T.fiPaisID = TP.fiPaisID and T.fiCanalId = TP.fiCanalId 
inner join @vTPromoDist V on  T.fiNoTienda = V.fiNoTienda and T.fiPaisID = V.fiPaisID and T.fiCanalId = V.fiCanalId 
where T.fiPaisID = 1 and T.fiActivo = 1 and T.fiPlazaID = 186336 and T.flEsTiendaOUI = 1
group by T.fiJefeVtaID, J.fcDescripcion  
order by T.fiJefeVtaID


select T.fiJefeVtaID, T.fcDescripcion, T.fiCantidad as TotaldeTiendas, O.fiCantidad as TiendasOUI, P.fiCantidad as TiendasConPromotor, A.fiCantidad as TiendasPromoAsignado, (T.fiCantidad-O.fiCantidad) as TiendasSinOUI
from @vTTiendas T inner join @vTTiendasOUI  O on T.fiJefeVtaID = O.fiJefeVtaID 
inner join @vTTiendasOUIPromo  P  on T.fiJefeVtaID = P.fiJefeVtaID 
inner join @vTTiendasOUIPromoAsignado A on T.fiJefeVtaID = A.fiJefeVtaID 

SET NOCOUNT OFF
	RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConHijosJerarquia]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Consulta colaboradores del empleado dado
	-----------------------------------------------------
	Última modificación: creación del stored procedure
	Responsable: Angel Israel Lopez Rosales
	Fecha: agosto de 2019	
************************************************************************************/
CREATE PROCEDURE [dbo].[spConHijosJerarquia]
(
	@piPadreID INT
)
AS
SELECT	p.fiPromovendedorId, j.fiHijoID, Nombre = LTRIM(RTRIM(i.fcNombre)) + ' ' + LTRIM(RTRIM(i.fcAPaterno)) + ' ' + LTRIM(RTRIM(i.fcAMaterno))
FROM	dbo.TATEPromovendedor p WITH(NOLOCK)
	INNER JOIN dbo.TATEJerarquia j WITH(NOLOCK)
		ON j.fiPadreID = p.fiPromovendedorId
	INNER JOIN dbo.TATEPromovendedor i WITH(NOLOCK)
		ON i.fiPromovendedorId = j.fiHijoID
WHERE	p.fiPromovendedorId = @piPadreID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConTiendasSupervisor]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
	Descripción: Devuelve las tiendas supervisadas de um empleado
	-------------------------------------------------------------
	Última modificación: Devuelve la descripción de plaza, jefe ventas y distrito
	Responsable: Angel Israel Lopez Rosales
	Fecha: agosto de 2019
***********************************************************************************/
CREATE PROCEDURE [dbo].[spConTiendasSupervisor]
(
	@piSupervidorId INT
)
AS
SELECT	s.fiPromovendedorId, 
		t.fiNoTienda, 
		t.fcDescripcion, 
		t.fiActivo, 
		t.fiCanalId,
		t.fiDistritoID, 
		t.fiJefeVtaID, 
		t.fiPaisID,
		t.fiPlazaID,
		t.flEsTiendaIus,
		t.flEsTiendaMovi,
		t.flEsTiendaOUI,
		t.flEsTiendaTelcel,
		t.flEsTiendaUne,
		fcPlazaDesc = p.fcDescripcion,
		fcJefeVentasDesc = j.fcDescripcion,
		fcDistritoDesc = d.fcDescripcion
FROM	dbo.TATESupervisor s WITH(NOLOCK)
	INNER JOIN dbo.TCTETiendas t WITH(NOLOCK)
		ON t.fiNoTienda = s.fiNoTienda
	INNER JOIN dbo.TCTEPlazas p WITH(NOLOCK)
		ON p.fiPlazaID = t.fiPlazaID
	INNER JOIN dbo.TCTEJefeVentas j WITH(NOLOCK)
		ON j.fiPlazaID = t.fiPlazaID 
			AND j.fiJefeVtaID = t.fiJefeVtaID
	INNER JOIN dbo.TCTEDistritales d WITH(NOLOCK)
		ON d.fiDistritoId = t.fiDistritoID
			AND d.fiJefeVtaID = t.fiJefeVtaID
			AND d.fiPlazaID = t.fiPlazaID
			AND d.fiPaisID = t.fiPaisID
WHERE	s.fiPromovendedorId = @piSupervidorId
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConTiendaPromotorOUI]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------
------------------------------------------------
---Responsable: Israel Toledo Gómez
---Fecha: Junio 2017
---Descripción: Consulta información de tiendas y promovendedores OUI
------------------------------------------------

CREATE PROCEDURE [dbo].[spConTiendaPromotorOUI]	
(
	@piNoTienda INT
)									
					 						
AS

select T.fiNoTienda, T.fcDescripcion, T.flEsTiendaOUI,TP.fiTotalPromotores, DP.*
from TCTETiendas  T with (nolock) inner join TCTEJefeVentas J with (nolock) on T.fiJefeVtaID = J.fiJefeVtaID and T.fiPaisID = J.fiPaisID and T.fiPlazaID = J.fiPlazaID
left outer join TATETotalPromotoresTienda TP with (nolock) on T.fiNoTienda = TP.fiNoTienda and T.fiPaisID = TP.fiPaisID and T.fiCanalId = TP.fiCanalId 
left outer join TATEPromotoresTienda DP with (nolock) on T.fiNoTienda = DP.fiNoTienda and T.fiPaisID = DP.fiPaisID and T.fiCanalId = DP.fiCanalId 
where T.fiPaisID = 1 and T.fiActivo = 1 and T.fiPlazaID = 186336 and T.fiNoTienda=@piNoTienda

	
SET NOCOUNT OFF
	RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spUpdPromotoresTienda]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------
---Responsable: Israel Toledo Gómez
---Fecha: Julio 2017
---Descripción: Cambia de tienda un Promotor
------------------------------------------------
CREATE PROCEDURE [dbo].[spUpdPromotoresTienda]	
(
	@piPromotorId INT,
	@piTiendaNueva INT
)									
					 						
AS

DECLARE		@viTiendaA		INT, --Datos de tienda Actual					
			@viPaisA		INT,
			@viCanalA		INT,
			@viTiendaC		INT, --Datos de tienda nueva
			@viPaisC		INT,
			@viCanalC		INT,
			@viNoCompania	INT,
			@vcMensaje		VARCHAR(1000)

BEGIN TRY
	SELECT @viTiendaA = fiNoTienda, @viNoCompania = fiCompaniaId FROM dbo.TATEPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId=@piPromotorId
	SELECT @viPaisA=fiPaisID,@viCanalA=fiCanalId FROM dbo.TCTETiendas WITH (NOLOCK) WHERE fiNoTienda=@viTiendaA

	IF EXISTS(SELECT fiNoTienda FROM dbo.TCTETiendas WITH (NOLOCK) WHERE fiNoTienda=@piTiendaNueva)
		BEGIN        
			SELECT @viTiendaC=fiNoTienda,@viPaisC=fiPaisID,@viCanalC=fiCanalId FROM dbo.TCTETiendas WITH (NOLOCK) WHERE fiNoTienda=@piTiendaNueva
			EXEC dbo.PATELUPromovendedores
				@piPromovendedorId=@piPromotorId,
				@pcEmpModifica='999990',
				@piNoTienda=@viTiendaC,
				@piPaisID=@viPaisC,
				@piCanalId=@viCanalC
		END

	UPDATE dbo.TATETotalPromotoresTienda set fiTotalPromotores=fiTotalPromotores+1 WHERE fiNoTienda=@piTiendaNueva
	IF ((SELECT fiTotalPromotores FROM TATETotalPromotoresTienda WITH (NOLOCK) WHERE fiNoTienda=@viTiendaA) > 0)
		UPDATE dbo.TATETotalPromotoresTienda set fiTotalPromotores=fiTotalPromotores-1 WHERE fiNoTienda=@viTiendaA

	DELETE FROM dbo.TATEPromotoresTienda WHERE fiPromovendedorId = @piPromotorId
	INSERT INTO dbo.TATEPromotoresTienda VALUES (@piPromotorId, @viTiendaC, @viPaisC, @viCanalC, @viNoCompania)
END TRY
	
BEGIN CATCH
	DECLARE @viNumeroError INT = ERROR_NUMBER()
	IF (@viNumeroError = 547)
	BEGIN
		SET @vcMensaje = 'No se pudo terminar el proceso. Hay un conflicto con una llave foránea. '
	END
	ELSE
	BEGIN
		SET @vcMensaje = 'No se pudo terminar el proceso. Número de error=' + CAST(ERROR_NUMBER() AS VARCHAR(10)) + ', Mensaje: ' + ERROR_MESSAGE()
	END
	RAISERROR(@vcMensaje, 18, 1)
	RETURN -1
END CATCH

SET NOCOUNT OFF
	RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spInsAsistenciaDia]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**************************************************************************************
	Descripción: Inserta asistencia del día
**************************************************************************************/
CREATE PROCEDURE [dbo].[spInsAsistenciaDia]
	@pdFecha	DATETIME
AS
SET NOCOUNT ON
BEGIN TRY
	DECLARE @vdFinal			DATETIME, 
			@viContador			INT, 
			@viMaximo			INT, 
			@viMaximoNulos		INT, 
			@viContadorNulos	INT, 
			@viPromoNulo		INT,
			@viEntraNulos		INT
	SELECT	@vdFinal = @pdFecha + 1

	DECLARE @vtAsistencia TABLE (
		fiId				INT IDENTITY(1, 1),
		fiPromovendedorId	INT, 
		Fecha				DATETIME, 
		fdFecha				DATETIME,
		fiAsistenciaId		SMALLINT, 
		fiNoTienda			SMALLINT,
		fcNombre			VARCHAR(100), 
		fcAPaterno			VARCHAR(100),
		fcAMaterno			VARCHAR(100),
		fcCompaniaDesc		VARCHAR(100),
		NombreTienda		VARCHAR(100),
		Hora				TIME,
		Puesto				VARCHAR(100),
		JefeInmediato		VARCHAR(60),
		FechaRegistro		DATETIME,
		FechaBaja			DATETIME
		)
	DECLARE @vtAsistenciaUpd1 TABLE (
		fiId				INT IDENTITY(1, 1),
		fiPromovendedorId	INT, 
		Fecha				DATETIME, 
		fdFecha				DATETIME,
		fiAsistenciaId		SMALLINT, 
		fiNoTienda			SMALLINT,
		fcNombre			VARCHAR(100), 
		fcAPaterno			VARCHAR(100),
		fcAMaterno			VARCHAR(100),
		fcCompaniaDesc		VARCHAR(100),
		NombreTienda		VARCHAR(100),
		Hora				TIME,
		Puesto				VARCHAR(100),
		JefeInmediato		VARCHAR(60),
		FechaRegistro		DATETIME,
		FechaBaja			DATETIME
		)
	DECLARE @vtAsistenciaUpd2 TABLE (
		fiId				INT IDENTITY(1, 1),
		fiPromovendedorId	INT, 
		Fecha				DATETIME, 
		fdFecha				DATETIME,
		fiAsistenciaId		SMALLINT, 
		fiNoTienda			SMALLINT,
		fcNombre			VARCHAR(100), 
		fcAPaterno			VARCHAR(100),
		fcAMaterno			VARCHAR(100),
		fcCompaniaDesc		VARCHAR(100),
		NombreTienda		VARCHAR(100),
		Hora				TIME,
		Puesto				VARCHAR(100),
		JefeInmediato		VARCHAR(60),
		FechaRegistro		DATETIME,
		FechaBaja			DATETIME
		)
	DECLARE @vtHistoricoConsec TABLE (
		fiId				INT	IDENTITY(1, 1),
		fiPromovendedorId	INT, 
		fdFecRegistro		SMALLDATETIME, 
		fiConsec			INT, 
		fdCambio			SMALLDATETIME, 
		fcCompaniaId		VARCHAR(40), 
		fdFecBaja			DATETIME, 
		fdFecha				DATETIME,
		fcNombre			VARCHAR(40),
		fcAPaterno			VARCHAR(40),
		fcAMaterno			VARCHAR(40),
		fistatus			INT,
		fcPuesto			VARCHAR(100),
		JefeInmediato		VARCHAR(60)
		)
	DECLARE @vtTablaNulos TABLE (fiId INT IDENTITY(1, 1), fiPromovendedorId INT)

	SET @viEntraNulos = 0

	INSERT INTO @vtAsistencia (
		fiPromovendedorId, 
		Fecha,
		fdFecha, 
		fiAsistenciaId, 
		fiNoTienda,
		Hora, 
		NombreTienda
		)
	SELECT	DISTINCT a.fiPromovendedorId, 
			Fecha = CONVERT(DATETIME, CONVERT(VARCHAR(10), a.fdFecha, 103),103), 
			a.fdFecha, 
			a.fiAsistenciaId, 
			a.fiNoTienda, 
			a.fdFecha,
			t.fcDescripcion
	FROM	dbo.TATEControlAsistencia a WITH(NOLOCK) 
		LEFT OUTER JOIN TCTETiendas t WITH(NOLOCK) 
			ON t.fiNoTienda = a.fiNoTienda
	WHERE	fdFecha BETWEEN @pdFecha AND @vdFinal;

	IF EXISTS (
		SELECT	FechaDia 
		FROM	dbo.TATEControlAsistenciaCifras 
		WHERE	FechaDia = @pdFecha)
	BEGIN
		DELETE	dbo.TATEControlAsistenciaCifras 
		WHERE	FechaDia = @pdFecha
	END

	INSERT INTO dbo.TATEControlAsistenciaCifras (FechaDia, NumeroEntradas, NumeroAsistenciaHistorico, HoraInicio)
	SELECT	FechaDia = Fecha, NumeroEntradas = COUNT(*), NumeroAsistenciaHistorico = 0, GETDATE()
	FROM	@vtAsistencia WHERE fiAsistenciaId = 1
	GROUP BY Fecha;

	WITH tbHistorico 
		(
			PromoId, 
			Tienda, 
			Estatus, 
			Nombre, 
			Paterno, 
			Materno, 
			Compania, 
			FechaRegistro, 
			FechaBaja, 
			FechaUltimoCambio, 
			Puesto, 
			Consec,
			EmpleadoNo,
			JefeInmediato
			) 
	AS 
		(
			SELECT  
				h.fiPromovendedorId,
				h.fiNoTienda,
				h.fiStatus,    
				h.fcNombre,    
				h.fcAPaterno,    
				h.fcAMaterno,    
				c.fcCompaniaDesc,   
				h.fdFecRegistro,    
				CONVERT(DATETIME, RIGHT('0000' + CAST(DATEPART(YYYY, h.fdCambio) AS VARCHAR(4)), 4) + '-' + RIGHT('00' + CAST(DATEPART(MM, h.fdCambio) AS VARCHAR(2)), 2) + '-' + RIGHT('00' + CAST(DATEPART(DD, h.fdCambio) AS VARCHAR(2)), 2) + ' ' + RIGHT('00' + CAST(DATEPART(HOUR, h.fdCambio) AS VARCHAR(2)), 2) + ':' + RIGHT('00' + CAST(DATEPART(MINUTE, h.fdCambio) AS VARCHAR(2)), 2)),
				CONVERT(DATETIME, RIGHT('0000' + CAST(DATEPART(YYYY, h.fdCambio) AS VARCHAR(4)), 4) + '-' + RIGHT('00' + CAST(DATEPART(MM, h.fdCambio) AS VARCHAR(2)), 2) + '-' + RIGHT('00' + CAST(DATEPART(DD, h.fdCambio) AS VARCHAR(2)), 2) + ' ' + RIGHT('00' + CAST(DATEPART(HOUR, h.fdCambio) AS VARCHAR(2)), 2) + ':' + RIGHT('00' + CAST(DATEPART(MINUTE, h.fdCambio) AS VARCHAR(2)), 2)),
				p.fcDescPuesto,   
				h.fiConsec,
				h.fiNoPromo,
				h.fcJefeInme 
			FROM TATEPromovendedor t with(nolock) 
				INNER JOIN TATEPromovendedorHist h with(nolock) 
					on t.fiPromovendedorId = h.fiPromovendedorId 
				INNER JOIN TCTECompania c WITH (NOLOCK)  
					ON h.fiCompaniaId = c.fiCompaniaId 
				INNER JOIN dbo.TCTEPuesto p WITH(NOLOCK) 
					ON P.fiPuestoId = h.fiPuestoId 
		), 
	tblFiltro 
		(
			PromoId, 
			FechaReg, 
			Consec
		) 
	AS ( 
			SELECT	t.fiPromovendedorId,  
					fdFecRegistro = CONVERT(CHAR, h.fdFecRegistro, 100), 
					fiConsec = MAX(fiConsec)  
			FROM	TATEPromovendedor t with(nolock)    
				INNER JOIN TATEPromovendedorHist h with(nolock)       
					on t.fiPromovendedorId = h.fiPromovendedorId 
			GROUP BY t.fiPromovendedorId, CONVERT(CHAR, h.fdFecRegistro, 100) 
		), 
	tblUltimo (PromoId, Consec) 
	AS 
	( 
		SELECT	h.fiPromovendedorId, 
				fiConsec = MAX(fiConsec)  
		FROM	dbo.TATEPromovendedorHist h with(nolock)  
		GROUP BY h.fiPromovendedorId 
	)

	INSERT INTO @vtHistoricoConsec (fiPromovendedorId, fistatus, fcNombre, fcAPaterno, fcAMaterno, fcCompaniaId, fdFecRegistro, fdCambio, fiConsec, fcPuesto, fdFecBaja, JefeInmediato)
	SELECT DISTINCT
		h.PromoId, 
		Estatus = 
		CASE 
			WHEN u.PromoId IS NULL THEN 2  
			ELSE Estatus 
		END, 
		Nombre, 
		Paterno, 
		Materno, 
		Compania, 
		FechaRegistro = CONVERT(CHAR, FechaRegistro, 120), 
		FechaUltimoCambio, 
		h.Consec,
		h.Puesto,
		h.FechaBaja,
		h.JefeInmediato 
	FROM tbHistorico h 
		INNER JOIN tblFiltro f  
			ON h.PromoId = f.PromoId 
				AND h.Consec = f.Consec 
		LEFT OUTER JOIN tblUltimo u 
			ON u.Consec = f.Consec 
				AND u.PromoId = f.PromoId
	ORDER BY h.Consec 

	UPDATE  @vtHistoricoConsec 
	SET		fdCambio = CASE  
				WHEN fdCambio <= @vdFinal AND fistatus IN (1, 3) THEN @vdFinal + 1
				WHEN fdCambio BETWEEN @pdFecha AND @vdFinal AND fistatus IN (1, 3) THEN @vdFinal + 1
				ELSE fdCambio
			END
	FROM	@vtHistoricoConsec h
	
	UPDATE	c
	SET		c.fdFecha = CONVERT(DATETIME, CONVERT(VARCHAR(10), c.fdCambio, 103),103),
			c.fdFecBaja = 
				CASE 
					WHEN fistatus IN (1, 3) THEN @vdFinal
					WHEN fistatus IN (0, 2) THEN c.fdCambio
					ELSE c.fdCambio
				END
	FROM	@vtHistoricoConsec c

	INSERT INTO @vtAsistenciaUpd1 (
		fcNombre, 
		fcAPaterno, 
		fcAMaterno, 
		fcCompaniaDesc, 
		Puesto, 
		JefeInmediato, 
		FechaRegistro, 
		FechaBaja, 
		fdFecha, 
		Fecha, 
		fiAsistenciaId, 
		fiNoTienda, 
		fiPromovendedorId, 
		Hora, 
		NombreTienda
	)
	SELECT	fcNombre = c.fcNombre
			,fcAPaterno = c.fcAPaterno
			,fcAMaterno = c.fcAMaterno
			,fcCompaniaDesc = c.fcCompaniaId
			,Puesto = c.fcPuesto
			,JefeInmediato = c.JefeInmediato
			,FechaRegistro = c.fdFecRegistro
			,FechaBaja = c.fdFecBaja,
			a.fdFecha,
			a.Fecha,
			a.fiAsistenciaId,
			a.fiNoTienda,
			a.fiPromovendedorId,
			a.Hora,
			a.NombreTienda
	FROM	@vtAsistencia a
		LEFT OUTER JOIN @vtHistoricoConsec c
			ON a.fiPromovendedorId = c.fiPromovendedorId
	WHERE a.fdFecha BETWEEN c.fdFecRegistro AND fdFecBaja

	IF EXISTS (		
		SELECT a.fiPromovendedorId FROM @vtAsistenciaUpd1 a
		WHERE a.fcNombre IS NULL AND a.fcAPaterno IS NULL AND a.fcAMaterno IS NULL
			AND Fecha = @pdFecha
	)
	BEGIN
		INSERT INTO @vtTablaNulos (fiPromovendedorId)
		SELECT a.fiPromovendedorId FROM @vtAsistencia a
		WHERE a.fcNombre IS NULL AND a.fcAPaterno IS NULL AND a.fcAMaterno IS NULL
			AND Fecha = @pdFecha
		SELECT @viMaximoNulos = MAX(fiId) FROM @vtTablaNulos
		SET @viContadorNulos = 1
		WHILE(@viContadorNulos <= @viMaximoNulos)
		BEGIN
			SELECT @viPromoNulo = fiPromovendedorId FROM @vtTablaNulos WHERE fiId = @viContadorNulos
			BEGIN TRY
				EXEC dbo.PATELUPromovendedores @piPromovendedorId = @viPromoNulo, @pcEmpModifica = '999990'
				SET @viContadorNulos = @viContadorNulos + 1
			END TRY
			BEGIN CATCH
			END CATCH
		END
		INSERT INTO @vtAsistenciaUpd2 (
			fcNombre, 
			fcAPaterno, 
			fcAMaterno, 
			fcCompaniaDesc, 
			Puesto, 
			JefeInmediato, 
			FechaRegistro, 
			FechaBaja, 
			fdFecha, 
			Fecha, 
			fiAsistenciaId, 
			fiNoTienda, 
			fiPromovendedorId, 
			Hora, 
			NombreTienda
		)
		SELECT	fcNombre = c.fcNombre
				,fcAPaterno = c.fcAPaterno
				,fcAMaterno = c.fcAMaterno
				,fcCompaniaDesc = c.fcCompaniaId
				,Puesto = c.fcPuesto
				,JefeInmediato = c.JefeInmediato
				,FechaRegistro = c.fdFecRegistro
				,FechaBaja = c.fdFecBaja,
				a.fdFecha,
				a.Fecha,
				a.fiAsistenciaId,
				a.fiNoTienda,
				a.fiPromovendedorId,
				a.Hora,
				a.NombreTienda
		FROM	@vtAsistencia a
			LEFT OUTER JOIN @vtHistoricoConsec c
				ON a.fiPromovendedorId = c.fiPromovendedorId
		WHERE a.fdFecha BETWEEN c.fdFecRegistro AND fdFecBaja

		SET @viEntraNulos = 1
	END
				
	IF EXISTS (SELECT Fecha FROM dbo.TATEAsistenciasHistorico WHERE Fecha = @pdFecha)
		DELETE dbo.TATEAsistenciasHistorico WHERE Fecha = @pdFecha

	IF(@viEntraNulos = 0)
	BEGIN
		INSERT INTO dbo.TATEAsistenciasHistorico (
			Fecha, NumPromovendedor, NumTienda, Nombre, ApellidoPaterno, ApellidoMaterno, NombreTienda,
			NombreEmpresa, Puesto, HoraEntrada, HoraSalidaComer, RegresoComer, Salida, MinutosEntradaSalida,
			MinutosComida, JefeInmediato, FechaRegistro, FechaBaja
		)
		SELECT	Fecha = ent.Fecha
				,NumPromovendedor = ent.fiPromovendedorId
				,NumTienda = ent.fiNoTienda
				,Nombre = ent.fcNombre
				,ApellidoPaterno = ent.fcAPaterno
				,ApellidoMaterno = ent.fcAMaterno
				,NombreTienda = ent.NombreTienda
				,NombreEmpresa = ent.fcCompaniaDesc
				,Puesto = ent.Puesto
				,HoraEntrada = ent.Hora
				,HoraSalidaComer = sco.Hora
				,RegresoComer = rco.Hora
				,Salida = sal.Hora
				,MinutosEntradaSalida = DATEDIFF(MI, ent.Hora, sal.Hora)
				,MinutosComida = DATEDIFF(MI, sco.Hora, rco.Hora), ent.JefeInmediato
				,FechaRegistro = ent.FechaRegistro
				,FechaBaja = ent.FechaRegistro
		FROM	@vtAsistenciaUpd1 ent
			LEFT OUTER JOIN @vtAsistenciaUpd1 sco
				ON ent.fiPromovendedorId = sco.fiPromovendedorId
					AND ent.Fecha = sco.Fecha
					AND ent.fiNoTienda = sco.fiNoTienda
					AND sco.fiAsistenciaId = 2
			LEFT OUTER JOIN @vtAsistenciaUpd1 rco
				ON ent.fiPromovendedorId = rco.fiPromovendedorId
					AND ent.Fecha = rco.Fecha
					AND ent.fiNoTienda = rco.fiNoTienda
					AND rco.fiAsistenciaId = 3
			LEFT OUTER JOIN @vtAsistenciaUpd1 sal
				ON ent.fiPromovendedorId = sal.fiPromovendedorId
					AND ent.Fecha = sal.Fecha
					AND ent.fiNoTienda = sal.fiNoTienda
					AND sal.fiAsistenciaId = 4
		WHERE ent.fiAsistenciaId = 1
	END
	ELSE IF(@viEntraNulos = 1)
	BEGIN
		INSERT INTO dbo.TATEAsistenciasHistorico (
			Fecha, NumPromovendedor, NumTienda, Nombre, ApellidoPaterno, ApellidoMaterno, NombreTienda,
			NombreEmpresa, Puesto, HoraEntrada, HoraSalidaComer, RegresoComer, Salida, MinutosEntradaSalida,
			MinutosComida, JefeInmediato, FechaRegistro, FechaBaja
		)
		SELECT	Fecha = ent.Fecha
				,NumPromovendedor = ent.fiPromovendedorId
				,NumTienda = ent.fiNoTienda
				,Nombre = ent.fcNombre
				,ApellidoPaterno = ent.fcAPaterno
				,ApellidoMaterno = ent.fcAMaterno
				,NombreTienda = ent.NombreTienda
				,NombreEmpresa = ent.fcCompaniaDesc
				,Puesto = ent.Puesto
				,HoraEntrada = ent.Hora
				,HoraSalidaComer = sco.Hora
				,RegresoComer = rco.Hora
				,Salida = sal.Hora
				,MinutosEntradaSalida = DATEDIFF(MI, ent.Hora, sal.Hora)
				,MinutosComida = DATEDIFF(MI, sco.Hora, rco.Hora), ent.JefeInmediato
				,FechaRegistro = ent.FechaRegistro
				,FechaBaja = ent.FechaRegistro
		FROM	@vtAsistenciaUpd2 ent
			LEFT OUTER JOIN @vtAsistenciaUpd2 sco
				ON ent.fiPromovendedorId = sco.fiPromovendedorId
					AND ent.Fecha = sco.Fecha
					AND ent.fiNoTienda = sco.fiNoTienda
					AND sco.fiAsistenciaId = 2
			LEFT OUTER JOIN @vtAsistenciaUpd2 rco
				ON ent.fiPromovendedorId = rco.fiPromovendedorId
					AND ent.Fecha = rco.Fecha
					AND ent.fiNoTienda = rco.fiNoTienda
					AND rco.fiAsistenciaId = 3
			LEFT OUTER JOIN @vtAsistenciaUpd2 sal
				ON ent.fiPromovendedorId = sal.fiPromovendedorId
					AND ent.Fecha = sal.Fecha
					AND ent.fiNoTienda = sal.fiNoTienda
					AND sal.fiAsistenciaId = 4
		WHERE ent.fiAsistenciaId = 1
	END

	UPDATE	dbo.TATEControlAsistenciaCifras
	SET		NumeroAsistenciaHistorico = (SELECT COUNT(Fecha) FROM dbo.TATEAsistenciasHistorico WHERE Fecha = @pdFecha),
			HoraFin = GETDATE()
	WHERE	FechaDia = @pdFecha;
END TRY
BEGIN CATCH
	DECLARE @vcError VARCHAR(255)
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
	SET NOCOUNT OFF
	RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConArbolJerarquia]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************************
	DESCRIPCIÓN:	Obtiene el árbol de la jerarquía
	FECHA:			junio del 2017
	RESPONSABLE:	Angel Israel López Rosales
*********************************************************************************************/
CREATE PROCEDURE [dbo].[spConArbolJerarquia]
	@piPadreId		INT,
	@piCompaniaId	INT = 107
AS

SET NOCOUNT ON

DECLARE @viMax INT, @vicontador INT, @viPadreID INT, @viHijoID INT, @viNivel INT, @viContadorTemp INT, @viMaxNivel INT
DECLARE @vtTablaJerarquia TABLE (fiId INT IDENTITY(1, 1), fiPadreID INT, fiHijoID INT, Nivel INT, Nivel1 VARCHAR(30), Nivel2 HIERARCHYID)
DECLARE @vtTablaJerarquia2 TABLE (NombreCompleto VARCHAR(200), NumeroEmpleado INT, Puesto VARCHAR(200), PuestoId INT, PadreId INT, Nivel INT, Nivel2 HIERARCHYID)
INSERT INTO @vtTablaJerarquia (fiPadreID, fiHijoID, Nivel, Nivel1)
SELECT fiPadreID = 0, fiHijoID = @piPadreId, Nivel = 0, Nivel1 = '/1/'
UNION ALL
SELECT	fiPadreID, fiHijoID, Nivel + 1, Nivel1 = null 
FROM	[dbo].[FNTELSTablaNiveles](@piPadreId, @piCompaniaId) n
ORDER BY Nivel
SELECT @viMax = MAX(fiId), @viMaxNivel = MAX(Nivel) FROM @vtTablaJerarquia
SET @vicontador = 1

WHILE(@vicontador <= @viMax)
BEGIN
	SELECT @viPadreID = fiPadreID, @viHijoID = fiHijoID, @viNivel = Nivel 
	FROM @vtTablaJerarquia WHERE fiId = @vicontador
	BEGIN
		DECLARE @vcNivel VARCHAR(30)
		IF EXISTS(SELECT fiHijoID FROM @vtTablaJerarquia WHERE fiHijoID = @viHijoID AND fiPadreID = 0)
		BEGIN
			UPDATE @vtTablaJerarquia SET Nivel1 = '/' + CAST(fiId AS VARCHAR(10)) +'/' WHERE fiHijoID = @viHijoID
		END
		IF EXISTS (SELECT fiHijoID FROM @vtTablaJerarquia WHERE fiHijoID = @viPadreID)
		BEGIN
			SELECT @vcNivel = Nivel1 FROM @vtTablaJerarquia WHERE fiHijoID = @viPadreID
			UPDATE @vtTablaJerarquia SET Nivel1 = @vcNivel + CAST(fiId AS VARCHAR(10)) +'/' WHERE fiId = @vicontador
			IF EXISTS (
				SELECT fiPuestoId FROM dbo.TATEPromovendedor WHERE fiPromovendedorId = @viHijoID AND fiPuestoId = 631
			)
			BEGIN
				IF EXISTS(SELECT fiNoTienda FROM dbo.TATESupervisor WITH(NOLOCK) WHERE fiPromovendedorId = @viHijoID)
				BEGIN
					SELECT @vcNivel = Nivel1 FROM @vtTablaJerarquia WHERE fiId = @vicontador
					INSERT INTO @vtTablaJerarquia (fiPadreID, fiHijoID, Nivel, Nivel1)
					SELECT	fiPadreID = fiPromovendedorId, 
							fiHijoID = fiNoTienda, 
							Nivel = @viMaxNivel + 1, 
							Nivel1 = @vcNivel + CAST(s.fiNoTienda AS VARCHAR(10)) +'/'
					FROM	dbo.TATESupervisor s
					WHERE	s.fiPromovendedorId = @viHijoID
				END
				ELSE
				BEGIN
					SELECT @vcNivel = Nivel1 FROM @vtTablaJerarquia WHERE fiId = @vicontador
					INSERT INTO @vtTablaJerarquia (fiPadreID, fiHijoID, Nivel, Nivel1)
					SELECT	fiPadreID = @viHijoID, 
							fiHijoID = 0, 
							Nivel = @viMaxNivel + 1, 
							Nivel1 = @vcNivel + CAST(@viHijoID AS VARCHAR(10)) + '/'
				END
			END
		END
		ELSE IF EXISTS (SELECT fiPromovendedorId FROM dbo.TATEPromovendedor WHERE fiPromovendedorId = @piPadreId AND fiPuestoId = 631)
		BEGIN 
			IF EXISTS(SELECT fiNoTienda FROM dbo.TATESupervisor WITH(NOLOCK) WHERE fiPromovendedorId = @piPadreId)
			BEGIN
				SELECT @vcNivel = Nivel1 FROM @vtTablaJerarquia WHERE fiId = @vicontador
				INSERT INTO @vtTablaJerarquia (fiPadreID, fiHijoID, Nivel, Nivel1)
				SELECT	fiPadreID = fiPromovendedorId, 
						fiHijoID = fiNoTienda, 
						Nivel = @viMaxNivel + 1, 
						Nivel1 = @vcNivel + CAST(s.fiNoTienda AS VARCHAR(10)) +'/'
				FROM	dbo.TATESupervisor s
				WHERE	s.fiPromovendedorId = @viHijoID
			END
		END
	END
	SET @vicontador = @vicontador + 1
END
UPDATE @vtTablaJerarquia SET Nivel2 = Nivel1

INSERT INTO @vtTablaJerarquia2 (NombreCompleto, NumeroEmpleado, Puesto, PuestoId, PadreId, Nivel2, Nivel)
SELECT	NombreCompleto = LTRIM(RTRIM(p.fcNombre)) + ' ' + LTRIM(RTRIM(p.fcAPaterno)) + ' ' + LTRIM(RTRIM(p.fcAMaterno)), 
		NumeroEmpleado = p.fiPromovendedorId, 
		Puesto = pu.fcDescPuesto, 
		PuestoId = pu.fiPuestoId,
		PadreId = j.fiPadreID,
		Nivel2,
		Nivel
FROM	@vtTablaJerarquia j
	INNER JOIN dbo.TATEPromovendedor p
		ON p.fiPromovendedorId = j.fiHijoID
	INNER JOIN dbo.TCTEPuesto pu
		ON pu.fiPuestoId = p.fiPuestoId
WHERE	LEN(p.fiPromovendedorId) >= 6
UNION ALL
SELECT	NombreCompleto = CASE WHEN t.fcDescripcion IS NULL THEN 'SIN TIENDA' ELSE t.fcDescripcion END, 
		NumeroEmpleado = CASE WHEN t.fiNoTienda IS NULL THEN 0 ELSE t.fiNoTienda END, 
		Puesto = 'TIENDA',
		PuestoId = 0,
		PadreId = j.fiPadreID,
		Nivel2,
		Nivel
FROM	@vtTablaJerarquia j
	LEFT OUTER JOIN dbo.TCTETiendas t
		ON t.fiNoTienda = j.fiHijoID
WHERE	Nivel = @viMaxNivel + 1

INSERT INTO @vtTablaJerarquia2 (NombreCompleto, NumeroEmpleado, Puesto, PuestoId, PadreId, Nivel2, Nivel)
SELECT	NombreCompleto = LTRIM(RTRIM(p.fcNombre)) + ' ' + LTRIM(RTRIM(p.fcAPaterno)) + ' ' + LTRIM(RTRIM(p.fcAMaterno)), 
		NumeroEmpleado = P.fiPromovendedorId, 
		Puesto = 'PROMOTOR',
		PuestoId = p.fiPuestoId,
		PadreId = j.NumeroEmpleado,
		Nivel2,
		Nivel + 1
FROM	@vtTablaJerarquia2 j
	INNER JOIN dbo.TATEPromovendedor p WITH(NOLOCK)
		ON p.fiNoTienda = j.NumeroEmpleado
	INNER JOIN dbo.TCTEDetalleCatalogoGenerico  c WITH(NOLOCK)
		ON p.fiPuestoId = c.fiItemId
WHERE	Nivel = @viMaxNivel + 1
	AND j.Puesto = 'TIENDA'
	AND p.fiCompaniaId = @piCompaniaId
	AND c.fiCatalogoId = 7
	AND P.fiStatus NOT IN (0, 2)

SELECT	NombreCompleto,  NumeroEmpleado, Puesto, PuestoId, PadreId, Nivel
FROM	@vtTablaJerarquia2
ORDER BY Nivel2

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUEstatusPromo]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****************************************************************************************************
   Descripción objeto: Actualiza estatus promovendedores
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
*****************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUEstatusPromo]
   @piPromovendedorId INT           /*Identificador del promovendedor*/,
   @piEstatus         INT           /*Estatus del promovendedor*/,
   @pcHorario         VARCHAR(8),   /*Horario de trabajo del empleado compuesto de 8 digitos*/
   @piDiaDescanso     INT,          /*1=Lunes,2=martes,3=miercoles,...,7=domingo*/
   @pcEmpNoModifica   VARCHAR(10)=NULL  /*Empleado que hace la modificación a la información del promovendedor*/
AS

SET NOCOUNT ON
DECLARE @vcMensaje VARCHAR(255)
BEGIN TRY
   IF(@pcEmpNoModifica IS NULL)
      SET @pcEmpNoModifica='999989'
   EXECUTE [dbo].[PATELUPromovendedores] 
      @piPromovendedorId = @piPromovendedorId,
      @pcEmpModifica     = @pcEmpNoModifica,
      @piStatus          = @piEstatus,
      @pcHorario         = @pcHorario,
      @piDiaDescanso     = @piDiaDescanso
END TRY
BEGIN CATCH
   SET @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUPadreEmpleadoJerarquico]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************************************************
   Descripción: Actualiza datos padre empleado jerarquico
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUPadreEmpleadoJerarquico]
   @piHijoId  INT,
   @piPadreId INT
   ,@pcCorreoModifica VARCHAR(255) = NULL /*Correo de la persona que modifica*/
   ,@pcIPModifica     VARCHAR(50)  = NULL /*IP de la maquina de la persona que modifica*/
   ,@pcEmpNo          VARCHAR(10)   = '999994' /*Número de empleado quué modifica*/
AS
SET NOCOUNT ON

DECLARE @vcMensaje VARCHAR(200),
        @viNegocio INT,
        @viPuesto INT,
        -- VARIABLES DE LA BITACORA
        @viNoTienda        smallint,
        @viTipoVendedorId  smallint,
        @vcNombre          char(40),
        @vcAPaterno        char(40),
        @vcAMaterno        char(40),
        @vcRFC             char(20),
        @vcFechNacimiento  char(10),
        @vcTelefono        char(10),
        @viCompaniaId      INT,
        @vcHorario         char(8),
        @viDiaDescanso     tinyint,
        @viStatus          tinyint,
        @vcJefeInme        char(60),
        @vdFecRegistro     datetime,
        @vcEmail           char(60),
        @viNoPromo         char(10),
        @vcTelefonoCel     char(10) = null,
        @vcTelefonoRec     char(10) = null

BEGIN TRY
   SELECT @viNegocio = P.fiCompaniaId,
          @viPuesto = P.fiPuestoId
   FROM   dbo.TATEPromovendedor P WITH(NOLOCK)
   WHERE  P.fiPromovendedorId = @piHijoId

   ---------------------------------------------------VALIDACIONES-----------------------------------------------------------------------
   SET @vcMensaje = dbo.FNTELSValidacionesEmpJerarquico(@viNegocio, @piPadreId, @viPuesto)
   IF @vcMensaje <> '' 
   BEGIN
      RAISERROR(@vcMensaje, 18, 1)
      RETURN
   END
   --------------------------------------------------------------------------------------------------------------------------------------
	IF EXISTS(
		SELECT J.fiHijoID 
		FROM   dbo.TATEJerarquia J
		WHERE  J.fiHijoID = @piHijoId
	)
	BEGIN
		UPDATE J
		SET    J.fiPadreID = @piPadreId
		FROM   dbo.TATEJerarquia J
		WHERE  J.fiHijoID = @piHijoId
	END
	ELSE
	BEGIN
		INSERT INTO dbo.TATEJerarquia (fiPadreID, fiHijoID) VALUES (@piPadreId, @piHijoId)
	END

   --GRABAMOS LA BITACORA
   SELECT @viNoTienda       = fiNoTienda,
       @viTipoVendedorId = fiTipoVendedorId,
       @vcNombre         = fcNombre,
       @vcAPaterno       = fcAPaterno,
       @vcAMaterno       = fcAMaterno,
       @vcRFC            = fcRFC,
       @vcFechNacimiento = fcFechNacimiento,
       @vcTelefono       = fcTelefono,
       @viCompaniaId     = fiCompaniaId,
       @vcHorario        = fcHorario,
       @viDiaDescanso    = fiDiaDescanso,
       @viStatus         = fiStatus,
       @vcJefeInme       = fcJefeInme,
       @vdFecRegistro    = fdFecRegistro,
       @vcEmail          = fcEmail,
       @viNoPromo        = fiNoPromo,
       @vcTelefonoCel    = fcTelefonoCel,
       @vcTelefonoRec    = fcTelefonoRec,
       @viPuesto         = fiPuestoId
   FROM DBO.TATEPromovendedor WITH(NOLOCK)
   WHERE fiPromovendedorId = @piHijoId
       
   EXECUTE dbo.PATELIPromoVendedorHist
     @piPromovendedorId = @piHijoId,
     @piNoTienda        = @viNoTienda,
     @piTipoVendedorId  = @viTipoVendedorId,
     @pcNombre          = @vcNombre,
     @pcAPaterno        = @vcAPaterno,
     @pcAMaterno        = @vcAMaterno,
     @pcRFC             = @vcRFC,
     @pcFechNacimiento  = @vcFechNacimiento,
     @pcTelefono        = @vcTelefono,
     @piCompaniaId      = @viCompaniaId,
     @pcHorario         = @vcHorario,
     @piDiaDescanso     = @viDiaDescanso,
     @piStatus          = @viStatus,
     @pcJefeInme        = @vcJefeInme,
     @pdFecRegistro     = @vdFecRegistro,
     @pcEmpNo           = @pcEmpNo,
     @piTipoMovimiento  = 8,
     @pcEmail          = @vcEmail,
     @piNoPromo         = @viNoPromo,
     @pcTelefonoCel     = @vcTelefonoCel,
     @pcTelefonoRec     = @vcTelefonoRec,
     @piPuesto          = @viPuesto,
     @pcCorreoModifica  = @pcCorreoModifica,
     @pcIPModifica      = @pcIPModifica
END TRY
BEGIN CATCH
   SET @vcMensaje = ERROR_PROCEDURE() + ','  + ERROR_MESSAGE()
   RAISERROR(@vcMensaje, 18, 1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUMantenimientoPromo]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/********************************************************************************************
   Descripción objeto: Actualiza tipo de vendedor promovendedores
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
*********************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUMantenimientoPromo]
   @piPromovendedorId INT           /*Identificador del promovendedor*/,
   @piTipoVendedor    INT           /*Tipo de promovendedor*/,
   @pcHorario         VARCHAR(8),   /**/
   @piDiaDescanso     INT,          /*1=Lunes,2=martes,3=miercoles,...,7=domingo*/
   @pcEmpNoModifica   VARCHAR(10)=NULL  /*Empleado que hace la modificación a la información del promovendedor*/
AS
SET NOCOUNT ON
DECLARE @vcMensaje VARCHAR(255)
BEGIN TRY
   IF(@pcEmpNoModifica IS NULL)
      SET @pcEmpNoModifica='999999'
   EXECUTE [dbo].[PATELUPromovendedores] 
      @piPromovendedorId = @piPromovendedorId,
      @pcEmpModifica     = @pcEmpNoModifica,
      @piTipoVendedorId  = @piTipoVendedor,
      @pcHorario         = @pcHorario,
      @piDiaDescanso     = @piDiaDescanso
END TRY
BEGIN CATCH
   SET @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUAsistenciasAvisoCorreo]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************************************************
   Descripción objeto: Consulta los datos para envío de mails de las asistencias diarias de aviso
   ----------------------------------------------------------------------------------------------
   Fecha 14 de octubre del 2013
   Responsable: Angel Israel Lopez Rosales
************************************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUAsistenciasAvisoCorreo]
   @piHora INT,
   @piTipo SMALLINT
AS
SET XACT_ABORT ON  
SET NOCOUNT ON  
DECLARE @vtTATEDatosMail TABLE (
   fiTipo                INT,
   fiSupervisor          INT,    
   fcNombreSupervisor    VARCHAR(255),  
   fcCorreo              VARCHAR(255),  
   fiTiendaNoSupervisada INT,   
   fcNombreTienda        VARCHAR(60),  
   fiMulta               INT,  
   fcCorreoCC            VARCHAR(255),  
   fcCorreoCCO           VARCHAR(255),  
   fcCorreoPadre         VARCHAR(255),    
   fiMinutos             INT,  
   fiNegocio             INT,  
   fiIdDirector          INT,  
   fcNombreDirector      VARCHAR(255),   
   fcMotivo              VARCHAR(255)  
)  

BEGIN TRY
   BEGIN TRANSACTION
      DELETE dbo.TATEDatosMail WHERE fiTipo = @piTipo
      INSERT INTO @vtTATEDatosMail (fiSupervisor, fcNombreSupervisor, fcCorreo, fiTiendaNoSupervisada, fcNombreTienda, fiMulta, fcCorreoPadre)  
      EXEC PATELSSupervisorCorreo @piHora
      UPDATE @vtTATEDatosMail SET fiTipo = @piTipo
      INSERT INTO dbo.TATEDatosMail (fiTipo, fiSupervisor, fcNombreSupervisor, fcCorreo, fiTiendaNoSupervisada, fcNombreTienda, fiMulta, fcCorreoPadre)
      SELECT fiTipo = @piTipo, fiSupervisor, fcNombreSupervisor, fcCorreo, fiTiendaNoSupervisada, fcNombreTienda, fiMulta, fcCorreoPadre
      FROM @vtTATEDatosMail
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   DECLARE @vcError VARCHAR(255)  
   SET @vcError = ERROR_MESSAGE()  
   IF (XACT_STATE()) = -1  
   BEGIN  
      ROLLBACK TRANSACTION  
   END  
   IF (XACT_STATE()) = 1  
   BEGIN  
      COMMIT TRANSACTION  
   END  
   RAISERROR(@vcError,18,1)  
   SET NOCOUNT OFF  
   RETURN -1  
END CATCH
SET NOCOUNT OFF 
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSVendedoresTienda]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSVendedoresTienda] 

	@piPaisID		INT,
	@piNoTienda		INT,
	@piCompaniaId	INT,
	@pdFechaInicial DATETIME,
	@pdFechaFinal	DATETIME
	
AS
BEGIN		
		
    SELECT T.fiPromovendedorId, RTRIM(fcNombre) + ' ' + RTRIM(fcAPaterno) + ' ' + RTRIM(fcAMaterno) AS Nombre
		FROM dbo.FNTELSTablaVendedoresTienda(@piPaisID,@piCompaniaId,@pdFechaInicial,@pdFechaFinal) T 
			INNER JOIN TATEPromovendedor P WITH(NOLOCK) ON (T.fiPromovendedorId = P.fiPromovendedorId)
		WHERE T.fiNoTienda = @piNoTienda
	
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSTiempoSupervision]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************
   Descripción: Obtiene el tiempo de supervisión
   Fecha: 17 de diciembre del 2012
   Responsable: Angel Israel López Rosales
*************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSTiempoSupervision] 

	@pdFechaInicial	DATETIME,
	@pdFechaFinal	DATETIME,
	@piPromovendedorId INT
	
AS
BEGIN

SET NOCOUNT ON
SELECT	S.fiNoTienda, 
   T.fcDescripcion,
   Fecha, 
   ISNULL(dbo.FNTELSTiempoSupervision(Fecha,@piPromovendedorId,S.fiNoTienda),0) AS TiempoSupervision
FROM FNTELSTablaFechas(@pdFechaInicial,@pdFechaFinal)
   INNER JOIN TATESupervisor S WITH(NOLOCK) ON (S.fiPromovendedorId = @piPromovendedorId)
   INNER JOIN TCTETiendas T WITH(NOLOCK) ON (T.fiNoTienda = S.fiNoTienda)
ORDER BY S.fiNoTienda, Fecha
	
SET NOCOUNT OFF	
	
END
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUEliminarEmpleadoJerarquico]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************************************
   Descripción: Da de baja temporal a un jefe 
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUEliminarEmpleadoJerarquico]
    @piPromovendedorId INT                     /*Id de promovendedor*/
   ,@pcCorreoModifica  VARCHAR(255) = NULL     /*Correo de la persona que modifica*/
   ,@pcIPModifica      VARCHAR(50)  = NULL     /*IP de la maquina de la persona que modifica*/
   ,@pcEmpNo           VARCHAR(10)   = '999991' /*Número de empleado quué modifica*/
AS
SET NOCOUNT ON
DECLARE @vcError VARCHAR(255)
BEGIN TRY
   EXECUTE dbo.PATELIBajaPromovendedor 
        @piPromovendedorId = @piPromovendedorId,
        @pcEmpNo           = @pcEmpNo,
        @piMotivoId        = 1,
        @pcMotivoDesc      = 'Baja empleado de jerarquia',
        @plEsJerarquia     = 1,
        @pcCorreoModifica  = @pcCorreoModifica,
        @pcIPModifica      = @pcIPModifica
   DELETE dbo.TATEJerarquia 
   WHERE fiHijoId = @piPromovendedorId
END TRY
BEGIN CATCH
   SET @vcError=ERROR_MESSAGE()
   RAISERROR(@vcError,18,1)
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSSupervisorPenalizado]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
   Descripción: Consulta los supervisores penalizados
   --------------------------------------------------
   Fecha: 22/02/2013
   Responsable: Angel Israel López Rosales
   Modificación: Creación de objeto
************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSSupervisorPenalizado]
   @pdInicial DATETIME, 
   @pdFinal   DATETIME,
   @piNegocio INT, 
   @piPlaza   INT = 0
AS
SET NOCOUNT ON

DECLARE @viPromo INT, @viAsignada INT, @viNoSupervisada INT, @viMulta INT, @viSinSupervisor INT
DECLARE @vtPlaza TABLE (fiPlazaId INT, fiPaisID INT)

INSERT INTO @vtPlaza (fiPlazaID, fiPaisID) SELECT fiPlazaID, fiPaisID FROM dbo.TCTEPlazas WITH (NOLOCK)

IF(@piPlaza>0)
   DELETE @vtPlaza WHERE fiPlazaID<>@piPlaza

SELECT @viSinSupervisor = COUNT(ISNULL(fiNoTienda, 0)) FROM dbo.FNTELSTablaTiendasSinSupervisor(@piNegocio)

SELECT Nombre.fiIdPromo,
   fcNombre,
   Asignadas = 
      CASE
         WHEN fiPuestoId <> 631 THEN 0 
         ELSE COUNT(ISNULL(TdaAsignada,0))
      END,
   NoVisitadas = 
      CASE
         WHEN fiPuestoId <> 631 THEN 0 
         ELSE COUNT(ISNULL(TdaAsignada,0)) - SUM(ISNULL(TdaVisitada, 0))
      END,
   Multa = 
      CASE
         WHEN fiPuestoId <> 631 THEN 0 
         ELSE (COUNT(ISNULL(TdaAsignada,0)) - SUM(ISNULL(TdaVisitada,0))) * 5
      END,
   SinSupervisor = @viSinSupervisor
FROM 
(
   SELECT 
      fiIdPromo   = fiPromovendedorId,
      fcNombre    = LTRIM(RTRIM(fcNombre)) + ' ' + LTRIM(RTRIM(fcAPaterno)) + ' ' + LTRIM(RTRIM(fcAMaterno)),
      fiPuestoId
   FROM dbo.TATEPromovendedor s WITH (NOLOCK)
) AS Nombre
INNER JOIN
(
   SELECT 
      fiPromovendedorId,
      TdaAsignada = fiNoTienda,
      TdaVisitada = 
         CASE 
            WHEN Minutos >= 60 THEN 1
            ELSE 0
         END,
      MultaMinutos = 
         CASE 
            WHEN Minutos < 60 THEN 5
            ELSE Minutos
         END
   FROM 
   (
      SELECT 
         Super.fiPromovendedorId, 
         Super.fiNoTienda, 
         Minutos = SUM(ISNULL(Minutos, 0)) 
      FROM 
      (
         SELECT s.fiPromovendedorId, s.fiNoTienda
         FROM   dbo.TATESupervisor s WITH(NOLOCK)
            INNER JOIN dbo.TATEPromovendedor tp WITH(NOLOCK)
               ON s.fiPromovendedorId = tp.fiPromovendedorId
            INNER JOIN dbo.TCTETiendas tda WITH(NOLOCK)
               ON tda.fiNoTienda = s.fiNoTienda
            INNER JOIN @vtPlaza pl 
               ON pl.fiPlazaId = tda.fiPlazaID
         WHERE tp.fiCompaniaId = @piNegocio
            AND tp.fiPuestoId=631
      ) AS Super
      LEFT OUTER JOIN
      (
         SELECT 
            Entr.fiPromovendedorId, 
            Entr.FechaDia, 
            entr.fiNoTienda,
            Minutos = 
            CASE  
               WHEN Sal.FechaDia IS NULL THEN 0
               ELSE DATEDIFF(MINUTE, Entr.fdFecha, Sal.fdFecha )
            END
         FROM 
         (
            SELECT Asi.fiPromovendedorId, fdFecha, fiNoTienda, FechaDia = CONVERT(DATETIME, CONVERT(VARCHAR(10), fdFecha, 103),103)
            FROM   dbo.TATEControlAsistencia Asi WITH(NOLOCK)
            WHERE  fiAsistenciaId = 1
               AND fdFecha BETWEEN @pdInicial AND @pdFinal
         ) AS Entr
         LEFT OUTER JOIN 
         (
            SELECT Asi.fiPromovendedorId, fdFecha, fiNoTienda, FechaDia = CONVERT(DATETIME, CONVERT(VARCHAR(10), fdFecha, 103),103)
            FROM   dbo.TATEControlAsistencia Asi WITH(NOLOCK)
            WHERE  fiAsistenciaId = 4
               AND fdFecha BETWEEN @pdInicial AND @pdFinal
         ) AS Sal
         ON Sal.fiPromovendedorId = Entr.fiPromovendedorId
            AND CONVERT(DATETIME, CONVERT(VARCHAR(10), Entr.fdFecha, 103),103) = CONVERT(DATETIME, CONVERT(VARCHAR(10), Sal.fdFecha, 103),103)
            AND Entr.fiNoTienda = Sal.fiNoTienda
         ) AS TmpSupe
         ON TmpSupe.fiPromovendedorId = Super.fiPromovendedorId
            AND TmpSupe.fiNoTienda = Super.fiNoTienda
         GROUP BY Super.fiPromovendedorId, Super.fiNoTienda
      ) AS TblPenalizacion
) AS Tiendas
ON Nombre.fiIdPromo = Tiendas.fiPromovendedorId
GROUP BY fiIdPromo, fcNombre, fiPuestoId
ORDER BY fiIdPromo

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSTiendaSupervisada]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSTiendaSupervisada] 

	@piCompaniaId INT,
	@piNoTienda   INT
	
AS
BEGIN

SET NOCOUNT ON

	DECLARE @vdFecha		DATETIME
	DECLARE @viPais			INT
	DECLARE @viNumPromovend	INT
	DECLARE @vtTable		TABLE([fiNoTienda]			INT, 
								  [fcDescripcion]		VARCHAR(100), 
								  [fiPromovendedorId]	INT, 
								  [Nombre]				VARCHAR(125),
								  [NumPromovendedores]	INT)

	SELECT TOP 1  
		   @viPais = fiPaisId 
	FROM TCTETiendas WITH(NOLOCK) where fiNoTienda = @piNoTienda
		
	SET @vdFecha = dbo.FNTELSFechaST(GETDATE())
	
	SELECT @viNumPromovend = COUNT(fiPromovendedorId) 
	FROM dbo.FNTELSTablaVendedoresTienda(@viPais, @piCompaniaId, @vdFecha, @vdFecha) 
	WHERE fiNoTienda = @piNoTienda
	
	INSERT INTO @vtTable
	SELECT	T.fiNoTienda, 
			T.fcDescripcion, 
			S.fiPromovendedorId, 
			RTRIM(P.fcNombre) + ' ' + RTRIM(P.fcAPaterno) + ' ' + RTRIM(P.fcAMaterno),
			@viNumPromovend
	FROM TCTETiendas T WITH(NOLOCK) INNER JOIN TATESupervisor S WITH(NOLOCK) ON (T.fiNoTienda = S.fiNoTienda AND T.fiCanalId = S.fiCanalId
	AND T.fiPaisID = S.fiPaisID) INNER JOIN TATEPromovendedor P WITH(NOLOCK) ON (S.fiPromovendedorId = P.fiPromovendedorId)
	WHERE  T.fiNoTienda = @piNoTienda AND dbo.FNTELSValidarCompania(@piCompaniaId,P.fiCompaniaId,P.fiPuestoId) = 1
	
	SELECT	fiNoTienda, 
			fcDescripcion, 
			fiPromovendedorId, 
			Nombre,
			NumPromovendedores
	FROM @vtTable

			UNION 
	
	SELECT	T.fiNoTienda, 
			T.fcDescripcion, 
			-1, 
			'- Sin Asignar -',
			@viNumPromovend
	FROM TCTETiendas T WITH(NOLOCK)
	WHERE T.fiNoTienda = @piNoTienda 
		AND NOT EXISTS (SELECT fiPromovendedorId FROM @vtTable)
		
SET NOCOUNT OFF		
	
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSTiendasSinSupervisor]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSTiendasSinSupervisor] 

	@piCompaniaId INT
	
AS
BEGIN

SET NOCOUNT ON
				
	SELECT T.fiNoTienda, T.fcDescripcion, T.fiDistritoID, T.fiPlazaID, T.fiPaisID, T.fiCanalId
	 FROM FNTELSTablaTiendasSinSupervisor(@piCompaniaId) TsS 
	 INNER JOIN TCTETiendas T WITH(NOLOCK)
	 ON (TsS.fiNoTienda = T.fiNoTienda AND TsS.fiCanalId = T.fiCanalId AND TsS.fiPaisID = T.fiPaisID)
	ORDER BY 1
	
SET NOCOUNT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[PATELSEstadisticaAsistenciasSinCalcularPuntualidad]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSEstadisticaAsistenciasSinCalcularPuntualidad] 

	@piCompaniaId		INT,
	@piPaisID			INT,
	@piPlazaID			INT,
	@piDistritoID		INT,
	@pdFechaInicial	DATETIME,
	@pdFechaFinal		DATETIME
	
AS
BEGIN

SET NOCOUNT ON

	DECLARE @ValueTable TABLE ([ID] INT, [DESCRIPCION] VARCHAR(125), [PORCENTAJE_PUNTUALIDAD] DECIMAL(10,2), [SUMA_CUBRIMIENTO] INT, [NUMERO_TIENDAS] INT)
	
	IF @piDistritoID > 0 /*AND @JEFE_VENTA > 0*/ AND @piPlazaID > 0 AND @piPaisID > 0
	
		BEGIN
		
			INSERT INTO @ValueTable([ID], [DESCRIPCION], [PORCENTAJE_PUNTUALIDAD], [SUMA_CUBRIMIENTO], [NUMERO_TIENDAS])
			SELECT C.ID, T.fcDescripcion, 0, ISNULL(C.SUMA_CUBRIMIENTO, 0), (SELECT COUNT(fiNoTienda) FROM TCTETiendas WITH(NOLOCK) WHERE fiCanalID in (1,143,17)  AND fiActivo = 1 AND (@piCompaniaId NOT IN (11,47,30,31) OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)/**/OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1)) AND fiPaisID = @piPaisID AND fiPlazaId = @piPlazaID AND fiDistritoID = @piDistritoID AND fiNoTienda = C.ID)
				FROM DBO.FNTELSTablaCubrimiento(@piCompaniaId, @piPaisID, @piPlazaID, @piDistritoID, @pdFechaInicial, @pdFechaFinal) C
				INNER JOIN TCTETiendas T WITH(NOLOCK) ON (T.fiNoTienda = C.ID
											 AND fiPaisID = @piPaisID
											 AND fiPlazaID = @piPlazaID
											 AND fiDistritoID = @piDistritoID)
				
			SELECT ID, DESCRIPCION, PORCENTAJE_PUNTUALIDAD, SUMA_CUBRIMIENTO, NUMERO_TIENDAS FROM @ValueTable

										UNION
			
			SELECT fiNoTienda AS ID,
				   fcDescripcion AS DESCRIPCION,
				   0 AS PORCENTAJE,
				   0 AS PORCENTAJE_CUBRIMIENTO,
				   (SELECT COUNT(fiNoTienda) FROM TCTETiendas WITH(NOLOCK) WHERE fiCanalID in (1,143,17) AND fiActivo = 1 AND (@piCompaniaId NOT IN (11,47,30,31) OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)/**/OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1)) AND fiPaisID = @piPaisID AND fiPlazaId = @piPlazaID AND fiDistritoID = @piDistritoID AND fiNoTienda = T.fiNoTienda) AS NUMERO_TIENDAS
			FROM TCTETiendas T WITH(NOLOCK) where fiNoTienda not in (SELECT ID from @ValueTable)
			AND  (fiPaisID = @piPaisID /*OR 0 = @piPaisID*/)
			AND  (fiPlazaID = @piPlazaID /*OR 0 = @piPlazaID*/)
			--AND   (fiJefeVtaID = @JEFE_VENTA /*OR 0 = @JEFE_VENTA*/)
			AND   (fiDistritoID = @piDistritoID /*OR 0 = @piDistritoID*/)
			AND T.fiCanalID in (1,143,17) 
			AND T.fiActivo = 1
			AND (@piCompaniaId NOT IN (11,47,30,31) OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)/**/OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1))
			ORDER BY ID
			
		END
	
	ELSE IF /*@JEFE_VENTA > 0 AND*/ @piPlazaID > 0 AND @piPaisID > 0
	
		BEGIN
		
			INSERT INTO @ValueTable([ID], [DESCRIPCION], [PORCENTAJE_PUNTUALIDAD], [SUMA_CUBRIMIENTO], [NUMERO_TIENDAS])
			SELECT C.ID, D.fcDescripcion, 0, ISNULL(C.SUMA_CUBRIMIENTO, 0), (SELECT COUNT(fiNoTienda) FROM TCTETiendas WITH(NOLOCK) WHERE fiCanalID in (1,143,17)  AND fiActivo = 1 AND (@piCompaniaId NOT IN (11,47,30,31) OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)/**/OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1)) AND fiPaisID = @piPaisID AND fiPlazaId = @piPlazaID AND fiDistritoID = C.ID)
				FROM DBO.FNTELSTablaCubrimiento(@piCompaniaId, @piPaisID, @piPlazaID, @piDistritoID, @pdFechaInicial, @pdFechaFinal) C
				INNER JOIN TCTEDistritales D WITH(NOLOCK) ON (D.fiDistritoId = C.ID
												 AND fiPaisID = @piPaisID
												 AND fiPlazaID = @piPlazaID)
			
			SELECT ID, DESCRIPCION, PORCENTAJE_PUNTUALIDAD, SUMA_CUBRIMIENTO, NUMERO_TIENDAS FROM @ValueTable

										UNION
										
			SELECT D.fiDistritoId AS ID,
				   D.fcDescripcion AS DESCRIPCION,
				   0 AS PORCENTAJE,
				   0 AS SUMA_CUBRIMIENTO,
				   (SELECT COUNT(fiNoTienda) FROM TCTETiendas WITH(NOLOCK) WHERE fiCanalID in (1,143,17) AND fiActivo = 1 AND (@piCompaniaId NOT IN (11,47,30,31) OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)/**/OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1)) AND fiPaisID = @piPaisID AND fiPlazaId = @piPlazaID AND fiDistritoID = D.fiDistritoId) AS NUMERO_TIENDAS
			FROM TCTEDistritales D WITH(NOLOCK) INNER JOIN TCTETiendas T WITH(NOLOCK) on
				(D.fiDistritoId = T.fiDistritoID and D.fiJefeVtaID = T.fiJefeVtaID and D.fiPlazaID = T.fiPlazaID and D.fiPaisID = T.fiPaisID)
		    WHERE D.fiDistritoId not in (SELECT ID from @ValueTable)
			AND  (D.fiPaisID = @piPaisID /*OR 0 = @piPaisID*/)
			AND  (D.fiPlazaID = @piPlazaID /*OR 0 = @piPlazaID*/)
			AND T.fiCanalID in (1,143,17)  
		    AND T.fiActivo = 1
		    AND (@piCompaniaId NOT IN (11,47,30,31) OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)/**/OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1))
			ORDER BY ID										
		
		END		
	ELSE IF @piPaisID > 0
	
		BEGIN
		
			INSERT INTO @ValueTable([ID], [DESCRIPCION], [PORCENTAJE_PUNTUALIDAD], [SUMA_CUBRIMIENTO], [NUMERO_TIENDAS])
			SELECT C.ID, PL.fcDescripcion, 0, ISNULL(C.SUMA_CUBRIMIENTO, 0), (SELECT COUNT(fiNoTienda) FROM TCTETiendas WITH(NOLOCK) WHERE fiCanalID in (1,143,17) AND fiActivo = 1 AND (@piCompaniaId NOT IN (11,47,30,31) OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)/**/OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1)) AND fiPaisID = @piPaisID AND fiPlazaId = C.ID)
				FROM DBO.FNTELSTablaCubrimiento(@piCompaniaId, @piPaisID, @piPlazaID, @piDistritoID, @pdFechaInicial, @pdFechaFinal) C
				INNER JOIN TCTEPlazas PL WITH(NOLOCK) ON (PL.fiPlazaID = C.ID 
											 AND PL.fiPaisID = @piPaisID)
		
			SELECT ID, DESCRIPCION, PORCENTAJE_PUNTUALIDAD, SUMA_CUBRIMIENTO, NUMERO_TIENDAS FROM @ValueTable

										UNION
										
			SELECT PL.fiPlazaID AS ID,
				   PL.fcDescripcion AS DESCRIPCION,
				   0 AS PORCENTAJE,
				   0 AS SUMA_CUBRIMIENTO,
				   (SELECT COUNT(fiNoTienda) FROM TCTETiendas WITH(NOLOCK) WHERE fiCanalID in (1,143,17) AND fiActivo = 1 AND (@piCompaniaId NOT IN (11,47,30,31) OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)/**/OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1)) AND fiPaisID = @piPaisID AND fiPlazaId = PL.fiPlazaID) AS NUMERO_TIENDAS
			FROM TCTEPlazas PL WITH(NOLOCK) INNER JOIN TCTETiendas T WITH(NOLOCK) on
		   (PL.fiPlazaID = T.fiPlazaID and PL.fiPaisID = T.fiPaisID)
		    where PL.fiPlazaID not in (SELECT ID from @ValueTable)
			AND (PL.fiPaisID = @piPaisID /*OR 0 = @piPaisID*/)
			AND T.fiCanalID in (1,143,17)  
		    AND T.fiActivo = 1 
		    AND (@piCompaniaId NOT IN (11,47,30,31) OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)/**/OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1))
			ORDER BY ID										
		END
	    
	ELSE
	
		RAISERROR ('ADVERTENCIA: Debe introducir el id del país.',10, 1) 
		
SET NOCOUNT OFF	

END
GO
/****** Object:  StoredProcedure [dbo].[PATELSEstadisticaAsistencias]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
	Responsable: Angel Israel López Rosales
	Fecha: mayo 2017
	Descripción: Alta de OUI
******************************************************************************/
CREATE PROCEDURE [dbo].[PATELSEstadisticaAsistencias] 

	@piCompaniaId		INT,
	@piPaisID			INT,
	@piPlazaID			INT,
	@piDistritoID		INT,
	@pdFechaInicial		DATETIME,
	@pdFechaFinal		DATETIME
	
AS
BEGIN

SET NOCOUNT ON

DECLARE @ValueTable TABLE ([ID] INT, [DESCRIPCION] VARCHAR(125), [PORCENTAJE] DECIMAL(10,2), [SUMA_CUBRIMIENTO] INT, [NUMERO_TIENDAS] INT)
DECLARE @vtTiendasValidas TABLE (
	fiNoTienda			INT, 
	fiPaisID			INT, 
	fiCanalId			INT, 
	fcDescripcion		VARCHAR(100), 
	fiPlazaID			INT, 
	fiJefeVtaID			INT, 
	fiDistritoID		INT,
	fiActivo			INT,
	flEsTiendaUne		BIT,
	flEsTiendaIus		BIT,
	flEsTiendaTelcel	BIT,
	flEsTiendaMovi		BIT,
	flEsTiendaOUI		BIT
)

INSERT INTO @vtTiendasValidas (fiNoTienda, fiPaisID, fiCanalId, fcDescripcion, fiPlazaID, fiJefeVtaID, fiDistritoID, fiActivo, flEsTiendaUne, flEsTiendaIus, flEsTiendaTelcel, flEsTiendaMovi, flEsTiendaOUI)
SELECT	fiNoTienda, fiPaisID, fiCanalId, T.fcDescripcion, fiPlazaID, fiJefeVtaID, fiDistritoID, fiActivo, flEsTiendaUne, flEsTiendaIus, flEsTiendaTelcel, flEsTiendaMovi, flEsTiendaOUI
FROM	dbo.TCTETiendas T WITH(NOLOCK) 
		INNER JOIN dbo.TCTEDetalleCatalogoGenerico cc WITH(NOLOCK)
			ON cc.fiItemId = t.fiCanalId
WHERE	cc.fiCatalogoId = 35 
	AND T.fiActivo = 1 
	AND (
		@piCompaniaId NOT IN (11, 47, 30, 31, 107) 
		OR (@piCompaniaId = 11 AND flEsTiendaUne = 1) 
		OR (@piCompaniaId = 47 AND flEsTiendaIus = 1)
		OR (@piCompaniaId = 30 AND flEsTiendaTelcel = 1) 
		OR (@piCompaniaId = 31 AND flEsTiendaMovi = 1)
		OR (@piCompaniaId = 107 AND flEsTiendaOUI = 1)
	)

IF @piDistritoID > 0 AND @piPlazaID > 0 AND @piPaisID > 0
BEGIN
	INSERT INTO @ValueTable([ID], [DESCRIPCION], [PORCENTAJE], [SUMA_CUBRIMIENTO], [NUMERO_TIENDAS])
	SELECT	C.ID, T.fcDescripcion, 0, ISNULL(C.SUMA_CUBRIMIENTO, 0), 
	(
		SELECT COUNT(fiNoTienda) 
		FROM @vtTiendasValidas
		WHERE fiNoTienda = C.ID
	)
	FROM DBO.FNTELSTablaCubrimiento(@piCompaniaId, @piPaisID, @piPlazaID, @piDistritoID, @pdFechaInicial, @pdFechaFinal) C 
		INNER JOIN @vtTiendasValidas T
			ON T.fiNoTienda = C.ID
	WHERE	fiPaisID = @piPaisID
		AND fiPlazaID = @piPlazaID
		AND fiDistritoID = @piDistritoID
	SELECT ID, DESCRIPCION,  CONVERT(VARCHAR,SUMA_CUBRIMIENTO) +'/'+ CONVERT(VARCHAR,NUMERO_TIENDAS) AS PORCENTAJE_PUNTUALIDAD , SUMA_CUBRIMIENTO, NUMERO_TIENDAS 
	FROM @ValueTable
	UNION
	SELECT	fiNoTienda AS ID,
			fcDescripcion AS DESCRIPCION,
			'0/1' AS PORCENTAJE_PUNTUALIDAD,
			0 AS SUMA_CUBRIMIENTO,
			(
				SELECT COUNT(fiNoTienda) 
				FROM	@vtTiendasValidas 
				WHERE	fiNoTienda = T.fiNoTienda
			) AS NUMERO_TIENDAS
	FROM @vtTiendasValidas T WHERE fiNoTienda NOT IN (SELECT ID FROM @ValueTable)
		AND  fiPaisID = @piPaisID
		AND  fiPlazaID = @piPlazaID
		AND  fiDistritoID = @piDistritoID
	ORDER BY ID
END
ELSE IF @piPlazaID > 0 AND @piPaisID > 0
BEGIN
	INSERT INTO @ValueTable([ID], [DESCRIPCION], [PORCENTAJE], [SUMA_CUBRIMIENTO], [NUMERO_TIENDAS])	
	SELECT	C.ID, D.fcDescripcion, 0, ISNULL(C.SUMA_CUBRIMIENTO, 0), 
		(
			SELECT COUNT(fiNoTienda) 
			FROM @vtTiendasValidas
			WHERE fiPaisID = @piPaisID
				AND fiPlazaId = @piPlazaID 
				AND fiDistritoID = C.ID)
			FROM DBO.FNTELSTablaCubrimiento(@piCompaniaId, @piPaisID, @piPlazaID, @piDistritoID, @pdFechaInicial, @pdFechaFinal) C
				INNER JOIN TCTEDistritales D WITH(NOLOCK) 
					ON D.fiDistritoId = C.ID
						AND fiPaisID = @piPaisID
						AND fiPlazaID = @piPlazaID
			SELECT	ID, 
					DESCRIPCION, 
					CONVERT(VARCHAR,SUMA_CUBRIMIENTO)+'/'+ CONVERT(VARCHAR,NUMERO_TIENDAS) AS PORCENTAJE_PUNTUALIDAD, SUMA_CUBRIMIENTO, 
					NUMERO_TIENDAS 
			FROM @ValueTable
			UNION
			SELECT D.fiDistritoId AS ID,
				   D.fcDescripcion AS DESCRIPCION,
				   '0/'+CONVERT(VARCHAR,
						(
						SELECT COUNT(fiNoTienda) 
						FROM @vtTiendasValidas
						WHERE fiPaisID = @piPaisID AND fiPlazaId = @piPlazaID 
							AND fiDistritoID = D.fiDistritoId)
						) 
				   AS PORCENTAJE,
				   0 AS SUMA_CUBRIMIENTO,
				   (
						SELECT COUNT(fiNoTienda) 
						FROM @vtTiendasValidas
						WHERE fiPaisID = @piPaisID 
							AND fiPlazaId = @piPlazaID 
							AND fiDistritoID = D.fiDistritoId
					) AS NUMERO_TIENDAS
			FROM TCTEDistritales D WITH(NOLOCK) 
				INNER JOIN @vtTiendasValidas T
				ON D.fiDistritoId = T.fiDistritoID 
					and D.fiJefeVtaID = T.fiJefeVtaID 
					and D.fiPlazaID = T.fiPlazaID 
					and D.fiPaisID = T.fiPaisID
		    WHERE D.fiDistritoId not in (SELECT ID from @ValueTable)
				AND  D.fiPaisID = @piPaisID
				AND  D.fiPlazaID = @piPlazaID
			ORDER BY ID										
END
ELSE IF @piPaisID > 0
BEGIN
	INSERT INTO @ValueTable([ID], [DESCRIPCION], [PORCENTAJE], [SUMA_CUBRIMIENTO], [NUMERO_TIENDAS])
	SELECT	C.ID, PL.fcDescripcion, 0, ISNULL(C.SUMA_CUBRIMIENTO, 0), 
		(
			SELECT COUNT(fiNoTienda) 
			FROM @vtTiendasValidas t
			WHERE fiPaisID = @piPaisID 
				AND fiPlazaId = C.ID
		)
	FROM DBO.FNTELSTablaCubrimiento(@piCompaniaId, @piPaisID, @piPlazaID, @piDistritoID, @pdFechaInicial, @pdFechaFinal) C
		INNER JOIN dbo.TCTEPlazas PL WITH(NOLOCK) 
			ON PL.fiPlazaID = C.ID
	WHERE PL.fiPaisID = @piPaisID
	SELECT ID, DESCRIPCION, CONVERT(VARCHAR,SUMA_CUBRIMIENTO)+'/'+ CONVERT(VARCHAR,NUMERO_TIENDAS) AS PORCENTAJE_PUNTUALIDAD, SUMA_CUBRIMIENTO, NUMERO_TIENDAS 
	FROM	@ValueTable
	UNION
	SELECT	PL.fiPlazaID AS ID,
			PL.fcDescripcion AS DESCRIPCION,
			'0/' + CONVERT(VARCHAR, (
					SELECT COUNT(fiNoTienda) 
					FROM @vtTiendasValidas
					WHERE fiPaisID = @piPaisID 
						AND fiPlazaId = PL.fiPlazaID
						)
					) AS PORCENTAJE,
			0 AS SUMA_CUBRIMIENTO,
			(
				SELECT COUNT(fiNoTienda) 
				FROM @vtTiendasValidas t
				WHERE fiPaisID = @piPaisID 
					AND fiPlazaId = PL.fiPlazaID
			) AS NUMERO_TIENDAS
	FROM dbo.TCTEPlazas PL WITH(NOLOCK) 
		INNER JOIN @vtTiendasValidas T
			ON PL.fiPlazaID = T.fiPlazaID 
				AND PL.fiPaisID = T.fiPaisID
	WHERE PL.fiPlazaID NOT IN (SELECT ID FROM @ValueTable)
		AND PL.fiPaisID = @piPaisID
	ORDER BY ID										
END
ELSE
	RAISERROR ('ADVERTENCIA: Debe introducir el id del país.',10, 1) 
		
SET NOCOUNT OFF		

END
GO
/****** Object:  StoredProcedure [dbo].[PATELSEsquemaJerarquico]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
   Descripción: Consulta el empleado de la jerarquía
   -------------------------------------------------------------------
   Fecha: 11/04/2013
   Reponsable: Angel Israel López Rosales
   Última modificación: Devuelve el teléfono celular
*******************************************************************************/
CREATE PROCEDURE [dbo].[PATELSEsquemaJerarquico]
   @piCompaniaId		INT,  /*Compañía asociada a la compañía*/
   @piPromovendedorId	INT   /*Número de promotor*/
AS
BEGIN

SET NOCOUNT ON

SELECT -1 AS IdPadre,
       P.fiPromovendedorId AS IdEmpleado,
       RTRIM(fcNombre) + ' ' + RTRIM(fcAPaterno) + ' ' + RTRIM(fcAMaterno) AS Nombre,
       P.fiPuestoId,
       RTRIM(Pu.fcDescPuesto) AS fcDescPuesto,
       RTRIM(P.fcEmail) AS fcEmail,
       P.fdUltimoCambio,
       P.fiCompaniaId,
       -1 AS Nivel,
       LTRIM(RTRIM(P.fcTelefonoCel)) AS fcTelefonoCel
FROM TATEPromovendedor P WITH(NOLOCK)
   INNER JOIN TCTEPuesto Pu WITH(NOLOCK) ON (P.fiPuestoId = Pu.fiPuestoId)
WHERE @piPromovendedorId <> 0
   AND P.fiPromovendedorId = @piPromovendedorId 
   AND dbo.FNTELSValidarCompania(@piCompaniaId,P.fiCompaniaId,P.fiPuestoId) = 1
UNION ALL
SELECT IdPadre,
       IdEmpleado,
       RTRIM(fcNombre) + ' ' + RTRIM(fcAPaterno) + ' ' + RTRIM(fcAMaterno) AS Nombre,
       P.fiPuestoId,
       RTRIM(Pu.fcDescPuesto) AS fcDescPuesto,
       RTRIM(P.fcEmail) AS fcEmail,
       P.fdUltimoCambio,
       P.fiCompaniaId,
       Nivel,
       LTRIM(RTRIM(P.fcTelefonoCel)) AS fcTelefonoCel
FROM
   (
      SELECT J.fiPadreID AS IdPadre,
             J.fiHijoID AS IdEmpleado,
             Nivel
      FROM FNTELSTablaNivelesJerarquia(@piPromovendedorId) J
    ) TBL 
   INNER JOIN TATEPromovendedor P WITH(NOLOCK) ON (TBL.IdEmpleado = P.fiPromovendedorId)
   INNER JOIN TCTEPuesto Pu WITH(NOLOCK) ON (P.fiPuestoId = Pu.fiPuestoId)
WHERE ((@piPromovendedorId = 0 AND (Nivel IN (0,1))) OR (@piPromovendedorId <> 0 AND Nivel = 0))
   AND dbo.FNTELSValidarCompania(@piCompaniaId,P.fiCompaniaId,P.fiPuestoId) = 1
ORDER BY Nivel	
	
SET NOCOUNT OFF		
RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[PATELSDistritosPenalizados]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
   Descripción: Consulta los supervisores penalizados
   --------------------------------------------------
   Fecha: 22/02/2013
   Responsable: Angel Israel López Rosales
   Modificación: Creación de objeto
************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSDistritosPenalizados]
   @pdInicial DATETIME, 
   @pdFinal   DATETIME,
   @piNegocio INT, 
   @piPlaza   INT = 0
AS
SET NOCOUNT ON

DECLARE @viSinSupervisor INT, @viMontoTotal INT
DECLARE @vtTiendas TABLE (
   fiDistritoId        INT, 
   fcDistrito          VARCHAR(255), 
   fiNoTienda          INT, 
   fcNombreTDA         VARCHAR(255),
   fiPromo             INT,
   fcNombreSupervisor  VARCHAR(255),
   fiMontoPenalizacion INT,
   fiPenalizacion      INT
)
DECLARE @vtPlaza TABLE (fiPlazaId INT, fiPaisID INT)

INSERT INTO @vtPlaza (fiPlazaID, fiPaisID) SELECT fiPlazaID, fiPaisID FROM dbo.TCTEPlazas WITH (NOLOCK)
IF(@piPlaza>0)
   DELETE @vtPlaza WHERE fiPlazaID<>@piPlaza

SELECT @viSinSupervisor = COUNT(ISNULL(fiNoTienda, 0)) FROM dbo.FNTELSTablaTiendasSinSupervisor(@piNegocio)

INSERT INTO @vtTiendas (fiDistritoId, fcDistrito, fiNoTienda, fcNombreTDA, fiPromo, fcNombreSupervisor, fiMontoPenalizacion, fiPenalizacion)
SELECT 
   IdDistrito,
   Distrito,
   fiNoTienda,
   NombreTda,
   fiPromovendedorId, 
   NombrePromo,
   MontoPenalizacion = 
      CASE 
         WHEN fiPuestoId <> 631 THEN 0
         WHEN SUM(ISNULL(Minutos, 0)) >= 60 THEN 0 
         ELSE 5 
      END,
   Penalizacion = 
      CASE 
         WHEN fiPuestoId <> 631 THEN 0
         WHEN SUM(ISNULL(Minutos, 0)) >= 60 THEN 0 
         ELSE 1 
      END
FROM 
(
   SELECT 
      TblResumen.IdDistrito,
      TblResumen.Distrito,
      TblResumen.fiNoTienda,
      Datos.fiPromovendedorId,
      TblResumen.NombreTda,
      Datos.NombrePromo,
      Datos.fiPuestoId,
      TblResumen.Minutos
   FROM 
   (
      SELECT 
         pr.fiPromovendedorId,
         NombrePromo = LTRIM(RTRIM(fcNombre)) + ' ' + LTRIM(RTRIM(fcAPaterno)) + ' ' + LTRIM(RTRIM(fcAMaterno)),
         pr.fiPuestoId
      FROM dbo.TATEPromovendedor pr WITH(NOLOCK)
   ) AS Datos
   INNER JOIN
   (
      SELECT 
         Super.fiPromovendedorId, 
         Super.fiNoTienda, 
         Super.IdDistrito,
         Super.Distrito,
         Super.NombreTda,
         Minutos = SUM(ISNULL(Minutos, 0)) 
      FROM 
      ( 
         SELECT 
            s.fiPromovendedorId, 
            s.fiNoTienda,
            NombreTda = LTRIM(RTRIM(tda.fcDescripcion)),
            IdDistrito = dis.fiDistritoId,
            Distrito = dis.fcDescripcion
         FROM   dbo.TATESupervisor s WITH(NOLOCK)
            INNER JOIN dbo.TATEPromovendedor tp WITH(NOLOCK)
               ON s.fiPromovendedorId = tp.fiPromovendedorId
            INNER JOIN dbo.TCTETiendas tda WITH(NOLOCK)
               ON tda.fiNoTienda = s.fiNoTienda
            INNER JOIN dbo.TCTEDistritales dis WITH(NOLOCK)
               ON dis.fiDistritoId = tda.fiDistritoID
                 AND dis.fiJefeVtaID = tda.fiJefeVtaID
                 AND dis.fiPaisID = tda.fiPaisID
            INNER JOIN @vtPlaza pl 
               ON pl.fiPlazaId = tda.fiPlazaID
         WHERE tp.fiCompaniaId = @piNegocio
            AND tp.fiPuestoId = 631
      ) 
      AS Super
      LEFT OUTER JOIN
      (
         SELECT 
            Entr.fiPromovendedorId, 
            Entr.FechaDia, 
            entr.fiNoTienda,
            Minutos = 
            CASE  
               WHEN Sal.FechaDia IS NULL THEN 0
               ELSE DATEDIFF(MINUTE, Entr.fdFecha, Sal.fdFecha )
            END
         FROM 
         (
            SELECT Asi.fiPromovendedorId, fdFecha, fiNoTienda, FechaDia = CONVERT(DATETIME, CONVERT(VARCHAR(10), fdFecha, 103),103)
            FROM   dbo.TATEControlAsistencia Asi WITH(NOLOCK)
            WHERE  fiAsistenciaId = 1
               AND fdFecha BETWEEN @pdInicial AND @pdFinal
      ) AS Entr
      LEFT OUTER JOIN 
      (
         SELECT Asi.fiPromovendedorId, fdFecha, fiNoTienda, FechaDia = CONVERT(DATETIME, CONVERT(VARCHAR(10), fdFecha, 103),103)
         FROM   dbo.TATEControlAsistencia Asi WITH(NOLOCK)
         WHERE  fiAsistenciaId = 4
            AND fdFecha BETWEEN @pdInicial AND @pdFinal
      ) AS Sal
      ON Sal.fiPromovendedorId = Entr.fiPromovendedorId
         AND CONVERT(DATETIME, CONVERT(VARCHAR(10), Entr.fdFecha, 103),103) = CONVERT(DATETIME, CONVERT(VARCHAR(10), Sal.fdFecha, 103),103)
         AND Entr.fiNoTienda = Sal.fiNoTienda
   ) AS TmpSupe
   ON TmpSupe.fiPromovendedorId = Super.fiPromovendedorId
      AND TmpSupe.fiNoTienda = Super.fiNoTienda
   GROUP BY Super.fiPromovendedorId, Super.fiNoTienda, Super.IdDistrito, Super.Distrito, Super.NombreTda
) AS TblResumen
ON TblResumen.fiPromovendedorId= Datos.fiPromovendedorId
) AS Resumen
GROUP BY fiPromovendedorId, fiNoTienda, NombrePromo, NombreTda, IdDistrito, Distrito, fiPuestoId

SELECT @viMontoTotal = SUM(fiMontoPenalizacion) FROM @vtTiendas

SELECT 
   DistritoId = Tiendas.fiDistritoId, 
   Distrito = fcDistrito,
   TdasAsignadas, 
   TdaNoSupervisadas,
   PenalizacionDist=PenalDist.fiMontoPenalizacion,
   TiendaId = fiNoTienda, 
   Tienda = fcNombreTDA, 
   SupervisorId = fiPromo, 
   Supervisor = fcNombreSupervisor, 
   MontoPenalizacionTienda = Tiendas.fiMontoPenalizacion, 
   Penalizacion = fiPenalizacion,
   SinSupervisor = @viSinSupervisor,
   MontoTotal = @viMontoTotal
FROM    
   (
	   SELECT fiDistritoId, fcDistrito, fiNoTienda, fcNombreTDA, fiPromo, fcNombreSupervisor, fiMontoPenalizacion, fiPenalizacion 
	   FROM @vtTiendas
   ) as Tiendas
   INNER JOIN (
      SELECT 
         fiDistritoId, 
         fiMontoPenalizacion = SUM(fiMontoPenalizacion),
         TdaNoSupervisadas = SUM(fiPenalizacion),
         TdasAsignadas=COUNT(fiNoTienda)
	  FROM @vtTiendas
	  GROUP BY fiDistritoId
   ) AS PenalDist
   ON PenalDist.fiDistritoId = Tiendas.fiDistritoId
ORDER BY fiPromo, Tiendas.fiNoTienda

SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSAsistenciaVendedor]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************
   Descripción: Obtiene la asistencia por promovendedor
   ----------------------------------------------------
   Responsable: Clemente Jonathan Navarrete Díaz
   Fecha: 27/02/2013
   Modificación: Se hace manejo de tolerancia por parametro
**********************************************************************************/
CREATE PROCEDURE [dbo].[PATELSAsistenciaVendedor]
(
	@piPromovendedorId  INT,        /*Número de promovendedor*/
	@pdFechaInicial     DATETIME,   /*Fecha inicial*/
	@pdFechaFinal       DATETIME    /*Fecha final*/
)
AS
SET NOCOUNT ON
BEGIN TRY
   DECLARE @ValueTable 
   TABLE (
      fiVendedorId       INT,
      fcVendedor         VARCHAR(125), 
      fdFecha            DATETIME, 
      fiAsistencia       INT,
      fdLlegada          DATETIME,
      fiEdoLlegada       INT,
      fdSalida           DATETIME,
      fiEdoSalida        INT,
      fiExisteRegLlegada INT
   )
   
   DECLARE @ValueTablePivote 
   TABLE (
      fiVendedorId       INT,
      fcVendedor         VARCHAR(125), 
      fdFecha            DATETIME, 
      fiDescanso		 INT,
      fiEntrada          INT,
      fiSalida	         INT
   )

   DECLARE	@vdFechaInicial     DATETIME, 
           @vdFechaFinal        DATETIME,
           @viCurId             INT,
           @vcNombre            VARCHAR(125),
           @vdFecha             DATETIME,
           @viDiaDescanso       INT,
           @viHoraEntrada       INT,
           @viHoraSalida        INT,
           @viAsistencia        INT,
           @viExisteRegLlegada  INT,
           @vdLlegada           DATETIME,
           @viEdoLllegada       INT,
           @viExisteRegSalida   INT,
           @vdSalida            DATETIME,
           @viEdoSalida         INT,
           @viConteo			INT, 
           @vdFechaMax			DATETIME,
           @viTolerancia		INT
  
   
   SELECT @viTolerancia = CONVERT(INT,ISNULL(fcPrmVal,60)) FROM DBO.TCTEParametro WITH (NOLOCK) WHERE fiPrmId = 15
   
   SELECT	
       @vdFechaInicial = @pdFechaInicial,
       @vdFechaFinal = @pdFechaFinal
   FROM dbo.FNTELSTablaFechasVendedorConsiderandoAltaBaja(@piPromovendedorId, @pdFechaInicial, @pdFechaFinal)

   INSERT INTO @ValueTablePivote (fiVendedorId, fcVendedor, fdFecha, fiDescanso, fiEntrada, fiSalida)
      SELECT	p.fiPromovendedorId AS ID,
      RTRIM(P.fcNombre) + ' ' + RTRIM(P.fcAPaterno) + ' ' + RTRIM(P.fcAMaterno) AS NOMBRE,
      f.Fecha AS FECHA,
      CASE WHEN fiDiaDescanso = 7 THEN 1 ELSE fiDiaDescanso + 1 END AS DIA_DESCANSO,
      CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) AS HR_ENTRADA,
      CONVERT(INTEGER, SUBSTRING(fcHorario, 7, 2)) AS HR_SALIDA
   FROM TATEPromovendedor p WITH(NOLOCK) 
      INNER JOIN dbo.FNTELSTablaFechas(@vdFechaInicial, @vdFechaFinal) f on (1=1)
   WHERE p.fiPromovendedorId = @piPromovendedorId

   SELECT @viConteo = COUNT(fiVendedorId) FROM @ValueTablePivote

   WHILE (@viConteo>0)
   BEGIN
	  --Asigna Valores
	  SELECT @vdFechaMax = MAX(fdFecha) FROM @ValueTablePivote

	  SELECT @viCurId=fiVendedorId,@vcNombre=fcVendedor,@vdFecha=fdFecha,@viDiaDescanso=fiDescanso,@viHoraEntrada=fiEntrada,@viHoraSalida=fiSalida
	  FROM @ValueTablePivote WHERE fdFecha = @vdFechaMax
            
      --Llegada
      SELECT @viExisteRegLlegada = COUNT(fiPromovendedorId) FROM TATEControlAsistencia WITH (NOLOCK)
      WHERE fiPromovendedorId = @viCurId 
      AND fiAsistenciaId = 1
      AND DBO.FNTELSFechaST(fdFecha) = @vdFecha
      
      IF @viExisteRegLlegada > 0
      BEGIN
         SELECT @vdLlegada = fdFecha FROM dbo.TATEControlAsistencia WITH(NOLOCK)
         WHERE fiPromovendedorId = @viCurId 
         AND fiAsistenciaId = 1
         AND DBO.FNTELSFechaST(fdFecha) = @vdFecha
         --Evaluar minutos en que checó su entrada
         IF DATEPART(HOUR, @vdLlegada) < @viHoraEntrada OR (DATEPART(HOUR, @vdLlegada) = @viHoraEntrada  AND DATEPART(MINUTE, @vdLlegada) = 0)
			SET @viEdoLllegada = 0 --Correcta (Semáforo Verde)
         ELSE IF DATEPART(HOUR, @vdLlegada) = @viHoraEntrada AND DATEPART(MINUTE, @vdLlegada) <= @viTolerancia
			SET @viEdoLllegada = 1 --RETARDO (Semáforo Amarillo)
         ELSE 
		 	SET @viEdoLllegada = 2 -- LLEGADA DESPUES DE HORA LIMITE (Semáforo Rojo)
      END
      ELSE
      BEGIN
         SET @vdLlegada = dbo.FNTELSFechaST(@vdFecha)
         IF DATEPART(WEEKDAY, @vdLlegada) = @viDiaDescanso
			SET @viEdoLllegada = 3	--Día de descanso
         ELSE IF @vdLlegada <> dbo.FNTELSFechaST(GETDATE())
			SET @viEdoLllegada = 2 --Falta
         ELSE
            SET @viEdoLllegada = dbo.FNTELSEstadoLlegadaSegunTiempoActual(@viHoraEntrada)
      END
      
      --Salida
      SELECT @viExisteRegSalida = COUNT(fiPromovendedorId) FROM TATEControlAsistencia WITH(NOLOCK) 
      WHERE fiPromovendedorId = @viCurId 
      AND fiAsistenciaId = 4
      AND DBO.FNTELSFechaST(fdFecha) = @vdFecha
      
      IF @viExisteRegSalida > 0
      BEGIN
         SELECT @vdSalida = fdFecha FROM TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId = @viCurId 
         AND fiAsistenciaId = 4
         AND DBO.FNTELSFechaST(fdFecha) = @vdFecha
         --Evaluar minutos en que checó su salida
         IF DATEPART(HOUR, @vdSalida) >= @viHoraSalida
			SET @viEdoSalida = 0 --Correcta (Semáforo Verde)
         ELSE --IF DATEPART(HOUR, @vdSalida) = (@viHoraSalida - 1) AND DATEPART(MINUTE, @vdSalida) < 45
			SET @viEdoSalida = 2 --Salida previa mayor (Semáforo Rojo)
         END
      ELSE
      BEGIN
         SET @vdSalida = dbo.FNTELSFechaST(@vdFecha)
         IF DATEPART(WEEKDAY, @vdSalida) = @viDiaDescanso
            SET @viEdoSalida = 3	--Día de descanso
         ELSE IF @vdSalida <> dbo.FNTELSFechaST(GETDATE())
            SET @viEdoSalida = 2 -- No fue
         ELSE
            SET @viEdoSalida = 4 --Aún no checa salida
      END

	  --Asistencia
      SELECT @viAsistencia=
         CASE 
            WHEN dbo.fnDiaSemana(@vdFecha)=(SELECT fiDiaDescanso FROM dbo.TATEPromovendedor WITH(NOLOCK) WHERE fiPromovendedorId=@viCurId) THEN 2
            WHEN (@viEdoLllegada = 0 OR @viEdoLllegada = 1) AND @viEdoSalida = 0 THEN 1
            WHEN @viEdoLllegada = 4 THEN 4
            ELSE 0 
            END
      
      --Inserta Datos
      INSERT INTO @ValueTable(fiVendedorId, fcVendedor, fdFecha, fiAsistencia, fdLlegada, fiEdoLlegada, fdSalida, fiEdoSalida, fiExisteRegLlegada)
      SELECT @viCurId, @vcNombre,@vdFecha,@viAsistencia,@vdLlegada,@viEdoLllegada,@vdSalida,@viEdoSalida,@viExisteRegLlegada

	  DELETE @ValueTablePivote WHERE fdFecha = @vdFechaMax
	  
	  SELECT @viConteo = COUNT(fiVendedorId) FROM @ValueTablePivote

   END

   SELECT
          VENDEDOR_ID=fiVendedorId,
          VENDEDOR=fcVendedor, 
          [FECHA]=fdFecha, 
          [ASISTENCIA]=fiAsistencia,
          [LLEGADA]=fdLlegada,
          [ESTADO_LLEGADA]=fiEdoLlegada,
          [SALIDA]=fdSalida,
          [ESTADO_SALIDA]=fiEdoSalida,
          [EXISTE_REGISTRO_LLEGADA]=fiExisteRegLlegada
   FROM @ValueTable ORDER BY Fecha DESC

END TRY
BEGIN CATCH
   DECLARE @vcMensaje VARCHAR(255)
   SET @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSHijos]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
   Descripción: Consulta el empleado de la jerarquía, hijos
   -------------------------------------------------------------------
   Fecha: 11/04/2013
   Reponsable: Angel Israel López Rosales
   Última modificación: Devuelve el teléfono celular
*******************************************************************************/
CREATE PROCEDURE [dbo].[PATELSHijos] 
   @piCompaniaId		INT,
   @piPromovendedorId	INT
AS
BEGIN

SET NOCOUNT ON

SELECT IdPadre,
       IdEmpleado,
       RTRIM(fcNombre) + ' ' + RTRIM(fcAPaterno) + ' ' + RTRIM(fcAMaterno) AS Nombre,
       P.fiPuestoId,
       RTRIM(Pu.fcDescPuesto) AS fcDescPuesto,
       RTRIM(P.fcEmail) AS fcEmail,
       P.fdUltimoCambio,
       P.fiCompaniaId,
       Nivel,
       LTRIM(RTRIM(P.fcTelefonoCel)) AS fcTelefonoCel
FROM
   (
      SELECT J.fiPadreID AS IdPadre,
             J.fiHijoID AS IdEmpleado,
             Nivel
      FROM FNTELSTablaNivelesJerarquia(@piPromovendedorId) J) TBL 
   INNER JOIN TATEPromovendedor P WITH(NOLOCK) ON (TBL.IdEmpleado = P.fiPromovendedorId)
   INNER JOIN TCTEPuesto Pu WITH(NOLOCK) ON (P.fiPuestoId = Pu.fiPuestoId)
WHERE ((@piPromovendedorId = 0 AND (Nivel IN (0,1))) OR (@piPromovendedorId <> 0 AND Nivel = 0)) 
ORDER BY Nivel	
	
SET NOCOUNT OFF		
RETURN 0
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaResumenPenalizacion]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FNTELSTablaResumenPenalizacion](
 @piCompaniaId	INT,
 @pdFecha		DATETIME
 )
RETURNS @ValueTable TABLE ([fiDistritoID] INT, [DescDistrito] VARCHAR(100), [fiPromovendedorId] INT, 
						   [Nombre] VARCHAR(125), [fiNoTienda] INT, [DescTienda] VARCHAR(100), --[Supervisada] INT,
						   [Penalizacion] INT, [MontoPenalizacion] INT)
BEGIN

 DECLARE @viMontoPenalizacion INT
 
 SELECT @viMontoPenalizacion = CONVERT(INTEGER, fcPrmVal) FROM TCTEParametro WITH(NOLOCK) WHERE fiPrmId = 11
 
 IF dbo.FNTELSFechaST(GETDATE()) = 	dbo.FNTELSFechaST(@pdFecha)
 	
	  INSERT INTO @ValueTable ([fiDistritoID], [DescDistrito], [fiPromovendedorId], 
							   [Nombre], [fiNoTienda], [DescTienda], /*[Supervisada],*/
							   [Penalizacion], [MontoPenalizacion])
		   
	  SELECT T.fiDistritoID, 
		   D.fcDescripcion as DescDistrito,
		   ISNULL(S.fiPromovendedorId, -1) as fiPromovendedorId, 
		   ISNULL(RTRIM(P.fcNombre) + ' ' + RTRIM(P.fcAPaterno) + ' ' + RTRIM(P.fcAMaterno),'-N/A-') as Nombre, 
		   TxN.fiNoTienda, 
		   T.fcDescripcion as DescTienda,
		   --dbo.FNTELSTiendaSupervisada(TxN.fiNoTienda, TxN.fiPaisID, TxN.fiCanalId, @pdFecha) as Supervisada,
		   ISNULL(CASE WHEN ISNULL(TBL_NOPEN.NoPenalizada,2) <> 0 THEN TBL_PEN_HOY.PenalizacionHoy ELSE TBL_NOPEN.NoPenalizada END,2) AS Penalizacion,
		   CASE WHEN ISNULL(TBL_NOPEN.NoPenalizada,2) <> 0 THEN @viMontoPenalizacion ELSE 0 END AS MontoPenalizacion
	 from FNTELSTablaTiendasXNegocio(@piCompaniaId) TxN INNER JOIN TCTETiendas T WITH(NOLOCK)
	 ON (TxN.fiNoTienda = T.fiNoTienda AND TxN.fiPaisID = T.fiPaisID AND TxN.fiCanalId = T.fiCanalId)
	 INNER JOIN TCTEDistritales D WITH(NOLOCK) on (T.fiPaisID = D.fiPaisID and T.fiPlazaID = D.fiPlazaID and T.fiJefeVtaID = D.fiJefeVtaID and T.fiDistritoID = D.fiDistritoId)
	 LEFT JOIN TATESupervisor S WITH(NOLOCK) on (S.fiNoTienda = TxN.fiNoTienda AND S.fiPaisID = TxN.fiPaisID AND S.fiCanalId = TxN.fiCanalId)
	 LEFT JOIN TATEPromovendedor P WITH(NOLOCK) on (P.fiPromovendedorId = S.fiPromovendedorId AND dbo.FNTELSValidarCompania(@piCompaniaId,P.fiCompaniaId,P.fiPuestoId) = 1)
	 LEFT JOIN FNTELSTablaTiendasNoPenalizadas(@piCompaniaId, @pdFecha) TBL_NOPEN ON (TxN.fiNoTienda = TBL_NOPEN.fiNoTienda)
	 LEFT JOIN FNTELSTablaTiendasPreOPenalizadasHoy(@piCompaniaId) TBL_PEN_HOY ON (TxN.fiNoTienda = TBL_PEN_HOY.fiNoTienda)
 
 ELSE
 
 	  INSERT INTO @ValueTable ([fiDistritoID], [DescDistrito], [fiPromovendedorId], 
							   [Nombre], [fiNoTienda], [DescTienda], /*[Supervisada],*/
							   [Penalizacion], [MontoPenalizacion])
		   
	   SELECT T.fiDistritoID, 
		   D.fcDescripcion as DescDistrito,
		   ISNULL(S.fiPromovendedorId, -1) as fiPromovendedorId, 
		   ISNULL(RTRIM(P.fcNombre) + ' ' + RTRIM(P.fcAPaterno) + ' ' + RTRIM(P.fcAMaterno),'-N/A-') as Nombre, 
		   TxN.fiNoTienda, 
		   T.fcDescripcion as DescTienda,
		   --dbo.FNTELSTiendaSupervisada(TxN.fiNoTienda, TxN.fiPaisID, TxN.fiCanalId, @pdFecha) as Supervisada,
		   isnull(TBL_NOPEN.NoPenalizada,2) as Penalizacion,
		   case when isnull(TBL_NOPEN.NoPenalizada,2) = 0 then 0 else @viMontoPenalizacion end as MontoPenalizacion
	 from FNTELSTablaTiendasXNegocio(@piCompaniaId) TxN INNER JOIN TCTETiendas T WITH(NOLOCK)
	 ON (TxN.fiNoTienda = T.fiNoTienda AND TxN.fiPaisID = T.fiPaisID AND TxN.fiCanalId = T.fiCanalId)
	 INNER JOIN TCTEDistritales D WITH(NOLOCK) on (T.fiPaisID = D.fiPaisID and T.fiPlazaID = D.fiPlazaID and T.fiJefeVtaID = D.fiJefeVtaID and T.fiDistritoID = D.fiDistritoId)
	 LEFT JOIN TATESupervisor S WITH(NOLOCK) on (S.fiNoTienda = TxN.fiNoTienda AND S.fiPaisID = TxN.fiPaisID AND S.fiCanalId = TxN.fiCanalId)
	 LEFT JOIN TATEPromovendedor P WITH(NOLOCK) on (P.fiPromovendedorId = S.fiPromovendedorId AND dbo.FNTELSValidarCompania(@piCompaniaId,P.fiCompaniaId,P.fiPuestoId) = 1)
	 LEFT JOIN FNTELSTablaTiendasNoPenalizadas(@piCompaniaId, @pdFecha) TBL_NOPEN ON (TxN.fiNoTienda = TBL_NOPEN.fiNoTienda)
 
 RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaPuntualidad]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[FNTELSTablaPuntualidad](
	@CATEGORIA INT,
	@PAIS INT,
	@PLAZA INT,
	@DISTRITO INT,
	@FI DATETIME,
	@FF DATETIME
 )
RETURNS @ValueTable TABLE ([ID] INT, [DESCRIPCION] VARCHAR(125), [PORCENTAJE_PUNTUALIDAD] DECIMAL(10,2))
BEGIN

	IF @DISTRITO > 0 AND @PLAZA > 0 AND @PAIS > 0
	
		
			INSERT INTO @ValueTable ([ID], [DESCRIPCION], [PORCENTAJE_PUNTUALIDAD])
			SELECT ID, DESCRIPCION, SUM(PorcPuntualidad) / COUNT(*) AS PORCENTAJE FROM (
				SELECT	T.fiNoTienda AS ID,
						T.fcDescripcion AS DESCRIPCION,
						DBO.FNTELSPorcPuntualidad(fiPromovendedorId, @FI, @FF) AS PorcPuntualidad
				FROM
				TATEPromovendedor P INNER JOIN TCTETiendas T 
				ON (T.fiNoTienda = P.fiNoTienda
				AND   (t.fiPaisID = @PAIS)
				AND   (fiPlazaID = @PLAZA)
				AND   (fiDistritoID = @DISTRITO)
				AND T.fiCanalID in (1,143,17) AND T.fiActivo = 1
				)
				AND (fiCompaniaId = @CATEGORIA OR 0 = @CATEGORIA)
			) AS tabla
			WHERE PorcPuntualidad <> -1
			GROUP BY ID, DESCRIPCION
	
	ELSE IF @PLAZA > 0 AND @PAIS > 0
	
		
			INSERT INTO @ValueTable ([ID], [DESCRIPCION], [PORCENTAJE_PUNTUALIDAD])
			SELECT ID, DESCRIPCION, SUM(PorcPuntualidad) / COUNT(*) AS PORCENTAJE FROM (
				SELECT	D.fiDistritoId AS ID,
						D.fcDescripcion AS DESCRIPCION,
						DBO.FNTELSPorcPuntualidad(fiPromovendedorId, @FI, @FF) AS PorcPuntualidad
				FROM
				TATEPromovendedor P INNER JOIN TCTETiendas T 
				ON (T.fiNoTienda = P.fiNoTienda
				AND   (t.fiPaisID = @PAIS)
				AND   (fiPlazaID = @PLAZA)
				AND T.fiCanalID in (1,143,17) AND T.fiActivo = 1
				)
				AND (fiCompaniaId = @CATEGORIA OR 0 = @CATEGORIA)
				INNER JOIN TCTEDistritales D ON (T.fiPlazaID = D.fiPlazaID AND T.fiPaisID = D.fiPaisID AND T.fiJefeVtaID = D.fiJefeVtaID AND T.fiDistritoID = D.fiDistritoId)
			) AS tabla
			WHERE PorcPuntualidad <> -1
			GROUP BY ID, DESCRIPCION
			
	ELSE IF @PAIS > 0
 
	    INSERT INTO @ValueTable ([ID], [DESCRIPCION], [PORCENTAJE_PUNTUALIDAD])
	    SELECT ID, DESCRIPCION, SUM(PorcPuntualidad) / COUNT(*) AS PORCENTAJE FROM (
		  			SELECT	PL.fiPlazaID AS ID,
							PL.fcDescripcion AS DESCRIPCION,
							DBO.FNTELSPorcPuntualidad(fiPromovendedorId, @FI, @FF) AS PorcPuntualidad
					FROM
					TATEPromovendedor P INNER JOIN TCTETiendas T 
					ON (T.fiNoTienda = P.fiNoTienda
					AND   (t.fiPaisID = @PAIS)
					AND T.fiCanalID in (1,143,17) AND T.fiActivo = 1
					)
					AND (fiCompaniaId = @CATEGORIA OR 0 = @CATEGORIA)
					INNER JOIN TCTEPlazas PL ON (T.fiPlazaID = PL.fiPlazaID AND T.fiPaisID = PL.fiPaisID)
				) AS P
				WHERE PorcPuntualidad <> -1
				GROUP BY ID, DESCRIPCION
 
 RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTablaPenalizacion]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSTablaPenalizacion](
	@pdFechaInicial	DATETIME,
	@pdFechaFinal	DATETIME,
	@piPromovendedorId INT
 )
RETURNS @vTablePenalizacion TABLE ([fiNoTienda] INT, [fiMinutos] INT)
BEGIN
	INSERT INTO @vTablePenalizacion ([fiNoTienda], [fiMinutos])
	SELECT	S.fiNoTienda, 
			SUM(ISNULL(dbo.FNTELSTiempoSupervision(Fecha,@piPromovendedorId,S.fiNoTienda),0) )
	FROM FNTELSTablaFechas(@pdFechaInicial,@pdFechaFinal)
		INNER JOIN TATESupervisor S WITH(NOLOCK) ON (S.fiPromovendedorId = @piPromovendedorId)
	GROUP BY S.fiNoTienda
 
 RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTiendaPenalizada]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FNTELSTiendaPenalizada]
(
	@piNoTienda		INT,
	@piPaisID		INT,
	@piCanalID		INT,
	@pdFecha		DATETIME,
	@piCompaniaId	INT
	
)
RETURNS		INT
AS
BEGIN
	
	DECLARE	 @viTiendaPenalizada	INT
	DECLARE	 @viFechaActual			INT
	DECLARE	 @viMaxHrEntrada		INT
		
	SELECT @viFechaActual = CASE WHEN dbo.FNTELSFechaST(GETDATE()) = dbo.FNTELSFechaST(@pdFecha) THEN 1 ELSE 0 END
	
	 --Realizar siempre primero esta asignación a la variable de Penalización:
	SELECT @viTiendaPenalizada =  CASE WHEN COUNT(A.fiNoTienda) > 0 THEN 0 ELSE 2 END
	from TATEControlAsistencia A WITH(NOLOCK)
	INNER JOIN TATEPromovendedor P WITH(NOLOCK) on (A.fiPromovendedorId = P.fiPromovendedorId)
	where dbo.FNTELSFechaST(fdFecha) = @pdFecha
		AND fiAsistenciaId = 1
		AND A.fiNoTienda = @piNoTienda
		AND P.fiCompaniaId = @piCompaniaId
		AND DATEPART(HOUR, fdFecha) < CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2)) + 3
		
	IF @viFechaActual = 1 AND @viTiendaPenalizada <> 0
		BEGIN
		
			 SELECT @viMaxHrEntrada = ISNULL(MAX(CONVERT(INTEGER, SUBSTRING(fcHorario, 1, 2))),-3) 
				FROM dbo.FNTELSTablaVendedoresTienda(@piPaisID,@piCompaniaId,@pdFecha,@pdFecha)
				WHERE fiNoTienda = @piNoTienda
				
			 SELECT @viTiendaPenalizada = CASE WHEN DATEPART(HOUR, GETDATE()) >= @viMaxHrEntrada + 3 THEN 2 ELSE 1 END
			 	
		END
	


RETURN @viTiendaPenalizada

END
GO
/****** Object:  UserDefinedFunction [dbo].[FNTELSTiempoSupervisionTotal]    Script Date: 08/14/2020 09:06:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************
   Descripción: Función para indentificar el tiempo de supervisión del supervisor dado
   Fecha: 06 de Febrero de 2013
   Responsable: Clemente Jonathan Navarrete Díaz
*************************************************************************************/
CREATE FUNCTION [dbo].[FNTELSTiempoSupervisionTotal]
(
   @pdFecha           DATETIME, /*Fecha a verificar*/
   @piPromovendedorId INT       /*Id de Promovendedor */
)
RETURNS		INT
AS
BEGIN
   DECLARE @viMinSupervisados INT,
		   @viMin			  INT,
		   @viConteo		  INT,
		   @viConteo2		  INT,
		   @viPuestoId		  INT,
		   @viIdPromo		  INT,
		   @viNoTienda		  INT

   DECLARE @vTableSupervisores TABLE ([fiIdPromo] INT)
   DECLARE @vTableTiendas TABLE ([fiNoTienda] INT)

   SET @viMinSupervisados = 0

   SELECT @viPuestoId = fiPuestoId FROM TATEPromovendedor  WITH (NOLOCK) WHERE fiPromovendedorId = @piPromovendedorId

	IF @viPuestoId = 631 -- SUPERVISOR
	BEGIN
		INSERT INTO @vTableSupervisores (fiIdPromo)
		VALUES(@piPromovendedorId)
	END
	ELSE IF @viPuestoId = 632 -- JEFE DE VENTAS
	BEGIN
		INSERT INTO @vTableSupervisores (fiIdPromo)
		SELECT DISTINCT fiHijoID
		FROM TATEJerarquia J WITH (NOLOCK) 
		WHERE J.fiPadreID = @piPromovendedorId
	END
	ELSE IF @viPuestoId = 633 -- JEFE DE PLAZA
	BEGIN
		INSERT INTO @vTableSupervisores (fiIdPromo)
		SELECT DISTINCT JV.fiHijoID
		FROM TATEJerarquia JP WITH (NOLOCK) 
		INNER JOIN TATEJerarquia JV WITH (NOLOCK)  
		ON JV.fiPadreID = JP.fiHijoID AND JP.fiPadreID = @piPromovendedorId 		
	END

	SELECT @viConteo = COUNT(fiIdPromo) FROM @vTableSupervisores

	WHILE (@viConteo>0)
	BEGIN
		--Asigna Valores
		SELECT @viIdPromo = MAX(fiIdPromo) FROM @vTableSupervisores

		--Limpia tabla de paso de las tiendas
		DELETE @vTableTiendas
			
		--Tiendas asignadas al supervisor
		INSERT INTO @vTableTiendas (fiNoTienda)
		SELECT fiNoTienda FROM TATESupervisor WITH (NOLOCK) WHERE fiPromovendedorId =  @viIdPromo
		
		SET @viConteo2 = 0
		SELECT @viConteo2 = COUNT(fiNoTienda) FROM @vTableTiendas
		WHILE(@viConteo2>0)
		BEGIN
			--Asigna tienda a revisar
			SELECT @viNoTienda = MAX(fiNoTienda) FROM @vTableTiendas
			
			SET @viMin = 0
			SELECT @viMin = ISNULL(dbo.FNTELSTiempoSupervision(@pdFecha,@viIdPromo,@viNoTienda),0)
			SET @viMinSupervisados = @viMinSupervisados + @viMin
			
			DELETE @vTableTiendas WHERE fiNoTienda = @viNoTienda
			SELECT @viConteo2 = COUNT(fiNoTienda) FROM @vTableTiendas
		END
		
		-- Se quita el valor asignado
		DELETE @vTableSupervisores WHERE fiIdPromo = @viIdPromo
		SELECT @viConteo = COUNT(fiIdPromo) FROM @vTableSupervisores
	END

RETURN @viMinSupervisados
END
GO
/****** Object:  StoredProcedure [dbo].[PATELISupervisorTienda]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************
	Descripción: Da de alta una tienda a un supervisor
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELISupervisorTienda] 
	@piNoTienda         INT,
	@piPromovendedorId  INT,
	@pcCorreoModifica   VARCHAR(255) = NULL,
	@pcIPModifica       VARCHAR(50)  = NULL,
	@pcEmpNo            VARCHAR(10)   = '999992'
AS 

DECLARE @viPais    INT,
        @viCanal   INT,
        @vcMensaje VARCHAR(200),
        -- VARIABLES DE LA BITACORA
        @viNoTienda        smallint,
        @viTipoVendedorId  smallint,
        @vcNombre          char(40),
        @vcAPaterno        char(40),
        @vcAMaterno        char(40),
        @vcRFC             char(20),
        @vcFechNacimiento  char(10),
        @vcTelefono        char(10),
        @viCompaniaId      INT,
        @vcHorario         char(8),
        @viDiaDescanso     tinyint,
        @viStatus          tinyint,
        @vcJefeInme        char(60),
        @vdFecRegistro     datetime,
        @vcEmail           char(60),
        @viNoPromo         char(10),
        @vcTelefonoCel     char(10) = null,
        @vcTelefonoRec     char(10) = null,
        @viPuesto          INT,
		@viPromotorTienda	INT

SET NOCOUNT ON

BEGIN TRY
	IF(@piPromovendedorId = 0)
	BEGIN
		SET NOCOUNT OFF	  
		RETURN 0
	END

	--Obtener canal y pais de la tienda
	SELECT  TOP 1 @viPais = fiPaisId, @viCanal = fiCanalId 
	FROM	dbo.TCTETiendas WITH(NOLOCK) 
	WHERE	fiNoTienda = @piNoTienda

	/*Validar que no exista ya un supervisor asignado en esa tienda de la misma compañía*/
	SET @vcMensaje = dbo.FNTELSValidacionesSupervisorTienda(@piNoTienda, @piPromovendedorId, @viPais, @viCanal)
	IF @vcMensaje <> '' 
	BEGIN
		IF(@vcMensaje = 'Tienda OUI')
		BEGIN
			SELECT	@viPromotorTienda = p.fiPromovendedorId 
			FROM	dbo.TATESupervisor s
				INNER JOIN dbo.TATEPromovendedor p 
					ON s.fiPromovendedorId = p.fiPromovendedorId
			WHERE	p.fiCompaniaId = 107
				AND s.fiNoTienda = @piNoTienda
			EXECUTE dbo.PATELDSupervisorTienda @piNoTienda = @piNoTienda, @piPromovendedorId = @viPromotorTienda
		END
		ELSE
		BEGIN
			RAISERROR(@vcMensaje, 18, 1)
		END
	END

	INSERT INTO dbo.TATESupervisor VALUES (@piPromovendedorId, @piNoTienda, @viPais, @viCanal)

	-- GRABAMOS LA BITACORA
	SELECT @viNoTienda       = fiNoTienda,
	@viTipoVendedorId = fiTipoVendedorId,
	@vcNombre         = fcNombre,
	@vcAPaterno       = fcAPaterno,
	@vcAMaterno       = fcAMaterno,
	@vcRFC            = fcRFC,
	@vcFechNacimiento = fcFechNacimiento,
	@vcTelefono       = fcTelefono,
	@viCompaniaId     = fiCompaniaId,
	@vcHorario        = fcHorario,
	@viDiaDescanso    = fiDiaDescanso,
	@viStatus         = fiStatus,
	@vcJefeInme       = fcJefeInme,
	@vdFecRegistro    = fdFecRegistro,
	@vcEmail          = fcEmail,
	@viNoPromo        = fiNoPromo,
	@vcTelefonoCel    = fcTelefonoCel,
	@vcTelefonoRec    = fcTelefonoRec,
	@viPuesto         = fiPuestoId
	FROM DBO.TATEPromovendedor WITH(NOLOCK)
	WHERE fiPromovendedorId = @piPromovendedorId
       
	EXECUTE dbo.PATELIPromoVendedorHist
	@piPromovendedorId = @piPromovendedorId,
	@piNoTienda        = @viNoTienda,
	@piTipoVendedorId  = @viTipoVendedorId,
	@pcNombre          = @vcNombre,
	@pcAPaterno        = @vcAPaterno,
	@pcAMaterno        = @vcAMaterno,
	@pcRFC             = @vcRFC,
	@pcFechNacimiento  = @vcFechNacimiento,
	@pcTelefono        = @vcTelefono,
	@piCompaniaId      = @viCompaniaId,
	@pcHorario         = @vcHorario,
	@piDiaDescanso     = @viDiaDescanso,
	@piStatus          = @viStatus,
	@pcJefeInme        = @vcJefeInme,
	@pdFecRegistro     = @vdFecRegistro,
	@pcEmpNo           = @pcEmpNo,
	@piTipoMovimiento  = 6,
	@pcEmail           = @vcEmail,
	@piNoPromo         = @viNoPromo,
	@pcTelefonoCel     = @vcTelefonoCel,
	@pcTelefonoRec     = @vcTelefonoRec,
	@piPuesto          = @viPuesto,
	@pcCorreoModifica  = @pcCorreoModifica,
	@pcIPModifica      = @pcIPModifica

END TRY
BEGIN CATCH
   SET @vcMensaje = ERROR_MESSAGE()
   RAISERROR(@vcMensaje, 18, 1)
   SET NOCOUNT OFF	  
   RETURN -1
END CATCH

SET NOCOUNT OFF	  
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELIPromoVendedor_bkp]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************************************************
	Descripción: Inserta promovendedor en TATEPromovendedor
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELIPromoVendedor_bkp]  
	@piNoTienda			SMALLINT,				--Tienda asociada al demovendedor
	@piTipoVendedorId	SMALLINT,				--Tipo de vendedor (1=fijo, 2=volante)
	@pcNombre			VARCHAR(40),			--Nombre del demovendedor
	@pcAPaterno			VARCHAR(40),			--Apellido Paterno del demovendedor
	@pcAMaterno			VARCHAR(40),			--Apellido materno del demovendedor
	@pcRFC				VARCHAR(20),			--rfc del demovendedor  
	@pcFechNacimiento	VARCHAR(10),			--Fecha de nacimiento del demovendedor  
	@pcTelefono			VARCHAR(10),			--Telefono fijo del demovendedor  
	@piCompaniaId		INT,				--Compañía para la que trabaja el demovendedor (11=unefon, 31=movistar, etc)  
	@pcHorario			VARCHAR(8),				--Horario de trabajo (aabbccdd aa=hora entrada, bb=hora salida a comer, cc=hora regreso comer, dd=salida del trabajo)  
	@piDiaDescanso		TINYINT,				--Dia de descanso, 1=lunes,2=martes,3=miércoles,....,7=domingo  
	@pcJefeInme			VARCHAR(60),			--Nombre del jefe inmediato  
	@pcEmpNo			VARCHAR(10),				--Empleado que da de alta  
	@pcEmail			VARCHAR(60)='',			--E-mail del demovendedor  
	@piNoPromo			VARCHAR(10)='',			--Número de empleado de la empresa para la que trabaja  
	@pcTelefonoCel		VARCHAR(10)='',			--Número de teléfono celular  
	@pcTelefonoRec		VARCHAR(10)='',			--Número de teléfono de recados  
	@piPuesto			INT = 0,				--Puesto asociado al demovendedor  
	@plActualiza		BIT = 0,				--Bandera para indicar que se esta haciendo una carga masiva  
	@pcCorreoModifica	VARCHAR(255) = NULL,	--Correo de la persona que modifica
	@pcIPModifica		VARCHAR(50)  = NULL,		--IP de la maquina de la persona que modifica
	@pcCURP				VARCHAR(18) = NULL
AS  
SET NOCOUNT ON  
DECLARE
	@viRtn              INT,  
	@vcMensaje          VARCHAR(200),  
	@viPromovendedorId  INT,  
	@vdFechaHoy         DATETIME,  
	@viRanMin           INT,  
	@viRanMax           INT,  
	@viIdReciclado      INT,  
	@viStatus           INT,  
	@viTipoMovimiento   SMALLINT,  
	@viCanal            INT,  
	@viPais             INT,  
	@viCatalogoId1      INT,  
	@viCatalogoId2      INT

SELECT @vdFechaHoy=GETDATE(), @viIdReciclado=0

BEGIN TRY  
	IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE fcNombre = @pcNombre AND fcAPaterno = @pcAPaterno AND fcAMaterno = @pcAMaterno AND fiStatus <> 4 and fiStatus <> 2)  
	BEGIN  
		RAISERROR('El nombre del promovendedor ya fue registrado previamente. Validación 1',18,1)
	END
	IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE LTRIM(RTRIM(fcCURP)) = LTRIM(RTRIM(@pcCURP)) AND fiStatus <> 4 and fiStatus <> 2)  
	BEGIN  
		RAISERROR('El nombre del promovendedor ya fue registrado previamente. Validación 2',18,1)
	END  
	IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE LTRIM(RTRIM(fcCURP)) = LTRIM(RTRIM(@pcEmail)) AND fiStatus <> 4 and fiStatus <> 2)  
	BEGIN  
		RAISERROR('El nombre del promovendedor ya fue registrado previamente. Validación 3',18,1)
	END  
	IF NOT EXISTS(SELECT fiNoTienda FROM dbo.TCTETiendas WITH(NOLOCK) WHERE fiNoTienda = @piNoTienda)  
	BEGIN  
		RAISERROR('No está registrada la tienda en el catálogo de tiendas.',18,1)  
	END  
	ELSE  
	BEGIN  
		SELECT @viCanal = fiCanalId, @viPais = fiPaisID FROM dbo.TCTETiendas WITH (NOLOCK) WHERE fiNoTienda = @piNoTienda  
	END 
	IF(@piCompaniaId = 0) 
	BEGIN
		SET @piCompaniaId = 1
	END
	IF NOT EXISTS (SELECT fiCompaniaId FROM dbo.TCTECompania WHERE fiCompaniaId = @piCompaniaId AND fiPaisID = @viPais)  
	BEGIN   
		RAISERROR('No se encuentra la compañia proporcionada',18,1)  
	END  
	IF EXISTS(SELECT fiCatalogoId FROM dbo.TCTEDetalleCatalogoGenerico WHERE fiCatalogoId = 6 AND fiItemId = @piCompaniaId)  
	BEGIN  
		SELECT @vcMensaje = LTRIM(RTRIM(fcDescripcion)) FROM dbo.TCTEDetalleCatalogoGenerico WHERE fiCatalogoId = 6 AND fiItemId = @piCompaniaId  
		SET @vcMensaje ='No se puede registrar un empleado con la compañía ' + @vcMensaje + ', ya que está dada de baja.'  
		RAISERROR(@vcMensaje,18,1)  
	END  
	
	SELECT	@viPromovendedorId	=	fiPromovendedorId, 
			@viStatus			=	fiStatus,
			@viTipoMovimiento	=	fiTipoMovimiento,
			@viIdReciclado		=	flReciclado,
			@vcMensaje			=	fcMensaje
	FROM	dbo.FNTELSNumPromovendedor(@viPais)

	IF (@vcMensaje <> '')
		RAISERROR(@vcMensaje, 18, 1)

	IF @viIdReciclado=0  
	BEGIN  
		INSERT INTO DBO.TATEPromovendedor(  
			fiPromovendedorId,
			fiNoTienda,
			fiTipoVendedorId,
			fcNombre,
			fcAPaterno,
			fcAMaterno,
			fcRFC,
			fcFechNacimiento,
			fcTelefono,
			fcTelefonoCel,
			fcTelefonoRec,
			fiCompaniaId,
			fcHorario,
			fiDiaDescanso,
			fiStatus,
			fcJefeInme,
			fcEmail,
			fiNoPromo,
			fdFecRegistro,
			fiPuestoId,
			fiPaisID,
			fiCanalId,
			flActualiza,
			flHuellaValida,
			fcCURP
		)  
		VALUES (  
			@viPromovendedorId,
			@piNoTienda,
			@piTipoVendedorId,
			LTRIM(RTRIM(@pcNombre)),
			LTRIM(RTRIM(@pcAPaterno)),
			LTRIM(RTRIM(@pcAMaterno)),
			@pcRFC,
			@pcFechNacimiento,
			@pcTelefono,
			@pcTelefonoCel,
			@pcTelefonoRec,
			@piCompaniaId,
			@pcHorario,
			@piDiaDescanso,
			1,
			@pcJefeInme,
			@pcEmail,
			@piNoPromo,
			@vdFechaHoy,
			@piPuesto,
			@viPais,
			@viCanal,
			@plActualiza,
			0,
			@pcCURP 
		)  
	END
	ELSE IF @viIdReciclado=1
	BEGIN
		UPDATE DBO.TATEPromovendedor
		SET fiNoTienda			=	@piNoTienda,  
			fiTipoVendedorId	=	@piTipoVendedorId,
			fcNombre			=	LTRIM(RTRIM(@pcNombre)),
			fcAPaterno			=	LTRIM(RTRIM(@pcAPaterno)),
			fcAMaterno			=	LTRIM(RTRIM(@pcAMaterno)),
			fcRFC				=	@pcRFC,
			fcFechNacimiento	=	@pcFechNacimiento,
			fcTelefono			=	@pcTelefono,
			fcTelefonoCel		=	@pcTelefonoCel,
			fcTelefonoRec		=	@pcTelefonoRec,
			fiCompaniaId		=	@piCompaniaId,
			fcHorario			=	@pcHorario,
			fiDiaDescanso		=	@piDiaDescanso,
			fiStatus			=	@viStatus,
			fcJefeInme			=	@pcJefeInme,
			fcEmail				=	@pcEmail,
			fiNoPromo			=	@piNoPromo,
			fdFecRegistro		=	GETDATE(),
			fdUltimoCambio		=	GETDATE(),
			fiPuestoId			=	@piPuesto,
			fiPaisID			=	@viPais,
			fiCanalId			=	@viCanal,
			flActualiza			=	@plActualiza,
			flHuellaValida		=	0,
			fcCURP				=	@pcCURP
		WHERE fiPromovendedorId = @viPromovendedorId   
	END
	-- GRABAMOS LA BITACORA
	EXECUTE dbo.PATELIPromoVendedorHist  
		@viPromovendedorId,  
		@piNoTienda,
		@piTipoVendedorId,
		@pcNombre,
		@pcAPaterno,
		@pcAMaterno,
		@pcRFC,
		@pcFechNacimiento,
		@pcTelefono,
		@piCompaniaId,
		@pcHorario,
		@piDiaDescanso,
		@viStatus,
		@pcJefeInme,
		@vdFechaHoy,
		@pcEmpNo,
		@viTipoMovimiento,
		@pcEmail,
		@piNoPromo,
		@pcTelefonoCel,
		@pcTelefonoRec,
		@piPuesto,
		@viPais,
		@viCanal,
		@pcCorreoModifica = @pcCorreoModifica,
		@pcIPModifica = @pcIPModifica,
		@pcCURP = @pcCURP  
END TRY  
BEGIN CATCH
	SET @vcMensaje=ERROR_MESSAGE() 
	RAISERROR(@vcMensaje,18,1) 
	SET NOCOUNT OFF
	RETURN -1  
END CATCH  
  
-- REGRESAMOS EL NUMERO DE PROMOVENDEDOR QUE SE GENERO.  
SELECT @viPromovendedorId AS fiPromovendedorId   
SET NOCOUNT OFF  
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELIPromoVendedor]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************************************************************************
	Descripción: Inserta promovendedor en TATEPromovendedor
	-------------------------------------------------------------------
	Última modificación: Aumenta el tamaño del parametro empleado
	Responsable: Angel Israel López Rosales
	Fecha: septiembre de 2019
***********************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELIPromoVendedor]  
	@piNoTienda			SMALLINT,				--Tienda asociada al demovendedor
	@piTipoVendedorId	SMALLINT,				--Tipo de vendedor (1=fijo, 2=volante)
	@pcNombre			VARCHAR(40),			--Nombre del demovendedor
	@pcAPaterno			VARCHAR(40),			--Apellido Paterno del demovendedor
	@pcAMaterno			VARCHAR(40),			--Apellido materno del demovendedor
	@pcRFC				VARCHAR(20),			--rfc del demovendedor  
	@pcFechNacimiento	VARCHAR(10),			--Fecha de nacimiento del demovendedor  
	@pcTelefono			VARCHAR(10),			--Telefono fijo del demovendedor  
	@piCompaniaId		INT,				--Compañía para la que trabaja el demovendedor (11=unefon, 31=movistar, etc)  
	@pcHorario			VARCHAR(8),				--Horario de trabajo (aabbccdd aa=hora entrada, bb=hora salida a comer, cc=hora regreso comer, dd=salida del trabajo)  
	@piDiaDescanso		TINYINT,				--Dia de descanso, 1=lunes,2=martes,3=miércoles,....,7=domingo  
	@pcJefeInme			VARCHAR(60),			--Nombre del jefe inmediato  
	@pcEmpNo			VARCHAR(10),				--Empleado que da de alta  
	@pcEmail			VARCHAR(60)='',			--E-mail del demovendedor  
	@piNoPromo			VARCHAR(10)='',			--Número de empleado de la empresa para la que trabaja  
	@pcTelefonoCel		VARCHAR(10)='',			--Número de teléfono celular  
	@pcTelefonoRec		VARCHAR(10)='',			--Número de teléfono de recados  
	@piPuesto			INT = 0,				--Puesto asociado al demovendedor  
	@plActualiza		BIT = 0,				--Bandera para indicar que se esta haciendo una carga masiva  
	@pcCorreoModifica	VARCHAR(255) = NULL,	--Correo de la persona que modifica
	@pcIPModifica		VARCHAR(50)  = NULL,		--IP de la maquina de la persona que modifica
	@pcCURP				VARCHAR(18) = NULL
AS  
SET NOCOUNT ON  
DECLARE
	@viRtn              INT,  
	@vcMensaje          VARCHAR(200),  
	@viPromovendedorId  INT,  
	@vdFechaHoy         DATETIME,  
	@viRanMin           INT,  
	@viRanMax           INT,  
	@viIdReciclado      INT,  
	@viStatus           INT,  
	@viTipoMovimiento   SMALLINT,  
	@viCanal            INT,  
	@viPais             INT,  
	@viCatalogoId1      INT,  
	@viCatalogoId2      INT,
	@piNoPromo107			INT

SELECT @vdFechaHoy=GETDATE(), @viIdReciclado=0


BEGIN TRY  
	IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE fcNombre = @pcNombre AND fcAPaterno = @pcAPaterno AND fcAMaterno = @pcAMaterno AND fiStatus <> 4 and fiStatus <> 2)  
	BEGIN  
		RAISERROR('El nombre del promovendedor ya fue registrado previamente. Validación 1',18,1)
	END
	IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE LTRIM(RTRIM(fcCURP)) = LTRIM(RTRIM(@pcCURP)) AND fiStatus <> 4 and fiStatus <> 2)  
	BEGIN  
		RAISERROR('El nombre del promovendedor ya fue registrado previamente. Validación 2',18,1)
	END
	IF(LTRIM(RTRIM(ISNULL(@pcEmail, ''))) != '')
	BEGIN
		IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH(NOLOCK) WHERE LTRIM(RTRIM(fcEmail)) = LTRIM(RTRIM(@pcEmail)) AND fiStatus <> 4 and fiStatus <> 2)  
		BEGIN  
			RAISERROR('El nombre del promovendedor ya fue registrado previamente. Validación 3',18,1)
		END 
	END 
	IF NOT EXISTS(SELECT fiNoTienda FROM dbo.TCTETiendas WITH(NOLOCK) WHERE fiNoTienda = @piNoTienda)  
	BEGIN  
		RAISERROR('No está registrada la tienda en el catálogo de tiendas.',18,1)  
	END  
	ELSE  
	BEGIN  
		SELECT @viCanal = fiCanalId, @viPais = fiPaisID FROM dbo.TCTETiendas WITH (NOLOCK) WHERE fiNoTienda = @piNoTienda  
	END 
	IF(@piCompaniaId = 0) 
	BEGIN
		SET @piCompaniaId = 1
	END
	
	IF(@piCompaniaId = 107 AND @piNoPromo = '')
	BEGIN
		SET @piNoPromo = '107'
	END
	
	SELECT  @piNoPromo107 = CAST(@piNoPromo AS INT)

	IF(@piCompaniaId = 107 AND @piNoPromo107 = 0)
	BEGIN
		SET @piNoPromo = '107'
	END

	IF NOT EXISTS (SELECT fiCompaniaId FROM dbo.TCTECompania WHERE fiCompaniaId = @piCompaniaId AND fiPaisID = @viPais)  
	BEGIN   
		RAISERROR('No se encuentra la compañia proporcionada',18,1)  
	END  
	IF EXISTS(SELECT fiCatalogoId FROM dbo.TCTEDetalleCatalogoGenerico WHERE fiCatalogoId = 6 AND fiItemId = @piCompaniaId)  
	BEGIN  
		SELECT @vcMensaje = LTRIM(RTRIM(fcDescripcion)) FROM dbo.TCTEDetalleCatalogoGenerico WHERE fiCatalogoId = 6 AND fiItemId = @piCompaniaId  
		SET @vcMensaje ='No se puede registrar un empleado con la compañía ' + @vcMensaje + ', ya que está dada de baja.'  
		RAISERROR(@vcMensaje,18,1)  
	END  
	
	SELECT	@viPromovendedorId	=	fiPromovendedorId, 
			@viStatus			=	fiStatus,
			@viTipoMovimiento	=	fiTipoMovimiento,
			@viIdReciclado		=	flReciclado,
			@vcMensaje			=	fcMensaje
	FROM	dbo.FNTELSNumPromovendedor(@viPais)

	IF (@vcMensaje <> '')
		RAISERROR(@vcMensaje, 18, 1)

	IF @viIdReciclado=0  
	BEGIN  
		INSERT INTO DBO.TATEPromovendedor(  
			fiPromovendedorId,
			fiNoTienda,
			fiTipoVendedorId,
			fcNombre,
			fcAPaterno,
			fcAMaterno,
			fcRFC,
			fcFechNacimiento,
			fcTelefono,
			fcTelefonoCel,
			fcTelefonoRec,
			fiCompaniaId,
			fcHorario,
			fiDiaDescanso,
			fiStatus,
			fcJefeInme,
			fcEmail,
			fiNoPromo,
			fdFecRegistro,
			fiPuestoId,
			fiPaisID,
			fiCanalId,
			flActualiza,
			flHuellaValida,
			fcCURP
		)  
		VALUES (  
			@viPromovendedorId,
			@piNoTienda,
			@piTipoVendedorId,
			LTRIM(RTRIM(@pcNombre)),
			LTRIM(RTRIM(@pcAPaterno)),
			LTRIM(RTRIM(@pcAMaterno)),
			@pcRFC,
			@pcFechNacimiento,
			@pcTelefono,
			@pcTelefonoCel,
			@pcTelefonoRec,
			@piCompaniaId,
			@pcHorario,
			@piDiaDescanso,
			1,
			@pcJefeInme,
			@pcEmail,
			@piNoPromo,
			@vdFechaHoy,
			@piPuesto,
			@viPais,
			@viCanal,
			@plActualiza,
			0,
			@pcCURP 
		)  
	END
	ELSE IF @viIdReciclado=1
	BEGIN
		UPDATE DBO.TATEPromovendedor
		SET fiNoTienda			=	@piNoTienda,  
			fiTipoVendedorId	=	@piTipoVendedorId,
			fcNombre			=	LTRIM(RTRIM(@pcNombre)),
			fcAPaterno			=	LTRIM(RTRIM(@pcAPaterno)),
			fcAMaterno			=	LTRIM(RTRIM(@pcAMaterno)),
			fcRFC				=	@pcRFC,
			fcFechNacimiento	=	@pcFechNacimiento,
			fcTelefono			=	@pcTelefono,
			fcTelefonoCel		=	@pcTelefonoCel,
			fcTelefonoRec		=	@pcTelefonoRec,
			fiCompaniaId		=	@piCompaniaId,
			fcHorario			=	@pcHorario,
			fiDiaDescanso		=	@piDiaDescanso,
			fiStatus			=	@viStatus,
			fcJefeInme			=	@pcJefeInme,
			fcEmail				=	@pcEmail,
			fiNoPromo			=	@piNoPromo,
			fdFecRegistro		=	GETDATE(),
			fdUltimoCambio		=	GETDATE(),
			fiPuestoId			=	@piPuesto,
			fiPaisID			=	@viPais,
			fiCanalId			=	@viCanal,
			flActualiza			=	@plActualiza,
			flHuellaValida		=	0,
			fcCURP				=	@pcCURP
		WHERE fiPromovendedorId = @viPromovendedorId   
	END
	-- GRABAMOS LA BITACORA
	EXECUTE dbo.PATELIPromoVendedorHist  
		@viPromovendedorId,  
		@piNoTienda,
		@piTipoVendedorId,
		@pcNombre,
		@pcAPaterno,
		@pcAMaterno,
		@pcRFC,
		@pcFechNacimiento,
		@pcTelefono,
		@piCompaniaId,
		@pcHorario,
		@piDiaDescanso,
		@viStatus,
		@pcJefeInme,
		@vdFechaHoy,
		@pcEmpNo,
		@viTipoMovimiento,
		@pcEmail,
		@piNoPromo,
		@pcTelefonoCel,
		@pcTelefonoRec,
		@piPuesto,
		@viPais,
		@viCanal,
		@pcCorreoModifica = @pcCorreoModifica,
		@pcIPModifica = @pcIPModifica,
		@pcCURP = @pcCURP  
END TRY  
BEGIN CATCH
	SET @vcMensaje=ERROR_MESSAGE() 
	RAISERROR(@vcMensaje,18,1) 
	SET NOCOUNT OFF
	RETURN -1  
END CATCH  
  
-- REGRESAMOS EL NUMERO DE PROMOVENDEDOR QUE SE GENERO.  
SELECT @viPromovendedorId AS fiPromovendedorId   
SET NOCOUNT OFF  
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELIAsistencia]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************************************************************************
	Responsable: Angel israel López Rosales
	Fecha: 07/08/2017
	Descrìpción: quita validación de promotores de tienda
***********************************************************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELIAsistencia]
	@piPromovendedorId	INT,             /*Id. de empleado*/
	@piAsistenciaId	    SMALLINT,        /*Tipo de asistencia, 1=Entrada,2=Comida,3=regreso comida,4=Salida*/
	@pdFecha            VARCHAR(30),     /*Fecha del movimiento*/--dd/mm/yyyy hh:mm:ss p.m.
	@piNoTienda			VARCHAR(6)=NULL  /*Tienda donde se hace el movimiento*/
AS
DECLARE
   @vcMensaje       VARCHAR(200),
   @viAsistenciaId  SMALLINT,
   @vcFecha         VARCHAR(200),
   @vcFechaD        DATETIME,
   @viTienda        INT,
   @vcFechaSalida   VARCHAR(200),
   @viMinutos       INT,
   @vcFechaEntrada  VARCHAR(200)

SET XACT_ABORT ON;
BEGIN TRY
   BEGIN TRANSACTION
   SET @viMinutos = 0
   SET @vcFecha = CONVERT(VARCHAR, SUBSTRING(@pdFecha,7,4) + '-' + SUBSTRING(@pdFecha,4,2) + '-' + SUBSTRING(@pdFecha,1,2) + ' ' + SUBSTRING(@pdFecha,12,8), 120)
   SET @vcFechaD = CONVERT(DATETIME, @vcFecha)
   IF EXISTS (SELECT fiPromovendedorId FROM DBO.TATEPromovendedor WITH (NOLOCK) WHERE fiPromovendedorId =  @piPromovendedorId)
   BEGIN
      -------VALIDACION DE TIENDA
      IF (@piNoTienda IS NULL OR LTRIM(RTRIM(@piNoTienda))='')
      BEGIN
         -----OBTENER LA TIENDA DEL EMPLEADO 
         SET @piNoTienda=ISNULL((SELECT fiNoTienda FROM dbo.TATEPromovendedor WHERE fiPromovendedorId=@piPromovendedorId),0)
      END 
      IF (dbo.fnEsPuestoJerarquia(@piPromovendedorId))=0
      BEGIN
         IF EXISTS (SELECT fiPromovendedorId FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND fiAsistenciaId = @piAsistenciaId AND DATEDIFF(DAY,fdFecha,@vcFecha)=0)
         BEGIN RAISERROR('YA SE REGISTRO PREVIAMENTE ESTE EVENTO.',18,1) END
         IF (@piAsistenciaId > 1) AND NOT EXISTS(SELECT fiPromovendedorId FROM dbo.TATEControlAsistencia  WITH (NOLOCK) WHERE fiPromovendedorId = @piPromovendedorId AND  fiAsistenciaId = (@piAsistenciaId-1) AND DATEDIFF(DAY,fdFecha,@vcFecha) = 0)
         BEGIN
            SELECT @viAsistenciaId = ISNULL(MAX(fiAsistenciaId),0) FROM dbo.TATEControlAsistencia  WITH (NOLOCK) WHERE fiPromovendedorId = @piPromovendedorId AND DATEDIFF(DAY,fdFecha,@vcFecha) = 0
            IF @viAsistenciaId = 0 
               RAISERROR('FAVOR DE REGISTRAR PRIMERO SU ENTRADA DEL DIA DE HOY.',18,1)
            IF @viAsistenciaId = 1
               RAISERROR('FAVOR DE REGISTRAR PRIMERO SU SALIDA A COMER.',18,1)
            IF @viAsistenciaId = 2
               RAISERROR('FAVOR DE REGISTRAR PRIMERO SU REGRESO DE COMER.',18,1)
         END
      END
      ELSE IF (dbo.fnEsPuestoJerarquia(@piPromovendedorId))=1
      BEGIN
         IF EXISTS (
            SELECT fiPromovendedorId 
            FROM   dbo.TATEControlAsistencia WITH(NOLOCK) 
            WHERE  fiPromovendedorId=@piPromovendedorId 
               AND fiAsistenciaId = @piAsistenciaId 
               AND DATEDIFF(DAY,fdFecha,@vcFecha)=0 
               AND fiNoTienda=@piNoTienda
         )
         BEGIN RAISERROR('YA SE REGISTRO PREVIAMENTE ESTE EVENTO.',18,1) END
         IF (
            @piAsistenciaId > 1) 
            AND NOT EXISTS(
               SELECT fiPromovendedorId 
               FROM   dbo.TATEControlAsistencia  WITH (NOLOCK) 
               WHERE  fiPromovendedorId = @piPromovendedorId 
                  AND fiAsistenciaId = (@piAsistenciaId-1) 
                  AND DATEDIFF(DAY,fdFecha,@vcFecha) = 0 
                  AND fiNoTienda=@piNoTienda)
         BEGIN
            SELECT @viAsistenciaId = ISNULL((SELECT MAX(fiAsistenciaId) FROM dbo.TATEControlAsistencia WITH(NOLOCK) WHERE fiPromovendedorId=@piPromovendedorId AND DATEDIFF(DAY,fdFecha,@vcFecha)=0 AND fiNoTienda=@piNoTienda),0)
            IF @viAsistenciaId = 0 BEGIN RAISERROR('FAVOR DE REGISTRAR PRIMERO SU ENTRADA DEL DIA DE HOY.',18,1) END
         END
         IF(
            @piAsistenciaId = 1
            AND EXISTS 
            (
               SELECT ent.fiPromovendedorId 
               FROM   dbo.TATEControlAsistencia Ent WITH (NOLOCK) 
               WHERE  ent.fiPromovendedorId = @piPromovendedorId 
                  AND ent.fiAsistenciaId = 1 
                  AND DATEDIFF(DAY,Ent.fdFecha,@vcFecha) = 0 
                  AND ent.fiNoTienda NOT IN (@piNoTienda)
            )
            AND EXISTS 
            (
               SELECT Ent.fiNoTienda 
               FROM 
               (
                  SELECT ent.fiPromovendedorId, Ent.fiNoTienda 
                  FROM   dbo.TATEControlAsistencia Ent WITH (NOLOCK) 
                  WHERE  ent.fiPromovendedorId = @piPromovendedorId 
                     AND ent.fiAsistenciaId = 1 
                     AND DATEDIFF(DAY,Ent.fdFecha,@vcFecha) = 0 
                     AND ent.fiNoTienda NOT IN (@piNoTienda)
               ) AS Ent
               LEFT OUTER JOIN 
               (
                  SELECT Ent.fiNoTienda, Ent.fdFecha 
                  FROM   dbo.TATEControlAsistencia Ent WITH (NOLOCK) 
                  WHERE  ent.fiPromovendedorId = @piPromovendedorId 
                     AND ent.fiAsistenciaId = 4
                     AND DATEDIFF(DAY,Ent.fdFecha,@vcFecha) = 0 
               ) AS Sal
               ON Ent.fiNoTienda = Sal.fiNoTienda
               WHERE Sal.fdFecha IS NULL
            )
         )
         BEGIN
            SELECT 
                   @viTienda = Ent.fiNoTienda,
                   @vcFechaSalida = Ent.fdFecha
            FROM 
               (
                  SELECT ent.fiPromovendedorId, Ent.fiNoTienda, Ent.fdFecha 
                  FROM   dbo.TATEControlAsistencia Ent WITH (NOLOCK) 
                  WHERE  ent.fiPromovendedorId = @piPromovendedorId 
                     AND ent.fiAsistenciaId = 1 
                     AND DATEDIFF(DAY,Ent.fdFecha,@vcFecha) = 0 
                     AND ent.fiNoTienda NOT IN (@piNoTienda)
               ) AS Ent
               LEFT OUTER JOIN 
               (
                  SELECT Ent.fiNoTienda, Ent.fdFecha 
                  FROM   dbo.TATEControlAsistencia Ent WITH (NOLOCK) 
                  WHERE  ent.fiPromovendedorId = @piPromovendedorId 
                     AND ent.fiAsistenciaId = 4
                     AND DATEDIFF(DAY,Ent.fdFecha,@vcFecha) = 0 
               ) AS Sal
               ON Ent.fiNoTienda = Sal.fiNoTienda
            WHERE Sal.fdFecha IS NULL
            INSERT INTO dbo.TATEControlAsistencia (fiPromovendedorId,fiAsistenciaId,fdFecha,fiNoTienda,fiMinutos,fiEstatus) 
            VALUES (@piPromovendedorId,4,@vcFechaSalida,@viTienda,0,1)
         END
         IF (@piAsistenciaId = 4)
         BEGIN
            IF EXISTS (
               SELECT fiPromovendedorId FROM TATEControlAsistencia WHERE fiPromovendedorId=@piPromovendedorId AND fiNoTienda=@piNoTienda
               AND fiAsistenciaId = 1
            )
            BEGIN
               SELECT @vcFechaEntrada = fdFecha FROM TATEControlAsistencia WHERE fiPromovendedorId=@piPromovendedorId AND fiNoTienda=@piNoTienda AND fiAsistenciaId = 1
               SET @viMinutos = DATEDIFF(MINUTE,@vcFechaEntrada,@vcFecha) 
            END
         END
      END
      -- INSERTAMOS LA ASISTENCIA
      INSERT INTO dbo.TATEControlAsistencia (fiPromovendedorId,fiAsistenciaId,fdFecha,fiNoTienda,fiMinutos,fiEstatus) VALUES (@piPromovendedorId,@piAsistenciaId,@vcFecha,@piNoTienda,@viMinutos,0)
      IF(@piNoTienda IS NOT NULL AND @piAsistenciaId=1)
      BEGIN
         IF NOT EXISTS (
            SELECT fiPromovendedorId 
            FROM dbo.TATEPromovendedor WITH (NOLOCK) 
            WHERE fiPromovendedorId=@piPromovendedorId AND fiNoTienda=@piNoTienda
            )
         BEGIN
            IF EXISTS(SELECT fiNoTienda FROM dbo.TCTETiendas WITH (NOLOCK) WHERE fiNoTienda=@piNoTienda)
            BEGIN
               DECLARE @viTiendaC INT,@viPaisC INT,@viCanalC INT
               SELECT @viTiendaC=fiNoTienda,@viPaisC=fiPaisID,@viCanalC=fiCanalId FROM dbo.TCTETiendas WITH (NOLOCK) WHERE fiNoTienda=@piNoTienda
               EXEC PATELUPromovendedores
                    @piPromovendedorId=@piPromovendedorId,
                    @pcEmpModifica='999990',
                    @piNoTienda=@viTiendaC,
                    @piPaisID=@viPaisC,
                    @piCanalId=@viCanalC
            END
         END
      END
   END
   ELSE
   BEGIN
      RAISERROR('NO EXISTE EL PROMOVENDEDOR INDICADO.',18,1)
   END
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   SET @vcMensaje=ERROR_MESSAGE()
   IF (XACT_STATE()) = -1
   BEGIN
      ROLLBACK TRANSACTION
   END
   IF (XACT_STATE()) = 1
   BEGIN
      COMMIT TRANSACTION
   END
   RAISERROR(@vcMensaje,18,1)
   RETURN -1
END CATCH
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spUpdEmpleadoJerarquia]    Script Date: 08/14/2020 09:06:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************
   Descripción: Actualiza los campos de TATEPromovendedor
   -------------------------------------------------------------------------
   Fecha: 08/2012
   Modifico: Angel Israel López Rosales 
****************************************************************************/
CREATE PROCEDURE [dbo].[spUpdEmpleadoJerarquia]
   @piPromovendedorId       int,
   @pcEmpModifica           CHAR(30)		= '999994',
   @piNoTienda              int				= NULL,
   @piTipoVendedorId        smallint		= NULL,
   @pcNombre                char(40)		= NULL,
   @pcAPaterno              char(40)		= NULL,
   @pcAMaterno              char(40)		= NULL,
   @pcRFC                   char(20)		= NULL,
   @pcFechNacimiento        char(10)		= NULL,
   @pcTelefono              char(10)		= NULL,
   @pcTelefonoCel           char(10)		= NULL,
   @pcTelefonoRec           char(10)		= NULL,
   @piCompaniaId            int				= NULL,
   @pcHorario               char(8)			= NULL,
   @piDiaDescanso           tinyint			= NULL,
   @piStatus                tinyint			= NULL,
   @pcJefeInme              char(60)		= NULL,
   @pcEmail                 char(60)		= NULL,
   @pcNoPromo               char(10)		= NULL,
   @pdFecRegistro           datetime		= NULL,
   @pdUltimoCambio          datetime		= NULL,
   @piPuestoId              int				= NULL,
   @piPaisID                int				= NULL,
   @piCanalId               int				= NULL,
   @pcCURP					VARCHAR(18)		= NULL,
   @piPadreId				INT				= 0,
   @pcCorreoModifica		VARCHAR(255)	= NULL, /*Correo de la persona que modifica*/
   @pcIPModifica			VARCHAR(50)		= NULL /*IP de la maquina de la persona que modifica*/
AS

DECLARE @viRetorno INT, @vcError VARCHAR(100)
BEGIN TRY
	BEGIN TRANSACTION Actualiza
	EXECUTE @viRetorno = dbo.PATELUPromovendedores
		@piPromovendedorId	= @piPromovendedorId	, 
		@pcEmpModifica		= @pcEmpModifica		,
		@piNoTienda			= @piNoTienda			,
		@piTipoVendedorId	= @piTipoVendedorId		,
		@pcNombre			= @pcNombre				,
		@pcAPaterno			= @pcAPaterno			,
		@pcAMaterno			= @pcAMaterno			,
		@pcRFC				= @pcRFC				,
		@pcFechNacimiento	= @pcFechNacimiento		,
		@pcTelefono			= @pcTelefono			,
		@pcTelefonoCel		= @pcTelefonoCel		,
		@pcTelefonoRec		= @pcTelefonoRec		,
		@piCompaniaId		= @piCompaniaId			,
		@pcHorario			= @pcHorario			,
		@piDiaDescanso		= @piDiaDescanso		,
		@piStatus			= @piStatus				,
		@pcJefeInme			= @pcJefeInme			,
		@pcEmail			= @pcEmail				,
		@pcNoPromo			= @pcNoPromo			,
		@pdFecRegistro		= @pdFecRegistro		,
		@pdUltimoCambio		= @pdUltimoCambio		,
		@piPuestoId			= @piPuestoId			,
		@piPaisID			= @piPaisID				,
		@piCanalId			= @piCanalId			,
		@pcCURP				= @pcCURP
	IF(@viRetorno < 0 OR @@ERROR <> 0)
	BEGIN
		RAISERROR('Sucedió un error al actualizar los datos', 18, 1)
	END
	IF(@piPadreId > 0)
	BEGIN
		EXECUTE dbo.PATELUPadreEmpleadoJerarquico
			@piHijoId			= @piPromovendedorId,
			@piPadreId			= @piPadreId,
			@pcCorreoModifica	= @pcCorreoModifica,
			@pcIPModifica		= @pcIPModifica,
			@pcEmpNo			= @pcEmpModifica
		IF(@viRetorno < 0 OR @@ERROR <> 0)
		BEGIN
			RAISERROR('Sucedió un error al actualizar el jefe del empleado', 18, 1)
		END
	END
	COMMIT TRANSACTION Actualiza
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION Actualiza
	SET @vcError = ERROR_MESSAGE()
	RAISERROR(@vcError, 18, 1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[PATELIEmpleadoJerarquico]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************
   Descripción: Da de alta empleado de jerarquia en TaTePromovendedor
   -------------------------------------------------------------------
   Última modificación: Inserta CURP
   Responsable: Angel Israel López Rosales
   Fecha: agosto del 2019
*******************************************************************************/
CREATE PROCEDURE [dbo].[PATELIEmpleadoJerarquico] 
	@piCompaniaId			INT,
	@piPadreId				INT,
	@pcNombre				VARCHAR(40),
	@pcAPaterno				VARCHAR(40),
	@pcAMaterno				VARCHAR(40),
	@piPuestoId				INT,
	@pcEmail				VARCHAR(60),
	@pcTelefonoCel			char(10) = '',
	@pcCorreoModifica		VARCHAR(255) = NULL, /*Correo de la persona que modifica*/
	@pcIPModifica			VARCHAR(50)  = NULL, /*IP de la maquina de la persona que modifica*/
	@pcFechNacimiento		CHAR(10) = '01/01/1980',
	@pcCURP					VARCHAR(18) = NULL
	
AS
SET NOCOUNT ON

DECLARE @vcError VARCHAR(255),
		@vcStored VARCHAR(255), 
		@vcNombreEmplPadre VARCHAR(60)
		,@viClaveAsignada INT
		,@viTiendaDefault INT
		,@viTipoVendedor  INT
		,@viDiaDescansa   INT
		,@vcHorario       VARCHAR(8)
		,@vcMensaje       VARCHAR(200)

DECLARE @vtTablaTemp TABLE(fiIdAsignado INT)

BEGIN TRY
	IF(LTRIM(RTRIM(@pcNombre)) = '') BEGIN RAISERROR('El nombre debe ser válido', 18, 1) END
	IF(LTRIM(RTRIM(@pcAPaterno)) = '') BEGIN RAISERROR('El apellido debe ser válido', 18, 1) END
	IF(LTRIM(RTRIM(@pcAMaterno)) = '') BEGIN RAISERROR('El apellido debe ser válido', 18, 1) END
	IF(LTRIM(RTRIM(@pcEmail)) = '') BEGIN RAISERROR('El correo debe ser válido', 18, 1) END
	IF(LTRIM(RTRIM(@pcTelefonoCel)) = '') BEGIN RAISERROR('El teléfono debe ser válido', 18, 1) END
	IF(LTRIM(RTRIM(@piCompaniaId)) = 0) BEGIN RAISERROR('La companía debe ser válida', 18, 1) END
	IF(LTRIM(RTRIM(@piPadreId)) = 0) BEGIN RAISERROR('El jefe debe ser válido', 18, 1) END
	
	SET @vcMensaje = dbo.FNTELSValidacionesEmpJerarquico(@piCompaniaId, @piPadreId, @piPuestoId)
	IF @vcMensaje <> ''
	BEGIN
		RAISERROR(@vcMensaje, 18, 1)
		RETURN 0
	END
	
	SELECT	@pcNombre = UPPER(@pcNombre)
			,@pcAPaterno = UPPER(@pcAPaterno)
			,@pcAMaterno = UPPER(@pcAMaterno)
			,@viTipoVendedor = 2
			,@viDiaDescansa = 7
			,@vcHorario = '09131521'
	SELECT @viTiendaDefault = CONVERT(INTEGER, fcPrmVal) 
	FROM   dbo.TCTEParametro WITH(NOLOCK)
	WHERE  fiPrmId = 12
	
	IF (@piPadreId <> 0)
		SELECT @vcNombreEmplPadre = SUBSTRING(RTRIM(fcNombre) + ' ' + RTRIM(fcAPaterno) + ' ' + RTRIM(fcAMaterno), 1, 60)
		FROM TATEPromovendedor WITH(NOLOCK)
		WHERE fiPromovendedorId = @piPadreId
	ELSE
	BEGIN
		SET @vcNombreEmplPadre = ''
	END
	
	INSERT INTO @vtTablaTemp(fiIdAsignado)
	EXECUTE dbo.PATELIPromoVendedor 
		@piNoTienda			= @viTiendaDefault,
        @piTipoVendedorId	= @viTipoVendedor,
        @pcNombre			= @pcNombre,
        @pcAPaterno			= @pcAPaterno,
        @pcAMaterno			= @pcAMaterno,
        @pcRFC				= '',
        @pcFechNacimiento	= @pcFechNacimiento,
        @pcTelefono			= '',
        @piCompaniaId		= @piCompaniaId,
        @pcHorario			= @vcHorario,
        @piDiaDescanso		= @viDiaDescansa,
        @pcJefeInme			= @vcNombreEmplPadre,
        @pcEmpNo			= '',
        @pcEmail			= @pcEmail,
        @piNoPromo			= '',
        @pcTelefonoCel		= @pcTelefonoCel,
        @pcTelefonoRec		= '',
        @piPuesto			= @piPuestoId,
        @plActualiza		= 0,
        @pcCorreoModifica	= @pcCorreoModifica,
        @pcIPModifica		= @pcIPModifica,
		@pcCURP				= @pcCURP
	
	SELECT @viClaveAsignada = fiIdAsignado FROM @vtTablaTemp
	IF @viClaveAsignada IS NOT NULL
	BEGIN
		INSERT INTO dbo.TATEJerarquia (fiPadreID, fiHijoID)
		SELECT @piPadreId, @viClaveAsignada
	END
END TRY
BEGIN CATCH
   SELECT @vcError = ERROR_MESSAGE(), @vcStored=ERROR_PROCEDURE()
   SET @vcError = @vcStored + '. ' + @vcError
   RAISERROR(@vcError,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH	

SELECT fiPromovendedorId = @viClaveAsignada
	
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSMultaSupervision]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************
   Descripción: Obtiene el tiempo de supervisión de puesto mas altos
   Fecha: 06 de febrero del 2013
   Responsable: Clemente Jonathan Navarrete Díaz
*************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSMultaSupervision] 
	@pdFechaInicial	DATETIME,
	@pdFechaFinal	DATETIME,
	@piPromovendedorId INT
	
AS
BEGIN
SET NOCOUNT ON
	
	DECLARE @vTableSupervisores TABLE ([fiIdPromo] INT)
	DECLARE @vTableTiendas TABLE ([fiNoTienda] INT, [fiMinutos] INT)
	DECLARE @viPuestoId INT,
			@viConteo	INT,
			@viIdPromo	INT,
			@viTotalT	INT,
			@viTotalV	INT,
			@viMulta	INT

	SELECT @viPuestoId = fiPuestoId FROM TATEPromovendedor  WITH (NOLOCK) WHERE fiPromovendedorId = @piPromovendedorId

	IF @viPuestoId = 631 -- SUPERVISOR
	BEGIN
		INSERT INTO @vTableSupervisores (fiIdPromo)
		VALUES(@piPromovendedorId)
	END
	ELSE IF @viPuestoId = 632 -- JEFE DE VENTAS
	BEGIN
		INSERT INTO @vTableSupervisores (fiIdPromo)
		SELECT DISTINCT fiHijoID
		FROM TATEJerarquia J WITH (NOLOCK) 
		WHERE J.fiPadreID = @piPromovendedorId
	END
	ELSE IF @viPuestoId = 633 -- JEFE DE PLAZA
	BEGIN
		INSERT INTO @vTableSupervisores (fiIdPromo)
		SELECT DISTINCT JV.fiHijoID
		FROM TATEJerarquia JP WITH (NOLOCK) 
		INNER JOIN TATEJerarquia JV WITH (NOLOCK)  
		ON JV.fiPadreID = JP.fiHijoID AND JP.fiPadreID = @piPromovendedorId 		
	END
	ELSE IF @viPuestoId = 634 -- DIRECTOR GEOGRAFICO
	BEGIN
		INSERT INTO @vTableSupervisores (fiIdPromo)
		SELECT DISTINCT JV.fiHijoID
		FROM TATEJerarquia D WITH (NOLOCK) 
		INNER JOIN TATEJerarquia JP WITH (NOLOCK)  
		ON JP.fiPadreID = D.fiHijoID AND D.fiPadreID = @piPromovendedorId
		INNER JOIN TATEJerarquia JV WITH (NOLOCK) 
		ON JP.fiHijoID = JV.fiPadreID 
	END

	SELECT @viConteo = COUNT(fiIdPromo) FROM @vTableSupervisores

	WHILE (@viConteo>0)
	BEGIN
		--Asigna Valores
		SELECT @viIdPromo = MAX(fiIdPromo) FROM @vTableSupervisores

		INSERT INTO @vTableTiendas (fiNoTienda, fiMinutos)
		SELECT fiNoTienda, fiMinutos FROM DBO.FNTELSTablaPenalizacion(@pdFechaInicial,@pdFechaFinal,@viIdPromo)

		-- Se quita el valor asignado
		DELETE @vTableSupervisores WHERE fiIdPromo = @viIdPromo
		SELECT @viConteo = COUNT(fiIdPromo) FROM @vTableSupervisores
	END
	
	SELECT @viTotalT = COUNT(fiNoTienda) FROM @vTableTiendas
	SELECT @viTotalV = COUNT(fiNoTienda) FROM @vTableTiendas WHERE fiMinutos >= 60
	SELECT @viMulta = (@viTotalT - @viTotalV)*5
			
	SELECT @viTotalT AS ASIGNADAS, @viTotalV AS VISITADAS, @viMulta AS MULTA

SET NOCOUNT OFF	
	
END
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSTiendasPenalizacion]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PATELSTiendasPenalizacion] 

	@piCompaniaId INT,
	@pdFecha   DATETIME
	
AS
BEGIN

SET NOCOUNT ON
				
SELECT fiDistritoID, DescDistrito, fiPromovendedorId, Nombre, fiNoTienda, DescTienda, Penalizacion, MontoPenalizacion
 from FNTELSTablaResumenPenalizacion(@piCompaniaId, @pdFecha) R
 WHERE R.Penalizacion <> 0
 ORDER BY R.fiDistritoId, ISNULL(R.fiPromovendedorId, -1), R.fiNoTienda

SET NOCOUNT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[PATELSTiendaMultaSemCorreo]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*********************************************************************************
   Descripción: Obtiene la asistencia de los supervisores para correo
   ----------------------------------------------------
   Responsable: Angel Israel López Rosales
   Fecha: abril de 2017
   Modificacion: Agrega OUI
**********************************************************************************/
CREATE PROCEDURE [dbo].[PATELSTiendaMultaSemCorreo]
(
	@pdFechaInicial     DATETIME,   /*Fecha inicial*/
	@pdFechaFinal       DATETIME    /*Fecha final*/
)
AS
	
SET NOCOUNT ON
BEGIN TRY

	DECLARE @vTableSupervisores TABLE ([fiIdPromo] INT, [fiIdNegocio] INT, [fiIdDirector] INT, [fcNomDirGeo] CHAR(123), [fcCorDirGeo] CHAR(60))
	DECLARE @vTableTiendas TABLE ([fiNoTienda] INT, [fiMinutos] INT, [fiIdPromo] INT, [fiIdNegocio] INT, [fiIdDirector] INT, [fcNomDirGeo] CHAR(123), [fcCorDirGeo] CHAR(60) )
	DECLARE @viConteo	INT,
			@viIdPromo	INT,
			@viTotalT	INT,
			@viTotalV	INT,
			@viMulta	INT,
			@viPromovendedorId INT,
			@viDirectorId INT,
			@viCompaniaId	INT,
			@vcNombreDirector CHAR(123),
			@vcEmailDirector	CHAR(60),
			@vcEmail	CHAR(60)

	-- SE OBTIENE EL CORREO DEL DIRECTOR GENERAL
	SELECT @vcEmail = fcEmail
	FROM TATEPromovendedor  WITH (NOLOCK) 
	WHERE fiPuestoId = 635 AND fiStatus = 1

	-- SE OBTIENE EL DIRECTOR GEOGRAFICO DE MOVISTAR
	SELECT @viPromovendedorId = fiPromovendedorId, @viCompaniaId = fiCompaniaId, 
	@vcNombreDirector = LTRIM(RTRIM(fcNombre)) + ' ' + LTRIM(RTRIM(fcAPaterno)) + ' ' + LTRIM(RTRIM(fcAMaterno)),
	@vcEmailDirector = fcEmail
	FROM TATEPromovendedor  WITH (NOLOCK) 
	WHERE fiPuestoId = 634 AND fiCompaniaId = 31 AND fiStatus = 1

	INSERT INTO @vTableSupervisores (fiIdPromo, fiIdNegocio, fiIdDirector, fcNomDirGeo, fcCorDirGeo)
	SELECT DISTINCT JV.fiHijoID, @viCompaniaId, @viPromovendedorId, @vcNombreDirector, @vcEmailDirector
	FROM TATEJerarquia D WITH (NOLOCK) 
	INNER JOIN TATEJerarquia JP WITH (NOLOCK)  
	ON JP.fiPadreID = D.fiHijoID AND D.fiPadreID = @viPromovendedorId
	INNER JOIN TATEJerarquia JV WITH (NOLOCK) 
	ON JP.fiHijoID = JV.fiPadreID 
	
	
	-- SE OBTIENE EL DIRECTOR GEOGRAFICO DE IUSACELL/UNEFON
	SELECT @viPromovendedorId = fiPromovendedorId, @viCompaniaId = fiCompaniaId,
	@vcNombreDirector = LTRIM(RTRIM(fcNombre)) + ' ' + LTRIM(RTRIM(fcAPaterno)) + ' ' + LTRIM(RTRIM(fcAMaterno)),
	@vcEmailDirector = fcEmail
	FROM TATEPromovendedor  WITH (NOLOCK) 
	WHERE fiPuestoId = 634 AND fiCompaniaId IN (11,47,78) AND fiStatus = 1

	INSERT INTO @vTableSupervisores (fiIdPromo, fiIdNegocio, fiIdDirector, fcNomDirGeo, fcCorDirGeo)
	SELECT DISTINCT JV.fiHijoID, @viCompaniaId, @viPromovendedorId, @vcNombreDirector, @vcEmailDirector
	FROM TATEJerarquia D WITH (NOLOCK) 
	INNER JOIN TATEJerarquia JP WITH (NOLOCK)  
	ON JP.fiPadreID = D.fiHijoID AND D.fiPadreID = @viPromovendedorId
	INNER JOIN TATEJerarquia JV WITH (NOLOCK) 
	ON JP.fiHijoID = JV.fiPadreID 

		-- SE OBTIENE EL DIRECTOR GEOGRAFICO DE OUI
	SELECT @viPromovendedorId = fiPromovendedorId, @viCompaniaId = fiCompaniaId,
	@vcNombreDirector = LTRIM(RTRIM(fcNombre)) + ' ' + LTRIM(RTRIM(fcAPaterno)) + ' ' + LTRIM(RTRIM(fcAMaterno)),
	@vcEmailDirector = fcEmail
	FROM TATEPromovendedor  WITH (NOLOCK) 
	WHERE fiPuestoId = 634 AND fiCompaniaId = 107 AND fiStatus = 1

	INSERT INTO @vTableSupervisores (fiIdPromo, fiIdNegocio, fiIdDirector, fcNomDirGeo, fcCorDirGeo)
	SELECT DISTINCT JV.fiHijoID, @viCompaniaId, @viPromovendedorId, @vcNombreDirector, @vcEmailDirector
	FROM TATEJerarquia D WITH (NOLOCK) 
	INNER JOIN TATEJerarquia JP WITH (NOLOCK)  
	ON JP.fiPadreID = D.fiHijoID AND D.fiPadreID = @viPromovendedorId
	INNER JOIN TATEJerarquia JV WITH (NOLOCK) 
	ON JP.fiHijoID = JV.fiPadreID 
	
	SELECT @viConteo = COUNT(fiIdPromo) FROM @vTableSupervisores

	WHILE (@viConteo>0)
	BEGIN
		--Asigna Valores
		SELECT @viIdPromo = MAX(fiIdPromo) FROM @vTableSupervisores
		
		SELECT @viCompaniaId = fiIdNegocio, @viDirectorId = fiIdDirector, @vcNombreDirector = fcNomDirGeo  , @vcEmailDirector = fcCorDirGeo 
		FROM @vTableSupervisores WHERE fiIdPromo = @viIdPromo

		INSERT INTO @vTableTiendas (fiNoTienda, fiMinutos, fiIdPromo, fiIdNegocio, fiIdDirector, fcNomDirGeo, fcCorDirGeo)
		SELECT fiNoTienda, fiMinutos, @viIdPromo, @viCompaniaId, @viDirectorId, @vcNombreDirector, @vcEmailDirector
		FROM DBO.FNTELSTablaPenalizacion(@pdFechaInicial,@pdFechaFinal,@viIdPromo)

		-- Se quita el valor asignado
		DELETE @vTableSupervisores WHERE fiIdPromo = @viIdPromo
		SELECT @viConteo = COUNT(fiIdPromo) FROM @vTableSupervisores
	END
	
	SELECT A.fiNoTienda AS TdaAsignada, 
		B.fcDescripcion AS Nombretienda, 
		A.fiMinutos AS Minutos,
		5 AS MultaMinutos,
		A.fiIdPromo AS IdPromo, 
		LTRIM(RTRIM(C.fcNombre)) + ' ' + LTRIM(RTRIM(C.fcAPaterno)) + ' ' + LTRIM(RTRIM(C.fcAMaterno)) AS NombreSupervisor, 
		A.fiIdNegocio AS Negocio,
		A.fcNomDirGeo AS NombreDirGeo,
		CorreoDirGen  = CASE A.fiIdNegocio WHEN 107 THEN '' ELSE @vcEmail END,
		A.fcCorDirGeo AS CorreoDirGeo,
		A.fiIdDirector AS IdDirector
	FROM @vTableTiendas A
	INNER JOIN TCTETiendas B WITH (NOLOCK) ON A.fiNoTienda = B.fiNoTienda AND fiMinutos < 60
	INNER JOIN TATEPromovendedor C WITH (NOLOCK) ON A.fiIdPromo = C.fiPromovendedorId

END TRY
BEGIN CATCH
   DECLARE @vcMensaje VARCHAR(255)
   SET @vcMensaje=ERROR_MESSAGE()
   RAISERROR(@vcMensaje,18,1)
   SET NOCOUNT OFF
   RETURN -1
END CATCH
SET NOCOUNT OFF
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELSTiempoSupervisionSuperior]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************
   Descripción: Obtiene el tiempo de supervisión de puesto mas altos
   Fecha: 06 de febrero del 2013
   Responsable: Clemente Jonathan Navarrete Díaz
*************************************************************************************/
CREATE PROCEDURE [dbo].[PATELSTiempoSupervisionSuperior] 
	@pdFechaInicial	DATETIME,
	@pdFechaFinal	DATETIME,
	@piPromovendedorId INT
	
AS
BEGIN

SET NOCOUNT ON

DECLARE @viPuestoId	INT

SELECT @viPuestoId = fiPuestoId FROM TATEPROMOVENDEDOR WITH (NOLOCK) WHERE fiPromovendedorId = @piPromovendedorId

IF @viPuestoId IN (632,633,634) -- JEFE DE VENTAS, JEFE DE PLAZA, DIRECTOR GEOGRAFICO
BEGIN
	SELECT	P.fiPromovendedorId, 
			LTRIM(RTRIM(P.fcNombre)) + ' ' + LTRIM(RTRIM(P.fcAPaterno)) + ' ' + LTRIM(RTRIM(P.fcAMaterno)) AS Nombre, 
			Fecha,
			DBO.FNTELSTiempoSupervisionTotal(Fecha,P.fiPromovendedorId) AS  TiempoSupervision
	FROM DBO.FNTELSTablaFechas(@pdFechaInicial,@pdFechaFinal)
	INNER JOIN TATEJerarquia J WITH (NOLOCK) ON J.fiPadreID = @piPromovendedorId
	INNER JOIN TATEPromovendedor P WITH (NOLOCK) ON	J.fiHijoID = P.fiPromovendedorId 
	ORDER BY P.fiPromovendedorId, Fecha
END

SET NOCOUNT OFF	
	
END
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUCorreoTdaNoAsignada]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************************************************
   Descripción objeto: Consulta los datos para envío de mails de tiendas no asignadas
   -------------------------------------------------------------------------------------
   Última modificación: Corrige insercción de multas por tipo
   Fecha 16 de octubre del 2013
   Responsable: Angel Israel Lopez Rosales
************************************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUCorreoTdaNoAsignada]
   @piTipo     SMALLINT
AS
SET XACT_ABORT ON  
SET NOCOUNT ON  

DECLARE @vdFechaHoy    DATETIME

DECLARE @vtDirectores TABLE  (  
   fcNombre    VARCHAR(100),  
   fcCorreo    VARCHAR(100),  
   fcCorreoCC  VARCHAR(100),  
   fiNegocio   INT,  
   fiIndice    INT identity(1,1)   
)  

DECLARE @vtTiendas TABLE (  
   fiNoTienda   INT,  
   fcTienda     VARCHAR(100),  
   fiDistritoID INT,   
   fiPlazaID    INT,  
   fiPaisID     INT,   
   fiCanalId    INT  
)  
DECLARE @viCompania INT, @vcNombre VARCHAR(100), @vcCorreo VARCHAR(100), @vcCorreoCC VARCHAR(100),@viNoReg INT,@viIndice INT  

SELECT @vdFechaHoy = GETDATE()
DELETE dbo.TATEDatosMail WHERE fiTipo = @piTipo

BEGIN TRY
   BEGIN TRANSACTION
      INSERT INTO @vtDirectores (fcNombre, fcCorreo, fcCorreoCC, fiNegocio)  
      SELECT DISTINCT  
         Nombre =  LTRIM(RTRIM(tp1.fcNombre)) + ' ' + LTRIM(RTRIM(tp1.fcAPaterno)) + ' ' + LTRIM(RTRIM(tp1.fcAMaterno)),
         Correo = tp1.fcEmail,
         CorreoCC = LTRIM(RTRIM(tp2.fcEmail)),  
         Compania = dbo.FNTELSCompania(tp1.fiCompaniaId)  
      FROM   dbo.TATEJerarquia j1 WITH(NOLOCK)
         INNER JOIN dbo.TATEPromovendedor tp1 WITH(NOLOCK) ON j1.fiPadreID = tp1.fiPromovendedorId 
         INNER JOIN dbo.TATEJerarquia j2 WITH(NOLOCK) ON j1.fiPadreID = j2.fiHijoID  
         INNER JOIN dbo.TATEPromovendedor tp2 WITH(NOLOCK) ON j2.fiPadreID = tp2.fiPromovendedorId  
      WHERE tp1.fiPuestoId = 634
         AND tp2.fiPuestoId = 635  
      GROUP BY   
         LTRIM(RTRIM(tp1.fcNombre)) + ' ' + LTRIM(RTRIM(tp1.fcAPaterno)) + ' ' + LTRIM(RTRIM(tp1.fcAMaterno)),
         tp1.fcEmail,  
         LTRIM(RTRIM(tp2.fcEmail)),dbo.FNTELSCompania(tp1.fiCompaniaId)  
  
      SELECT  @viIndice=1,@viNoReg=max(fiIndice) FROM @vtDirectores
      WHILE (@viIndice <= @viNoReg)  
      BEGIN 
         SELECT TOP 1 @viCompania = fiNegocio,  
            @vcNombre = fcNombre,
            @vcCorreo = fcCorreo,
            @vcCorreoCC = fcCorreoCC  
         FROM   @vtDirectores WHERE fiIndice =@viIndice    
         INSERT INTO @vtTiendas (fiNoTienda, fcTienda, fiDistritoID, fiPlazaID, fiPaisID, fiCanalId)  
         EXEC PATELSTiendasSinSupervisor @piCompaniaId=@viCompania  
         
         INSERT INTO dbo.TATEDatosMail (fiTipo, fiTiendaNoSupervisada, fcNombreTienda, fcNombreDirector, fcCorreo, fcCorreoPadre, fiNegocio, fiMulta)  
         SELECT @piTipo, fiNoTienda, fcTienda, @vcNombre, @vcCorreo, @vcCorreoCC, @viCompania, 5 FROM @vtTiendas  
         SELECT @viIndice =@viIndice + 1  
         DELETE @vtTiendas  
      END  
     
      DELETE dbo.TATEMultaNoAsignadasIus  
      DELETE dbo.TATEMultaNoAsignadasMovi  

      INSERT INTO dbo.TATEMultaNoAsignadasIus (fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus)  
      SELECT fiTiendaNoSupervisada, fcNombreTienda, fiMulta, @vdFechaHoy, '58', 'NA', '4966', 2, 0, 0  
      FROM   dbo.TATEDatosMail  
      WHERE  (dbo.FNTELSCompania(fiNegocio)=78 OR dbo.FNTELSCompania(fiNegocio)=11 OR dbo.FNTELSCompania(fiNegocio)=47) AND fiTipo = @piTipo 
      
      INSERT INTO dbo.TATEMultaNoAsignadasMovi (fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus)  
      SELECT fiTiendaNoSupervisada, fcNombreTienda, fiMulta, @vdFechaHoy, '56', 'NA', '5181', 2, 0, 0  
      FROM   dbo.TATEDatosMail  
      WHERE  dbo.FNTELSCompania(fiNegocio)=31 AND fiTipo = @piTipo 
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   DECLARE @vcError VARCHAR(255)  
   SET @vcError = ERROR_MESSAGE()  
   IF (XACT_STATE()) = -1  
   BEGIN  
      ROLLBACK TRANSACTION  
   END  
   IF (XACT_STATE()) = 1  
   BEGIN  
      COMMIT TRANSACTION  
   END  
   RAISERROR(@vcError,18,1)  
   SET NOCOUNT OFF  
   RETURN -1  
END CATCH
SET NOCOUNT OFF 
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUAsistenciasCorreo]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************************************************
   Descripción objeto: Consulta los datos para envío de mails de las asistencias diarias
   -------------------------------------------------------------------------------------
   Última modificación: Modificaciones para correos OUI
   Fecha: abril 2017
   Responsable: Angel Israel Lopez Rosales
************************************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUAsistenciasCorreo]
   @piTipo     SMALLINT,
   @pdFechaIni DATETIME = NULL,
   @pdFechaFin DATETIME = NULL
AS
SET XACT_ABORT ON  
SET NOCOUNT ON  
DECLARE 
   @vdFechaI      DATETIME, 
   @vdFechaF      DATETIME, 
   @viContador    INT, 
   @viNegocio     INT, 
   @vinoTienda    INT, 
   @vcDescripcion VARCHAR(100), 
   @viContadorA   INT,
   @viPromo       INT, 
   @viMultaTienda INT,  
   @vdFechaHoy    DATETIME

/*Para actualizar*/   
DECLARE @vtTiendasM TABLE (fiContador INT IDENTITY(1,1), fiNegocio INT, fiNoTienda INT, fcDescripcion VARCHAR(100), flEstatus BIT)  
DECLARE @vtTempAsistencia TABLE (fiContador INT IDENTITY(1,1), fiPromovendedorID INT, fiNoTienda INT, fiNegocio INT)  

DECLARE @vtAsistencia TABLE (fiPromovendedorID INT, fiNoTienda INT, fiNegocio INT)  
DECLARE @vtDatos TABLE (  
      VENDEDOR_ID             INT,   
      VENDEDOR                VARCHAR(255),   
      FECHA                   DATETIME,  
      ASISTENCIA              INT,  
      LLEGADA                 DATETIME,  
      ESTADO_LLEGADA          INT,  
      SALIDA                  DATETIME,  
      ESTADO_SALIDA           INT,  
      EXISTE_REGISTRO_LLEGADA INT)

SELECT @vdFechaHoy = GETDATE()
SELECT @viMultaTienda = CONVERT(INTEGER, fcPrmVal) FROM TCTEParametro WITH(NOLOCK) WHERE fiPrmId = 11  

IF (@pdFechaIni IS NOT NULL AND @pdFechaFin IS NULL)
BEGIN
   SET @vdFechaI = @pdFechaIni-1
   SET @vdFechaI = CONVERT(DATETIME, CONVERT(CHAR, @vdFechaI, 103), 103)
   SET @vdFechaF = @vdFechaI + 1  
END
ELSE
BEGIN
   SET @vdFechaI = GETDATE()-1
   SET @vdFechaI = CONVERT(DATETIME, CONVERT(CHAR, @vdFechaI, 103), 103)
   SET @vdFechaF = @vdFechaI + 1  
END

BEGIN TRY
   BEGIN TRANSACTION
      DELETE dbo.TATEDatosMail WHERE fiTipo = @piTipo
      INSERT INTO @vtTiendasM (fiNegocio, fiNoTienda, fcDescripcion, flEstatus)  
      SELECT fiNegocio = 78, t.fiNoTienda, t.fcDescripcion, 0  
      FROM dbo.TCTETiendas t   
      WHERE fiPaisID = 1   
      AND (  
         flEsTiendaIus = 1 OR  
         flEsTiendaUne = 1  
      )  
      UNION ALL
      SELECT fiNegocio = 31, t.fiNoTienda, t.fcDescripcion, 0
      FROM dbo.TCTETiendas t
      WHERE fiPaisID = 1
         AND flEsTiendaMovi = 1  
	  UNION ALL
      SELECT fiNegocio = 107, t.fiNoTienda, t.fcDescripcion, 0
      FROM dbo.TCTETiendas t
      WHERE fiPaisID = 1
         AND flEsTiendaOUI = 1  
      ORDER BY fiNoTienda

      INSERT INTO @vtAsistencia (fiPromovendedorID, fiNoTienda, fiNegocio)
      SELECT 
         T.fiPromovendedorId, 
         T.fiNoTienda,
         fiCompaniaId = dbo.FNTELSCompania(P.fiCompaniaId)
      FROM   TATEControlAsistencia T WITH(NOLOCK)
         INNER JOIN TATEPromovendedor P WITH(NOLOCK)  
         ON P.fiPromovendedorId = T.fiPromovendedorId  
      WHERE  fdFecha >= @vdFechaI AND fdFecha < @vdFechaF  
         AND T.fiAsistenciaId = 1
         AND P.fiPuestoId NOT IN (SELECT fiItemId FROM dbo.TCTEDetalleCatalogoGenerico WITH(NOLOCK) WHERE fiCatalogoId=8)  
      ORDER By T.fiNoTienda, P.fiCompaniaId  

      SELECT @viContador = MAX(fiContador) FROM @vtTiendasM
      WHILE(@viContador >0)
      BEGIN
         SELECT  @viNegocio = fiNegocio,
           @vinoTienda = fiNoTienda,
           @vcDescripcion = fcDescripcion,
           @viContador = fiContador - 1  
         FROM    @vtTiendasM
         WHERE fiContador = @viContador  
     
         IF EXISTS (  
            SELECT A.fiPromovendedorID  
            FROM @vtAsistencia A
            WHERE A.fiNegocio = @viNegocio AND A.fiNoTienda = @vinoTienda  
       )
         BEGIN
            INSERT INTO @vtTempAsistencia (fiPromovendedorID, fiNoTienda, fiNegocio)
            SELECT A.fiPromovendedorID, A.fiNoTienda, A.fiNegocio
            FROM @vtAsistencia A
            WHERE A.fiNegocio = @viNegocio AND A.fiNoTienda = @vinoTienda
            SELECT @viContadorA = MAX(fiContador) FROM @vtTempAsistencia  
            WHILE(@viContadorA >0)
            BEGIN
               IF EXISTS(SELECT fiContador FROM @vtTempAsistencia WHERE fiContador = @viContadorA)
               BEGIN
                  SELECT @viPromo = fiPromovendedorID,
                     @viContadorA = fiContador - 1
                  FROM @vtTempAsistencia WHERE fiContador = @viContadorA
                  INSERT INTO @vtDatos
                  EXEC  PATELSAsistenciaVendedor
                     @piPromovendedorId  = @viPromo,
                     @pdFechaInicial     = @vdFechaI,
                     @pdFechaFinal       = @vdFechaI
                  IF EXISTS (SELECT ASISTENCIA FROM @vtDatos WHERE ASISTENCIA = 1)
                  BEGIN 
                     UPDATE @vtTiendasM 
                     SET    flEstatus = 1
                     WHERE  fiNoTienda = @vinoTienda AND
                        fiNegocio = @viNegocio
                        SET @viContadorA = 0  
                  END
                  DELETE @vtDatos  
               END
               ELSE
               BEGIN 
                  SET @viContadorA = 0  
               END
            END
            DELETE @vtTempAsistencia  
         END  
      END

      INSERT INTO dbo.TATEDatosMail (fiTipo, fiTiendaNoSupervisada, fcNombreTienda, fiMinutos, fiMulta, fiSupervisor, fcNombreSupervisor, fiNegocio, fcNombreDirector, fcCorreoPadre, fcCorreo, fiIdDirector, fcMotivo)
      SELECT 
         fiTipo = @piTipo,
         fiTiendaNoSupervisada = t.fiNoTienda,   
         fcNombreTienda = fcDescripcion,
         fiMinutos = 0,
         fiMulta = @viMultaTienda,
         fiSupervisor = 0,
         fcNombreSupervisor = '',
         fiNegocio = t.fiNegocio,
         fcNombreDirector = LTRIM(RTRIM(p.fcNombre)) + ' ' + LTRIM(RTRIM(p.fcAPaterno)) + ' ' + LTRIM(RTRIM(p.fcAMaterno)),
         fcCorreoPadre = 
			CASE 
				WHEN p.fiCompaniaId = 107 THEN ''
				ELSE (SELECT TOP 1 fcEmail FROM dbo.TATEPromovendedor WHERE fiPuestoId = 635 AND p.fiStatus = 1) 
			END,
         fcCorreo = p.fcEmail ,
         fiIdDirector = fiPromovendedorId,
         fcMotivo = 'Tienda no cubierta por promotor.'  
      FROM   @vtTiendasM t
         INNER JOIN dbo.TATEPromovendedor p ON dbo.FNTELSCompania(p.fiCompaniaId) = t.fiNegocio  
      WHERE fiPuestoId = 634
         AND p.fiStatus = 1  
         AND t.flEstatus = 0  
     
      DELETE dbo.TATEMultaAsistenciaMovi
      DELETE dbo.TATEMultaAsistenciaIus  

      INSERT INTO dbo.TATEMultaAsistenciaIus (fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus)  
      SELECT fiTiendaNoSupervisada, fcNombreTienda, fiMulta, @vdFechaHoy, '58', CAST(fiMinutos AS VARCHAR(40)), '4966', 1, 0, 0  
      FROM   dbo.TATEDatosMail
      WHERE  (dbo.FNTELSCompania(fiNegocio)=78 OR dbo.FNTELSCompania(fiNegocio)=11 OR dbo.FNTELSCompania(fiNegocio)=47) AND fiTipo = @piTipo 

      INSERT INTO dbo.TATEMultaAsistenciaMovi (fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus)  
      SELECT fiTiendaNoSupervisada, fcNombreTienda, fiMulta, @vdFechaHoy, '56', CAST(fiMinutos AS VARCHAR(40)), '5181', 1, 0, 0  
      FROM   dbo.TATEDatosMail  
      WHERE  dbo.FNTELSCompania(fiNegocio)=31 AND fiTipo = @piTipo 
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   DECLARE @vcError VARCHAR(255)  
   SET @vcError = ERROR_MESSAGE()  
   IF (XACT_STATE()) = -1  
   BEGIN  
      ROLLBACK TRANSACTION  
   END  
   IF (XACT_STATE()) = 1  
   BEGIN  
      COMMIT TRANSACTION  
 END  
   RAISERROR(@vcError,18,1)  
   SET NOCOUNT OFF  
   RETURN -1  
END CATCH
SET NOCOUNT OFF 
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[PATELUCorreoTdaNoSupervisada]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************************************************
   Descripción objeto: Consulta los datos para envío de mails de tiendas no supervisadas
   -------------------------------------------------------------------------------------
   Última modificación: Corrige insercción de multas por tipo
   Fecha 16 de octubre del 2013
   Responsable: Angel Israel Lopez Rosales
************************************************************************************************************************/
CREATE PROCEDURE [dbo].[PATELUCorreoTdaNoSupervisada]
   @piTipo     SMALLINT,
   @pdFechaIni DATETIME = NULL,
   @pdFechaFin DATETIME = NULL
AS
SET XACT_ABORT ON  
SET NOCOUNT ON  
DECLARE @vdFechaHoy    DATETIME

DECLARE @vtTATEDatosMail TABLE (
   fiTipo                INT,
   fiSupervisor          INT,    
   fcNombreSupervisor    VARCHAR(255),  
   fcCorreo              VARCHAR(255),  
   fiTiendaNoSupervisada INT,   
   fcNombreTienda        VARCHAR(60),  
   fiMulta               INT,  
   fcCorreoCC            VARCHAR(255),  
   fcCorreoCCO           VARCHAR(255),  
   fcCorreoPadre         VARCHAR(255),    
   fiMinutos             INT,  
   fiNegocio             INT,  
   fiIdDirector          INT,  
   fcNombreDirector      VARCHAR(255),   
   fcMotivo              VARCHAR(255)  
)  

SELECT @vdFechaHoy = GETDATE()
DELETE dbo.TATEDatosMail WHERE fiTipo = @piTipo

BEGIN TRY
   BEGIN TRANSACTION
      INSERT INTO @vtTATEDatosMail (fiTiendaNoSupervisada, fcNombreTienda, fiMinutos, fiMulta, fiSupervisor, fcNombreSupervisor, fiNegocio, fcNombreDirector, fcCorreoPadre, fcCorreo, fiIdDirector)  
      EXEC PATELSTiendaMultaSemCorreo @pdFechaIni, @pdFechaFin  

      INSERT INTO dbo.TATEDatosMail (fiTipo, fiTiendaNoSupervisada, fcNombreTienda, fiMinutos, fiMulta, fiSupervisor, fcNombreSupervisor, fiNegocio, fcNombreDirector, fcCorreoPadre, fcCorreo, fiIdDirector)  
      SELECT fiTipo = @piTipo, fiTiendaNoSupervisada, fcNombreTienda, fiMinutos, fiMulta, fiSupervisor, fcNombreSupervisor, fiNegocio, fcNombreDirector, fcCorreoPadre, fcCorreo, fiIdDirector
      FROM @vtTATEDatosMail

      DELETE dbo.TATEMultaNoSupervisadasMovi  
      DELETE dbo.TATEMultaNoSupervisadasIus  

      INSERT INTO dbo.TATEMultaNoSupervisadasIus (fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus)  
      SELECT fiTiendaNoSupervisada, fcNombreTienda, fiMulta, @vdFechaHoy, '58', CAST(fiMinutos AS VARCHAR(40)), '4966', 2, 0, 0  
      FROM   dbo.TATEDatosMail  
      WHERE  (dbo.FNTELSCompania(fiNegocio)=78 OR dbo.FNTELSCompania(fiNegocio)=11 OR dbo.FNTELSCompania(fiNegocio)=47) AND fiTipo = @piTipo 

      INSERT INTO dbo.TATEMultaNoSupervisadasMovi (fiNoTienda, fcNombreTienda, fiMulta, fdFecha, fcArticulo, fcMinutos, fcProveedor, fiTipo, fiNumVeces, fiEstatus)  
      SELECT fiTiendaNoSupervisada, fcNombreTienda, fiMulta, @vdFechaHoy, '56', CAST(fiMinutos AS VARCHAR(40)), '5181', 2, 0, 0  
      FROM   dbo.TATEDatosMail  
      WHERE  dbo.FNTELSCompania(fiNegocio)=31 AND fiTipo = @piTipo 
   COMMIT TRANSACTION
END TRY
BEGIN CATCH
   DECLARE @vcError VARCHAR(255)  
   SET @vcError = ERROR_MESSAGE()  
   IF (XACT_STATE()) = -1  
   BEGIN  
      ROLLBACK TRANSACTION  
   END  
   IF (XACT_STATE()) = 1  
   BEGIN  
      COMMIT TRANSACTION  
   END  
   RAISERROR(@vcError,18,1)  
   SET NOCOUNT OFF  
   RETURN -1  
END CATCH
SET NOCOUNT OFF 
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[spConMail]    Script Date: 08/14/2020 09:06:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/************************************************************************************************************************
   Descripción: Consulta detalles del correo a enviar  
   --------------------------------------------------  
   Última modificación: Modificaciones para correos OUI
   Fecha: abril de 2017
   Responsable: Angel Israel Lopez Rosales
************************************************************************************************************************/
CREATE PROCEDURE [dbo].[spConMail]  
(  
   @piTipo INT,  
   @piHora INT,  
   @pdFechaIni DATETIME = NULL,  
   @pdFechaFin DATETIME = NULL  
)  
AS  
SET XACT_ABORT ON  
SET NOCOUNT ON  

IF (@piTipo > 5)  
   RETURN 0
     
DECLARE @vtCatalogos TABLE (  
   fiCatalogoId  INT,  
   fiItemId      SMALLINT,  
   fcDescripcion CHAR(255),  
   flStatus      BIT  
)  
  
DECLARE @vcDireccionPromotores VARCHAR(255),  
        @viPuerto              INT,  
        @vcServidorSMTP        VARCHAR(255),  
        @vdFechaHoy            DATETIME  

SELECT @vdFechaHoy = GETDATE()
   
BEGIN TRY  
   BEGIN TRAN  
      INSERT INTO @vtCatalogos (fiCatalogoId, fiItemId, fcDescripcion, flStatus)
      SELECT fiCatalogoId, fiItemId, fcDescripcion, flStatus
      FROM dbo.TCTEDetalleCatalogoGenerico WITH (NOLOCK)
      WHERE fiCatalogoId IN (10, 11, 12, 22)  
      
      SELECT @vcDireccionPromotores = fcDescripcion FROM @vtCatalogos WHERE fiCatalogoId = 11 AND fiItemId = 1
      SELECT @vcServidorSMTP = fcDescripcion FROM @vtCatalogos WHERE fiCatalogoId = 11 AND fiItemId = 2
      SELECT @viPuerto = CAST(LTRIM(RTRIM(fcDescripcion)) AS INT) FROM @vtCatalogos WHERE fiCatalogoId = 11 AND fiItemId = 3  
      
      IF(@piTipo=1 OR @piTipo=2)  
      BEGIN
         EXEC dbo.PATELUAsistenciasAvisoCorreo @piTipo = @piTipo, @piHora = @piHora
      END
      ELSE IF(@piTipo=3)  
      BEGIN
         EXEC dbo.PATELUCorreoTdaNoSupervisada @piTipo = @piTipo, @pdFechaIni = @pdFechaIni, @pdFechaFin = @pdFechaFin
      END
      ELSE IF(@piTipo=4)  
      BEGIN
         EXEC dbo.PATELUCorreoTdaNoAsignada @piTipo = @piTipo
      END
      ELSE IF(@piTipo=5)
      BEGIN
         EXEC dbo.PATELUAsistenciasCorreo @piTipo = @piTipo, @pdFechaIni = @pdFechaIni, @pdFechaFin = @pdFechaFin
      END
      
      UPDATE dbo.TATEDatosMail SET fcCorreoPadre = CASE WHEN @piTipo = 1 THEN '' ELSE fcCorreoPadre END WHERE fiTipo = @piTipo
      IF (@piTipo IN (3, 4, 5))  
      BEGIN  
         UPDATE d  
         SET    d.fcCorreoPadre = 
			CASE 
				WHEN LTRIM(RTRIM(fcCorreoPadre)) = '' THEN CAST(LTRIM(RTRIM(ISNULL(cc.fcDescripcion, ''))) AS varchar(255))
				ELSE CAST(LTRIM(RTRIM(ISNULL(cc.fcDescripcion, ''))) + ',' + LTRIM(RTRIM(fcCorreoPadre)) AS varchar(255))
			END
         FROM   dbo.TATEDatosMail d  
            INNER JOIN @vtCatalogos cc   
            ON   
            (  
               CASE   
                  WHEN fiNegocio IN (11, 78, 47) THEN 78  
                  ELSE fiNegocio  
               END  
            ) = cc.fiItemId  
         WHERE cc.fiCatalogoId = 22
            AND d.fiTipo = @piTipo
      END

   COMMIT TRAN  
  
   SELECT   
      Asunto           = LTRIM(RTRIM(Asunto.fcDescripcion)),  
      Remitente        = @vcDireccionPromotores,  
      Correos          = fcCorreo,  
      CorreosCC        = LTRIM(RTRIM(fcCorreoPadre)),  
      CorreosCCO       = LTRIM(RTRIM(CCO.fcDescripcion)),  
      Mensaje          = '',  
      Puerto           = @viPuerto,  
      Servidor         = @vcServidorSMTP,  
      NumeroPromo      = fiSupervisor,  
      NombreSupervisor = fcNombreSupervisor,  
      NumeroTienda     = fiTiendaNoSupervisada,  
      NombreTienda     = fcNombreTienda,  
      fiMulta,  
      NombreDirector = fcNombreDirector,  
      Negocio = fiNegocio,  
      IdDirector = fiIdDirector,  
      Minutos = fiMinutos,  
      Motivo = fcMotivo  
   FROM   dbo.TATEDatosMail m  
      INNER JOIN @vtCatalogos Asunto  
         ON m.fiTipo = Asunto.fiItemId  
      INNER JOIN @vtCatalogos CCO   
         ON m.fiTipo = CCO.fiItemId  
   WHERE Asunto.fiCatalogoId = 10  
   AND CCO.fiCatalogoId = 12  
      AND m.fiTipo = @piTipo
     
END TRY  
BEGIN CATCH  
   DECLARE @vcError VARCHAR(255)  
   SET @vcError = ERROR_MESSAGE()  
   IF (XACT_STATE()) = -1  
   BEGIN  
      ROLLBACK TRANSACTION  
   END  
   IF (XACT_STATE()) = 1  
   BEGIN  
      COMMIT TRANSACTION  
   END  
   RAISERROR(@vcError,18,1)  
   SET NOCOUNT OFF  
   RETURN -1  
END CATCH  
SET NOCOUNT OFF  
RETURN 0
GO
/****** Object:  Default [DF__TATEDetal__fiCan__09FE775D]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEDetallePromocionEspecial] ADD  DEFAULT ((0)) FOR [fiCantidad]
GO
/****** Object:  Default [DF__TATEPromo__fiReg__119F9925]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromocionEspecial] ADD  DEFAULT ((773)) FOR [fiReglaId]
GO
/****** Object:  Default [df001TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromovendedor] ADD  CONSTRAINT [df001TATEPromovendedor]  DEFAULT ((0)) FOR [flActualiza]
GO
/****** Object:  Default [df002TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromovendedor] ADD  CONSTRAINT [df002TATEPromovendedor]  DEFAULT ((0)) FOR [flHuellaValida]
GO
/****** Object:  Default [DF001TATETotalPromotoresTienda]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATETotalPromotoresTienda] ADD  CONSTRAINT [DF001TATETotalPromotoresTienda]  DEFAULT ((0)) FOR [fiTotalPromotores]
GO
/****** Object:  Default [DF002TATETotalPromotoresTienda]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATETotalPromotoresTienda] ADD  CONSTRAINT [DF002TATETotalPromotoresTienda]  DEFAULT ((0)) FOR [fiTiendaCompania]
GO
/****** Object:  Default [DF__TCTEDistr__fiEst__51BA1E3A]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTEDistritales] ADD  DEFAULT ((0)) FOR [fiEstatus]
GO
/****** Object:  Default [DF__TCTEJefeV__fiEst__52AE4273]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTEJefeVentas] ADD  DEFAULT ((0)) FOR [fiEstatus]
GO
/****** Object:  Default [DF__TCTEPaisC__fiEst__53A266AC]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTEPaisCanal] ADD  DEFAULT ((0)) FOR [fiEstatus]
GO
/****** Object:  Default [DF__TCTEPlaza__fiEst__54968AE5]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTEPlazas] ADD  DEFAULT ((0)) FOR [fiEstatus]
GO
/****** Object:  Default [DF_TCTETiendas_flEsTiendaIus]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTETiendas] ADD  CONSTRAINT [DF_TCTETiendas_flEsTiendaIus]  DEFAULT ((0)) FOR [flEsTiendaIus]
GO
/****** Object:  Default [DF_TCTETiendas_flEsTiendaUne]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTETiendas] ADD  CONSTRAINT [DF_TCTETiendas_flEsTiendaUne]  DEFAULT ((0)) FOR [flEsTiendaUne]
GO
/****** Object:  Default [DF_TCTETiendas_flEsTiendaMovi]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTETiendas] ADD  CONSTRAINT [DF_TCTETiendas_flEsTiendaMovi]  DEFAULT ((0)) FOR [flEsTiendaMovi]
GO
/****** Object:  Default [DF_TCTETiendas_flEsTiendaTelcel]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTETiendas] ADD  CONSTRAINT [DF_TCTETiendas_flEsTiendaTelcel]  DEFAULT ((0)) FOR [flEsTiendaTelcel]
GO
/****** Object:  Default [DF__TCTETiend__flEsT__4B0D20AB]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTETiendas] ADD  DEFAULT ((0)) FOR [flEsTiendaOUI]
GO
/****** Object:  ForeignKey [FK001AutMembresia]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[AutMembresia]  WITH NOCHECK ADD  CONSTRAINT [FK001AutMembresia] FOREIGN KEY([fiIdUsuario], [fiIdAplicacion])
REFERENCES [dbo].[AutUsuario] ([fiIdUsuario], [fiIdAplicacion])
GO
ALTER TABLE [dbo].[AutMembresia] CHECK CONSTRAINT [FK001AutMembresia]
GO
/****** Object:  ForeignKey [FK002AutMembresia]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[AutMembresia]  WITH NOCHECK ADD  CONSTRAINT [FK002AutMembresia] FOREIGN KEY([fiIdAplicacion])
REFERENCES [dbo].[AutAplicacion] ([fiIdAplicacion])
GO
ALTER TABLE [dbo].[AutMembresia] CHECK CONSTRAINT [FK002AutMembresia]
GO
/****** Object:  ForeignKey [FK003AutMembresia]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[AutMembresia]  WITH NOCHECK ADD  CONSTRAINT [FK003AutMembresia] FOREIGN KEY([fiIdEstatus])
REFERENCES [dbo].[AutEstatus] ([fiIdEstatus])
GO
ALTER TABLE [dbo].[AutMembresia] CHECK CONSTRAINT [FK003AutMembresia]
GO
/****** Object:  ForeignKey [FK001AutUsuario]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[AutUsuario]  WITH NOCHECK ADD  CONSTRAINT [FK001AutUsuario] FOREIGN KEY([fiIdRol])
REFERENCES [dbo].[AutRoles] ([fiIdRol])
GO
ALTER TABLE [dbo].[AutUsuario] CHECK CONSTRAINT [FK001AutUsuario]
GO
/****** Object:  ForeignKey [FK002AutUsuario]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[AutUsuario]  WITH NOCHECK ADD  CONSTRAINT [FK002AutUsuario] FOREIGN KEY([fiIdAplicacion])
REFERENCES [dbo].[AutAplicacion] ([fiIdAplicacion])
GO
ALTER TABLE [dbo].[AutUsuario] CHECK CONSTRAINT [FK002AutUsuario]
GO
/****** Object:  ForeignKey [FK001ProContadorVale]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[ProContadorVale]  WITH CHECK ADD  CONSTRAINT [FK001ProContadorVale] FOREIGN KEY([fiPromocionId])
REFERENCES [dbo].[PROPromocion] ([fiPromocionId])
GO
ALTER TABLE [dbo].[ProContadorVale] CHECK CONSTRAINT [FK001ProContadorVale]
GO
/****** Object:  ForeignKey [FK1_PRODescuento]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[PRODescuento]  WITH CHECK ADD  CONSTRAINT [FK1_PRODescuento] FOREIGN KEY([fiPromocionId])
REFERENCES [dbo].[PROPromocion] ([fiPromocionId])
GO
ALTER TABLE [dbo].[PRODescuento] CHECK CONSTRAINT [FK1_PRODescuento]
GO
/****** Object:  ForeignKey [FK1_PRODetalleDescuento]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[PRODetalleDescuento]  WITH CHECK ADD  CONSTRAINT [FK1_PRODetalleDescuento] FOREIGN KEY([fiElementoId], [fiPromocionId])
REFERENCES [dbo].[PROElemento] ([fiElementoId], [fiPromocionId])
GO
ALTER TABLE [dbo].[PRODetalleDescuento] CHECK CONSTRAINT [FK1_PRODetalleDescuento]
GO
/****** Object:  ForeignKey [FK001ProDetalleVale]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[ProDetalleVale]  WITH CHECK ADD  CONSTRAINT [FK001ProDetalleVale] FOREIGN KEY([fiPromocionId])
REFERENCES [dbo].[PROPromocion] ([fiPromocionId])
GO
ALTER TABLE [dbo].[ProDetalleVale] CHECK CONSTRAINT [FK001ProDetalleVale]
GO
/****** Object:  ForeignKey [FK1_PROElemento]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[PROElemento]  WITH CHECK ADD  CONSTRAINT [FK1_PROElemento] FOREIGN KEY([fiPromocionId])
REFERENCES [dbo].[PROPromocion] ([fiPromocionId])
GO
ALTER TABLE [dbo].[PROElemento] CHECK CONSTRAINT [FK1_PROElemento]
GO
/****** Object:  ForeignKey [FK2_PROElemento]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[PROElemento]  WITH CHECK ADD  CONSTRAINT [FK2_PROElemento] FOREIGN KEY([fiTipo])
REFERENCES [dbo].[PROTipoElemento] ([fiTipo])
GO
ALTER TABLE [dbo].[PROElemento] CHECK CONSTRAINT [FK2_PROElemento]
GO
/****** Object:  ForeignKey [FK1_ProElementoCliente]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[ProElementoCliente]  WITH CHECK ADD  CONSTRAINT [FK1_ProElementoCliente] FOREIGN KEY([fiClienteId])
REFERENCES [dbo].[ProCliente] ([fiClienteId])
GO
ALTER TABLE [dbo].[ProElementoCliente] CHECK CONSTRAINT [FK1_ProElementoCliente]
GO
/****** Object:  ForeignKey [FK2_ProElementoCliente]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[ProElementoCliente]  WITH CHECK ADD  CONSTRAINT [FK2_ProElementoCliente] FOREIGN KEY([fiElementoId], [fiPromocionId])
REFERENCES [dbo].[PROElemento] ([fiElementoId], [fiPromocionId])
GO
ALTER TABLE [dbo].[ProElementoCliente] CHECK CONSTRAINT [FK2_ProElementoCliente]
GO
/****** Object:  ForeignKey [FK1_PROPromocion]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[PROPromocion]  WITH CHECK ADD  CONSTRAINT [FK1_PROPromocion] FOREIGN KEY([fiTipoPromocionId])
REFERENCES [dbo].[PROTipoPromocion] ([fiTipoPromocionId])
GO
ALTER TABLE [dbo].[PROPromocion] CHECK CONSTRAINT [FK1_PROPromocion]
GO
/****** Object:  ForeignKey [FK001TATEBajaPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEBajaPromovendedor]  WITH NOCHECK ADD  CONSTRAINT [FK001TATEBajaPromovendedor] FOREIGN KEY([fiPromovendedorId])
REFERENCES [dbo].[TATEPromovendedor] ([fiPromovendedorId])
GO
ALTER TABLE [dbo].[TATEBajaPromovendedor] NOCHECK CONSTRAINT [FK001TATEBajaPromovendedor]
GO
/****** Object:  ForeignKey [FK002TATEBajaPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEBajaPromovendedor]  WITH NOCHECK ADD  CONSTRAINT [FK002TATEBajaPromovendedor] FOREIGN KEY([fiMotivoId])
REFERENCES [dbo].[TCTEMotivoBaja] ([fiMotivoId])
GO
ALTER TABLE [dbo].[TATEBajaPromovendedor] NOCHECK CONSTRAINT [FK002TATEBajaPromovendedor]
GO
/****** Object:  ForeignKey [FK001TATEControlAsistencia]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEControlAsistencia]  WITH NOCHECK ADD  CONSTRAINT [FK001TATEControlAsistencia] FOREIGN KEY([fiAsistenciaId])
REFERENCES [dbo].[TCTEMovAsistencia] ([fiAsistenciaId])
GO
ALTER TABLE [dbo].[TATEControlAsistencia] NOCHECK CONSTRAINT [FK001TATEControlAsistencia]
GO
/****** Object:  ForeignKey [FK002TATEControlAsistencia]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEControlAsistencia]  WITH NOCHECK ADD  CONSTRAINT [FK002TATEControlAsistencia] FOREIGN KEY([fiPromovendedorId])
REFERENCES [dbo].[TATEPromovendedor] ([fiPromovendedorId])
GO
ALTER TABLE [dbo].[TATEControlAsistencia] NOCHECK CONSTRAINT [FK002TATEControlAsistencia]
GO
/****** Object:  ForeignKey [FK001TATEDetallePromocionEspecial]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEDetallePromocionEspecial]  WITH CHECK ADD  CONSTRAINT [FK001TATEDetallePromocionEspecial] FOREIGN KEY([fiTipoMovimiento])
REFERENCES [dbo].[TATETipoMovimiento] ([fiTipoMovimiento])
GO
ALTER TABLE [dbo].[TATEDetallePromocionEspecial] CHECK CONSTRAINT [FK001TATEDetallePromocionEspecial]
GO
/****** Object:  ForeignKey [FK002TATEDetallePromocionEspecial]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEDetallePromocionEspecial]  WITH CHECK ADD  CONSTRAINT [FK002TATEDetallePromocionEspecial] FOREIGN KEY([fiFolio])
REFERENCES [dbo].[TATEPromocionEspecial] ([fiFolio])
GO
ALTER TABLE [dbo].[TATEDetallePromocionEspecial] CHECK CONSTRAINT [FK002TATEDetallePromocionEspecial]
GO
/****** Object:  ForeignKey [FK001TATEIdPromReciclados]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEIdPromReciclados]  WITH NOCHECK ADD  CONSTRAINT [FK001TATEIdPromReciclados] FOREIGN KEY([fiPromovendedorId])
REFERENCES [dbo].[TATEPromovendedor] ([fiPromovendedorId])
GO
ALTER TABLE [dbo].[TATEIdPromReciclados] NOCHECK CONSTRAINT [FK001TATEIdPromReciclados]
GO
/****** Object:  ForeignKey [fk005TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEJerarquia]  WITH NOCHECK ADD  CONSTRAINT [fk005TATEPromovendedor] FOREIGN KEY([fiHijoID])
REFERENCES [dbo].[TATEPromovendedor] ([fiPromovendedorId])
GO
ALTER TABLE [dbo].[TATEJerarquia] NOCHECK CONSTRAINT [fk005TATEPromovendedor]
GO
/****** Object:  ForeignKey [FK001TATETotalPromotoresTienda]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromotoresTienda]  WITH CHECK ADD  CONSTRAINT [FK001TATETotalPromotoresTienda] FOREIGN KEY([fiNoTienda], [fiPaisID], [fiCanalId], [fiCompaniaId])
REFERENCES [dbo].[TATETotalPromotoresTienda] ([fiNoTienda], [fiPaisID], [fiCanalId], [fiCompaniaId])
GO
ALTER TABLE [dbo].[TATEPromotoresTienda] CHECK CONSTRAINT [FK001TATETotalPromotoresTienda]
GO
/****** Object:  ForeignKey [FK006TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromotoresTienda]  WITH CHECK ADD  CONSTRAINT [FK006TATEPromovendedor] FOREIGN KEY([fiPromovendedorId])
REFERENCES [dbo].[TATEPromovendedor] ([fiPromovendedorId])
GO
ALTER TABLE [dbo].[TATEPromotoresTienda] CHECK CONSTRAINT [FK006TATEPromovendedor]
GO
/****** Object:  ForeignKey [FK001TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromovendedor]  WITH NOCHECK ADD  CONSTRAINT [FK001TATEPromovendedor] FOREIGN KEY([fiTipoVendedorId])
REFERENCES [dbo].[TCTETipoVendedor] ([fiTipoVendedorId])
GO
ALTER TABLE [dbo].[TATEPromovendedor] NOCHECK CONSTRAINT [FK001TATEPromovendedor]
GO
/****** Object:  ForeignKey [FK002TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromovendedor]  WITH NOCHECK ADD  CONSTRAINT [FK002TATEPromovendedor] FOREIGN KEY([fiCompaniaId])
REFERENCES [dbo].[TCTECompania] ([fiCompaniaId])
GO
ALTER TABLE [dbo].[TATEPromovendedor] NOCHECK CONSTRAINT [FK002TATEPromovendedor]
GO
/****** Object:  ForeignKey [FK003TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromovendedor]  WITH NOCHECK ADD  CONSTRAINT [FK003TATEPromovendedor] FOREIGN KEY([fiNoTienda], [fiPaisID], [fiCanalId])
REFERENCES [dbo].[TCTETiendas] ([fiNoTienda], [fiPaisID], [fiCanalId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TATEPromovendedor] NOCHECK CONSTRAINT [FK003TATEPromovendedor]
GO
/****** Object:  ForeignKey [FK004TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromovendedor]  WITH NOCHECK ADD  CONSTRAINT [FK004TATEPromovendedor] FOREIGN KEY([fiPuestoId])
REFERENCES [dbo].[TCTEPuesto] ([fiPuestoId])
GO
ALTER TABLE [dbo].[TATEPromovendedor] NOCHECK CONSTRAINT [FK004TATEPromovendedor]
GO
/****** Object:  ForeignKey [FK007TATEPromovendedor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromovendedor]  WITH NOCHECK ADD  CONSTRAINT [FK007TATEPromovendedor] FOREIGN KEY([fiStatus])
REFERENCES [dbo].[TCTEStatusPromo] ([fiStatus])
GO
ALTER TABLE [dbo].[TATEPromovendedor] NOCHECK CONSTRAINT [FK007TATEPromovendedor]
GO
/****** Object:  ForeignKey [FK001TATEPromovendedorHist]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATEPromovendedorHist]  WITH NOCHECK ADD  CONSTRAINT [FK001TATEPromovendedorHist] FOREIGN KEY([fiMovimientoId])
REFERENCES [dbo].[TCTETipoMovimiento] ([fiMovimientoId])
GO
ALTER TABLE [dbo].[TATEPromovendedorHist] NOCHECK CONSTRAINT [FK001TATEPromovendedorHist]
GO
/****** Object:  ForeignKey [FK001TATESupervisor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATESupervisor]  WITH NOCHECK ADD  CONSTRAINT [FK001TATESupervisor] FOREIGN KEY([fiNoTienda], [fiPaisID], [fiCanalId])
REFERENCES [dbo].[TCTETiendas] ([fiNoTienda], [fiPaisID], [fiCanalId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TATESupervisor] NOCHECK CONSTRAINT [FK001TATESupervisor]
GO
/****** Object:  ForeignKey [FK002TATESupervisor]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATESupervisor]  WITH NOCHECK ADD  CONSTRAINT [FK002TATESupervisor] FOREIGN KEY([fiPromovendedorId])
REFERENCES [dbo].[TATEPromovendedor] ([fiPromovendedorId])
GO
ALTER TABLE [dbo].[TATESupervisor] NOCHECK CONSTRAINT [FK002TATESupervisor]
GO
/****** Object:  ForeignKey [FK002TCTECompania]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATETotalPromotoresTienda]  WITH CHECK ADD  CONSTRAINT [FK002TCTECompania] FOREIGN KEY([fiCompaniaId])
REFERENCES [dbo].[TCTECompania] ([fiCompaniaId])
GO
ALTER TABLE [dbo].[TATETotalPromotoresTienda] CHECK CONSTRAINT [FK002TCTECompania]
GO
/****** Object:  ForeignKey [FK003TCTETiendas]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TATETotalPromotoresTienda]  WITH CHECK ADD  CONSTRAINT [FK003TCTETiendas] FOREIGN KEY([fiNoTienda], [fiPaisID], [fiCanalId])
REFERENCES [dbo].[TCTETiendas] ([fiNoTienda], [fiPaisID], [fiCanalId])
GO
ALTER TABLE [dbo].[TATETotalPromotoresTienda] CHECK CONSTRAINT [FK003TCTETiendas]
GO
/****** Object:  ForeignKey [FK001TCTECompania]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTECompania]  WITH NOCHECK ADD  CONSTRAINT [FK001TCTECompania] FOREIGN KEY([fiPaisID])
REFERENCES [dbo].[TCTEPaises] ([fiPaisID])
GO
ALTER TABLE [dbo].[TCTECompania] NOCHECK CONSTRAINT [FK001TCTECompania]
GO
/****** Object:  ForeignKey [FK001TCTEDetalleCatalogoGenerico]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTEDetalleCatalogoGenerico]  WITH CHECK ADD  CONSTRAINT [FK001TCTEDetalleCatalogoGenerico] FOREIGN KEY([fiCatalogoId])
REFERENCES [dbo].[TCTECatalogoGenerico] ([fiCatalogoId])
GO
ALTER TABLE [dbo].[TCTEDetalleCatalogoGenerico] CHECK CONSTRAINT [FK001TCTEDetalleCatalogoGenerico]
GO
/****** Object:  ForeignKey [FK001TCTEDistritales]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTEDistritales]  WITH NOCHECK ADD  CONSTRAINT [FK001TCTEDistritales] FOREIGN KEY([fiJefeVtaID], [fiPlazaID], [fiPaisID])
REFERENCES [dbo].[TCTEJefeVentas] ([fiJefeVtaID], [fiPlazaID], [fiPaisID])
GO
ALTER TABLE [dbo].[TCTEDistritales] NOCHECK CONSTRAINT [FK001TCTEDistritales]
GO
/****** Object:  ForeignKey [FK001TCTEJefeVentas]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTEJefeVentas]  WITH NOCHECK ADD  CONSTRAINT [FK001TCTEJefeVentas] FOREIGN KEY([fiPlazaID], [fiPaisID])
REFERENCES [dbo].[TCTEPlazas] ([fiPlazaID], [fiPaisID])
GO
ALTER TABLE [dbo].[TCTEJefeVentas] NOCHECK CONSTRAINT [FK001TCTEJefeVentas]
GO
/****** Object:  ForeignKey [FK001TCTEPaisCanal]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTEPaisCanal]  WITH NOCHECK ADD  CONSTRAINT [FK001TCTEPaisCanal] FOREIGN KEY([fiPaisID])
REFERENCES [dbo].[TCTEPaises] ([fiPaisID])
GO
ALTER TABLE [dbo].[TCTEPaisCanal] NOCHECK CONSTRAINT [FK001TCTEPaisCanal]
GO
/****** Object:  ForeignKey [FK001TCTEPlazas]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTEPlazas]  WITH NOCHECK ADD  CONSTRAINT [FK001TCTEPlazas] FOREIGN KEY([fiPaisID])
REFERENCES [dbo].[TCTEPaises] ([fiPaisID])
GO
ALTER TABLE [dbo].[TCTEPlazas] NOCHECK CONSTRAINT [FK001TCTEPlazas]
GO
/****** Object:  ForeignKey [FK001TCTETiendas]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTETiendas]  WITH NOCHECK ADD  CONSTRAINT [FK001TCTETiendas] FOREIGN KEY([fiCanalId], [fiPaisID])
REFERENCES [dbo].[TCTEPaisCanal] ([fiCanalId], [fiPaisID])
GO
ALTER TABLE [dbo].[TCTETiendas] NOCHECK CONSTRAINT [FK001TCTETiendas]
GO
/****** Object:  ForeignKey [FK002TCTETiendas]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[TCTETiendas]  WITH NOCHECK ADD  CONSTRAINT [FK002TCTETiendas] FOREIGN KEY([fiDistritoID], [fiJefeVtaID], [fiPlazaID], [fiPaisID])
REFERENCES [dbo].[TCTEDistritales] ([fiDistritoId], [fiJefeVtaID], [fiPlazaID], [fiPaisID])
GO
ALTER TABLE [dbo].[TCTETiendas] NOCHECK CONSTRAINT [FK002TCTETiendas]
GO
/****** Object:  ForeignKey [FK1_Venta]    Script Date: 08/14/2020 09:06:33 ******/
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK1_Venta] FOREIGN KEY([fiPromocionId])
REFERENCES [dbo].[PROPromocion] ([fiPromocionId])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK1_Venta]
GO
