<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="ul.li" use-attribute-sets="common.orphans.widows common.keep-together">
        <xsl:attribute name="space-after">1.5pt</xsl:attribute>
        <xsl:attribute name="space-before">1.5pt</xsl:attribute>
    </xsl:attribute-set>

    <!--Ordered list-->
    <xsl:attribute-set name="ol" use-attribute-sets="common.block">
        <xsl:attribute name="margin-left">auto</xsl:attribute>
        <xsl:attribute name="provisional-distance-between-starts">5mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="ol.li" use-attribute-sets="common.orphans.widows common.keep-together">
        <xsl:attribute name="space-after">1.5pt</xsl:attribute>
        <xsl:attribute name="space-before">1.5pt</xsl:attribute>
    </xsl:attribute-set>

    <!--Simple list-->
    <xsl:attribute-set name="sl" use-attribute-sets="common.block">
        <xsl:attribute name="provisional-distance-between-starts">0mm</xsl:attribute>
        <xsl:attribute name="provisional-label-separation">1mm</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>