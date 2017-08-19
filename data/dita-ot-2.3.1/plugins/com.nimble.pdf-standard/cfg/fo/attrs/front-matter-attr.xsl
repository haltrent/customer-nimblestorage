<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="__frontmatter__title" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">0.125in</xsl:attribute>
        <!--<xsl:attribute name="space-before.conditionality">retain</xsl:attribute>-->
        <xsl:attribute name="font-size">36pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="line-height">140%</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
        <xsl:attribute name="color">rgb(72,72,84)</xsl:attribute>
        <xsl:attribute name="font-family">HelveticaNeueLT67</xsl:attribute>
        <xsl:attribute name="hyphenate">
            <xsl:choose>
                <xsl:when test="@outputclass = 'hyphenate'">true</xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__version">
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="margin-bottom">0.25in</xsl:attribute>
        <xsl:attribute name="margin-right">0.25in</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="font-family">HelveticaNeueLT67</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__subtitle" use-attribute-sets="common.title">
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">140%</xsl:attribute>
        <xsl:attribute name="color">rgb(72,72,84)</xsl:attribute>
        <xsl:attribute name="text-align">left</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>