<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="b">
        <xsl:attribute name="font-weight">
            <xsl:choose>
                <xsl:when test="@outputclass = 'yellow'">
                    <xsl:text>normal</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>bold</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="background-color">
            <xsl:choose>
                <xsl:when test="@outputclass = 'yellow'">
                    <xsl:text>yellow</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>inherit</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>