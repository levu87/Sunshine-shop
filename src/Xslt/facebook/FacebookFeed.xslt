<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:if test="count(/FeedList/Feed ) > 0 ">


      <div class="cello-title">
        <h2>
          <xsl:value-of select="/FeedList/ModuleTitle" disable-output-escaping="yes"></xsl:value-of>
        </h2>
      </div>
      <div class="swiper-container">
        <div class="swiper-wrapper">
          <xsl:apply-templates select="/FeedList/Feed"></xsl:apply-templates>

        </div>
      </div>

    </xsl:if>
  </xsl:template>

  <xsl:template match="Feed">
    <div class="swiper-slide">
      <a class="item" href="javascript:void(0)">
        <xsl:attribute name="href">
          <xsl:value-of select="Url"></xsl:value-of>
        </xsl:attribute>
        <div class="top-item">
          <div class="img">
            <img src="/Data/Sites/1/skins/default/img/home/fanpage-1.png" alt="">
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="src">
                <xsl:value-of select="FullPicture"></xsl:value-of>
              </xsl:attribute>
            </img>
          </div>
          <div class="icon">
            <i class="mdi mdi-facebook"></i>
          </div>
        </div>
        <div class="bottom-item">
          <div class="time">
            <xsl:value-of select="CreatedTime" disable-output-escaping="yes"></xsl:value-of>
          </div>
          <div class="name">
            <h5>
              <xsl:value-of select="Message"></xsl:value-of>
            </h5>
          </div>
        </div>
      </a>
    </div>
  </xsl:template>
</xsl:stylesheet>
