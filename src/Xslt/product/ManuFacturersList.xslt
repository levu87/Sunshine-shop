<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="brand-display">
			<div class="container">
				<div class="row brand-logo-wrapper">
					<xsl:apply-templates select='/ManufacturerList/Manufacturer'></xsl:apply-templates>
				</div>
				<xsl:if test="count(/ManufacturerList/Manufacturer)&gt;12">
					<div class="view-more-brand">
						<a href="javascript:void(0)">
							<span>View more</span>
							<em class="mdi mdi-chevron-down"></em>
						</a>
					</div>
				</xsl:if>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='Manufacturer'>
		<div class="col-6 col-sm-4 col-md-3 items">
			<div class="brand-logo-item">
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