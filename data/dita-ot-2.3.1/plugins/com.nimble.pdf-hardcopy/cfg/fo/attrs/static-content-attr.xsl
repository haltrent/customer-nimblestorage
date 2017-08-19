<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="odd__header">
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="start-indent">0.15in</xsl:attribute>
        <xsl:attribute name="space-before">0.15in</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="border-bottom">1pt solid black</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="even__header">
        <xsl:attribute name="text-align">start</xsl:attribute>
        <xsl:attribute name="start-indent">0.15in</xsl:attribute>
        <xsl:attribute name="space-before">0.15in</xsl:attribute>
        <xsl:attribute name="space-before.conditionality">retain</xsl:attribute>
        <xsl:attribute name="color">white</xsl:attribute>
        <xsl:attribute name="font-size">12pt</xsl:attribute>
        <xsl:attribute name="border-bottom">1pt solid black</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="odd__footer">
        <xsl:attribute name="text-align">end</xsl:attribute>
        <xsl:attribute name="end-indent">0.75in</xsl:attribute>
        <xsl:attribute name="space-after">10pt</xsl:attribute>
        <xsl:attribute name="space-after.conditionality">retain</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="__body__first__footer__heading">
        <xsl:attribute name="font-size">8pt</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>