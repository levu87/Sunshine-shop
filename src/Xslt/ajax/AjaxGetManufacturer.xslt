<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes" />
  <xsl:template match="/">
    <xsl:apply-templates select="/ManufacturerList/Manufacturer"/>
  </xsl:template>

  <xsl:template match="Manufacturer" >
    <div class="item">
      <a href="javascript:void(0)">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
          <xsl:if test="/ManufacturerList/ZoneId != ''">
            <xsl:text>?zoneId=</xsl:text>
            <xsl:value-of select="/ManufacturerList/ZoneId"/>
          </xsl:if>
        </xsl:attribute>
        <xsl:attribute name="title">
          <xsl:value-of select="Title"></xsl:value-of>
        </xsl:attribute>
        <img src="/Data/Sites/1/skins/default/img/home/sub-6.png"
          alt="">
          <xsl:attribute name="src">
            <xsl:value-of select="PrimaryImage"></xsl:value-of>
          </xsl:attribute>
          <xsl:attribute name="alt">
            <xsl:value-of select="Title"></xsl:value-of>
          </xsl:attribute>
        </img>
      </a>
    </div>
  </xsl:template>
</xsl:stylesheet>
