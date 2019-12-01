<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <div class="contact-information-wrapper">
            <div class="row">
                <div class="col-12">
                    <h1><xsl:value-of select="/NewsList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of></h1>
                </div>
                <div class="col-12">
                    <xsl:apply-templates select="/NewsList/News"></xsl:apply-templates>
                </div>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="News">
        <div class="location">
            <div class="box">
                <div class="icon"><em class="mdi mdi-home"></em></div>
                <div class="caption">
                    <p class="text"><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></p>
                    <p class="text"><xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of></p>
                </div>
            </div>
            <xsl:value-of select="FullContent" disable-output-escaping="yes"></xsl:value-of>
        </div>
    </xsl:template>
</xsl:stylesheet>