<?xml version='1.0'?>


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:opentopic="http://www.idiominc.com/opentopic"
    xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
    xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
    xmlns:ot-placeholder="http://suite-sol.com/namespaces/ot-placeholder"
    exclude-result-prefixes="xs opentopic opentopic-func ot-placeholder opentopic-index"
    version="2.0">
  
    <xsl:variable name="map" select="//opentopic:map"/>

    <xsl:template match="*[contains(@class, ' topic/topic ')]" mode="toc">
        <xsl:param name="include"/>
        <xsl:variable name="topicLevel" as="xs:integer">
          <xsl:apply-templates select="." mode="get-topic-level"/>
        </xsl:variable>		
        <xsl:if test="$topicLevel &lt; $tocMaximumLevel">
		<!-- 
			REDLINE: added this section to get topic's navtitle plus deltaxml rev attribute value
			this will help determine that topic being processed falls in which one of the three
			categories: 1) has topic been modified in authoring version of the map(deltaxml-changed)
						2) has topic been deleted in authoring version of the map(deltaxml-delete)
						3) has topic been added to authoring version of the map(deltaxml-add)
			-->
			<xsl:variable name="topicTitleWithStatus">
			    <xsl:call-template name="getNavTitleWithRev"/>
            </xsl:variable>
            <xsl:variable name="mapTopicref" select="key('map-id', @id)[1]"/>
			
			<xsl:variable name="tocColor">
				<xsl:choose >
					<xsl:when test=" matches($topicTitleWithStatus, 'deltaxml-changed') ">
						<xsl:value-of select="'#0000FF'"/> <!-- blue -->
					</xsl:when>
					<xsl:when test="matches($topicTitleWithStatus, 'deltaxml-delete')">
						<xsl:value-of select="'#DF0101'"/> <!-- mustard -->
					</xsl:when>
					<xsl:when test="matches($topicTitleWithStatus, 'deltaxml-add')"> 
						<xsl:value-of select="'#21610B'"/> <!-- green -->
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="'#000000'"/> <!-- black -->
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:variable name="topicTitle">
				<xsl:value-of select="substring-before($topicTitleWithStatus, 'deltaxml')"/>
			</xsl:variable>
			<!-- REDLINE: FINISHED -->
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
							<!-- REDLINE: for adding color to toc-->
							<xsl:attribute name="color">
								<xsl:value-of select="$tocColor"/>
							</xsl:attribute>
							
							<xsl:apply-templates select="$mapTopicref" mode="tocPrefix"/>
							
                            <!-- 
							<fo:inline xsl:use-attribute-sets="__toc__title">
                                <xsl:call-template name="getNavTitle" />
                            </fo:inline>
							-->
							<!-- REDLINE: modified how topic title is generated. -->
							 <xsl:value-of select="concat($topicTitle,' ')"/>
							<!-- REDLINE: FINISHED -->
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

</xsl:stylesheet>
