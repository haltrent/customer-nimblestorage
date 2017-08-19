<?xml version='1.0'?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:dita2xslfo="http://dita-ot.sourceforge.net/ns/200910/dita2xslfo"
    xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
    xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
    exclude-result-prefixes="dita-ot ot-placeholder opentopic opentopic-index opentopic-func dita2xslfo xs"
    version="2.0">

    <!-- Gets navigation title of current topic, used for bookmarks/TOC -->
    <xsl:template name="getNavTitle">
        <xsl:variable name="topicref" select="key('map-id', @id)[1]"/>
        <xsl:choose>
            <xsl:when test="$topicref/@locktitle='yes' and
                            $topicref/*[contains(@class, ' map/topicmeta ')]/*[contains(@class, ' topic/navtitle ')]">
               <xsl:apply-templates select="$topicref/*[contains(@class, ' map/topicmeta ')]/*[contains(@class, ' topic/navtitle ')]/node()"/>
            </xsl:when>
            <xsl:when test="$topicref/@locktitle='yes' and
                            $topicref/@navtitle">
                <xsl:value-of select="$topicref/@navtitle"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="*[contains(@class,' topic/title ')]" mode="getTitle"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
	
	<!-- REDLINE: NEW TEMPLATE -->
    <xsl:template name="getNavTitleWithRev">
        <xsl:call-template name="getNavTitle"/>
        <xsl:variable name="topicref" select="key('map-id', @id)"/>
        <!-- REDLINE: created a new variable "redlineStatus" to hold rev attribute created by deltaxml -->
        <xsl:variable name="redlineStatus" select="$topicref/@rev"/>
        <!-- REDLINE: adding the value of deltaxml attribute in this particular case -->
        <xsl:value-of select="$redlineStatus"/>	
    </xsl:template>
    <!-- REDLINE: FINISHED -->

    <xsl:template match="*" mode="getTitle">
        <xsl:choose>
<!--             add keycol here once implemented-->
            <xsl:when test="@spectitle">
                <xsl:value-of select="@spectitle"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*[contains(@class,' topic/navtitle ')]">
        <fo:block xsl:use-attribute-sets="navtitle">
            <xsl:call-template name="commonattributes"/>
            <fo:inline xsl:use-attribute-sets="navtitle__label">
                <xsl:call-template name="getVariable">
                    <xsl:with-param name="id" select="'Navigation title'"/>
                </xsl:call-template>
                <xsl:text>: </xsl:text>
            </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
   
</xsl:stylesheet>
