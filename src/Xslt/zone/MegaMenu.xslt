<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <div class="navigation-wrapper">
            <ul>
                <xsl:apply-templates select="/ZoneList/Zone" mode="Zone1"></xsl:apply-templates>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone1">
        <li>
            <xsl:if test="count(Zone)>0">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">has-mega</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <a>
                <xsl:if test="IsActive='true'">
                    <xsl:attribute name="class">
                        <xsl:text disable-output-escaping="yes">active</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </a>
            <xsl:if test="count(Zone)>0">
                <em class="lnr lnr-chevron-down"></em>
            </xsl:if>
            <xsl:if test="count(Zone)>0">
                <div class="row mega-wrapper">
                    <div class="container"><em class="lnr lnr-cross"></em>
                        <div class="row">
                            <xsl:apply-templates select="Zone" mode="Zone2"></xsl:apply-templates>
                            <xsl:value-of select="count(Zone)" disable-output-escaping="yes"></xsl:value-of>
                        </div>
                    </div>
                </div>
            </xsl:if>
        </li>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone2">
        <div class="col-sm-4 col-md-3 col-xl-2 mega-item">
            <h2>
                <xsl:if test="IsActive='true'">
                    <xsl:attribute name="class">
                        <xsl:text disable-output-escaping="yes">active</xsl:text>
                    </xsl:attribute>
                </xsl:if>
                <a>
                    <xsl:attribute name="href">
                        <xsl:value-of select="Url"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:attribute name="title">
                        <xsl:value-of select="Title"></xsl:value-of>
                    </xsl:attribute>
                    <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
                </a>
            </h2>
            <ul class="mega-list">
                <xsl:apply-templates select="Zone" mode="Zone3"></xsl:apply-templates>
            </ul>
        </div>
    </xsl:template>
    <xsl:template match="Zone" mode="Zone3">
        <li>
            <xsl:if test="IsActive='true'">
                <xsl:attribute name="class">
                    <xsl:text disable-output-escaping="yes">active</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <a>
                <xsl:attribute name="href">
                    <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>