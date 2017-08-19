<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                version="2.0">

    <xsl:template name="insertBodyStaticContents">
        <xsl:call-template name="insertBodyFootnoteSeparator"/>
        <xsl:call-template name="insertBodyOddFooter"/>
        <xsl:call-template name="insertBodyOddHeader"/>
        <xsl:if test="$mirror-page-margins">
            <xsl:call-template name="insertBodyEvenFooter"/>
        </xsl:if>
        <xsl:call-template name="insertBodyFirstHeader"/>
        <xsl:call-template name="insertBodyLastHeader"/>
        <xsl:call-template name="insertBodyFirstFooter"/>
        <xsl:call-template name="insertBodyLastFooter"/>
    </xsl:template>

    <xsl:template name="insertTocStaticContents">
        <xsl:call-template name="insertTocOddFooter"/>
        <xsl:if test="$mirror-page-margins">
            <xsl:call-template name="insertTocEvenFooter"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="insertIndexStaticContents">
        <xsl:call-template name="insertIndexOddFooter"/>
        <xsl:if test="$mirror-page-margins">
            <xsl:call-template name="insertIndexEvenFooter"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="insertBodyOddHeader">
        <fo:static-content flow-name="odd-body-header">
            <xsl:call-template name="insertNimbleHeaderContent"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertNimbleHeaderContent">
        <fo:table margin-top=".25in" margin-left="0.75in" margin-right="0.75in"
                  border-bottom="1pt solid black">
            <fo:table-column column-width="25%"/>
            <fo:table-column column-width="75%"/>
            <fo:table-body margin-top="0in" margin-left="0in">
                <fo:table-row background-color="rgb(120,199,58)">
                    <fo:table-cell text-align="left" padding-start="0in">
                        <fo:block text-align="inherit">
                            <fo:external-graphic
                                    src="url({'Customization/OpenTopic/common/artwork/ns-reversed-logo.png'})"
                                    xsl:use-attribute-sets="image"/>
                        </fo:block>
                    </fo:table-cell>
                    <fo:table-cell text-align="right">
                        <fo:block xsl:use-attribute-sets="__frontmatter__title">
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
                                    <xsl:choose>
                                        <xsl:when test="$LAYOUT = 'portrait'">
                                            <xsl:apply-templates select="$map//*[contains(@class, ' bookmap/booktitlealt ')][1]"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')]"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                    <fo:table-cell number-columns-spanned="2">
                        <xsl:if test="$LAYOUT = 'landscape-4col'">
                            <xsl:attribute name="number-columns-spanned">4</xsl:attribute>
                        </xsl:if>
                        <fo:block xsl:use-attribute-sets="__frontmatter__title_sub">
                            <xsl:choose>
                                <xsl:when test="$LAYOUT = 'portrait'">
                                    <xsl:apply-templates select="$map//*[contains(@class, ' bookmap/booktitlealt ')][1]"/>
                                </xsl:when>
                                <xsl:when test="$map//*[contains(@class, ' bookmap/booktitlealt ')][1]">
                                    <!--<xsl:apply-templates select="$map//*[contains(@class,' bookmap/booktitlealt ')][1]"/>-->
                                    <fo:retrieve-marker retrieve-class-name="current-header"/>
                                </xsl:when>
                                <xsl:otherwise/>
                            </xsl:choose>
                        </fo:block>
                    </fo:table-cell>
                </fo:table-row>
            </fo:table-body>
        </fo:table>
    </xsl:template>

    <xsl:template name="insertBodyEvenHeader">
        <fo:static-content flow-name="even-body-header">
            <xsl:call-template name="insertNimbleHeaderContent"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyFirstHeader">
        <fo:static-content flow-name="first-body-header">
            <xsl:call-template name="insertNimbleHeaderContent"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyFirstFooter">
        <fo:static-content flow-name="first-body-footer">
            <fo:table margin-bottom="1.5in" margin-left="0.75in" margin-right="0.75in"
                      border-top="1pt solid black" padding-top="0.125in">
                <fo:table-column column-width="50%">
                    <xsl:if test="$LAYOUT = 'portrait'">
                        <xsl:attribute name="column-width">25%</xsl:attribute>
                    </xsl:if>
                </fo:table-column>
                <fo:table-column column-width="50%">
                    <xsl:if test="$LAYOUT = 'portrait'">
                        <xsl:attribute name="column-width">75%</xsl:attribute>
                    </xsl:if>
                </fo:table-column>

                <fo:table-body>
                    <xsl:if test="$LAYOUT = 'landscape-2col' or $LAYOUT = 'landscape-3col' or $LAYOUT = 'landscape-4col'">
                        <fo:table-row>
                            <fo:table-cell text-align="left" display-align="before" number-columns-spanned="2">
                                <xsl:if test="$LAYOUT = 'landscape-3col'">
                                    <xsl:attribute name="number-columns-spanned">3</xsl:attribute>
                                </xsl:if>
                                <xsl:if test="$LAYOUT = 'landscape-4col'">
                                    <xsl:attribute name="number-columns-spanned">4</xsl:attribute>
                                </xsl:if>
                                <fo:block font-size="8pt">
                                    <fo:inline font-weight="bold">Note: </fo:inline>This equipment
                                    has been tested and found to comply with the limits for a Class
                                    A digital device, pursuant to Part 15 of the FCC Rules. These
                                    limits are designed to provide reasonable protection against
                                    harmful interference when the equipment is operated in a
                                    commercial environment. This equipment generates, uses, and can
                                    radiate radio frequency energy and, if not installed and used in
                                    accordance with the instruction manual, may cause harmful
                                    interference to radio communications. Operation of this
                                    equipment in a residential area is likely to cause harmful
                                    interference in which case the user will be required to correct
                                    the interference at his own expense. </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <xsl:if test="$LAYOUT = 'landscape-2col' or $LAYOUT = 'landscape-3col' or $LAYOUT = 'landscape-4col'">
                        <fo:table-row>
                            <fo:table-cell text-align="left" display-align="before">
                                <fo:block font-size="8pt">
                                    <fo:inline font-weight="bold">Warning: </fo:inline>This is a
                                    Class A product. In a domestic environment this product may
                                    cause radio interference in which case the user may be required
                                    to take adequate measures.</fo:block>
                            </fo:table-cell>
                            <fo:table-cell text-align="right" display-align="before">
                                <fo:block writing-mode="rl-tb" font-size="8pt" font-family="Arial">
                                    <!-- Hebrew -->
                                    <fo:inline font-family="Sans-Korean" font-weight="bold">אַזהָרָה</fo:inline>
                                </fo:block>
                                <fo:block writing-mode="rl-tb" font-size="8pt" font-family="Sans-Korean">
                                    <!-- Hebrew -->
                                    <fo:inline font-family="Sans-Korean">Class A זהו מוצר מסוג A .
                                        בסביבה ביתית מוצר זה עלול לגרום להפרעות רדיו ובמקרה זה ,
                                        המשתמש עשוי להידרש לנקוט באמצעים מתאימים .</fo:inline>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <xsl:if test="$LAYOUT = 'landscape-2col' or $LAYOUT = 'landscape-3col' or $LAYOUT = 'landscape-4col'">
                        <fo:table-row>
                            <fo:table-cell text-align="left" display-align="before" number-columns-spanned="2">
                                <xsl:if test="$LAYOUT = 'landscape-3col'">
                                    <xsl:attribute name="number-columns-spanned">3</xsl:attribute>
                                </xsl:if>
                                <xsl:if test="$LAYOUT = 'landscape-4col'">
                                    <xsl:attribute name="number-columns-spanned">4</xsl:attribute>
                                </xsl:if>
                                <fo:block font-size="6pt" font-family="Sans-Korean">
                                    <!-- Korean -->
                                    <fo:inline font-family="Sans-Korean">경고: </fo:inline>이것은 클래스 A
                                    제품입니다. 국내 환경에서이 제품은 사용자가 적절한 조치를 취할 필요로하는 무선 간섭을 일으킬 수
                                    있습니다.</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <xsl:if test="$LAYOUT = 'landscape-2col' or $LAYOUT = 'landscape-3col' or $LAYOUT = 'landscape-4col'">
                        <fo:table-row>
                            <fo:table-cell text-align="left" display-align="before" number-columns-spanned="2">
                                <xsl:if test="$LAYOUT = 'landscape-3col'">
                                    <xsl:attribute name="number-columns-spanned">3</xsl:attribute>
                                </xsl:if>
                                <xsl:if test="$LAYOUT = 'landscape-4col'">
                                    <xsl:attribute name="number-columns-spanned">4</xsl:attribute>
                                </xsl:if>
                                <fo:block font-size="6pt" font-family="Sans-Korean">
                                    <!-- Tawain -->
                                    <fo:inline font-family="Sans-Korean">警告:
                                    </fo:inline>这是A类产品。在家庭环境中，本产品可能会造成这种情况下，用户可能需要采取适当的措施无线电干扰.</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:if>
                    <fo:table-row>
                        <fo:table-cell text-align="left" display-align="before">
                            <fo:block>
                                <fo:inline font-family="BarCode39" font-size="24pt" letter-spacing="1pt" padding-right="12pt">
                                    <xsl:text>*</xsl:text>
                                    <xsl:value-of select="//booknumber[1]"/>
                                    <xsl:text>*</xsl:text>
                                </fo:inline>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="right" display-align="before">
                            <fo:block>
                                <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                    <xsl:text>PN: </xsl:text>
                                    <xsl:value-of select="//booknumber[1]"/>
                                    <xsl:text> </xsl:text>
                                    <xsl:value-of select="//volume[1]"/>
                                    <xsl:text> (</xsl:text>
                                    <xsl:variable name="currenttime" select="current-dateTime()" as="xs:dateTime"/>
                                    <xsl:value-of select="format-dateTime($currenttime, '[M01]/[D01]/[Y0001]')"/>
                                    <xsl:text>) </xsl:text>
                                </fo:inline>
                                <!--<fo:inline xsl:use-attribute-sets="__body__first__footer__heading" padding-right="12pt">Copyright © 2010-2015 by Nimble Storage, Inc. All rights reserved.</fo:inline>-->
                            </fo:block>
                            <fo:block>
                                <fo:inline xsl:use-attribute-sets="__body__first__footer__heading" padding-right="12pt">
                                    <xsl:call-template name="insertNimbleCopyrights"/>
                                </fo:inline>
                                <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                    <xsl:text>Page </xsl:text>
                                    <fo:page-number/>
                                    <xsl:text> of </xsl:text>
                                    <fo:page-number-citation ref-id="TheVeryLastPage"/>
                                </fo:inline>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyLastHeader">
        <fo:static-content flow-name="last-body-header">
            <xsl:call-template name="insertNimbleHeaderContent"/>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyLastFooter">
        <fo:static-content flow-name="last-body-footer">
            <fo:table margin-bottom=".25in" margin-left="0.75in" margin-right="0.75in"
                      border-top="1pt solid black" padding-top="0.125in">
                <fo:table-column column-width="60%"/>
                <fo:table-column column-width="40%"/>
                <fo:table-body>
                    <fo:table-row>
                        <xsl:choose>
                            <xsl:when test="$LAYOUT = 'portrait'">
                                <fo:table-cell text-align="left" display-align="before">
                                    <fo:block>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading"
                                                padding-right="12pt"> Nimble Storage, Inc. • 211
                                            River Oaks Parkway, San Jose, CA 95134
                                            support@nimblestorage.com • +1.408.432.9600
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" display-align="before">
                                    <fo:block>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                            <xsl:text>Page </xsl:text>
                                            <fo:page-number/>
                                            <xsl:text> of </xsl:text>
                                            <fo:page-number-citation ref-id="TheVeryLastPage"/>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:table-cell text-align="left" display-align="before">
                                    <fo:block>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                            <xsl:text>PN: </xsl:text>
                                            <xsl:value-of select="//booknumber[1]"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="//volume[1]"/>
                                            <xsl:text> (</xsl:text>
                                            <xsl:variable name="currenttime" select="current-dateTime()" as="xs:dateTime"/>
                                            <xsl:value-of select="format-dateTime($currenttime, '[M01]/[D01]/[Y0001]')"/>
                                            <xsl:text>) </xsl:text>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" display-align="before">
                                    <fo:block>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading" padding-right="12pt">
                                            <xsl:call-template name="insertNimbleCopyrights"/>
                                        </fo:inline>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                            <xsl:text>Page </xsl:text>
                                            <fo:page-number/>
                                            <xsl:text> of </xsl:text>
                                            <fo:page-number-citation ref-id="TheVeryLastPage"/>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                            </xsl:otherwise>
                        </xsl:choose>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyOddFooter">
        <fo:static-content flow-name="odd-body-footer">
            <fo:table margin-bottom=".25in" margin-left="0.75in" margin-right="0.75in"
                      border-top="1pt solid black" padding-top="0.125in">
                <fo:table-column column-width="30%"/>
                <fo:table-column column-width="70%"/>
                <fo:table-body>
                    <fo:table-row>
                        <xsl:choose>
                            <xsl:when test="$LAYOUT = 'portrait'">
                                <fo:table-cell text-align="left" display-align="before">
                                    <fo:block>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                            <xsl:text>PN: </xsl:text>
                                            <xsl:value-of select="//booknumber[1]"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="//volume[1]"/>
                                            <xsl:text> (</xsl:text>
                                            <xsl:variable name="currenttime" select="current-dateTime()" as="xs:dateTime"/>
                                            <xsl:value-of select="format-dateTime($currenttime, '[M01]/[D01]/[Y0001]')"/>
                                            <xsl:text>) </xsl:text>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" display-align="before">
                                    <fo:block>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading" padding-right="12pt">
                                            <xsl:call-template name="insertNimbleCopyrights"/>
                                        </fo:inline>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                            <xsl:text>Page </xsl:text>
                                            <fo:page-number/>
                                            <xsl:text> of </xsl:text>
                                            <fo:page-number-citation ref-id="TheVeryLastPage"/>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                            </xsl:when>
                            <xsl:otherwise>
                                <fo:table-cell text-align="left" display-align="before">
                                    <fo:block>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading" padding-right="12pt"> Nimble Storage, Inc. • 211
                                            River Oaks Parkway, San Jose, CA 95134
                                            support@nimblestorage.com • +1.408.432.9600
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" display-align="before">
                                    <fo:block>
                                        <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                            <xsl:text>Page </xsl:text>
                                            <fo:page-number/>
                                            <xsl:text> of </xsl:text>
                                            <fo:page-number-citation ref-id="TheVeryLastPage"/>
                                        </fo:inline>
                                    </fo:block>
                                </fo:table-cell>
                            </xsl:otherwise>
                        </xsl:choose>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertBodyEvenFooter">
        <fo:static-content flow-name="even-body-footer">
            <fo:table margin-bottom=".25in" margin-left="0.75in" margin-right="0.75in"
                      border-top="1pt solid black" padding-top="0.125in">
                <fo:table-column column-width="60%"/>
                <fo:table-column column-width="40%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell text-align="left" display-align="before">
                            <fo:block>
                                <fo:inline xsl:use-attribute-sets="__body__first__footer__heading" padding-right="12pt"> Nimble Storage, Inc. • 211 River
                                    Oaks Parkway, San Jose, CA 95134
                                    support@nimblestorage.com • +1.408.432.9600 </fo:inline>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="right" display-align="before">
                            <fo:block>
                                <fo:inline xsl:use-attribute-sets="__body__first__footer__heading">
                                    <xsl:text>Page </xsl:text>
                                    <fo:page-number/>
                                    <xsl:text> of </xsl:text>
                                    <fo:page-number-citation ref-id="TheVeryLastPage"/>
                                </fo:inline>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertTocOddFooter">
        <fo:static-content flow-name="odd-toc-footer">
            <fo:table margin-bottom=".25in" margin-left="0.75in" margin-right="0.75in">
                <fo:table-column column-width="80%"/>
                <fo:table-column column-width="20%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell text-align="left">
                            <fo:block>
                                <xsl:call-template name="insertNimbleCopyrights"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="right" margin-right="0.75in">
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertIndexOddFooter">
        <fo:static-content flow-name="odd-index-footer">
            <fo:table margin-bottom=".25in" margin-left="0.75in" margin-right="0.75in">
                <fo:table-column column-width="80%"/>
                <fo:table-column column-width="20%"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell text-align="left">
                            <fo:block>
                                <xsl:call-template name="insertNimbleCopyrights"/>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell text-align="right" margin-right="0.75in">
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:static-content>
    </xsl:template>

    <xsl:template name="insertNimbleCopyrights">
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
    </xsl:template>
</xsl:stylesheet>