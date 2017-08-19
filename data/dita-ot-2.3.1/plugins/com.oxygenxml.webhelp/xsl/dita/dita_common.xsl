<?xml version="1.0" encoding="UTF-8"?>
<!--
    
Oxygen Webhelp Plugin
Copyright (c) 1998-2017 Syncro Soft SRL, Romania.  All rights reserved.

-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs oxygen"
    xmlns:oxygen="http://www.oxygenxml.com/functions"
    version="2.0">
    
    <xsl:template name="generateWebhelpFooter">
        <xsl:if
            test="
            ('yes' = $WEBHELP_FOOTER_INCLUDE)
            or ('yes' = $WEBHELP_TRIAL_LICENSE)">
            <div class="footer" id="webhelp_copyright_information" xmlns="http://www.w3.org/1999/xhtml">
                <xsl:choose>
                    <xsl:when
                        test="
                        (string-length($WEBHELP_FOOTER_FILE) = 0)
                        or ('yes' = $WEBHELP_TRIAL_LICENSE)">
                        <xsl:call-template name="getWebhelpString">
                            <xsl:with-param name="stringName" select="'Output generated by'"/>
                        </xsl:call-template>
                        <a class="oxyFooter" href="http://www.oxygenxml.com/xml_webhelp.html" target="_blank">
                            &lt;oXygen/> XML WebHelp
                        </a>
                        <xsl:if test="'yes' = $WEBHELP_TRIAL_LICENSE">
                            <xsl:text> - Trial Edition</xsl:text>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <!-- Include custom footer file. -->
                        <xsl:variable name="footerFileContent"
                            select="document(oxygen:makeURL($WEBHELP_FOOTER_FILE))"/>
                        <xsl:choose>
                            <xsl:when
                                test="count($footerFileContent/*:html) > 0 and count($footerFileContent/descendant-or-self::*:body) > 0">
                                <xsl:copy-of copy-namespaces="no"
                                    select="$footerFileContent/descendant::*:body/node()"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:copy-of select="$footerFileContent"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>