<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:fo="http://www.w3.org/1999/XSL/Format" 
				xmlns:exsl="http://exslt.org/common"
                xmlns:opentopic="http://www.idiominc.com/opentopic"
                xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
                extension-element-prefixes="exsl"
                exclude-result-prefixes="opentopic-index opentopic"
				version="1.1">

	<!-- Ixiasoft specific templates -->
	<xsl:import href="change-bars.xsl"/>
	
	<!-- Override default templates -->
	<xsl:include href="bookmarks.xsl"/>
	<xsl:include href="front-matter.xsl"/>
	<xsl:include href="toc.xsl"/>
	<xsl:include href="index.xsl"/>
	
</xsl:stylesheet>
