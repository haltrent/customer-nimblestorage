<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="codeblock" use-attribute-sets="pre">
        <xsl:attribute name="keep-with-previous.within-page">5</xsl:attribute>
        <xsl:attribute name="start-indent">6pt + from-parent(start-indent)</xsl:attribute>
        <xsl:attribute name="end-indent">6pt + from-parent(end-indent)</xsl:attribute>
        <xsl:attribute name="padding">6pt</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:choose>
                <xsl:when test="@outputclass = 'small'">8pt</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$default-font-size"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="line-height">
            <xsl:choose>
                <xsl:when test="@outputclass = 'small'">10pt</xsl:when>
                <xsl:otherwise>106%</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="kwd" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">Sans</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>