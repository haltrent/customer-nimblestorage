<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
    <xsl:attribute-set name="region-body.odd">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="$page-margin-top"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$page-margin-bottom"/>
        </xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
            <xsl:value-of select="$page-margin-inside"/>
        </xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
            <xsl:value-of select="$page-margin-outside"/>
        </xsl:attribute>
        <xsl:attribute name="column-count">
            <xsl:choose>
                <xsl:when test="$LAYOUT='portrait'">1</xsl:when>
                <xsl:when test="$LAYOUT='landscape-2col'">2</xsl:when>
                <xsl:when test="$LAYOUT='landscape-3col'">3</xsl:when>
                <xsl:when test="$LAYOUT='landscape-4col'">4</xsl:when>
                <xsl:otherwise>1</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="region-body.even">
        <xsl:attribute name="margin-top">
            <xsl:value-of select="$page-margin-top"/>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">
            <xsl:value-of select="$page-margin-bottom"/>
        </xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
            <xsl:value-of select="$page-margin-outside"/>
        </xsl:attribute>
        <xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
            <xsl:value-of select="$page-margin-inside"/>
        </xsl:attribute>
        <xsl:attribute name="column-count">
            <xsl:choose>
                <xsl:when test="$LAYOUT='portrait'">1</xsl:when>
                <xsl:when test="$LAYOUT='landscape-2col'">2</xsl:when>
                <xsl:when test="$LAYOUT='landscape-3col'">3</xsl:when>
                <xsl:when test="$LAYOUT='landscape-4col'">4</xsl:when>
                <xsl:otherwise>2</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>