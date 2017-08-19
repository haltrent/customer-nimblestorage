<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:exsl="http://exslt.org/common"
                xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
                extension-element-prefixes="exsl"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template name="createBookmarks">
        <xsl:variable name="bookmarks" as="element()*">
            <xsl:choose>
                <xsl:when test="$retain-bookmap-order">
                    <xsl:apply-templates select="/" mode="bookmark"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:for-each select="/*/*[contains(@class, ' topic/topic ')]">
                        <xsl:variable name="topicType">
                            <xsl:call-template name="determineTopicType"/>
                        </xsl:variable>
                        <xsl:if test="$topicType = 'topicNotices'">
                            <xsl:apply-templates select="." mode="bookmark"/>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="/*/*[contains(@class, ' topic/topic ')] |
                                  /*/ot-placeholder:glossarylist |
                                  /*/ot-placeholder:tablelist |
                                  /*/ot-placeholder:figurelist">
                        <xsl:variable name="topicType">
                            <xsl:call-template name="determineTopicType"/>
                        </xsl:variable>
                        <xsl:if test="not($topicType = 'topicNotices')">
                            <xsl:apply-templates select="." mode="bookmark"/>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:apply-templates select="/*" mode="bookmark-index"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="exists($bookmarks)">
            <fo:bookmark-tree>
                <fo:bookmark>
                    <xsl:attribute name="internal-destination">
                        <xsl:call-template name="generate-toc-id"/>
                    </xsl:attribute>
                    <xsl:if test="$bookmarkStyle != 'EXPANDED'">
                        <xsl:attribute name="starting-state">show</xsl:attribute>
                    </xsl:if>
                    <fo:bookmark-title>
                        <xsl:choose>
                            <xsl:when test="/descendant::*[contains(@class, ' bookmap/mainbooktitle ')][1]">
                                <xsl:value-of select="normalize-space(/descendant::*[contains(@class, ' bookmap/mainbooktitle ')][1])"/>
                            </xsl:when>
                            <xsl:when test="/descendant::*[contains(@class, ' map/map ')][*[contains(@class, ' topic/title ')]]">
                                <xsl:value-of select="normalize-space(/descendant::*[contains(@class, ' map/map ')][*[contains(@class, ' topic/title ')]][1]/*[contains(@class, ' topic/title ')])"/>
                            </xsl:when>
                            <xsl:when test="/descendant::*[contains(@class, ' topic/title ')][1]">
                                <xsl:value-of select="/map[1]/*[1]/title[1]"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="normalize-space(/descendant::*[contains(@class, ' topic/topic ')][1]/*[contains(@class, ' topic/title ')])"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </fo:bookmark-title>

                    <xsl:copy-of select="$bookmarks"/>
                </fo:bookmark>
            </fo:bookmark-tree>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ot-placeholder:toc[$retain-bookmap-order]" mode="bookmark">
        <!--<fo:bookmark internal-destination="{$id.toc}">
            <xsl:if test="$bookmarkStyle!='EXPANDED'">
                <xsl:attribute name="starting-state">hide</xsl:attribute>
            </xsl:if>
            <fo:bookmark-title>
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Table of Contents'"/>
                </xsl:call-template>
            </fo:bookmark-title>
        </fo:bookmark>-->
    </xsl:template>

</xsl:stylesheet>