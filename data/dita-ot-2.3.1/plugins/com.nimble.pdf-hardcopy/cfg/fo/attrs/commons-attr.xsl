<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
    <!-- titles -->
    <xsl:attribute-set name="common.title">
        <xsl:attribute name="font-family">sans-serif</xsl:attribute>
        <xsl:attribute name="page-break-before">
            <xsl:choose>
                <xsl:when test="@outputclass = 'force-page-break'">always</xsl:when>
                <xsl:otherwise>auto</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <!-- paragraph-like blocks -->
    <xsl:attribute-set name="common.block">
        <xsl:attribute name="space-before">0em</xsl:attribute>
        <xsl:attribute name="space-after">0em</xsl:attribute>
        <xsl:attribute name="line-height">
            <xsl:value-of select="$default-line-height"/>
        </xsl:attribute>
    </xsl:attribute-set>

    <!-- keeps logic -->
    <xsl:attribute-set name="common.orphans.widows"></xsl:attribute-set>

    <xsl:attribute-set name="common.keep-together">
        <xsl:attribute name="keep-together.within-page">auto</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.title" use-attribute-sets="common.title">
        <xsl:attribute name="border-after-style">solid</xsl:attribute>
        <xsl:attribute name="border-after-width">3pt</xsl:attribute>
        <xsl:attribute name="border-after-color">black</xsl:attribute>
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">16.8pt</xsl:attribute>
        <xsl:attribute name="font-size">18pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">16.8pt</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.title__content">
        <xsl:attribute name="line-height">100%</xsl:attribute>
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.title" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">15pt</xsl:attribute>
        <xsl:attribute name="space-before">12pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="padding-top">12pt</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>

        <xsl:attribute name="border-after-style">none</xsl:attribute>
        <xsl:attribute name="border-after-width">0pt</xsl:attribute>
        <xsl:attribute name="border-after-color">white</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.title" use-attribute-sets="common.title">
        <xsl:attribute name="space-before">12pt</xsl:attribute>
        <xsl:attribute name="space-after">2pt</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.topic.title"
                       use-attribute-sets="base-font common.title">
        <xsl:attribute name="space-before">10pt</xsl:attribute>
        <xsl:attribute name="start-indent">
            <xsl:value-of select="$side-col-width"/>
        </xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.topic.topic.title"
                       use-attribute-sets="base-font common.title">
        <xsl:attribute name="start-indent">
            <xsl:value-of select="$side-col-width"/>
        </xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic.topic.topic.topic.topic.topic.title"
                       use-attribute-sets="base-font common.title">
        <xsl:attribute name="start-indent">
            <xsl:value-of select="$side-col-width"/>
        </xsl:attribute>
        <xsl:attribute name="font-style">italic</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="section.title" use-attribute-sets="common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before">15pt</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="example.title" use-attribute-sets="common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fig">
        <xsl:attribute name="keep-together.within-page">auto</xsl:attribute>
        <xsl:attribute name="border">none</xsl:attribute>
        <xsl:attribute name="space-after">
            <xsl:choose>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">3pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">0pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">3pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">0pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">3pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fig.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before">5pt</xsl:attribute>
        <xsl:attribute name="space-after">5pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous.within-page">auto</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="shortdesc">
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="topic__shortdesc" use-attribute-sets="body">
        <xsl:attribute name="keep-with-next">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="section" use-attribute-sets="base-font">
        <xsl:attribute name="line-height">
            <xsl:value-of select="$default-line-height"/>
        </xsl:attribute>
        <xsl:attribute name="space-before">0em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="example" use-attribute-sets="base-font">
        <xsl:attribute name="line-height">
            <xsl:value-of select="$default-line-height"/>
        </xsl:attribute>
        <xsl:attribute name="space-before">0.6em</xsl:attribute>
        <xsl:attribute name="start-indent">inherit</xsl:attribute>
        <xsl:attribute name="end-indent">36pt</xsl:attribute>
        <xsl:attribute name="padding">5pt</xsl:attribute>

        <xsl:attribute name="border-before-style">none</xsl:attribute>
        <xsl:attribute name="border-before-width">0pt</xsl:attribute>
        <xsl:attribute name="border-before-color">white</xsl:attribute>

        <xsl:attribute name="border-after-style">none</xsl:attribute>
        <xsl:attribute name="border-after-width">0pt</xsl:attribute>
        <xsl:attribute name="border-after-color">white</xsl:attribute>

        <xsl:attribute name="border-start-style">none</xsl:attribute>
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-start-color">white</xsl:attribute>

        <xsl:attribute name="border-end-style">none</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-color">white</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="p" use-attribute-sets="common.block">
        <xsl:attribute name="space-after">
            <xsl:choose>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">1pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">0pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">1pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">0pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">2pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="space-before">
            <xsl:choose>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">1pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">0pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">1pt</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">0pt</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">2pt</xsl:when>
                <xsl:otherwise>0pt</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="text-indent">0em</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note" use-attribute-sets="common.block">
        <xsl:attribute name="margin-top">3pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">3pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__table" use-attribute-sets="common.block">
        <xsl:attribute name="margin-top">3pt</xsl:attribute>
        <xsl:attribute name="margin-bottom">3pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__image__column">
        <xsl:attribute name="column-number">1</xsl:attribute>
        <xsl:attribute name="column-width">18pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="color">red</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__important">
        <xsl:attribute name="font-style">italic</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__caution">
        <xsl:attribute name="text-transform">uppercase</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__danger">
        <xsl:attribute name="text-transform">uppercase</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__warning">
        <xsl:attribute name="text-transform">uppercase</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="note__label__other">
        <xsl:attribute name="text-transform">uppercase</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="lines" use-attribute-sets="base-font">
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
        <xsl:attribute name="white-space-collapse">true</xsl:attribute>
        <xsl:attribute name="linefeed-treatment">preserve</xsl:attribute>
        <xsl:attribute name="wrap-option">wrap</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="keyword">
        <xsl:attribute name="border-start-width">0pt</xsl:attribute>
        <xsl:attribute name="border-end-width">0pt</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-family">Sans</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="draft-comment" use-attribute-sets="common.border">
        <xsl:attribute name="border-before-color">red</xsl:attribute>
        <xsl:attribute name="border-after-color">red</xsl:attribute>
        <xsl:attribute name="border-start-color">red</xsl:attribute>
        <xsl:attribute name="border-end-color">red</xsl:attribute>
        <xsl:attribute name="background-color">white</xsl:attribute>
        <xsl:attribute name="color">black</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="image">
        <xsl:attribute name="keep-with-previous.within-page">auto</xsl:attribute>
        <xsl:attribute name="content-width">
            <xsl:choose>
                <xsl:when test="ancestor-or-self::*/@scale">
                    <xsl:value-of select="ancestor-or-self::*/@scale"/>
                </xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24_standard'">scale-to-fit</xsl:when>
                <xsl:when test="$DIMENSION = 'test_18x24'">scale-to-fit</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20_standard'">scale-to-fit</xsl:when>
                <xsl:when test="$DIMENSION = 'test_16x20'">scale-to-fit</xsl:when>
                <xsl:when test="$LAYOUT = 'portrait'">scale-to-fit</xsl:when>
                <xsl:when test="$LAYOUT = 'landscape-2col'">scale-to-fit</xsl:when>
                <xsl:otherwise>scale-to-fit</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__force__page__count">
        <xsl:attribute name="force-page-count">
            <xsl:choose>
                <xsl:when test="name(/*) = 'bookmap'">
                    <xsl:value-of select="'auto'"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="'auto'"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>