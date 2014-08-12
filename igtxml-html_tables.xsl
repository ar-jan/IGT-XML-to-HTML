<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html"/>

<xsl:template match="text">
<html>
<body>
	<xsl:apply-templates select="body/phrases"/>
</body>
</html>
</xsl:template>

<xsl:template match="phrases">
<xsl:variable name="home" select="phrase/@ph_id" />

<xsl:for-each select="phrase">
	<xsl:if test="$home = @ph_id">
		<table id="hor-minimalist-b">
		<thead>
		<tr>
		<td colspan="100%">
		<xsl:value-of select="current()" /> 
		</td></tr>
		</thead>
		<tbody>
		<tr>
		<xsl:apply-templates select="following::morphemes">
		<xsl:with-param name="home" select="@ph_id"/>
		</xsl:apply-templates>
		</tr>
		<tr>
		<xsl:apply-templates select="following::gloss">
		<xsl:with-param name="home" select="@ph_id"/>
		</xsl:apply-templates>
		</tr>
		<tr>
		<xsl:apply-templates select="following::postags">
		<xsl:with-param name="home" select="@ph_id"/>
		</xsl:apply-templates>
		</tr>
		</tbody>
		<tfoot>
		<tr>
		<xsl:apply-templates select="following::translations">
		<xsl:with-param name="home" select="@ph_id"/>
		</xsl:apply-templates>
		</tr>	
		</tfoot>
		</table>
	</xsl:if>
</xsl:for-each>
</xsl:template>

<xsl:template match="morphemes">
<xsl:param name="home"/>
	<xsl:for-each select="phrase/morph">
		<xsl:if test="$home = parent::phrase/@phrase_ref">
			<td>
			<xsl:value-of select="@text" />
			</td>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="gloss">
<xsl:param name="home"/>
	<xsl:for-each select="phrase/gls">
		<xsl:if test="$home = parent::phrase/@phrase_ref">
			<td>
			<xsl:value-of select="@text" /> 
			</td>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="postags">
<xsl:param name="home"/>
	<xsl:for-each select="phrase/pos">
		<xsl:if test="$home = parent::phrase/@ph_id">
			<td>
			<xsl:value-of select="@text" /> 
			</td>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="wordclass">
<xsl:param name="home"/>
	<xsl:for-each select="phrase/cls">
		<xsl:if test="$home = parent::phrase/@phrase_ref">
			<td>
			<xsl:value-of select="@text" /> 
			</td>
		</xsl:if>
	</xsl:for-each>
</xsl:template>

<xsl:template match="translations">
<xsl:param name="home"/>
	<xsl:for-each select="phrase/trans">
		<xsl:if test="$home = parent::phrase/@ph_id">
			<td colspan="100%">
			<xsl:value-of select="current()" />
			</td>
		</xsl:if>
	</xsl:for-each>			 
</xsl:template>

</xsl:stylesheet>
