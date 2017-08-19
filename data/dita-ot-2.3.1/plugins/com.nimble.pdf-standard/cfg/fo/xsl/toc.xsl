<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:opentopic="http://www.idiominc.com/opentopic"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template match="*[contains(@class, ' topic/topic ')]" mode="toc">
        <xsl:param name="include"/>
        <xsl:variable name="topicLevel" as="xs:integer">
            <xsl:apply-templates select="." mode="get-topic-level"/>
        </xsl:variable>
        <xsl:if test="$topicLevel &lt; $tocMaximumLevel">
            <xsl:variable name="mapTopicref" select="key('map-id', @id)[1]"/>
            <xsl:choose>
                <!-- In a future version, suppressing Notices in the TOC should not be hard-coded. -->
              <xsl:when test="$retain-bookmap-order and $mapTopicref/self::*[contains(@class, ' bookmap/notices ')]"/>
                <xsl:when test="$mapTopicref[@toc = 'yes' or not(@toc)] or
                              (not($mapTopicref) and $include = 'true')">
                    <fo:block xsl:use-attribute-sets="__toc__indent">
                        <xsl:variable name="tocItemContent">
                            <fo:basic-link xsl:use-attribute-sets="__toc__link">
                                <xsl:attribute name="internal-destination">
                                    <xsl:call-template name="generate-toc-id"/>
                                </xsl:attribute>
                                <!--<xsl:apply-templates select="$mapTopicref" mode="tocPrefix"/>-->
                                <fo:inline xsl:use-attribute-sets="__toc__title">
                                    <xsl:call-template name="getNavTitle"/>
                                </fo:inline>
                                <fo:inline xsl:use-attribute-sets="__toc__page-number">
                                    <fo:leader xsl:use-attribute-sets="__toc__leader"/>
                                    <fo:page-number-citation>
                                        <xsl:attribute name="ref-id">
                                            <xsl:call-template name="generate-toc-id"/>
                                        </xsl:attribute>
                                    </fo:page-number-citation>
                                </fo:inline>
                            </fo:basic-link>
                        </xsl:variable>
                        <xsl:choose>
                            <xsl:when test="not($mapTopicref)">
                                <xsl:apply-templates select="." mode="tocText">
                                    <xsl:with-param name="tocItemContent" select="$tocItemContent"/>
                                    <xsl:with-param name="currentNode" select="."/>
                                </xsl:apply-templates>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="$mapTopicref" mode="tocText">
                                    <xsl:with-param name="tocItemContent" select="$tocItemContent"/>
                                    <xsl:with-param name="currentNode" select="."/>
                                </xsl:apply-templates>
                            </xsl:otherwise>
                        </xsl:choose>
                    </fo:block>
                    <xsl:apply-templates mode="toc">
                        <xsl:with-param name="include" select="'true'"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates mode="toc">
                        <xsl:with-param name="include" select="'true'"/>
                    </xsl:apply-templates>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' bookmap/chapter ')] |
                         opentopic:map/*[contains(@class, ' map/topicref ')]" mode="tocText" priority="-1">
        <xsl:param name="tocItemContent"/>
        <xsl:param name="currentNode"/>
        <xsl:for-each select="$currentNode">
            <xsl:choose>
                <xsl:when test="upper-case($NOCHAP)='YES'">
                    <fo:block xsl:use-attribute-sets="__toc__chapter__content">
                        <xsl:copy-of select="$tocItemContent"/>
                    </fo:block>
                </xsl:when>
                <xsl:otherwise/>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>