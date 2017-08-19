<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template name="createFrontMatter">
        <xsl:if test="$generate-front-cover">
            <fo:page-sequence master-reference="front-matter" xsl:use-attribute-sets="page-sequence.cover">
                <xsl:call-template name="insertFrontMatterStaticContents"/>
                <fo:flow flow-name="xsl-region-body">
                    <!--<fo:block-container xsl:use-attribute-sets="__frontmatter">-->
                    <xsl:call-template name="createFrontCoverContents"/>
                    <!--</fo:block-container>-->
                </fo:flow>
            </fo:page-sequence>
        </xsl:if>
    </xsl:template>

    <xsl:template name="createFrontCoverContents">
        <fo:block-container absolute-position="absolute" top="-1in" left="-1.25in"
                            z-index="-1" padding-right="1.0in" background-color="rgb(120,199,58)"
                            height="3in">
            <fo:block text-align="left" margin-top="1.0in" margin-left="1.0in" padding-bottom="1.25in">
                <fo:external-graphic src="url({'Customization/OpenTopic/common/artwork/ns-reversed-logo.png'})" xsl:use-attribute-sets="image"/>
            </fo:block>
        </fo:block-container>
        <fo:block-container absolute-position="absolute" top="-0.5in" z-index="1" padding-right="1.0in" height="8.0in">
            <xsl:attribute name="left">
                <xsl:choose>
                    <xsl:when test="contains($FRONTCOVER, 'post-casablanca')">-0.79in</xsl:when>
                    <xsl:otherwise>-0.25in</xsl:otherwise>
                </xsl:choose>

            </xsl:attribute>
            <fo:block xsl:use-attribute-sets="__frontmatter">
                <fo:block text-align="right" margin-right="-1.0in" margin-top="1.25in">
                    <xsl:choose>
                        <xsl:when test="contains($FRONTCOVER, 'post-casablanca')">
                            <xsl:attribute name="margin-right">0in</xsl:attribute>
                            <xsl:attribute name="margin-top">2.49in</xsl:attribute>
                            <fo:external-graphic src="url({'Customization/OpenTopic/common/artwork/DaytonaBezel.png'})" xsl:use-attribute-sets="image"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <fo:external-graphic src="url({'Customization/OpenTopic/common/artwork/i_array_closeup_angle_reflection_bleed_transp_fade.png'})" xsl:use-attribute-sets="image"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
                <fo:block text-align="left" margin-right="-1.0in" margin-left="-1.0in"
                          margin-top="0in" padding-bottom="0in"/>
                <!-- set the title -->
                <fo:block xsl:use-attribute-sets="__frontmatter__title">
                    <xsl:if test="contains($FRONTCOVER, 'post-casablanca')">
                        <xsl:attribute name="margin-left">0.65in</xsl:attribute>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="$map/*[contains(@class, ' topic/title ')][1]">
                            <xsl:apply-templates select="$map/*[contains(@class, ' topic/title ')][1]"/>
                        </xsl:when>
                        <xsl:when test="$map//*[contains(@class, ' bookmap/mainbooktitle ')][1]">
                            <xsl:apply-templates select="$map//*[contains(@class, ' bookmap/mainbooktitle ')][1]"/>
                        </xsl:when>
                        <xsl:when test="//*[contains(@class, ' map/map ')]/@title">
                            <xsl:value-of select="//*[contains(@class, ' map/map ')]/@title"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')]"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </fo:block>
                <fo:block margin-left="-5.5in">
                    <xsl:if test="contains($FRONTCOVER, 'post-casablanca-techmktg')">
                        <fo:external-graphic src="url({'Customization/OpenTopic/common/artwork/TechMarketingApproved.png'})" xsl:use-attribute-sets="image"/>
                    </xsl:if>
                </fo:block>

                <!-- set the subtitle -->
                <xsl:apply-templates select="$map//*[contains(@class, ' bookmap/booktitlealt ')]"/>

                <fo:block xsl:use-attribute-sets="__frontmatter__owner">
                    <xsl:apply-templates select="$map//*[contains(@class, ' bookmap/bookmeta ')]"/>
                </fo:block>

            </fo:block>
        </fo:block-container>
        <fo:block-container absolute-position="fixed" top="10in">
            <xsl:if test="$map//*[contains(@class, ' bookmap/bookmeta ')]/prodinfo/vrmlist/vrm/@version">
                <fo:block xsl:use-attribute-sets="__frontmatter__version">
                    <xsl:text>Version </xsl:text>
                    <xsl:value-of select="$map//*[contains(@class, ' bookmap/bookmeta ')]/prodinfo/vrmlist/vrm/@version"/>
                    <xsl:if test="$map//*[contains(@class, ' bookmap/bookmeta ')]/prodinfo/vrmlist/vrm/@release">
                        <xsl:text>.</xsl:text>
                        <xsl:value-of select="$map//*[contains(@class, ' bookmap/bookmeta ')]/prodinfo/vrmlist/vrm/@release"/>
                    </xsl:if>
                </fo:block>
            </xsl:if>
            <fo:block text-align="left" margin-right="-1.0in" margin-left="-1.0in" margin-bottom="-1.0in"
                      padding-bottom="0.75in">
                <xsl:attribute name="background-color">
                    <xsl:choose>
                        <xsl:when test="contains($FRONTCOVER, 'post-casablanca')">
                            <xsl:text>rgb(31,73,125)</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>rgb(120,199,58)</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </fo:block>
        </fo:block-container>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' bookmap/booktitlealt ')]" priority="2">
        <fo:block xsl:use-attribute-sets="__frontmatter__subtitle">
            <xsl:if test="contains($FRONTCOVER, 'post-casablanca')">
                <xsl:attribute name="margin-left">0.65in</xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

</xsl:stylesheet>