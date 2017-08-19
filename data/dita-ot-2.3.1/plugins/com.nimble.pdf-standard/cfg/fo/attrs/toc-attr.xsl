<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="__toc__topic__content">
        <xsl:attribute name="last-line-end-indent">-22pt</xsl:attribute>
        <xsl:attribute name="end-indent">22pt</xsl:attribute>
        <xsl:attribute name="text-indent">
            <xsl:choose>
                <xsl:when test="upper-case($NOCHAP)='NO'">-42pt</xsl:when>
                <xsl:otherwise>-<xsl:value-of select="$toc.text-indent"/></xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="text-align-last">justify</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:choose>
                <xsl:when test="upper-case($NOCHAP)='NO' and $level = 2">14pt</xsl:when>
                <xsl:when test="$level = 1">12pt</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$default-font-size"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="font-weight">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:choose>
                <xsl:when test="upper-case($NOCHAP)='NO' and $level=2">bold</xsl:when>
                <xsl:when test="$level = 1">bold</xsl:when>
                <xsl:otherwise>normal</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__toc__indent">
        <xsl:attribute name="margin-left">
            <xsl:choose>
                <xsl:when test="upper-case($NOCHAP)='NO'">-24pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="start-indent">
            <xsl:variable name="level" select="count(ancestor-or-self::*[contains(@class, ' topic/topic ')])"/>
            <xsl:value-of select="concat($side-col-width, ' + (', string($level - 1), ' * ', $toc.toc-indent, ') + ', $toc.text-indent)"/>
        </xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>