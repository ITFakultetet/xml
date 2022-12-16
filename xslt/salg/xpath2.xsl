<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    
    <xsl:output method="text"/>
   
   
    
    <xsl:template match="/personer" >
    Selgere
    ---------------------------------
    <xsl:value-of select="person[@kjønn='K']/concat(fornavn,' ',etternavn)" separator=", "/> 
     <xsl:text></xsl:text>  
    </xsl:template>
    
    
    
</xsl:stylesheet>