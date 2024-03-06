<?xml version="1.0" encoding="UTF-8"?>

<!--
     Nombre: Luis Arnaldo Palma
     Fecha: 08/03/2024
     Módulo: Lenguajes de marcas y sistemas de gestión de información
     - UD4 Transformación de datos (20%)
     - LMSGI04 Tarea evaluativa 2. XSLT (60%)
     
     Enlace a Autoevaluación:
     https://docs.google.com/document/d/19JwmGknPQZtUwztoQQ9k3zZcPvF4jnPy36-XVRAApfc/edit?usp=sharing
     
     Enlace a página web:
     https://luiggimusic.github.io/LMSGI04tienda/
     
     Descripcion de la tarea:  
     El objetivo de esta tarea es utilizar el lenguaje XPath y el estandar XSLT para 
     transformar un sitio web de manera que obtenga los datos visualizados de un documento XML.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-system="about:legacy-compat" />
    
    <xsl:template match="/club_voleibol">
        
        <html lang="es">
            <head>
                <link href="../css/estilo.css" rel="stylesheet" type="text/css" />
                <meta charset="utf-8"/>
                <meta name="description" content="Página principal" />
                <title>titulo de la web</title>
            </head>
            
            <body>
                <header>
                    <img src= "../img/logotipo.png" alt= "Reservas" />
                    <a href="tienda.xml">Tienda</a>
                    <a href="equipos.xml">Equipos</a>
                    <a href="partidos.xml">Partidos</a>
                </header>
                
                <main>  
                    <xsl:apply-templates select="equipo"/>
                </main>
                
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html> 
    </xsl:template>
    
    <xsl:template match="equipo">

        <xsl:apply-templates select="entrenador[nombre = 'Julio Velasco']"/>
        
    </xsl:template>
    
    <xsl:template match="entrenador">
        
        <!-- Selecciono al entrenador creando una variable asignándole el nombre "Julio Velasco" -->
        <xsl:variable name="nombreEnt" select="nombre"/>
                    
            <!-- Se muestra el nombre del entrenador -->
            <h1><a href="{url}"><xsl:value-of select="$nombreEnt"/></a></h1>
            
            <article class="equipos">
                
                <!-- Se muestra nombre del equipo -->
                <h4><xsl:value-of select="../nombre"/></h4>
                
                <!-- Se crea un template para los jugadores y jugadoras -->
                <xsl:apply-templates select="../jugadores/jugador"/>
            </article>       
    </xsl:template>
    
    <xsl:template match="jugador">     
        
        <!-- Evalua si el jugador o jugadora es titular y muestra el número de camiseta y nombre -->  
        <xsl:if test="@titular = 'si'">
            <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>                                    
        </xsl:if>
        
    </xsl:template>
    
    
    
</xsl:stylesheet>