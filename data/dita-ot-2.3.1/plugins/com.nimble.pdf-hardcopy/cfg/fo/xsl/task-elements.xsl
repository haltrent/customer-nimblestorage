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

    <xsl:template match="*[contains(@class, ' task/steps ')]/*[contains(@class, ' task/step ')]">
        <!-- Switch to variable for the count rather than xsl:number, so that step specializations are also counted -->
        <xsl:variable name="actual-step-count" select="number(count(preceding-sibling::*[contains(@class, ' task/step ')]) + 1)"/>
        <fo:list-item xsl:use-attribute-sets="steps.step" keep-together.within-line="always">
            <fo:list-item-label xsl:use-attribute-sets="steps.step__label" keep-with-next.within-line="always">
                <fo:block font-size="100pt" float="left" position="absolute"
                          margin-left="-36pt" padding-top="8pt" z-index="1000" color="rgb(41,107,181)">
                    <xsl:text>•</xsl:text>
                </fo:block>
                <fo:block xsl:use-attribute-sets="steps.step__label__content" letter-spacing="1.5pt" keep-with-previous.within-column="always">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:if test="preceding-sibling::*[contains(@class, ' task/step ')] | following-sibling::*[contains(@class, ' task/step ')]">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Ordered List Number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <xsl:value-of select="$actual-step-count"/>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                </fo:block>
            </fo:list-item-label>

            <fo:list-item-body xsl:use-attribute-sets="steps.step__body">
                <fo:block xsl:use-attribute-sets="steps.step__content" margin-left="-14pt">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' task/substeps ')]/*[contains(@class, ' task/substep ')]">
        <fo:list-item xsl:use-attribute-sets="substeps.substep" keep-together.within-page="7" keep-together.within-column="7">
            <fo:list-item-label xsl:use-attribute-sets="substeps.substep__label">
                <fo:block xsl:use-attribute-sets="substeps.substep__label__content">
                    <fo:inline>
                        <xsl:call-template name="commonattributes"/>
                    </fo:inline>
                    <xsl:number format="a) "/>
                </fo:block>
            </fo:list-item-label>
            <fo:list-item-body xsl:use-attribute-sets="substeps.substep__body">
                <fo:block xsl:use-attribute-sets="substeps.substep__content">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

</xsl:stylesheet>