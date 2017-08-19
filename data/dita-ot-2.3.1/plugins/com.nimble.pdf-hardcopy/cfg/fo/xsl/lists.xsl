<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version="2.0">

    <xsl:template match="*[contains(@class, ' topic/ol ')]">
        <xsl:choose>
            <xsl:when test="parent::*[contains(@class, ' topic/fig ')] or @outputclass = '2cols'">
                <xsl:variable name="calloutCount">
                    <xsl:value-of select="count(child::*[contains(@class, ' topic/li ')])"/>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$calloutCount > 1">
                        <xsl:choose>
                            <xsl:when test="count(child::*[contains(@class, ' topic/li ')]) mod 2">
                                <xsl:variable name="calloutCountSplit">
                                    <xsl:value-of select="(count(child::*[contains(@class, ' topic/li ')]) - 1) div 2"/>
                                </xsl:variable>

                                <fo:table border-collapse="collapse" width="4in"
                                          keep-together.within-page="always"
                                          keep-with-previous.within-page="always" text-align="left"
                                          margin-left="0in">
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell min-width="1.75in" padding="0pt">
                                                <xsl:for-each select="child::*[position() &lt;= $calloutCountSplit + 1]">
                                                    <fo:block>
                                                        <fo:list-block xsl:use-attribute-sets="ol">
                                                            <xsl:call-template name="commonattributes"/>
                                                            <fo:list-item xsl:use-attribute-sets="ol.li">
                                                                <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
                                                                    <fo:block xsl:use-attribute-sets="ol.li__label__content">
                                                                        <fo:inline>
                                                                            <xsl:call-template name="commonattributes"/>
                                                                        </fo:inline>
                                                                        <xsl:call-template name="getVariable">
                                                                            <xsl:with-param name="id" select="'Ordered List Number'"/>
                                                                            <xsl:with-param name="params">
                                                                                <number>
                                                                                    <xsl:value-of select="count(preceding-sibling::*) + 1"/>
                                                                                </number>
                                                                            </xsl:with-param>
                                                                        </xsl:call-template>
                                                                    </fo:block>
                                                                </fo:list-item-label>
                                                                <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
                                                                    <fo:block xsl:use-attribute-sets="ol.li__content">
                                                                        <xsl:value-of select="."/>
                                                                    </fo:block>
                                                                </fo:list-item-body>
                                                            </fo:list-item>
                                                        </fo:list-block>
                                                    </fo:block>
                                                </xsl:for-each>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <xsl:for-each select="child::*[position() &lt;= $calloutCountSplit + 1]">
                                                    <fo:block>
                                                        <xsl:if test="$calloutCount >= count(preceding-sibling::*) + 2 + $calloutCountSplit">
                                                            <fo:list-block xsl:use-attribute-sets="ol">
                                                                <xsl:call-template name="commonattributes"/>
                                                                <fo:list-item xsl:use-attribute-sets="ol.li">
                                                                    <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
                                                                        <fo:block xsl:use-attribute-sets="ol.li__label__content">
                                                                            <fo:inline>
                                                                                <xsl:call-template name="commonattributes"/>
                                                                            </fo:inline>
                                                                            <xsl:call-template name="getVariable">
                                                                                <xsl:with-param name="id" select="'Ordered List Number'"/>
                                                                                <xsl:with-param name="params">
                                                                                    <number>
                                                                                        <xsl:value-of select="count(preceding-sibling::*) + 2 + $calloutCountSplit"/>
                                                                                    </number>
                                                                                </xsl:with-param>
                                                                            </xsl:call-template>
                                                                        </fo:block>
                                                                    </fo:list-item-label>
                                                                    <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
                                                                        <fo:block xsl:use-attribute-sets="ol.li__content">
                                                                            <xsl:value-of select="following-sibling::*[number($calloutCountSplit) + 1]"/>
                                                                        </fo:block>
                                                                    </fo:list-item-body>
                                                                </fo:list-item>
                                                            </fo:list-block>
                                                        </xsl:if>
                                                    </fo:block>
                                                </xsl:for-each>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:variable name="calloutCountSplit">
                                    <xsl:value-of select="count(child::*[contains(@class, ' topic/li ')]) div 2"/>
                                </xsl:variable>
                                <fo:table border-collapse="collapse" width="4in"
                                          keep-together.within-page="always"
                                          keep-with-previous.within-page="always" text-align="left"
                                          margin-left="0pt">
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell min-width="1.75in" padding="0pt">
                                                <xsl:for-each select="child::*[position() &lt;= $calloutCountSplit]">
                                                    <fo:block>
                                                        <fo:list-block xsl:use-attribute-sets="ol">
                                                            <xsl:call-template name="commonattributes"/>
                                                            <fo:list-item xsl:use-attribute-sets="ol.li">
                                                                <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
                                                                    <fo:block xsl:use-attribute-sets="ol.li__label__content">
                                                                        <fo:inline>
                                                                            <xsl:call-template name="commonattributes"/>
                                                                        </fo:inline>
                                                                        <xsl:call-template name="getVariable">
                                                                            <xsl:with-param name="id" select="'Ordered List Number'"/>
                                                                            <xsl:with-param name="params">
                                                                                <number>
                                                                                    <xsl:value-of select="count(preceding-sibling::*) + 1"/>
                                                                                </number>
                                                                            </xsl:with-param>
                                                                        </xsl:call-template>
                                                                    </fo:block>
                                                                </fo:list-item-label>
                                                                <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
                                                                    <fo:block xsl:use-attribute-sets="ol.li__content">
                                                                        <xsl:value-of select="."/>
                                                                    </fo:block>
                                                                </fo:list-item-body>
                                                            </fo:list-item>
                                                        </fo:list-block>
                                                    </fo:block>
                                                </xsl:for-each>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <xsl:for-each select="child::*[position() &lt;= $calloutCountSplit]">
                                                    <fo:block>
                                                        <fo:list-block xsl:use-attribute-sets="ol">
                                                            <xsl:call-template name="commonattributes"/>
                                                            <fo:list-item xsl:use-attribute-sets="ol.li">
                                                                <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
                                                                    <fo:block xsl:use-attribute-sets="ol.li__label__content">
                                                                        <fo:inline>
                                                                            <xsl:call-template name="commonattributes"/>
                                                                        </fo:inline>
                                                                        <xsl:call-template name="getVariable">
                                                                            <xsl:with-param name="id" select="'Ordered List Number'"/>
                                                                            <xsl:with-param name="params">
                                                                                <number>
                                                                                    <xsl:value-of select="count(preceding-sibling::*) + 1 + $calloutCountSplit"/>
                                                                                </number>
                                                                            </xsl:with-param>
                                                                        </xsl:call-template>
                                                                    </fo:block>
                                                                </fo:list-item-label>
                                                                <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
                                                                    <fo:block xsl:use-attribute-sets="ol.li__content">
                                                                        <xsl:value-of select="following-sibling::*[number($calloutCountSplit)]"/>
                                                                    </fo:block>
                                                                </fo:list-item-body>
                                                            </fo:list-item>
                                                        </fo:list-block>
                                                    </fo:block>
                                                </xsl:for-each>
                                            </fo:table-cell>
                                        </fo:table-row>

                                    </fo:table-body>
                                </fo:table>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <fo:table border-collapse="collapse" margin-left="0in">
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell min-width="3.75in" padding="0pt">
                                        <xsl:for-each select="child::*[contains(@class, ' topic/li ')]">
                                            <fo:block>
                                                <fo:list-block xsl:use-attribute-sets="ol">
                                                    <xsl:call-template name="commonattributes"/>
                                                    <fo:list-item xsl:use-attribute-sets="ol.li">
                                                        <fo:list-item-label xsl:use-attribute-sets="ol.li__label">
                                                            <fo:block xsl:use-attribute-sets="ol.li__label__content">
                                                                <fo:inline>
                                                                    <xsl:call-template name="commonattributes"/>
                                                                </fo:inline>
                                                                <xsl:call-template name="getVariable">
                                                                    <xsl:with-param name="id" select="'Ordered List Number'"/>
                                                                    <xsl:with-param name="params">
                                                                        <number>
                                                                            <xsl:value-of select="count(preceding-sibling::*) + 1"/>
                                                                        </number>
                                                                    </xsl:with-param>
                                                                </xsl:call-template>
                                                            </fo:block>
                                                        </fo:list-item-label>
                                                        <fo:list-item-body xsl:use-attribute-sets="ol.li__body">
                                                            <fo:block xsl:use-attribute-sets="ol.li__content">
                                                                <xsl:value-of select="."/>
                                                            </fo:block>
                                                        </fo:list-item-body>
                                                    </fo:list-item>
                                                </fo:list-block>
                                            </fo:block>
                                        </xsl:for-each>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <fo:list-block xsl:use-attribute-sets="ol">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:apply-templates/>
                </fo:list-block>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>