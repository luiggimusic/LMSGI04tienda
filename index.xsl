<?xml version="1.0" encoding="UTF-8"?>

<!--
	Nombre: Luis Arnaldo Palma
	Fecha: 08/03/2024
	Módulo: Lenguajes de marcas y sistemas de gestión de información
	- UD4 Transformación de datos (20%)
	- LMSGI04 Tarea evaluativa 2. XSLT (60%)
	
	Enlace a Autoevaluación:
	https://docs.google.com/document/d/19JwmGknPQZtUwztoQQ9k3zZcPvF4jnPy36-XVRAApfc/edit?usp=sharing
	
	Descripcion de la tarea:  
	El objetivo de esta tarea es utilizar el lenguaje XPath y el estandar XSLT para 
	transformar un sitio web de manera que obtenga los datos visualizados de un documento XML.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="html" doctype-system="about:legacy-compat" />
	
	<xsl:template match="/">
		
		<html lang="es">
			
			<head>
				<link href="./css/estilo.css" rel="stylesheet" type="text/css" />
				<meta charset="utf-8"/>
				<meta name="description" content="Página principal" />
				<title>titulo de la web</title>
			</head>
			
			<body>
				<header>
					<img src= "./img/logotipo.png" alt= "Reservas" />
					<a href="web/tienda.xml">Tienda</a>
					<a href="web/equipos.xml">Equipos</a>
					<a href="web/partidos.xml">Partidos</a>
				</header>
				
				<main class="principal">
					<h1>TRABAJANDO CON PLANTILLAS XSLT</h1>
				</main>
				
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
		
	</xsl:template>
	
</xsl:stylesheet>