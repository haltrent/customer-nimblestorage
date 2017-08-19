<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="table.title" use-attribute-sets="base-font common.title">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="space-before">10pt</xsl:attribute>
        <xsl:attribute name="space-after">10pt</xsl:attribute>
        <xsl:attribute name="keep-with-next.within-page">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table" use-attribute-sets="base-font">
        <!--It is a table container -->
        <xsl:attribute name="space-after">10pt</xsl:attribute>
        <xsl:attribute name="keep-with-previous">auto</xsl:attribute>
        <xsl:attribute name="keep-together.within-page">
            <xsl:choose>
                <xsl:when test="@outputclass='keep'">always</xsl:when>
                <xsl:otherwise>auto</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="start-indent">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table.tgroup">
        <!--It is a table-->
        <xsl:attribute name="table-layout">fixed</xsl:attribute>
        <xsl:attribute name="width">100%</xsl:attribute>
        <!--xsl:attribute name=&quot;inline-progression-dimension&quot;&gt;auto&lt;/xsl:attribute-->
        <!--        &lt;xsl:attribute name=&quot;background-color&quot;&gt;white&lt;/xsl:attribute&gt;-->
        <xsl:attribute name="space-before">0pt</xsl:attribute>
        <xsl:attribute name="space-after">0pt</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="table__tableframe__bottom">
        <xsl:attribute name="border-bottom-style">none</xsl:attribute>
        <xsl:attribute name="border-bottom-width">0pt</xsl:attribute>
        <xsl:attribute name="border-bottom-color">white</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tbody.row" use-attribute-sets="common.border">
        <!--Table body row-->
        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="thead.row.entry">
        <!--head cell-->
        <xsl:attribute name="background-color">
            <xsl:choose>
                <xsl:when test="parent::*[@outputclass='clear']">inherit</xsl:when>
                <xsl:otherwise>rgb(120,199,58)</xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tbody.row.entry" use-attribute-sets="common.border">
        <!--body cell-->
        <xsl:attribute name="hyphenate">true</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="tbody.row.entry__content" use-attribute-sets="common.table.body.entry">
        <!--body cell contents-->
        <xsl:attribute name="hyphenate">true</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="simpletable" use-attribute-sets="base-font common.border">
        <!--It is a table container -->
        <xsl:attribute name="width">100%</xsl:attribute>
        <xsl:attribute name="space-before">8pt</xsl:attribute>
        <xsl:attribute name="space-after">10pt</xsl:attribute>
    </xsl:attribute-set>


</xsl:stylesheet>