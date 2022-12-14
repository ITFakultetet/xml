<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Dette er personer</title>
				<link rel="stylesheet" href="stiler.css"/>
			</head>
			<body>
				<xsl:apply-templates select="personer">
					<xsl:with-param name="kjønn" select="'M'"/>
				</xsl:apply-templates>
				<p/>
				<xsl:apply-templates select="personer">
					<xsl:with-param name="kjønn" select="'K'"/>
				</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="personer">
		<xsl:param name="kjønn"/>
		<h2><xsl:value-of select="if($kjønn='M') then 'Menn' else 'Kvinner'" /></h2>
		<table class="standard_tabell">
			<thead>
				<tr>
					<th>ID</th>
					<th>Navn</th>
					<th>Tel</th>
					<th>Kjønn</th>
					<th>Totalt Salg</th>
					<th>Snittsalg</th>
					</tr>
			</thead>
			<tbody>
				<xsl:for-each select="person[@kjønn=$kjønn and etternavn matches(.,'[D].*[k]')]">
					<xsl:sort data-type="text" order="ascending" lang="no" select="etternavn"/>
					<xsl:sort data-type="text" order="ascending" lang="no" select="fornavn"/>
					
					<tr>
						<td>
							<xsl:value-of select="@id"/>
						</td>
						<td>
						
							<xsl:value-of select="concat(fornavn,' ',etternavn)"/>
						
						</td>
						<td id="tel-nummer">
							<xsl:value-of select="tel"/>
						</td>
						<td class="center-adjust">
							<xsl:value-of select="@kjønn"/>
						</td>
						<td class="right-adjust">
							<xsl:value-of select="sum(salg)"/>
						</td>
						<td class="right-adjust">
							<xsl:value-of select="avg(salg)"/>
						</td>
					</tr>
				</xsl:for-each>
			<!-- Merk: konteksten er nå: personer  -->	
		<tr><td colspan="4">Totalt salg: </td><td><xsl:value-of select="sum(person[@kjønn=$kjønn]/salg)"></xsl:value-of></td></tr>
				</tbody>
		</table>
		
	</xsl:template>
</xsl:stylesheet>