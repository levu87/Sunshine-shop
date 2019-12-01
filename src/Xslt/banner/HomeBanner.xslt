<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="home-banner-top">
			<div class="swiper-container">
				<div class="container swiper-navigation-wrapper">
					<div class="navigation-banner-prev"><em class="mdi mdi-chevron-left"></em></div>
					<div class="navigation-banner-next"><em class="mdi mdi-chevron-right"></em></div>
				</div>
				<div class="swiper-wrapper">
					<xsl:apply-templates select='/BannerList/Banner'></xsl:apply-templates>
				</div>
				<div class="swiper-pagination"></div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='Banner'>
		<div class="swiper-slide">
			<div class="wrapper">
				<div class="swiper-image">
					<img>
					<xsl:attribute name='src'>
						<xsl:value-of select='ImageUrl'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='alt'>
						<xsl:value-of select='Title'></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<div class="container caption-wrapper">
					<div class="swiper-caption">
						<h2>
							<xsl:value-of select='Title'></xsl:value-of>
						</h2>
						<h3>
							<xsl:value-of select='Description' disable-output-escaping='yes'></xsl:value-of>
						</h3>
						<div class="shop-now-button">
							<a>
								<xsl:attribute name='href'>
									<xsl:value-of select='Url'></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name='title'>
									<xsl:value-of select='Title'></xsl:value-of>
								</xsl:attribute>
								<img src="/Data/Sites/1/skins/default/img/cart-white.png" alt="" />
								<xsl:text>Shop now</xsl:text>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>