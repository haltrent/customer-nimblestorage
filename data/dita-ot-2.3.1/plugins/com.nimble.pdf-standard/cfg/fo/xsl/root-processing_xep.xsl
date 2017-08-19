<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:rx="http://www.renderx.com/XSL/Extensions"
                xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template name="createMetadata">
        <rx:meta-info>
            <rx:meta-field name="author">
                <xsl:attribute name="value">
                    <xsl:text>Nimble Storage, Inc.</xsl:text>
                </xsl:attribute>
            </rx:meta-field>
            <xsl:variable name="title" as="xs:string?">
                <xsl:apply-templates select="." mode="dita-ot:title-metadata"/>
            </xsl:variable>
            <xsl:if test="exists($title)">
                <rx:meta-field name="title" value="{$title}"/>
            </xsl:if>
            <xsl:variable name="keywords" as="xs:string*">
                <xsl:apply-templates select="." mode="dita-ot:keywords-metadata"/>
            </xsl:variable>
            <xsl:if test="exists($keywords)">
                <rx:meta-field name="keywords">
                    <xsl:attribute name="value" select="$keywords" separator=", "/>
                </rx:meta-field>
            </xsl:if>
            <xsl:variable name="subject" as="xs:string?">
                <xsl:apply-templates select="." mode="dita-ot:subject-metadata"/>
            </xsl:variable>
            <xsl:if test="exists($subject)">
                <rx:meta-field name="subject" value="{$subject}"/>
            </xsl:if>
            <rx:meta-field name="creator" value="Nimble DITA Open Toolkit"/>
        </rx:meta-info>
    </xsl:template>

</xsl:stylesheet>