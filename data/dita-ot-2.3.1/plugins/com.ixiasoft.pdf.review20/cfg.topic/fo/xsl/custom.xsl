<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:fo="http://www.w3.org/1999/XSL/Format" 
				version="2.0">

	<!-- Ixiasoft specific templates -->
	<xsl:import href="change-bars.xsl"/>
	
	<!-- Override default templates -->
	<xsl:include href="bookmarks.xsl"/>
	<xsl:include href="front-matter.xsl"/>
	<xsl:include href="toc.xsl"/>
	<xsl:include href="index.xsl"/>
	
</xsl:stylesheet>
