<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math tei"
    version="3.0">
    
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
    
   <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template> 
    
 
 <!-- <xsl:template match="tei:l">
     <xsl:copy-of select="."/>
 </xsl:template> -->
 
 
    <!--   <xsl:template match="l">       
        <xsl:copy-of select="."/>
    </xsl:template> -->
 
    
 
<!--  <xsl:template match="l"/>  -->
    
<!-- <xsl:template match="lg[@type='stanza']">
     <xsl:copy-of select="."/>
 </xsl:template> -->
    
 <!--    <xsl:template match="lg[@type='stanza'][1]">
        <xsl:copy-of select="."/>
 </xsl:template> -->

<!--<xsl:template match="l">
    Ici, il y avait un vers
</xsl:template>-->

<!--<xsl:template match="l">
<xsl:text>Ici, il y avait un vers</xsl:text>
</xsl:template>-->

<!--
<xsl:template match="lg">
    <div>Here was my element</div>
</xsl:template>
-->
    
<!-- <xsl:template match="lg">
     <xsl:element name="div">Here was my element</xsl:element>
 </xsl:template>-->
 
<!-- <xsl:template match="lg">
     <div type="poem">Here was my element</div>
 </xsl:template>-->

 <!-- <xsl:template match="lg">
        <div type="{./@type}">Here was my elemente</div>
    </xsl:template> -->
    
<!--<xsl:template match="lg">
    <xsl:element name="div">
        <xsl:attribute name="type">
            <xsl:value-of select="@type"/>
        </xsl:attribute>
        <xsl:text>Here was my element</xsl:text>
    </xsl:element>
</xsl:template>-->
    
    <!-- <xsl:template match="lg">
        <xsl:element name="div">
            <xsl:attribute name="type">
                <xsl:value-of select="@type"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>-->
    
   <!-- <xsl:template match="l">
        <xsl:value-of select="."/>
    </xsl:template>-->
    
   <!-- <xsl:template match="l">
        <l><xsl:value-of select="."/></l>
    </xsl:template>-->
    
 
    <!-- <xsl:template match="teiHeader">
        <xsl:copy-of select="."/>
    </xsl:template> -->
   
    <!-- <xsl:template match="l">
        <xsl:element name="l">
            <xsl:attribute name="n">
             <xsl:number count="l" level="any" format="1"/>   
            </xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>  -->
   
    
    
</xsl:stylesheet>