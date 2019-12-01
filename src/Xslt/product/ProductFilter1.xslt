<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="product-filter-side product-filter clearfix">
			<span class="title">Filter<em class="mdi mdi-filter"></em></span>
			<div class="filter-wrap">
				<div class="product-filter-side-wrapper ajaxfilterresponse">
					<div class="mobile-filter"><em class="mdi mdi-chevron-left"></em><span>Back</span></div>
					<xsl:apply-templates select="/ProductFilter/Group" mode="Group1"></xsl:apply-templates>

				</div>
					<div class="filter-side-item filter-range">
						<div class="filter-range">
	            <div id="slider-range"></div>
	            <div class="price-range"><xsl:value-of select="/ProductFilter/FromPriceText"></xsl:value-of>
	              <div class="sliderValue min-input" data-index="0"></div>
	              <xsl:value-of select="/ProductFilter/ToPriceText"></xsl:value-of>
	              <div class="sliderValue max-input" data-index="1"></div>
	            </div>
	            <div class="hidden">
	              <a class="urlwithoutprice">
	                <xsl:attribute name="href">
	                  <xsl:value-of select="/ProductFilter/UrlWithoutPrice"></xsl:value-of>
	                </xsl:attribute>
	              </a>
	              <a class="urlwithprice">
	                <xsl:attribute name="href">
	                  <xsl:value-of select="/ProductFilter/UrlWithPrice"></xsl:value-of>
	                </xsl:attribute>
	              </a>
	              <a class="pricemin">
	                <xsl:value-of select="/ProductFilter/PriceMin"></xsl:value-of>
	              </a>
	              <a class="pricemax">
	                <xsl:value-of select="/ProductFilter/PriceMax"></xsl:value-of>
	              </a>
	            </div>
	          </div>
					</div>
					<div class="hidden">
						<a class="urlwithoutprice">
							<xsl:attribute name="href">
								<xsl:value-of select="/ProductFilter/UrlWithoutPrice"></xsl:value-of>
							</xsl:attribute>
						</a>
						<a class="urlwithprice">
							<xsl:attribute name="href">
								<xsl:value-of select="/ProductFilter/UrlWithPrice"></xsl:value-of>
							</xsl:attribute>
						</a>
						<a class="pricemin">
							<xsl:value-of select="/ProductFilter/PriceMin"></xsl:value-of>
						</a>
						<a class="pricemax">
							<xsl:value-of select="/ProductFilter/PriceMax"></xsl:value-of>
						</a>
					</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Group" mode="Group1">
		<div class="filter-side-item filter-group clearfix">
			<span class="title-filter filter-title">
				<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
			</span>
			<xsl:choose>
				<xsl:when test="GroupId='11'">
					<xsl:apply-templates select="Option" mode="Option11"></xsl:apply-templates>
				</xsl:when>
				<xsl:when test="GroupId='12'">
					<xsl:apply-templates select="Option" mode="Option12"></xsl:apply-templates>
				</xsl:when>
				<xsl:when test="FieldType='1'">
					<div class="color-picker">
						<div class="color filter-side-item"
							style="display: flex; flex-flow: row;width: auto;height: auto;">
							<xsl:apply-templates select="Option" mode="Color"></xsl:apply-templates>
						</div>
					</div>
				</xsl:when>
				<xsl:when test="GroupId='9'">
					<xsl:apply-templates select="Option" mode="Option9"></xsl:apply-templates>
				</xsl:when>
				<xsl:otherwise>
					<xsl:apply-templates select="Option" mode="Default"></xsl:apply-templates>
					<!-- <div class="product-size">
                    </div> -->
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>
	<xsl:template match="Option" mode="Color">
		<div class="color-wrapper">
			<a class="ajaxlink color">
				<xsl:if test="IsActive='true'">
					<xsl:attribute name="class">
						<xsl:text>ajaxlink active color</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<xsl:attribute name="href">
					<xsl:value-of select="Url"></xsl:value-of>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:value-of select="Title"></xsl:value-of>
				</xsl:attribute>
				<xsl:if test="Color!=''">
					<xsl:attribute name="style">
						<xsl:text>background-color:</xsl:text>
						<xsl:value-of select="Color"></xsl:value-of>
					</xsl:attribute>
				</xsl:if>
			</a>
		</div>
	</xsl:template>
	<xsl:template match="Option" mode="Option9">
		<a class="checkbox">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">checkbox active</xsl:text>
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
	</xsl:template>
	<xsl:template match="Option" mode="Option11">
		<a class="radio">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">radio active</xsl:text>
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
	</xsl:template>
	<xsl:template match="Option" mode="Option12">
		<a class="checkbox">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">checkbox active</xsl:text>
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
	</xsl:template>
	<xsl:template match="Option" mode="Default">
		<a class="checkbox">
			<xsl:if test="IsActive='true'">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">checkbox active</xsl:text>
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
	</xsl:template>
</xsl:stylesheet>
