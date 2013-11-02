<?xml version="1.0" encoding="WINDOWS-1251" ?>

<xsl:stylesheet version="1.0" 
     xmlns:xsl ="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
 <P>
  <strong>
    <xsl:value-of select="//Date"/>
  </strong>
 </P>
 <table border="1">
<tr bgcolor="#CCCCCC">
<td align="center"><strong>Уровень ошибки</strong></td>
<td align="center"><strong>Текст ошибки</strong></td>
<td align="center"><strong>Модуль</strong></td>
<td align="center"><strong>№ строки в модуле</strong></td>
</tr>
<xsl:for-each select="ParsingErrors/Error"> 
<xsl:sort data-type="number" select = "number(Level)"/> <xsl:sort order="ascending" select = "Unit"/> <xsl:sort order="ascending" select = "Line"/>
<tr bgcolor="#F5F5F5">
<td align="center"><xsl:value-of select="number(Level)"/></td>
<td><xsl:value-of select="Message"/></td>

<td> <xsl:variable name="A1"> <xsl:value-of select="Unit"/> </xsl:variable> 
<a href= "{$A1}"> <xsl:value-of select="Unit"/> </a> 
</td>

<td align="center"><xsl:value-of select="Line"/></td>
</tr>
</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>

