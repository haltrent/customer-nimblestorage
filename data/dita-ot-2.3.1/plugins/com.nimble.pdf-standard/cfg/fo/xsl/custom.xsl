<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

    <xsl:import href="bookmarks.xsl"/>
    <xsl:import href="commons.xsl"/>
    <xsl:import href="front-matter.xsl"/>
    <xsl:import href="hi-domain.xsl"/>
    <xsl:import href="index_xep.xsl"/>
    <xsl:import href="layout-masters.xsl"/>
    <xsl:import href="lists.xsl"/>
    <xsl:import href="root-processing_xep.xsl"/>
    <xsl:import href="static-content.xsl"/>
    <xsl:import href="tables.xsl"/>
    <xsl:import href="task-elements.xsl"/>
    <xsl:import href="toc.xsl"/>
    <xsl:import href="ui-domain.xsl"/>


    <xsl:param name="DRAFT"/>
    <xsl:param name="NOCHAP" select="'yes'"/>
    <xsl:param name="BRAND" select="'Nimble'"/>
    <xsl:param name="FEEDBACK" select="'techpubs'"/>
    <xsl:param name="FRONTCOVER" select="'post-casablanca'"/>

</xsl:stylesheet>