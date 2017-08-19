<?xml version='1.0'?>
<xsl:stylesheet xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template name="createFrontMatter">
<!--
        <xsl:if test="$generate-front-cover">
            <fo:page-sequence master-reference="front-matter" xsl:use-attribute-sets="page-sequence.cover">
                <xsl:call-template name="insertFrontMatterStaticContents"/>
                <fo:flow flow-name="xsl-region-body">
                    &lt;!&ndash;<fo:block-container xsl:use-attribute-sets="__frontmatter">&ndash;&gt;
                    <xsl:call-template name="createFrontCoverContents"/>
                    &lt;!&ndash;</fo:block-container>&ndash;&gt;
                </fo:flow>
            </fo:page-sequence>
        </xsl:if>
-->
    </xsl:template>
</xsl:stylesheet>