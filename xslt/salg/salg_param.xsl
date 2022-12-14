<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="html"/>
	<xsl:param name="menn" select="'M'"/>
	<xsl:param name="kvinner" select="'K'"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Dette er personer</title>
				<link rel="stylesheet" href="stiler.css"/>
			</head>
			<body>
				<xsl:call-template name="visperson">
					<xsl:with-param name="kjønn" select="'M'"/>
				</xsl:call-template>
				<p/>
				<xsl:call-template name="visperson">
					<xsl:with-param name="kjønn" select="'K'"/>
				</xsl:call-template>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template name="visperson">
		<xsl:param name="kjønn" />
		<table class="standard_tabell">
			<thead>
				<tr>
					<th>ID</th>
					<th>Navn</th>
					<th>Tel</th>
					<th>Kjønn</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="/personer/person[@kjønn=$kjønn]">
					<tr>
						<td>
							<xsl:value-of select="/personer/person/@id"/>
						</td>
						<td>
							<xsl:value-of select="concat(fornavn,' ',etternavn)"/>
						</td>
						<td>
							<xsl:value-of select="tel"/>
						</td>
						<td>
							<xsl:value-of select="@kjønn"/>
						</td>
					</tr>
				</xsl:for-each>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>