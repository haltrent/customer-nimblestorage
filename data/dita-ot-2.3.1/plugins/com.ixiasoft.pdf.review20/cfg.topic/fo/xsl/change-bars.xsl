<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:fo="http://www.w3.org/1999/XSL/Format" 
				version="2.0">

	<xsl:attribute-set name="change-bar-class">
		<xsl:attribute name="change-bar-class">C20040405-3</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="addition-change-bar" use-attribute-sets="change-bar-class">
		<xsl:attribute name="change-bar-style">solid</xsl:attribute>
		<xsl:attribute name="change-bar-color">green</xsl:attribute>
		<xsl:attribute name="change-bar-offset">2mm</xsl:attribute>
		<xsl:attribute name="change-bar-placement">start</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="deletion-change-bar" use-attribute-sets="change-bar-class">
		<xsl:attribute name="change-bar-style">solid</xsl:attribute>
		<xsl:attribute name="change-bar-color">red</xsl:attribute>
		<xsl:attribute name="change-bar-offset">4mm</xsl:attribute>
		<xsl:attribute name="change-bar-placement">start</xsl:attribute>
	</xsl:attribute-set>

	<xsl:template match="processing-instruction('xm-insertion_mark_start') | processing-instruction('oxy_insert_start')">
		<!-- only available in fo 1.1 (not supported by apache fop) -->
		<xsl:if test="$pdfFormatter != 'fop'">
		   <fo:change-bar-begin xsl:use-attribute-sets="addition-change-bar"/>
		</xsl:if>

		<xsl:choose>
			<xsl:when test="parent::*[contains(@class,' topic/ul ')] | parent::*[contains(@class,' topic/ol ')]">
				<!--xsl:text disable-output-escaping="yes"> &lt;fo:list-item&gt; </xsl:text>
				<xsl:text disable-output-escaping="yes"> &lt;fo:list-item-body&gt; </xsl:text>
				<xsl:text disable-output-escaping="yes"> &lt;fo:block color="blue"&gt; </xsl:text-->
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes"> &lt;fo:inline color="blue"&gt; </xsl:text>
			</xsl:otherwise>
		</xsl:choose>

	</xsl:template>

	<xsl:template match="processing-instruction('xm-insertion_mark_end') | processing-instruction('oxy_insert_end')">

		<xsl:choose>
			<xsl:when test="parent::*[contains(@class,' topic/ul ')] | parent::*[contains(@class,' topic/ol ')]">
				<!--xsl:text disable-output-escaping="yes"> &lt;/fo:block&gt; </xsl:text>
				<xsl:text disable-output-escaping="yes"> &lt;/fo:list-item-body&gt; </xsl:text>
				<xsl:text disable-output-escaping="yes"> &lt;/fo:list-item&gt; </xsl:text-->
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes"> &lt;/fo:inline&gt; </xsl:text>
			</xsl:otherwise>
		</xsl:choose>

		<!-- only available in fo 1.1 (not supported by apache fop) -->
		<xsl:if test="$pdfFormatter != 'fop'">
		   <fo:change-bar-end xsl:use-attribute-sets="change-bar-class"/>
		</xsl:if>
	</xsl:template>

	<xsl:template match="processing-instruction('xm-deletion_mark') | processing-instruction('oxy_delete')">
		<xsl:if test="$pdfFormatter != 'fop'">
		   <fo:change-bar-begin xsl:use-attribute-sets="deletion-change-bar"/>
		</xsl:if>

		<xsl:variable name="data">
			<xsl:value-of select="substring-before( substring-after(., 'data=&quot;'), '&quot;' )"/>
		</xsl:variable>
		<xsl:variable name="tagname">
			<xsl:choose>
				<xsl:when test="substring($data, 1, 4) = '&amp;lt;'">
					<xsl:value-of select="substring-before(substring($data, 5, string-length($data) - 5), '&amp;gt;')"/>
				</xsl:when>
				<xsl:otherwise/>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="cleaned-data">
			<xsl:choose>
				<xsl:when test="$tagname != ''">
					<xsl:value-of select="substring($data, string-length($tagname) + 9, string-length($data) - 2*string-length($tagname) - 17)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$data"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="newnode">
			<xsl:if test="$tagname != ''">
				<xsl:element name="{$tagname}">
					<xsl:value-of select="$cleaned-data"/>
				</xsl:element>
			</xsl:if>
		</xsl:variable>

<!--	<xsl:message> PARENT: <xsl:value-of select="parent::*/@class"/></xsl:message>
		<xsl:message>   DATA: <xsl:value-of select="$data"/></xsl:message>
		<xsl:message>TAGNAME: <xsl:value-of select="$tagname"/></xsl:message>
		<xsl:message>CLEANED: <xsl:value-of select="$cleaned-data"/></xsl:message>
-->
		<xsl:choose>
			<xsl:when test="parent::*[contains(@class,' topic/ul ')] | parent::*[contains(@class,' topic/ol ')]">
				<fo:list-item >
					<fo:list-item-label space-before="6pt">
						<fo:block/>
					</fo:list-item-label>
					<fo:list-item-body>
						<fo:block xsl:use-attribute-sets="p">
							<fo:inline color="red" text-decoration="line-through">
								<xsl:value-of disable-output-escaping="yes" select="$cleaned-data"/>
							</fo:inline>
						</fo:block>
					</fo:list-item-body>
				</fo:list-item>
			</xsl:when>
			<xsl:otherwise>
				<fo:inline color="red" text-decoration="line-through">
					<!--xsl:apply-templates select="$newnode"/-->
					<xsl:value-of disable-output-escaping="yes" select="$cleaned-data"/>
				</fo:inline>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:if test="$pdfFormatter != 'fop'">
		   <fo:change-bar-end xsl:use-attribute-sets="change-bar-class"/>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>
