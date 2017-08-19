<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="msgph" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="cmdname" use-attribute-sets="base-font uicontrol">
        <!--<xsl:attribute name="font-family">monospace</xsl:attribute>-->
    </xsl:attribute-set>

    <xsl:attribute-set name="filepath" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="userinput" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="systemoutput" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>