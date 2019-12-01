<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="product-information-detail">
			<div class="container">
				<div class="row">
					<div class="col-lg-7">
						<div class="information-swiper-wrapper">
							<div class="swiper-product-top">
								<div class="swiper-container">
									<div class="swiper-wrapper">
										<xsl:apply-templates select='/ProductDetail/ProductImages'>
										</xsl:apply-templates>
									</div>
								</div>
							</div>
							<div class="swiper-product-thumb">
								<div class="swiper-container">
									<div class="swiper-wrapper">
										<xsl:apply-templates select='/ProductDetail/ProductImages'>
										</xsl:apply-templates>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-5">
						<div class="product-information-wrapper">
							<table>
								<tbody>
									<tr>
										<td>Product Name</td>
										<td>
											<xsl:value-of select='/ProductDetail/Title'></xsl:value-of>
											<xsl:value-of select='/ProductDetail/EditLink'
												disable-output-escaping='yes'></xsl:value-of>
										</td>
									</tr>
									<tr>
										<td>Code</td>
										<td>
											<xsl:value-of select='/ProductDetail/Code'></xsl:value-of>
										</td>
									</tr>
									<tr>
										<td>Dimension</td>
										<td>
											<xsl:value-of
												select='/ProductDetail/ProductProperties[FieldId = 9]/Options/Title'
												disable-output-escaping='yes'></xsl:value-of>
										</td>
									</tr>
									<tr>
										<td>Color</td>
										<td>
											<xsl:apply-templates
												select='/ProductDetail/ProductProperties[FieldType=1]/Options'
												mode='Color'>
											</xsl:apply-templates>
										</td>
									</tr>
									<tr>
										<td>Brand name</td>
										<td>
											<xsl:value-of select="/ProductDetail/ManufacturerTitle"
												disable-output-escaping="yes" />
										</td>
									</tr>
									<tr>
										<td>Origin</td>
										<td>
											<xsl:value-of
												select='/ProductDetail/ProductProperties[FieldId = 7]/Options/Title'
												disable-output-escaping='yes'></xsl:value-of>
										</td>
									</tr>
									<tr>
										<td>Price</td>
										<td>
											<xsl:value-of select="/ProductDetail/Price" disable-output-escaping="yes" />
										</td>
									</tr>
								</tbody>
							</table>
							<p class="mota">
								<xsl:value-of select="/ProductDetail/BriefContent" disable-output-escaping="yes" />
							</p>
							<div class="hot-line-wrapper">
								<p>Contact us if you need project advice. </p>
								<p>Hotline<a href="tel:0919170173">0919 170 173</a></p>
							</div>
							<div class="button-wrapper">
								<div class="check-out-button" style="opacity: 1;"><a href='javascript:void(0)'
										onclick="AjaxCart.addproducttocart_details(this); return false;">
										<xsl:attribute name="data-productid">
											<xsl:value-of select="/ProductDetail/ProductId">
											</xsl:value-of>
										</xsl:attribute>
										<xsl:text>Add to cart</xsl:text>
									</a>
								</div>
								<div class="item-quantity"
									style="opacity: 1; position: static; pointer-events: all; z-index: 1;">
									<div class="input-group">
										<div class="input-group-btn">
											<div class="qty-minus btn-number"><em class="mdi mdi-minus"></em></div>
										</div>
										<input class="product-details-quantity form-control input-number" type="text"
											value="1">
										<xsl:attribute name="name">
											<xsl:text>addtocart_</xsl:text>
											<xsl:value-of select="/ProductDetail/ProductId"
												disable-output-escaping="yes"></xsl:value-of>
											<xsl:text>.EnteredQuantity</xsl:text>
										</xsl:attribute>
										</input>
										<div class="input-group-btn">
											<div class="qty-plus btn-number"><em class="mdi mdi-plus"></em></div>
										</div>
									</div>
								</div>
								<div class="social-network-wrapper">
									<p>Share</p>
									<div class="social-button">
										<a href="#">
											<xsl:attribute name="href">
												<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
												<xsl:value-of select="/ProductDetail/FullUrl"></xsl:value-of>
											</xsl:attribute>
											<em class="fab fa-facebook-f"></em>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="product-tab-wrapper">
					<div class="tab-navigation-wrapper">
						<ul>
							<xsl:apply-templates select='/ProductDetail/ProductAttributes' mode='Title'>
							</xsl:apply-templates>
						</ul>
					</div>
					<div class="tab-wrapper">
						<xsl:apply-templates select='/ProductDetail/ProductAttributes' mode='Content'>
						</xsl:apply-templates>
					</div>
				</div>
			</div>
			<div class="others-project">
				<div class="white-title-bg-grey">
					<div class="container">
						<p>Similar product</p>
					</div>
				</div>
				<div class="list-similar">
					<div class="container">
						<div class="row">
							<xsl:apply-templates select='/ProductDetail/ProductOther'></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

	<xsl:template match='ProductImages'>
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
			</div>
		</div>
	</xsl:template>
	<xsl:template match='Options' mode='Color'>
		<a class="color" href="javascript:;">
			<xsl:attribute name="style">
				<xsl:text>background-color:</xsl:text>
				<xsl:value-of select="Color"></xsl:value-of>
				<xsl:text>;</xsl:text>
			</xsl:attribute>
		</a>
	</xsl:template>
	<xsl:template match='ProductAttributes' mode='Title'>
		<li>
			<xsl:if test='position() = 1'>
				<xsl:attribute name='class'>
					<xsl:text>active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<a href="javascript:void(0)">
				<xsl:attribute name='data-type'>
					<xsl:text>tab-</xsl:text>
					<xsl:value-of select='position()'></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select='Title'></xsl:value-of>
			</a>
		</li>
	</xsl:template>
	<xsl:template match='ProductAttributes' mode='Content'>
		<div class="tab-item">
			<xsl:if test='position() = 1'>
				<xsl:attribute name='class'>
					<xsl:text>tab-item active</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name='id'>
				<xsl:text>tab-</xsl:text>
				<xsl:value-of select='position()'></xsl:value-of>
			</xsl:attribute>
			<xsl:value-of select='Content' disable-output-escaping='yes'></xsl:value-of>
		</div>
	</xsl:template>
	<xsl:template match='ProductOther'>
		<div class="col-12 col-sm-6 col-md-4 col-lg-3 mb-10">
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
							<a onclick="AjaxCart.addproducttocart_catalog(this);return false;">
								<xsl:attribute name="data-productid">
									<xsl:value-of select="ProductId"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="title">
									<xsl:value-of select="Title"></xsl:value-of>
								</xsl:attribute>
								<div class="cart-icon"></div>
								<div class="cart-item-quantity">
									<div class="input-group">
										<div class="input-group-btn">
											<div class="qty-minus btn-number"><span class="mdi mdi-minus"></span></div>
										</div>
										<input class="product-details-quantity form-control input-number" type="text"
											value="1">
										<xsl:attribute name="name">
											<xsl:text>addtocart_</xsl:text>
											<xsl:value-of select="ProductId" disable-output-escaping="yes">
											</xsl:value-of>
											<xsl:text>.EnteredQuantity</xsl:text>
										</xsl:attribute>
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

		</div>
	</xsl:template>
</xsl:stylesheet>
