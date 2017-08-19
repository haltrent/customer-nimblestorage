<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="index-indents">
        <xsl:attribute name="end-indent">0pt</xsl:attribute>
        <xsl:attribute name="last-line-end-indent">0pt</xsl:attribute>
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
        <xsl:attribute name="font-size">9pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="index.entry__content">
        <xsl:attribute name="start-indent">12pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="index.term">
        <xsl:attribute name="start-indent">12pt</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>