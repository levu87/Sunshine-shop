<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <div id="rev_slider_202_1_wrapper" data-alias="concept1" style="background-color:#000000;padding:0px" class="rev_slider_wrapper fullscreen-container">
      <div id="rev_slider_202_1" data-version="5.1.1RC" class="rev_slider fullscreenbanner">
        <ul>
          <xsl:apply-templates select="/BannerList/Banner"></xsl:apply-templates>
        </ul>
        <div class="tp-bannertimer"></div>
      </div>
    </div>
    <div class="btn-down">
      <i class="fa fa-angle-double-down" aria-hidden="true"></i>
    </div>
  </xsl:template>

  <xsl:template match="Banner">
    <li
      data-transition="crossfade"
      data-slotamount="default"
      data-easein="default"
      data-easeout="default"
      data-masterspeed="default"
      data-thumb="img/banner/thumb2.jpg"
      data-rotate="0"
      data-saveperformance="off"
      data-title=""
      data-description="">
      <xsl:attribute name="data-thumb">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
      <img data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="5" data-no-retina="" class="rev-slidebg">
        <xsl:attribute name="src">
          <xsl:value-of select="ImageUrl"></xsl:value-of>
        </xsl:attribute>
        <xsl:attribute name="alt">
          <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
        </xsl:attribute>
      </img>
      <div
        data-x="['center','center','center','center']"
        data-hoffset="['0','0','0','0']"
        data-y="['middle','middle','middle','middle']"
        data-voffset="['0','0','0','0']"
        data-width="full"
        data-height="full"
        data-whitespace="nowrap"
        data-transform_idle="o:1;"
        data-transform_in="opacity:0;s:1000;e:Power2.easeInOut;"
        data-transform_out="opacity:0;s:1000;s:1000;"
        data-start="0" data-basealign="slide"
        data-responsive_offset="off"
        data-responsive="off"
        style="z-index: 5;background-color:rgba(0, 0, 0, 0.3);border-color:rgba(0, 0, 0, 0)" class="tp-caption tp-shape tp-shapewrapper">
      </div>
      <div
        data-x="['left','left','left','left']"
        data-hoffset="['100','50','50','40']"
        data-y="['bottom','bottom','bottom','bottom']"
        data-voffset="['279','279','279','279']"
        data-width="none" data-height="none"
        data-whitespace="nowrap"
        data-transform_idle="o:1;"
        data-transform_in="y:bottom;s:1500;e:Power4.easeOut;"
        data-transform_out="y:-50px;opacity:0;s:500;e:Power2.easeInOut;"
        data-start="0" data-splitin="none"
        data-splitout="none"
        data-basealign="slide"
        data-responsive_offset="on"
        style="z-index: 5; white-space: nowrap;padding:18px 30px 16px 30px" class="tp-caption FullScreenMenu-Category tp-resizem product-type">
        <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
      </div>
      <div
        data-x="['left','left','left','left']"
        data-hoffset="['100','50','50','40']"
        data-y="['bottom','bottom','bottom','bottom']"
        data-voffset="['170','170','170','170']"
        data-fontsize="['65','65','65','65']"
        data-lineheight="['70','70','70','70']"
        data-width="['none','none','none','none']"
        data-height="none"
        data-whitespace="['nowrap','nowrap','nowrap','nowrap']"
        data-transform_idle="o:1;"
        data-transform_in="y:bottom;s:1500;e:Power4.easeOut;"
        data-transform_out="y:-50px;opacity:0;s:500;e:Power2.easeInOut;"
        data-start="100"
        data-splitin="none"
        data-splitout="none"
        data-basealign="slide"
        data-responsive_offset="on"
        style="z-index: 6; white-space: nowrap" class="tp-caption FullScreenMenu-Title tp-resizeme product-caption">
        <xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
      </div>
      <xsl:if test="Url != ''">
        <a
          data-x="['left','left','left','left']"
          data-hoffset="['100','50','50','40']"
          data-y="['bottom','bottom','bottom','bottom']"
          data-voffset="['104','104','104','104']"
          data-width="none"
          data-height="none"
          data-whitespace="nowrap"
          data-transform_idle="o:1;"
          data-transform_hover="o:1;rX:0;rY:0;rZ:0;z:0;s:100;e:Power1.easeInOut;"
          data-style_hover="c:rgba(17, 17, 17, 1.00);bg:rgba(255, 255, 255, 0.90);"
          data-transform_in="y:bottom;s:1500;e:Power4.easeOut;"
          data-transform_out="y:-50px;opacity:0;s:500;e:Power2.easeInOut;"
          data-start="200" data-splitin="none"
          data-splitout="none"
          data-basealign="slide"
          data-responsive_offset="on"
          style="z-index: 7; white-space: nowrap; color: rgba(255, 255, 255, 1.00);background-color:rgba(17, 17, 17, 0.90);padding:18px 30px 16px 30px;cursor:pointer"
          class="tp-caption FullScreenMenu-Category tp-resizeme viewmore">
          <xsl:attribute name="href">
            <xsl:value-of select="Url"></xsl:value-of>
          </xsl:attribute>
          <xsl:value-of select="/BannerList/ViewMore"></xsl:value-of>
        </a>
      </xsl:if>

    </li>
  </xsl:template>
</xsl:stylesheet>