<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <ul class="faq-dashboard">
            <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
        </ul>
    </xsl:template>
    <xsl:template match="News">
        <li>
            <span class="title"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></span>
            <div class="content">
                <xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
                <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
            </div>
        </li>
    </xsl:template>
</xsl:stylesheet>