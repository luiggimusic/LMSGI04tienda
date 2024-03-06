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
                    <h1>PARTIDOS</h1>
                    <table>
                        <tr>
                            <th>PARTIDO</th>
                            <th>FECHA</th>
                            <th>RESULTADO</th>
                        </tr>
                        
                        <!-- Muestra todos los partidos que se juegan en Lima -->
                        <xsl:for-each select="partido/lugar[@ciudad = 'Lima']">
                            
                            <!-- Ordena por fecha desde el más reciente -->
                            <xsl:sort select="../fecha" order="descending" />
                            
                            <!-- Visualizará los equipos, la fecha y el resultado -->
                            <tr>
                                <td><xsl:value-of select="../equipos/local"/> - <xsl:value-of select="../equipos/visitante"/></td>
                                <td><xsl:value-of select="../fecha"/></td>
                                
                                <xsl:choose>
                                    <!-- Si gana el visitante lo mostrará en azul  -->
                                    <xsl:when test="../equipos/visitante/@puntuacion &gt; ../equipos/local/@puntuacion">
                                        <td class="azul">
                                            <xsl:value-of select="../equipos/local/@puntuacion"/> - 
                                            <xsl:value-of select="../equipos/visitante/@puntuacion"/>
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td>
                                            <xsl:value-of select="../equipos/local/@puntuacion"/> - 
                                            <xsl:value-of select="../equipos/visitante/@puntuacion"/>
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </tr>
                        </xsl:for-each>          
                    </table>			
                </main>
                <footer>
                    <address>&#169; Desarrollado por info@birt.eus</address>
                </footer>
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>