<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="product-by-category">
			<div class="container">
				<div class="product-by-category-wrapper">
					<ul>
						<xsl:apply-templates select='/ZoneList/Zone'></xsl:apply-templates>
					</ul>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='Zone'>
		<xsl:if test='Depth=1'>
			<li>
				<div class="title-caption">
					<span class="title">
						<xsl:value-of select='Title'></xsl:value-of>
					</span>
					<a href="#">
						<xsl:attribute name='href'>
							<xsl:value-of select='Url'></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name='title'>
							<xsl:value-of select='Title'></xsl:value-of>
						</xsl:attribute>
						View all
					</a>
				</div>
				<div class="row product-wrapper">
					<div class="product-item-wrapper">
						<xsl:apply-templates select='Zone' mode='Zone1'></xsl:apply-templates>
					</div>
				</div>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match='Zone' mode='Zone1'>
		<xsl:apply-templates select='Product'></xsl:apply-templates>
	</xsl:template>
	<xsl:template match='Product'>
		<div class="product-item-category">
			<div class="figure-image">
				<a class="product-img">
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="target">
						<xsl:value-of select="Target"></xsl:value-of>
					</xsl:attribute>
					<img class="lazyload">
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</a>
				<div class="discount">
					<xsl:choose>
						<xsl:when test="floor(ShowOption div 1) mod 2 = 1">
							<div class="promotion op1">
								<p>
									<xsl:value-of select="/ProductList/NewText"></xsl:value-of>
								</p>
							</div>
						</xsl:when>
						<xsl:when test="floor(ShowOption div 2) mod 2 = 1">
							<p class="promotion op2">
								<xsl:value-of select="/ProductList/SaleText"></xsl:value-of>
							</p>
						</xsl:when>
					</xsl:choose>
				</div>
			</div>
			<figcaption>
				<div class="top-caption">
					<h2>
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="Code" disable-output-escaping="yes"></xsl:value-of>
						</a>
					</h2>
					<h3>
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
						</a>
						<xsl:value-of select="EditLink" disable-output-escaping="yes"></xsl:value-of>
					</h3>
				</div>
				<div class="bottom-caption">
					<div class="price">
						<xsl:if test="Price != ''">
							<h4>
								<xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of>
							</h4>
						</xsl:if>
						<xsl:if test="OldPrice != ''">
							<h5>
								<s>
									<xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of>
								</s>
							</h5>
						</xsl:if>
						<!-- <h4><xsl:value-of select="Price" disable-output-escaping="yes"></xsl:value-of></h4>
								<h5>
									<s><xsl:value-of select="OldPrice" disable-output-escaping="yes"></xsl:value-of></s>
								</h5> -->
					</div>
					<div class="cart">
						<a onclick="AjaxCart.addproducttowishlist(this);return false;">
									<xsl:attribute name="data-productid">
										<xsl:value-of select="ProductId"></xsl:value-of>
									</xsl:attribute>
							<em class="mdi mdi-heart-outline"></em>
						</a>
						<a>
							<div class="cart-icon"></div>
							<div class="cart-item-quantity">
								<div class="input-group">
									<div class="input-group-btn">
										<div class="qty-minus btn-number"><span class="mdi mdi-minus"></span></div>
									</div>
									<input class="product-details-quantity form-control input-number" type="text"
										value="1"></input>
									<div class="input-group-btn">
										<div class="qty-plus btn-number"><span class="mdi mdi-plus"></span></div>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</figcaption>
		</div>
	</xsl:template>
</xsl:stylesheet>
