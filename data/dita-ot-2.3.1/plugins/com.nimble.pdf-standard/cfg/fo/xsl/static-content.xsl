<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template name="insertTocStaticContents">
        <xsl:call-template name="insertTocOddFooter"/>
        <xsl:if test="$mirror-page-margins">
            <xsl:call-template name="insertTocEvenFooter"/>
        </xsl:if>
        <!--<xsl:call-template name="insertTocOddHeader"/>
        <xsl:if test="$mirror-page-margins">
            <xsl:call-template name="insertTocEvenHeader"/>
        </xsl:if>-->
    </xsl:template>

    <xsl:template name="insertIndexStaticContents">
        <xsl:call-template name="insertIndexOddFooter"/>
        <xsl:if test="$mirror-page-margins">
            <xsl:call-template name="insertIndexEvenFooter"/>
        </xsl:if>
        <!--<xsl:call-template name="insertIndexOddHeader"/>
        <xsl:if test="$mirror-page-margins">
            <xsl:call-template name="insertIndexEvenHeader"/>
        </xsl:if>-->
    </xsl:template>

    <xsl:template name="insertBodyOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <xsl:call-template name="insertNimbleHeader"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertNimbleHeader">
        <fo:table margin-top=".15in">
            <fo:table-column column-width="60%"/>
            <fo:table-column column-width="40%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell text-align="left">
                        <fo:block xsl:use-attribute-sets="__body__odd__header">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Body odd header'"/>
                                <xsl:with-param name="params">
                                    <prodname>
                                        <xsl:value-of select="$productName"/>
                                    </prodname>
                                    <heading>
                                        <fo:inline xsl:use-attribute-sets="__body__odd__header__heading">
                                            <fo:retrieve-marker retrieve-class-name="current-header"/>
                                        </fo:inline>
                                    </heading>
                                    <pagenum>
                                        <fo:inline xsl:use-attribute-sets="__body__odd__header__pagenum">
                                            <fo:page-number/>
                                        </fo:inline>
                                    </pagenum>
                                </xsl:with-param>
                            </xsl:call-template>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="right">
                        <xsl:choose>
                            <xsl:when test="upper-case($FEEDBACK) = 'SUPPORT_FEEDBACK'">
                                <xsl:call-template name="insertFeedbackContainer">
                                    <xsl:with-param name="destination">mailto:support@nimblestorage.com?subject=[DOC FEEDBACK] - </xsl:with-param>
                                    <xsl:with-param name="text">Documentation Feedback: support@nimblestorage.com</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="upper-case($FEEDBACK) = 'TECHPUBS'">
                                <xsl:call-template name="insertFeedbackContainer">
                                    <xsl:with-param name="destination">mailto:doc-feedback@nimblestorage.com?subject=[DOC FEEDBACK] - </xsl:with-param>
                                    <xsl:with-param name="text">Documentation Feedback: doc-feedback@nimblestorage.com</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:when test="upper-case($FEEDBACK) = 'TECHMKTG'">
                                <xsl:call-template name="insertFeedbackContainer">
                                    <xsl:with-param name="destination">mailto:hpdl_nimble-tech-mkgt-doc-requests@hpe.com?subject=[DOC FEEDBACK] - </xsl:with-param>
                                    <xsl:with-param name="text">Documentation Feedback</xsl:with-param>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise/>
                        </xsl:choose>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template name="insertFeedbackContainer">
        <xsl:param name="destination"/>
        <xsl:param name="text"/>

        <xsl:variable name="title">
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
        </xsl:variable>
        <xsl:variable name="version">
            <fo:block xsl:use-attribute-sets="__frontmatter__version">
                <xsl:text>, Version </xsl:text>
                <xsl:value-of select="$map//*[contains(@class, ' bookmap/bookmeta ')]/prodinfo/vrmlist/vrm/@version"/>
                <xsl:if test="$map//*[contains(@class, ' bookmap/bookmeta ')]/prodinfo/vrmlist/vrm/@release">
                    <xsl:text>.</xsl:text>
                    <xsl:value-of select="$map//*[contains(@class, ' bookmap/bookmeta ')]/prodinfo/vrmlist/vrm/@release"/>
                </xsl:if>
            </fo:block>
        </xsl:variable>

        <fo:block xsl:use-attribute-sets="__body__odd__header" font-size="6pt">
            <fo:basic-link color="blue" text-decoration="underline">
                <xsl:attribute name="external-destination">
                    <xsl:value-of select="$destination"/>
                    <xsl:value-of select="$title"/>
                    <xsl:if test="$map//*[contains(@class, ' bookmap/bookmeta ')]/prodinfo/vrmlist/vrm/@version">
                        <xsl:copy-of select="$version"/>
                    </xsl:if>
                    <xsl:text>&amp;body=</xsl:text>
                    <xsl:text>Date: </xsl:text>
                    <xsl:variable name="currenttime" select="current-dateTime()" as="xs:dateTime"/>
                    <xsl:value-of select="format-dateTime($currenttime, '[M01]/[D01]/[Y0001]')"/>
                    <xsl:text>%0D%0A</xsl:text>
                    <xsl:text>Topic or Content Referenced: (please add information) %0D%0A</xsl:text>
                    <xsl:text>Comment: (please add information) %0D%0A</xsl:text>
                </xsl:attribute>
                <xsl:value-of select="$text"/>
            </fo:basic-link>
        </fo:block>

    </xsl:template>

    <xsl:template name="insertBodyFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <xsl:call-template name="insertNimbleHeader"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <fo:table margin-bottom=".25in" margin-left="0.75in" margin-right="0.75in">
                <fo:table-column column-width="80%"/>
                <fo:table-column column-width="20%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell text-align="left">
                            <xsl:call-template name="insertNimbleCopyrights"/>
                        </fo:table-cell>
                        <fo:table-cell text-align="right" margin-right="0.75in">
                            <fo:block>
                                <xsl:call-template name="getVariable">
                                    <xsl:with-param name="id" select="'Body first footer'"/>
                                    <xsl:with-param name="params">
                                        <heading>
                                            <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                                <fo:retrieve-marker retrieve-class-name="current-header"/>
                                            </fo:inline>
                                        </heading>
                                        <pagenum>
                                            <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                                <fo:page-number/>
                                            </fo:inline>
                                        </pagenum>
                                    </xsl:with-param>
                                </xsl:call-template>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <fo:table margin-bottom=".25in" margin-left="0.75in" margin-right="0.75in">
                <fo:table-column column-width="80%"/>
                <fo:table-column column-width="20%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell text-align="left">
                            <xsl:call-template name="insertNimbleCopyrights"/>
                        </fo:table-cell>
                        <fo:table-cell text-align="right">
                            <fo:block>
                                <!--<xsl:if test="preceding-sibling::*[contains(@class, ' topic/topic ')]">-->
                                    <xsl:call-template name="getVariable">
                                        <xsl:with-param name="id" select="'Body first footer'"/>
                                        <xsl:with-param name="params">
                                            <heading>
                                                <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                                    <fo:retrieve-marker retrieve-class-name="current-header"/>
                                                </fo:inline>
                                            </heading>
                                            <pagenum>
                                                <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                                    <fo:page-number/>
                                                </fo:inline>
                                            </pagenum>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                <!--</xsl:if>-->
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>

    </xsl:template>

    <xsl:template name="insertBodyLastHeader">
        <fo:static-content flow-name="last-body-header">
            <xsl:call-template name="insertNimbleHeader"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyLastFooter">
        <xsl:variable name="id" select="@id"/>
        <fo:static-content flow-name="last-body-footer">
            <fo:table margin-bottom=".25in" margin-left="0.75in" margin-right="0.75in">
                <fo:table-column column-width="80%"/>
                <fo:table-column column-width="20%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell text-align="left">
                            <xsl:call-template name="insertNimbleCopyrights"/>
                        </fo:table-cell>
                        <fo:table-cell text-align="right">
                            <fo:block>
                                <xsl:if test="not(exists($map/descendant::*[@id = $id][ancestor-or-self::*[contains(@class, ' bookmap/frontmatter ')]]))">
                                    <xsl:call-template name="getVariable">
                                        <xsl:with-param name="id" select="'Body first footer'"/>
                                        <xsl:with-param name="params">
                                            <heading>
                                                <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                                    <fo:retrieve-marker retrieve-class-name="current-header"/>
                                                </fo:inline>
                                            </heading>
                                            <pagenum>
                                                <fo:inline xsl:use-attribute-sets="__body__first__footer__pagenum">
                                                    <fo:page-number/>
                                                </fo:inline>
                                            </pagenum>
                                        </xsl:with-param>
                                    </xsl:call-template>
                                </xsl:if>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertTocOddFooter">
        <fo:static-content flow-name="odd-toc-footer">
            <xsl:call-template name="insertTocIndexOddFooterContainer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexOddFooter">
        <fo:static-content flow-name="odd-index-footer">
            <xsl:call-template name="insertTocIndexOddFooterContainer"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertTocIndexOddFooterContainer">
        <fo:table margin-bottom=".25in" margin-left="0.75in" margin-right="0.75in">
            <fo:table-column column-width="80%"/>
            <fo:table-column column-width="20%"/>
            <fo:table-body>
                <fo:table-row>
                    <fo:table-cell text-align="left">
                        <xsl:call-template name="insertNimbleCopyrights"/>
                    </fo:table-cell>
                    <fo:table-cell text-align="right" margin-right="0.75in">
                        <fo:block/>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template name="insertNimbleCopyrights">
        <fo:block>
            <xsl:choose>
                <xsl:when test="//copyrlast[1]/year[1] and //copyrfirst[1]/year[1]">
                    <xsl:text>Copyright © </xsl:text>
                    <xsl:value-of select="//copyrfirst[1]/year[1]"/>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="//copyrlast[1]/year[1]"/>
                    <xsl:text> by Hewlett Packard Enterprise Development LP. All rights reserved.</xsl:text>
                </xsl:when>
                <xsl:when test="//copyrfirst[1]/year[1]">
                    <xsl:text>Copyright © </xsl:text>
                    <xsl:value-of select="//copyrfirst[1]/year[1]"/>
                    <xsl:text> by Hewlett Packard Enterprise Development LP. All rights reserved.</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>Copyright © </xsl:text>
                    <xsl:value-of select="year-from-date(current-date())"/>
                    <xsl:text> by Hewlett Packard Enterprise Development LP. All rights reserved.</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </fo:block>
    </xsl:template>
</xsl:stylesheet>