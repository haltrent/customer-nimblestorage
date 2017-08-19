<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:rx="http://www.renderx.com/XSL/Extensions"
                xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
                xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template match="opentopic-index:index.entry" mode="index-postprocess">
        <xsl:variable name="value" select="@value"/>
        <xsl:choose>
            <xsl:when test="opentopic-index:index.entry">
                <fo:table rx:table-omit-initial-header="true" width="100%" margin-left="12pt">
                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="index-indents">
                                    <xsl:if test="count(ancestor::opentopic-index:index.entry) > 0">
                                        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
                                    </xsl:if>
                                    <xsl:variable name="following-idx" select="following-sibling::opentopic-index:index.entry[@value = $value and opentopic-index:refID]"/>
                                    <xsl:if test="count(preceding-sibling::opentopic-index:index.entry[@value = $value]) = 0">
                                        <xsl:apply-templates select="opentopic-index:formatted-value/node()"/>
                                        <fo:inline font-style="italic">
                                            <xsl:text> (</xsl:text>
                                            <xsl:value-of select="$continuedValue"/>
                                            <xsl:text>)</xsl:text>
                                        </fo:inline>
                                        <xsl:if test="$following-idx">
                                            <xsl:text> </xsl:text>
                                            <fo:index-page-citation-list>
                                                <fo:index-key-reference ref-index-key="{$following-idx[1]/opentopic-index:refID/@value}"
                                                                        xsl:use-attribute-sets="__index__page__link"/>
                                            </fo:index-page-citation-list>
                                        </xsl:if>
                                    </xsl:if>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="index-indents" keep-with-next="always" text-indent="-12pt">
                                    <xsl:if test="count(ancestor::opentopic-index:index.entry) > 0">
                                        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
                                    </xsl:if>
                                    <xsl:variable name="following-idx" select="following-sibling::opentopic-index:index.entry[@value = $value and opentopic-index:refID]"/>
                                    <xsl:if test="count(preceding-sibling::opentopic-index:index.entry[@value = $value]) = 0">
                                        <xsl:variable name="page-setting" select=" (ancestor-or-self::opentopic-index:index.entry/@no-page | ancestor-or-self::opentopic-index:index.entry/@start-page)[last()]"/>
                                        <xsl:variable name="isNoPage" select=" $page-setting = 'true' and name($page-setting) = 'no-page' "/>
                                        <xsl:variable name="refID" select="opentopic-index:refID/@value"/>
                                        <xsl:choose>
                                            <xsl:when test="opentopic-func:getIndexEntry($value,$refID)">
                                                <xsl:apply-templates select="." mode="make-index-ref">
                                                    <xsl:with-param name="idxs" select="opentopic-index:refID"/>
                                                    <xsl:with-param name="inner-text" select="opentopic-index:formatted-value"/>
                                                    <xsl:with-param name="no-page" select="$isNoPage"/>
                                                </xsl:apply-templates>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:variable name="isNormalChilds">
                                                    <xsl:for-each select="descendant::opentopic-index:index.entry">
                                                        <xsl:variable name="currValue" select="@value"/>
                                                        <xsl:variable name="currRefID" select="opentopic-index:refID/@value"/>
                                                        <xsl:if test="opentopic-func:getIndexEntry($currValue,$currRefID)">
                                                            <xsl:text>true </xsl:text>
                                                        </xsl:if>
                                                    </xsl:for-each>
                                                </xsl:variable>
                                                <xsl:if test="contains($isNormalChilds,'true ')">
                                                    <xsl:apply-templates select="." mode="make-index-ref">
                                                        <xsl:with-param name="inner-text" select="opentopic-index:formatted-value"/>
                                                        <xsl:with-param name="no-page" select="$isNoPage"/>
                                                    </xsl:apply-templates>
                                                </xsl:if>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:if>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block xsl:use-attribute-sets="index.entry__content">
                                    <xsl:apply-templates mode="index-postprocess"/>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </xsl:when>
            <xsl:otherwise>
                <fo:block xsl:use-attribute-sets="index-indents">
                    <xsl:if test="count(ancestor::opentopic-index:index.entry) > 0">
                        <xsl:attribute name="keep-together.within-page">always</xsl:attribute>
                    </xsl:if>
                    <xsl:variable name="following-idx" select="following-sibling::opentopic-index:index.entry[@value = $value and opentopic-index:refID]"/>
                    <xsl:if test="count(preceding-sibling::opentopic-index:index.entry[@value = $value]) = 0">
                        <xsl:variable name="page-setting" select=" (ancestor-or-self::opentopic-index:index.entry/@no-page | ancestor-or-self::opentopic-index:index.entry/@start-page)[last()]"/>
                        <xsl:variable name="isNoPage" select=" $page-setting = 'true' and name($page-setting) = 'no-page' "/>
                        <xsl:apply-templates select="." mode="make-index-ref">
                            <xsl:with-param name="idxs" select="opentopic-index:refID"/>
                            <xsl:with-param name="inner-text" select="opentopic-index:formatted-value"/>
                            <xsl:with-param name="no-page" select="$isNoPage"/>
                        </xsl:apply-templates>
                    </xsl:if>
                </fo:block>
                <!--fo:block xsl:use-attribute-sets="index.entry__content">
                  <xsl:apply-templates mode="index-postprocess"/>
                </fo:block-->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="createIndex">
<!--
        <xsl:if test="(//opentopic-index:index.groups//opentopic-index:index.entry) and (count($index-entries//opentopic-index:index.entry) &gt; 0)">
            <xsl:variable name="index">
                <xsl:choose>
                    <xsl:when test="$map//*[contains(@class,' bookmap/indexlist ')][@href]"/>
                    <xsl:when test="$map//*[contains(@class,' bookmap/indexlist ')]">
                        <xsl:apply-templates select="/" mode="index-postprocess"/>
                    </xsl:when>
                    <xsl:when test="/*[contains(@class,' map/map ')][not(contains(@class,' bookmap/bookmap '))]">
                        <xsl:apply-templates select="/" mode="index-postprocess"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:if test="count($index/*) > 0">
                <fo:page-sequence master-reference="index-sequence" xsl:use-attribute-sets="page-sequence.index">

                    <xsl:call-template name="insertIndexStaticContents"/>

                    <fo:flow flow-name="xsl-region-body">
                        <fo:marker marker-class-name="current-header">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Index'"/>
                            </xsl:call-template>
                        </fo:marker>
                        <xsl:copy-of select="$index"/>
                    </fo:flow>

                </fo:page-sequence>
            </xsl:if>
        </xsl:if>
-->
    </xsl:template>

</xsl:stylesheet>