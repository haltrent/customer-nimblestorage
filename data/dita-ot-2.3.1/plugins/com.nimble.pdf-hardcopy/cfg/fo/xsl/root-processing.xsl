<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                exclude-result-prefixes="#all"
                version="2.0">

    <xsl:template match="*[contains(@class, ' bookmap/preface ')]" mode="generatePageSequences">
        <xsl:for-each select="key('topic-id', @id)">
            <!--<xsl:call-template name="processTopicPreface"/>-->
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>