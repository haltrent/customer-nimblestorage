<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:opentopic-func="http://www.idiominc.com/opentopic/exsl/function"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template name="processTopicChapter">
        <fo:page-sequence master-reference="body-sequence" xsl:use-attribute-sets="page-sequence.body">
            <xsl:call-template name="startPageNumbering"/>
            <xsl:call-template name="insertBodyStaticContents"/>
            <fo:flow flow-name="xsl-region-body">
                <fo:block xsl:use-attribute-sets="topic">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:variable name="level" as="xs:integer">
                        <xsl:apply-templates select="." mode="get-topic-level"/>
                    </xsl:variable>
                    <fo:marker marker-class-name="current-topic-number">
                        <xsl:variable name="topicref" select="key('map-id', ancestor-or-self::*[contains(@class, ' topic/topic ')][1]/@id)"/>
                        <xsl:for-each select="$topicref">
                            <xsl:apply-templates select="." mode="topicTitleNumber"/>
                        </xsl:for-each>
                    </fo:marker>
                    <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>

                    <xsl:apply-templates select="*[contains(@class,' topic/prolog ')]"/>

                    <xsl:call-template name="insertChapterFirstpageStaticContent">
                        <xsl:with-param name="type" select="'chapter'"/>
                    </xsl:call-template>

                    <xsl:choose>
                        <xsl:when test="$chapterLayout = 'BASIC'">
                            <xsl:apply-templates select="*[not(contains(@class, ' topic/topic ') or contains(@class, ' topic/title ') or
                                                             contains(@class, ' topic/prolog '))]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:apply-templates select="." mode="createMiniToc"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:apply-templates select="*[contains(@class, ' topic/topic ')]"/>
                    <xsl:call-template name="pullPrologIndexTerms.end-range"/>
                </fo:block>
                <fo:block id="TheVeryLastPage"></fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

    <xsl:template name="insertChapterFirstpageStaticContent">
        <xsl:param name="type"/>
        <fo:block>
            <xsl:attribute name="id">
                <xsl:call-template name="generate-toc-id"/>
            </xsl:attribute>
            <xsl:choose>
                <xsl:when test="$type = 'chapter'">
                    <!--<fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Chapter with number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                        <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                    </fo:block>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </fo:block>-->
                </xsl:when>
                <!--<xsl:when test="$type = 'appendix'">
                        <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Appendix with number'"/>
                                <xsl:with-param name="params">
                                    <number>
                                        <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                            <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                        </fo:block>
                                    </number>
                                </xsl:with-param>
                            </xsl:call-template>
                        </fo:block>
                </xsl:when>-->
                <xsl:when test="$type = 'appendices'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Appendix with number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                        <xsl:text>&#xA0;</xsl:text>
                                    </fo:block>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'part'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Part with number'"/>
                            <xsl:with-param name="params">
                                <number>
                                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__number__container">
                                        <xsl:apply-templates select="key('map-id', @id)[1]" mode="topicTitleNumber"/>
                                    </fo:block>
                                </number>
                            </xsl:with-param>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'preface'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Preface title'"/>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
                <xsl:when test="$type = 'notices'">
                    <fo:block xsl:use-attribute-sets="__chapter__frontmatter__name__container">
                        <xsl:call-template name="getVariable">
                            <xsl:with-param name="id" select="'Notices title'"/>
                        </xsl:call-template>
                    </fo:block>
                </xsl:when>
            </xsl:choose>
        </fo:block>
    </xsl:template>

    <xsl:template match="*" mode="processTopicTitle">
        <xsl:variable name="level" as="xs:integer">
            <xsl:apply-templates select="." mode="get-topic-level"/>
        </xsl:variable>
        <xsl:variable name="attrSet1">
            <xsl:apply-templates select="." mode="createTopicAttrsName">
                <xsl:with-param name="theCounter" select="$level"/>
            </xsl:apply-templates>
        </xsl:variable>
        <xsl:variable name="attrSet2" select="concat($attrSet1, '__content')"/>
        <fo:block>
            <xsl:call-template name="commonattributes"/>
            <xsl:call-template name="processAttrSetReflection">
                <xsl:with-param name="attrSet" select="$attrSet1"/>
                <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
            </xsl:call-template>
            <fo:block>
                <xsl:call-template name="processAttrSetReflection">
                    <xsl:with-param name="attrSet" select="$attrSet2"/>
                    <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
                </xsl:call-template>
                <!--<xsl:if test="$level = 1">
                    <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>
                </xsl:if>
                <xsl:if test="$level = 2">
                    <xsl:apply-templates select="." mode="insertTopicHeaderMarker">
                      <xsl:with-param name="marker-class-name" as="xs:string">current-h2</xsl:with-param>
                    </xsl:apply-templates>
                </xsl:if>-->
                <xsl:apply-templates select="." mode="insertTopicHeaderMarker"/>
                <fo:wrapper id="{parent::node()/@id}"/>
                <fo:wrapper>
                    <xsl:attribute name="id">
                        <xsl:call-template name="generate-toc-id">
                            <xsl:with-param name="element" select=".."/>
                        </xsl:call-template>
                    </xsl:attribute>
                </fo:wrapper>
                <xsl:call-template name="pullPrologIndexTerms"/>
                <xsl:apply-templates select="." mode="getTitle"/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/desc ')]">
        <fo:block xsl:use-attribute-sets="desc">
            <xsl:call-template name="commonattributes"/>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/p ')]">
        <xsl:choose>
            <xsl:when test="@rev='GA'"/>
            <xsl:otherwise>
                <fo:block xsl:use-attribute-sets="p">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:apply-templates/>
                </fo:block>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template match="*" mode="placeNoteContent">
        <fo:block xsl:use-attribute-sets="note">
            <xsl:call-template name="commonattributes"/>
            <fo:inline xsl:use-attribute-sets="note__label" keep-with-next.within-line="always">
                <xsl:choose>
                    <xsl:when test="@type = 'note' or not(@type)">
                        <fo:inline xsl:use-attribute-sets="note__label__note">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Note'"/>
                            </xsl:call-template>
                            <xsl:text>: </xsl:text>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'notice'">
                        <fo:inline xsl:use-attribute-sets="note__label__notice">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Notice'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'tip'">
                        <fo:inline xsl:use-attribute-sets="note__label__tip">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Tip'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'fastpath'">
                        <fo:inline xsl:use-attribute-sets="note__label__fastpath">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Fastpath'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'restriction'">
                        <fo:inline xsl:use-attribute-sets="note__label__restriction">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Restriction'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'important'">
                        <fo:inline xsl:use-attribute-sets="note__label__important">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Important'"/>
                            </xsl:call-template>
                            <xsl:text>! </xsl:text>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'remember'">
                        <fo:inline xsl:use-attribute-sets="note__label__remember">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Remember'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'attention'">
                        <fo:inline xsl:use-attribute-sets="note__label__attention">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Attention'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'caution'">
                        <fo:inline xsl:use-attribute-sets="note__label__caution">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Caution'"/>
                            </xsl:call-template>
                            <xsl:text>! </xsl:text>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'danger'">
                        <fo:inline xsl:use-attribute-sets="note__label__danger">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Danger'"/>
                            </xsl:call-template>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'warning'">
                        <fo:inline xsl:use-attribute-sets="note__label__danger">
                            <xsl:call-template name="getVariable">
                                <xsl:with-param name="id" select="'Warning'"/>
                            </xsl:call-template>
                            <xsl:text>! </xsl:text>
                        </fo:inline>
                    </xsl:when>
                    <xsl:when test="@type = 'other'">
                        <fo:inline xsl:use-attribute-sets="note__label__other">
                            <xsl:choose>
                                <xsl:when test="@othertype">
                                    <xsl:value-of select="@othertype"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>[</xsl:text>
                                    <xsl:value-of select="@type"/>
                                    <xsl:text>]</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </fo:inline>
                    </xsl:when>
                </xsl:choose>
                <!--<xsl:call-template name="getVariable">
                  <xsl:with-param name="id" select="'#note-separator'"/>
                </xsl:call-template>-->
            </fo:inline>
            <xsl:text>  </xsl:text>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/note ')]">
        <xsl:variable name="noteImagePath">
            <xsl:apply-templates select="." mode="setNoteImagePath"/>
        </xsl:variable>
        <xsl:choose>
            <xsl:when test="@type = 'warning' or @type = 'caution'">
                <fo:table xsl:use-attribute-sets="note__table">
                    <fo:table-column xsl:use-attribute-sets="note__image__column"/>
                    <fo:table-column xsl:use-attribute-sets="note__text__column"/>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell xsl:use-attribute-sets="note__image__entry">
                                <fo:block>
                                    <fo:external-graphic
                                            src="url({concat($artworkPrefix, $noteImagePath)})"
                                            xsl:use-attribute-sets="image__block"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell xsl:use-attribute-sets="note__text__entry">
                                <xsl:apply-templates select="." mode="placeNoteContent"/>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="." mode="placeNoteContent"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/fig ')]">
        <fo:block xsl:use-attribute-sets="fig">
            <xsl:call-template name="commonattributes"/>
            <xsl:if test="not(@id)">
                <xsl:attribute name="id">
                    <xsl:call-template name="get-id"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="*[contains(@class, ' topic/title ')]"/>
            <xsl:apply-templates select="*[not(contains(@class, ' topic/title '))]"/>

        </fo:block>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/ph ')]">
        <xsl:choose>
            <xsl:when test="parent::*[contains(@class, ' bookmap/booktitlealt ')]">
                <fo:inline xsl:use-attribute-sets="ph">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:apply-templates/>
                </fo:inline>
                <xsl:if test="not(position()=last())">
                    <xsl:text>&#xA;</xsl:text>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <fo:inline xsl:use-attribute-sets="ph">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:apply-templates/>
                </fo:inline>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/image ')]">
        <!-- build any pre break indicated by style -->
        <xsl:choose>
            <xsl:when test="parent::fig">
                <!-- NOP if there is already a break implied by a parent property -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="not(@placement = 'inline')">
                    <!-- generate an FO break here -->
                    <fo:block>&#160;</fo:block>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>

        <xsl:choose>
            <xsl:when test="empty(@href)"/>
            <xsl:when test="not(@placement = 'inline')">
                <fo:block xsl:use-attribute-sets="image__block">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:apply-templates select="." mode="placeImageTEST">
                        <xsl:with-param name="imageAlign" select="@align"/>
                        <xsl:with-param name="href" select="if (@scope = 'external' or opentopic-func:isAbsolute(@href)) then @href else concat($input.dir.url, @href)"/>
                        <xsl:with-param name="height" select="@height"/>
                        <xsl:with-param name="width" select="@width"/>
                    </xsl:apply-templates>
                </fo:block>
            </xsl:when>
            <xsl:when test="@placement = 'inline' and parent::*[contains(@class, ' topic/fig ')]">
                <fo:block xsl:use-attribute-sets="image__block">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:apply-templates select="." mode="placeImageTEST">
                        <xsl:with-param name="imageAlign" select="@align"/>
                        <xsl:with-param name="href" select="if (@scope = 'external' or opentopic-func:isAbsolute(@href)) then @href else concat($input.dir.url, @href)"/>
                        <xsl:with-param name="height" select="@height"/>
                        <xsl:with-param name="width" select="@width"/>
                    </xsl:apply-templates>
                </fo:block>
            </xsl:when>
            <xsl:otherwise>
                <fo:inline xsl:use-attribute-sets="image__inline">
                    <xsl:call-template name="commonattributes"/>
                    <xsl:apply-templates select="." mode="placeImage">
                        <xsl:with-param name="imageAlign" select="@align"/>
                        <xsl:with-param name="href" select="if (@scope = 'external' or opentopic-func:isAbsolute(@href)) then @href else concat($input.dir.url, @href)"/>
                        <xsl:with-param name="height" select="@height"/>
                        <xsl:with-param name="width" select="@width"/>
                    </xsl:apply-templates>
                </fo:inline>
            </xsl:otherwise>
        </xsl:choose>

        <!-- build any post break indicated by style -->
        <xsl:choose>
            <xsl:when test="parent::fig">
                <!-- NOP if there is already a break implied by a parent property -->
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="not(@placement = 'inline')">
                    <!-- generate an FO break here -->
                    <fo:block>&#160;</fo:block>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="*" mode="placeImage">
        <xsl:param name="imageAlign"/>
        <xsl:param name="href"/>
        <xsl:param name="height" as="xs:string?"/>
        <xsl:param name="width" as="xs:string?"/>
        <!--Using align attribute set according to image @align attribute-->
        <xsl:call-template name="processAttrSetReflection">
            <xsl:with-param name="attrSet" select="concat('__align__', $imageAlign)"/>
            <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
        </xsl:call-template>
        <fo:external-graphic src="url({$href})" xsl:use-attribute-sets="image">
        </fo:external-graphic>
    </xsl:template>

    <xsl:template match="*" mode="placeImageTEST">
        <xsl:param name="imageAlign"/>
        <xsl:param name="href"/>
        <xsl:param name="height"/>
        <xsl:param name="width"/>
        <!--Using align attribute set according to image @align attribute-->
        <xsl:call-template name="processAttrSetReflection">
            <xsl:with-param name="attrSet" select="concat('__align__', $imageAlign)"/>
            <xsl:with-param name="path" select="'../../cfg/fo/attrs/commons-attr.xsl'"/>
        </xsl:call-template>
        <fo:external-graphic src="url({$href})" content-width="scale-to-fit" content-height="100%"
                             scaling="uniform" max-width="6.5in">
            <xsl:attribute name="content-width">
                <xsl:choose>
                    <xsl:when test="ancestor-or-self::*/@scale">
                        <xsl:value-of select="ancestor-or-self::*/@scale"/>
                    </xsl:when>
                    <xsl:otherwise>scale-to-fit</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
        </fo:external-graphic>

    </xsl:template>

    <xsl:template match="*[contains(@class, ' topic/draft-comment ')]">
        <xsl:if test="$publishRequiredCleanup = 'yes' or $DRAFT = 'yes'">
            <fo:block xsl:use-attribute-sets="draft-comment">
                <xsl:call-template name="commonattributes"/>
                <fo:block xsl:use-attribute-sets="draft-comment__label">Writer Comment:</fo:block>
                <xsl:apply-templates/>
            </fo:block>
        </xsl:if>
    </xsl:template>

    <xsl:template match="@rev">
        <xsl:message>Caught @rev...<xsl:value-of select="local-name()"/></xsl:message>
        <xsl:if test="$DRAFT='yes'">
            <xsl:attribute name="border-start-style">solid</xsl:attribute>
            <xsl:attribute name="border-start-width">1.5pt</xsl:attribute>
            <xsl:attribute name="border-start-color">red</xsl:attribute>
            <xsl:attribute name="margin-left">-0.5in</xsl:attribute>
            <xsl:attribute name="padding-left">0.5in</xsl:attribute>
            <xsl:attribute name="background-color">#D0D0D0</xsl:attribute>
        </xsl:if>
    </xsl:template>

    <xsl:template name="commonattributes">
        <xsl:apply-templates select="@id"/>
        <xsl:apply-templates select="@rev"/>
    </xsl:template>

</xsl:stylesheet>