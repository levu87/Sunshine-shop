<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="/">
    <xsl:choose>
      <xsl:when test="count(/ProductList/Product)>0">
        <section>
          <div class="searchsummary clearfix">
            <xsl:value-of select="/ProductList/SearchSumary" disable-output-escaping="yes"></xsl:value-of>
          </div>
          <section class="product-page clearfix">
		  <div class="product-list clearfix">
            <div class="row flex flex-wrap">
              <xsl:apply-templates select="/ProductList/Product"></xsl:apply-templates>
            </div>
			</div>
          </section>
        </section>
      </xsl:when>
      <xsl:otherwise>
        <div class="noresults">
          <xsl:value-of select="/ProductList/NoResults" disable-output-escaping="yes"></xsl:value-of>
        </div>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="Product">
    <article class="col-lg-3 col-6">
      <div class="product-col">
        <figure>
          <xsl:if test="floor(ShowOption div 1) mod 2 = 1">
			<style>
			.flashsale {width: 74%; margin-left: 13%; margin-right: 13%;}
			</style>
            <div class="promotion flashsale" style="top: 60% !important; text-align: center; background: #000; color: #fff !important;">
              <xsl:text>Nhập NOV giảm 500K</xsl:text>
            </div>
          </xsl:if>
          <xsl:if test="floor(ShowOption div 2) mod 2 = 1">
			<style>
			.flashsale {width: 56%; margin-left: 22%; margin-right: 22%;}
			</style>
            <div class="promotion flashsale" style="top: 60% !important; text-align: center; background: #ff0000; color: #fff !important;">
              <xsl:text>Mua 1 tặng 1</xsl:text>
            </div>
          </xsl:if>
          <xsl:if test="floor(ShowOption div 4) mod 2 = 1">
            <div class="promotion sale">
              <xsl:text>GIFT</xsl:text>
            </div>
          </xsl:if>
          <xsl:if test="Percent!=''">
            <div class="promotion new">
              <xsl:value-of select="Percent"></xsl:value-of>
              <xsl:text>% Off</xsl:text>
            </div>
          </xsl:if>
		  <xsl:if test="floor(ShowOption div 32) mod 2 = 1">
			<style>
			.reddot {position: absolute; top: 1%; left: 4%; z-index:4;}
			.reddot::after {content: ""; background-image: url('/Data/Sites/1/media/logo/reddot_design_award.png'); background-size: 75px 42px; width: 75px; height: 42px; display: inline-block;}
			@media only screen and (max-width: 600px) {
				.reddot::after {background-size: 60px 34px; width: 60px; height: 34px;}
			}
			</style>
			<div class="reddot"></div>
		  </xsl:if>
		  <xsl:if test="floor(ShowOption div 4096) mod 2 = 1">
			<style>
			.recyclexeco {position: absolute; top: 1%; left: 4%; z-index:4;}
			.recyclexeco::after {content: ""; background-image: url('/Data/Sites/1/media/logo/logo-recyclex-eco.png'); background-size: 75px 60px; width: 75px; height: 60px; display: inline-block;}
			@media only screen and (max-width: 600px) {
				.recyclexeco::after {background-size: 60px 48px; width: 60px; height: 48px;}
			}
			</style>
			<div class="recyclexeco"></div>
		  </xsl:if>
          <div class="product-popup">
            <a class="btn-viewdetail">
              <xsl:attribute name="href">
                <xsl:value-of select="Url"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="target">
                <xsl:value-of select="Target"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
              <xsl:value-of select="/ProductList/DetailText"></xsl:value-of>
            </a>
			<xsl:choose>
				<xsl:when test="StockQuantity =0">
					<a href="#!"  class="hvr-shutter-out-horizontal btn-buy btn-soldout">
							<xsl:attribute name="data-productid">
					  <xsl:value-of select="ProductId"></xsl:value-of>
					</xsl:attribute>
					  <span>
					  CHÁY HÀNG
					  </span>
					</a>
				</xsl:when>
				<xsl:otherwise>
				<a href="#!" class="btn-buy" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
					<xsl:attribute name="data-productid">
					  <xsl:value-of select="ProductId"></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select="/ProductList/BuyText"></xsl:value-of>
				  </a>
				</xsl:otherwise>
			</xsl:choose>
			 <a href="#" title="So sánh" class="compare btn_compare">
				<xsl:attribute name="data-productid">
				  <xsl:value-of select="ProductId"></xsl:value-of>
				</xsl:attribute>
				<xsl:if test="AddedCompare='true'">
				  <xsl:attribute name="class">
					<xsl:text>compare btn_compare active</xsl:text>
				  </xsl:attribute>
				</xsl:if>
				<xsl:text>So sánh</xsl:text>
			  </a>
			<xsl:if test="TextPlus!=''">
				<div class="text-discount">
					<xsl:value-of select="TextPlus"></xsl:value-of>
				</div>
			</xsl:if>
          </div>
          <a class="product-img">
            <xsl:attribute name="href">
              <xsl:value-of select="Url"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="target">
              <xsl:value-of select="Target"></xsl:value-of>
            </xsl:attribute>
            <xsl:attribute name="title">
              <xsl:value-of select="Title"></xsl:value-of>
            </xsl:attribute>
            <img>
              <xsl:attribute name="src">
                <xsl:value-of select="ImageUrl"></xsl:value-of>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:value-of select="Title"></xsl:value-of>
              </xsl:attribute>
            </img>
          </a>
          <figcaption>
            <div class="product-color">
              <xsl:apply-templates select="ProductListColors"></xsl:apply-templates>
            </div>
            <div class="product-brand">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="ManufacturerURL"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Manufacturer" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </div>
            <h3 class="product-name">
              <a>
                <xsl:attribute name="href">
                  <xsl:value-of select="Url"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="target">
                  <xsl:value-of select="Target"></xsl:value-of>
                </xsl:attribute>
                <xsl:attribute name="title">
                  <xsl:value-of select="Title"></xsl:value-of>
                </xsl:attribute>
                <xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
              </a>
            </h3>
            <div class="product-kind">
              <xsl:value-of select="SubTitle" disable-output-escaping="yes"></xsl:value-of>
            </div>
            <div class="product-price clearfix">
              <xsl:choose>
                <xsl:when test="Price!=''">
                  <div class="new">
                    <xsl:value-of select="Price"></xsl:value-of>
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div class="new">
                    <xsl:value-of select="/ProductList/ContactText" disable-output-escaping="yes"></xsl:value-of>
                  </div>
                </xsl:otherwise>
              </xsl:choose>
              <xsl:if test="OldPrice != ''">
                <div class="old">
                  <xsl:value-of select="OldPrice"></xsl:value-of>
                </div>
              </xsl:if>
            </div>
          </figcaption>
        </figure>
      </div>
    </article>
  </xsl:template>

    <xsl:template match="ProductListColors">
    <xsl:if test="ColorCode != ''">
      <div class="color">
        <xsl:attribute name="style">
          <xsl:text>background-color:</xsl:text>
          <xsl:value-of select="ColorCode"></xsl:value-of>
          <xsl:text>;display:block;</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="data-imgurl">
          <xsl:value-of select="UrlImageColorid"></xsl:value-of>
        </xsl:attribute>
      </div>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
