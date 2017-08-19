<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template match="*[contains(@class, ' task/taskbody ')]">
        <fo:block xsl:use-attribute-sets="taskbody">
            <xsl:call-template name="commonattributes"/>
            <xsl:if test="child::*[contains(@class, ' task/context ')]">
                <xsl:apply-templates select="*[contains(@class, ' task/context ')]"/>
            </xsl:if>
            <xsl:if test="child::*[contains(@class, ' task/prereq ')]">
                <xsl:apply-templates select="*[contains(@class, ' task/prereq ')]"/>
            </xsl:if>
            <xsl:apply-templates select="*[not(local-name()='prereq' or local-name()='context')]"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/context ')]">
        <fo:block xsl:use-attribute-sets="context">
            <xsl:call-template name="commonattributes"/>
            <!--<xsl:apply-templates select="." mode="dita2xslfo:task-heading">
                <xsl:with-param name="use-label">
                    <xsl:call-template name="getVariable">
                        <xsl:with-param name="id" select="'Task Context'"/>
                    </xsl:call-template>
                </xsl:with-param>
            </xsl:apply-templates>-->
            <fo:block xsl:use-attribute-sets="context__content">
                <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>