<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="product-by-category">
			<div class="container">
				<div class="product-by-category-wrapper">
					<ul>
						<xsl:apply-templates select="/ZoneList/Zone"></xsl:apply-templates>
					</ul>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match="Zone">
		<li>
			<xsl:if test="position()=1">
				<xsl:attribute name="class">
					<xsl:text disable-output-escaping="yes">active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<div class="title-caption">
				<span class="title">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</span>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="Url"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="title">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					<xsl:text disable-output-escaping="yes">View all</xsl:text>
				</a>
			</div>
			<div class="row product-wrapper">
				<div class="product-item-wrapper">
					<xsl:apply-templates select="Product"></xsl:apply-templates>
				</div>
			</div>
		</li>
	</xsl:template>
	<xsl:template match="Product">
		<xsl:if test="position()&gt;0 and position()&lt;6">
			<div class="product-item-category">
				<div class="figure-image">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="title">
							<xsl:value-of select="Title"></xsl:value-of>
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
						<xsl:if test="OldPrice != ''">
							<xsl:variable name='price'>
								<xsl:value-of select="substring-before(Price, ' ')"></xsl:value-of>
							</xsl:variable>
							<xsl:variable name='priceNumber'>
								<xsl:value-of select="translate($price, ',', '')"></xsl:value-of>
							</xsl:variable>
							<xsl:variable name='oldprice'>
								<xsl:value-of select="substring-before(OldPrice, ' ')"></xsl:value-of>
							</xsl:variable>
							<xsl:variable name='oldPriceNumber'>
								<xsl:value-of select="translate($oldprice, ',', '')"></xsl:value-of>
							</xsl:variable>
							<xsl:variable name='percentage'>
								<xsl:value-of select="100 - ($priceNumber div $oldPriceNumber)*100"></xsl:value-of>
							</xsl:variable>
							<div class="promotion">
								<p style="height: auto;width: auto;padding: 4px 8px;">
									<xsl:text>-</xsl:text>
									<xsl:value-of select="ceiling($percentage)"></xsl:value-of>
									<xsl:text>%</xsl:text>
								</p>
							</div>
						</xsl:if>
						<!-- <xsl:choose>
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
							</xsl:choose> -->
					</div>
					<!-- <div class="button-wrapper">
						<div class="button-view-more">
							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<xsl:text disable-output-escaping="yes">View more</xsl:text>
							</a>
						</div>
						<div class="button-cart">
							<a>
								<em class="mdi mdi cart"></em>Add to cart
							</a>
						</div>
					</div> -->
				</div>
				<figcaption>
					<div class="top-caption">
						<h2>
							<xsl:attribute name="href">
								<xsl:value-of select="Url"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="title">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							<xsl:value-of select="Code" disable-output-escaping="yes"></xsl:value-of>
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

								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<div class="cart-icon" onclick="AjaxCart.addproducttocart_catalog(this);return false;">
									<xsl:attribute name="data-productid">
										<xsl:value-of select="ProductId"></xsl:value-of>
									</xsl:attribute>
								</div>
								<div class="cart-item-quantity">
									<div class="input-group">
										<div class="input-group-btn">
											<div class="qty-minus btn-number"><span class="mdi mdi-minus"></span></div>
										</div>
										<input class="product-details-quantity form-control input-number" type="text"
											value="1">
										</input>
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
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
