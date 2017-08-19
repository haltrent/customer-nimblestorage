<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:attribute-set name="codeblock" use-attribute-sets="pre">
        <xsl:attribute name="keep-with-previous.within-page">always</xsl:attribute>
        <xsl:attribute name="start-indent">6pt + from-parent(start-indent)</xsl:attribute>
        <xsl:attribute name="end-indent">6pt + from-parent(end-indent)</xsl:attribute>
        <xsl:attribute name="padding">6pt</xsl:attribute>
        <xsl:attribute name="font-family">monospace</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="synph">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="oper" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="delim" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="sep" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="apiname" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="kwd" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
    </xsl:attribute-set>

    <xsl:attribute-set name="fragref" use-attribute-sets="base-font">
        <xsl:attribute name="font-family">inherit</xsl:attribute>
    </xsl:attribute-set>

</xsl:stylesheet>