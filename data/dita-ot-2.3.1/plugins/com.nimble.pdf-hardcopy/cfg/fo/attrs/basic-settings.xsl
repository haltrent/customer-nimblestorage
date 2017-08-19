<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <!-- The default of 215.9mm x 279.4mm is US Letter size (8.5x11in) -->
    <xsl:variable name="page-height">
        <xsl:choose>
            <xsl:when test="$DIMENSION = 'test_18x24_standard'">18in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_18x24'">18in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20_standard'">16in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20'">16in</xsl:when>
            <xsl:when test="$LAYOUT = 'portrait'">11in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-2col'">11in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-3col'">11in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-4col'">11in</xsl:when>
            <xsl:otherwise>11in</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="page-width">
        <xsl:choose>
            <xsl:when test="$DIMENSION = 'test_18x24_standard'">24in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_18x24'">24in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20_standard'">20in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20'">20in</xsl:when>
            <xsl:when test="$LAYOUT = 'portrait'">8.5in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-2col'">17in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-3col'">17in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-4col'">17in</xsl:when>
            <xsl:otherwise>8.5in</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="page-margin-top">
        <xsl:choose>
            <xsl:when test="$DIMENSION = 'test_18x24_standard'">1.25in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_18x24'">1.25in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20_standard'">1.25in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20'">1.25in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-2col'">1.25in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-3col'">1.25in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-4col'">1.25in</xsl:when>
            <xsl:when test="$LAYOUT = 'portrait'">0.85in</xsl:when>
            <xsl:otherwise>1.35in</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="page-margin-bottom">
        <xsl:choose>
            <xsl:when test="$DIMENSION = 'test_18x24_standard'">1.25in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_18x24'">1.5in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20_standard'">1.25in</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20'">1.5in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-2col'">1.5in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-3col'">1.5in</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-4col'">1.5in</xsl:when>
            <xsl:otherwise>1in</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <!--The side column width is the amount the body text is indented relative to the margin. -->
    <xsl:variable name="side-col-width">
        <xsl:choose>
            <xsl:when test="$DIMENSION = 'test_18x24_standard'">50pt</xsl:when>
            <xsl:when test="$DIMENSION = 'test_18x24'">25pt</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20_standard'">50pt</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20'">25pt</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-2col'">25pt</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-3col'">25pt</xsl:when>
            <xsl:when test="$LAYOUT = 'landscape-4col'">25pt</xsl:when>
            <xsl:otherwise>25pt</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="default-font-size">
        <xsl:choose>
            <xsl:when test="$DIMENSION = 'test_18x24_standard'">10pt</xsl:when>
            <xsl:when test="$DIMENSION = 'test_18x24'">10pt</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20_standard'">10pt</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20'">10pt</xsl:when>
            <xsl:when test="$LAYOUT = 'portrait'">10pt</xsl:when>
            <xsl:otherwise>10pt</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="default-line-height">
        <xsl:choose>
            <xsl:when test="$DIMENSION = 'test_18x24_standard'">12pt</xsl:when>
            <xsl:when test="$DIMENSION = 'test_18x24'">12pt</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20_standard'">12pt</xsl:when>
            <xsl:when test="$DIMENSION = 'test_16x20'">12pt</xsl:when>
            <xsl:when test="$LAYOUT = 'portrait'">12pt</xsl:when>
            <xsl:otherwise>12pt</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

</xsl:stylesheet>