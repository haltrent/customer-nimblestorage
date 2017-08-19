<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="prereq" use-attribute-sets="section">
        <xsl:attribute name="keep-together.within-page">auto</xsl:attribute>
        <xsl:attribute name="border-bottom">
            <xsl:choose>
                <xsl:when test="$LAYOUT = 'portrait'">none</xsl:when>
                <xsl:otherwise>1pt solid black</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="margin-bottom">6pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="context" use-attribute-sets="section">
        <xsl:attribute name="keep-together.within-page">auto</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="cmd">
        <xsl:attribute name="keep-with-next.within-page">auto</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="info">
        <xsl:attribute name="space-after">
            <xsl:choose>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">1.5pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">0pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">1.5pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">0pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">1.5pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-before">
            <xsl:choose>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">1.5pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">0pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">1.5pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">0pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">1.5pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="line-height">
            <xsl:value-of select="$default-line-height"/>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="steps.step" use-attribute-sets="ol.li">
        <xsl:attribute name="space-after">
            <xsl:choose>
                <xsl:when test="count(child::*) = 1">20pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">6pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">0pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">6pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">0pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">6pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-before">
            <xsl:choose>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">6pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">0pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">6pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">0pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">6pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="break-before">
            <xsl:choose>
                <xsl:when test="@outputclass = 'force-page-break'">page</xsl:when>
                <xsl:when test="@outputclass = 'force-column-break'">column</xsl:when>
                <xsl:otherwise>auto</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="line-height">
            <xsl:value-of select="$default-line-height"/>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="steps.step__label" use-attribute-sets="ol.li__label">
        <xsl:attribute name="font-size">18pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="steps.step__label__content" use-attribute-sets="ol.li__label__content">
        <xsl:attribute name="padding-bottom">0pt</xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="margin-left">-36pt</xsl:attribute>
        <xsl:attribute name="margin-right">12pt</xsl:attribute>
        <xsl:attribute name="margin-top">-20pt</xsl:attribute>
        <xsl:attribute name="text-align">center</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="stepsection" use-attribute-sets="ul.li">
        <xsl:attribute name="space-after">2pt</xsl:attribute>
        <xsl:attribute name="space-before">2pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">auto</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="substeps" use-attribute-sets="ol">
        <xsl:attribute name="space-after">0pt</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="substeps.substep" use-attribute-sets="ol.li">
        <xsl:attribute name="line-height">12pt</xsl:attribute>
        <xsl:attribute name="space-after">
            <xsl:choose>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">1.5pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">0pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">1.5pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">0pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">1.5pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-before">
            <xsl:choose>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">1.5pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">0pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">1.5pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">0pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">1.5pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="choicetable" use-attribute-sets="base-font">
        <!--It is a table container -->
        <xsl:attribute name="width">100%</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="chhead__row">
        <xsl:attribute name="background-color">rgb(232,232,232)</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="chrow" use-attribute-sets="common.border__top">
        <xsl:attribute name="border-top-width">0.5pt</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>