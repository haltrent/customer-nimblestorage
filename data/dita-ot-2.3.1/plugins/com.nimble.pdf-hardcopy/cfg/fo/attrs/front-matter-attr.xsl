<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="2.0">

    <xsl:attribute-set name="__frontmatter__title" use-attribute-sets="common.title">
        <xsl:attribute name="margin-right">0.125in</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:choose>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">18pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">20pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">18pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">20pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">18pt</xsl:when>
                <xsl:otherwise>20pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-top">15pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">100%</xsl:attribute>
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="font-family">TimesNewRoman</xsl:attribute>
        <xsl:attribute name="hyphenate">
            <xsl:choose>
                <xsl:when test="@outputclass = 'hyphenate'">true</xsl:when>
                <xsl:otherwise>false</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__title_sub" use-attribute-sets="common.title">
        <xsl:attribute name="margin-right">0.125in</xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="font-size">
            <xsl:choose>
                <xsl:when test="@outputclass='small-title'">12pt</xsl:when>
                <xsl:otherwise>18pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-top">6pt</xsl:attribute>
        <xsl:attribute name="font-weight">normal</xsl:attribute>
        <xsl:attribute name="line-height">100%</xsl:attribute>
        <xsl:attribute name="text-align">right</xsl:attribute>
        <xsl:attribute name="color">rgb(72,72,84)</xsl:attribute>
        <xsl:attribute name="font-family">TimesNewRoman</xsl:attribute>
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
        <xsl:attribute name="font-family">TimesNewRoman</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__frontmatter__subtitle" use-attribute-sets="common.title">
        <!--<xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="line-height">140%</xsl:attribute>-->
    </xsl:attribute-set>

</xsl:stylesheet>