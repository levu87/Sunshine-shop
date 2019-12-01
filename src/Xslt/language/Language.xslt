<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
<xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <ul class="language-list">
        <li class="has-sub">
            <xsl:apply-templates select="/LanguageList/Language" mode="active"></xsl:apply-templates>
            <ul class="nav-sub">
                <xsl:apply-templates select="/LanguageList/Language" mode="list"></xsl:apply-templates>
            </ul>
        </li>
    </ul>
  </xsl:template>
  <xsl:template match="Language" mode="active">
    <xsl:if test="IsActive='true'">
      <span><xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of></span> 
    </xsl:if>
  </xsl:template>
  <xsl:template match="Language" mode="list">
    <li>
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