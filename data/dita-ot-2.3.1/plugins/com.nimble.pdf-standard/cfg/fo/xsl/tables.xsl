<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template match="*[contains(@class, ' topic/dl ')]">
        <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-startprop ')]" mode="outofline"/>
        <fo:block xsl:use-attribute-sets="dl">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates select="*[contains(@class, ' topic/dlhead ')]"/>
            <fo:block xsl:use-attribute-sets="dl__body">
                <xsl:choose>
                    <xsl:when test="contains(@otherprops,'sortable')">
                        <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]">
                            <xsl:sort
                                    select="opentopic-func:getSortString(normalize-space( opentopic-func:fetchValueableText(*[contains(@class, ' topic/dt ')]) ))"
                                    lang="{$locale}"/>
                        </xsl:apply-templates>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="*[contains(@class, ' topic/dlentry ')]"/>
                    </xsl:otherwise>
                </xsl:choose>
            </fo:block>
        </fo:block>
        <xsl:apply-templates select="*[contains(@class,' ditaot-d/ditaval-endprop ')]" mode="outofline"/>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/dl ')]/*[contains(@class, ' topic/dlhead ')]">
        <fo:block xsl:use-attribute-sets="dl.dlhead">
            <xsl:call-template name="commonattributes"/>
            <fo:block xsl:use-attribute-sets="dl.dlhead__row">
                <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/dlhead ')]/*[contains(@class, ' topic/dthd ')]">
        <fo:block xsl:use-attribute-sets="dlhead.dthd__cell">
            <xsl:call-template name="commonattributes"/>
            <fo:block xsl:use-attribute-sets="dlhead.dthd__content">
                <xsl:apply-templates select="../*[contains(@class,' ditaot-d/ditaval-startprop ')]" mode="outofline"/>
                <xsl:apply-templates/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/dlhead ')]/*[contains(@class, ' topic/ddhd ')]">
        <fo:block xsl:use-attribute-sets="dlhead.ddhd__cell">
            <xsl:call-template name="commonattributes"/>
            <fo:block xsl:use-attribute-sets="dlhead.ddhd__content">
                <xsl:apply-templates/>
                <xsl:apply-templates select="../*[contains(@class,' ditaot-d/ditaval-endprop ')]" mode="outofline"/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/dlentry ')]">
        <fo:block xsl:use-attribute-sets="dlentry">
            <xsl:call-template name="commonattributes"/>
            <fo:block xsl:use-attribute-sets="dlentry.dt">
                <xsl:apply-templates select="*[contains(@class, ' topic/dt ')]"/>
            </fo:block>
            <fo:block xsl:use-attribute-sets="dlentry.dd">
                <xsl:apply-templates select="*[contains(@class, ' topic/dd ')]"/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*" mode="processTableEntry">
        <xsl:call-template name="commonattributes"/>
        <xsl:call-template name="applySpansAttrs"/>
        <xsl:call-template name="applyAlignAttrs"/>
        <xsl:call-template name="generateTableEntryBorder"/>
        <fo:block xsl:use-attribute-sets="tbody.row.entry__content">
            <xsl:apply-templates select="." mode="ancestor-start-flag"/>
            <xsl:choose>
                <xsl:when test="@outputclass='time_variable'">
                    <xsl:value-of select="format-date(current-date(), '[F] [MNn] [D], [Y0001]')"/>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="format-time(current-time(), '[H01]:[m01]:[s01]')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="processEntryContent"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:apply-templates select="." mode="ancestor-end-flag"/>
        </fo:block>
    </xsl:template>

    <xsl:template name="displayAtts">
        <xsl:param name="element" as="element()"/>
        <xsl:variable name="frame" as="xs:string">
            <xsl:choose>
                <xsl:when test="$element/@frame">
                    <xsl:value-of select="$element/@frame"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$table.frame-default"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:if test="$element/@expanse">
          <xsl:for-each select="$element">
            <xsl:call-template name="setExpanse"/>
          </xsl:for-each>
        </xsl:if>

        <xsl:choose>
            <xsl:when test="$frame = 'all'">
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="'table__tableframe__all'"/>
                    <xsl:with-param name="path" select="$tableAttrs"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$frame = 'topbot'">
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="'table__tableframe__topbot'"/>
                    <xsl:with-param name="path" select="$tableAttrs"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$frame = 'top'">
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="'table__tableframe__top'"/>
                    <xsl:with-param name="path" select="$tableAttrs"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$frame = 'bottom'">
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="'table__tableframe__bottom'"/>
                    <xsl:with-param name="path" select="$tableAttrs"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$frame = 'sides'">
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="'table__tableframe__sides'"/>
                    <xsl:with-param name="path" select="$tableAttrs"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$frame = 'none'">
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="'__tableframe__none'"/>
                    <xsl:with-param name="path" select="$tableAttrs"/>
                </xsl:call-template>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>