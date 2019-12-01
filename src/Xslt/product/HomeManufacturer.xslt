<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="partner-swiper">
			<div class="container">
				<div class="partnet-swiper-wrapper">
					<div class="navigation-partner-prev"><em class="mdi mdi-chevron-left"></em></div>
					<div class="navigation-partner-next"><em class="mdi mdi-chevron-right"></em></div>
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<xsl:apply-templates select='/ManufacturerList/Manufacturer'></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='Manufacturer'>
		<div class="swiper-slide">
			<div class="swiper-image">
				<a href="#">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<div class="img">
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ImageUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</div>
				</a>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>