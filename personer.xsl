<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/*" mode="#all">
        <salg>
            <oppsummering>
                <totalsalg><xsl:value-of select="sum(//salg)"/></totalsalg>
                <salgMenn><xsl:value-of select="sum(/personer/person[@kjønn='M']/salg)"/></salgMenn>
                <salgKvinner><xsl:value-of select="sum(/personer/person[@kjønn='K']/salg)"/></salgKvinner>
            </oppsummering>
            
            <xsl:apply-templates select="/personer/person" mode="#current"/>
        </salg>
    </xsl:template>
    
    <xsl:template match="/personer/person" mode="#all">
        <selger>
            <fornavn><xsl:value-of select="fornavn" /></fornavn>
            <etternavn><xsl:value-of select="etternavn" /></etternavn>
            <salg> <xsl:value-of select="sum(salg)" /> </salg>
        </selger>
    </xsl:template>
    
    
</xsl:stylesheet>