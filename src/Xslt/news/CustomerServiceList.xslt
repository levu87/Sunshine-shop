<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <section class="policy-services">
            <div class="container">
                <div class="title"><xsl:value-of select="/NewsList/ZoneTitle" disable-output-escaping="yes"></xsl:value-of></div>
                <div class="fullcontent">
                    <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
                </div>
            </div>
        </section>
    </xsl:template>
    <xsl:template match="News">
        <h5><xsl:value-of select="position()" disable-output-escaping="yes"></xsl:value-of>. <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of><xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of></h5>
        <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
    </xsl:template>
</xsl:stylesheet>