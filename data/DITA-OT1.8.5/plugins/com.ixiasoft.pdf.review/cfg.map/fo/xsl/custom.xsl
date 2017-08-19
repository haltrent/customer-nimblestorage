<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	xmlns:fo="http://www.w3.org/1999/XSL/Format" 
	xmlns:exsl="http://exslt.org/common"
	xmlns:opentopic="http://www.idiominc.com/opentopic"
	xmlns:opentopic-index="http://www.idiominc.com/opentopic/index"
	extension-element-prefixes="exsl"
	exclude-result-prefixes="opentopic-index opentopic"
	version="1.1">
	
	<!-- Import the same change bars XSLT used for topics -->
	<xsl:import href="../../../cfg.topic/fo/xsl/change-bars.xsl"/>
	<!-- REDLINE: ADDED CUSTOM XSL FILES -->
	<xsl:import href="commons.xsl"/>
	<xsl:import href="toc.xsl"/>
	<!-- REDLINE: FINISHED-->
</xsl:stylesheet>
