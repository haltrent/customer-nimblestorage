<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="prereq" use-attribute-sets="section">
        <xsl:attribute name="keep-together.within-page">auto</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="context" use-attribute-sets="section">
        <xsl:attribute name="keep-together.within-page">auto</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="chhead__row">
        <xsl:attribute name="background-color">rgb(232,232,232)</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="chrow" use-attribute-sets="common.border__top">
        <xsl:attribute name="border-top-width">0.5pt</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>