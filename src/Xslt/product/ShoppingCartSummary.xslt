<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt"
 exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">
		<xsl:if test="/ShoppingCart/Address != ''">
			<div class="checkout-title">
				<h3 class="title">
					<xsl:value-of select="/ShoppingCart/AddressText"></xsl:value-of>
				</h3>
				<a class="btn-edit">
					<xsl:attribute name="href">
						<xsl:text>/checkoutaddress</xsl:text>
					</xsl:attribute>
					<xsl:value-of select="/ShoppingCart/ChangeText"></xsl:value-of>
				</a>
			</div>
			<div class="cart-order-summary">
				<table class="table">
					<tbody>
						<tr>
							<td colspan="2">
								<xsl:value-of select="/ShoppingCart/LastName"></xsl:value-of>
								<xsl:value-of select="/ShoppingCart/FirstName"></xsl:value-of>
							</td>
						</tr>
						<tr>
							<td>
								<span>
									<xsl:text>Số điện thoại:</xsl:text>
								</span>
							</td>
							<td>
								<xsl:value-of select="/ShoppingCart/Phone"></xsl:value-of>
							</td>
						</tr>
						<tr>
							<td>
								<span>
									<xsl:text>Địa chỉ:</xsl:text>
								</span>
							</td>
							<td>
								<xsl:value-of select="/ShoppingCart/Address"></xsl:value-of>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</xsl:if>
		<div class="checkout-title">
			<h3><span class="fas fa-shopping-cart"></span>
				<span>
					<xsl:value-of select="/ShoppingCart/CartText"></xsl:value-of> (
				</span>
				<span>
					<xsl:value-of select="/ShoppingCart/TotalProducts"></xsl:value-of>
				</span>
				<span>
					<xsl:value-of select="/ShoppingCart/ProductText"></xsl:value-of>)
				</span>
			</h3>
			<a class="btn-edit">
				<xsl:attribute name="href">
					<xsl:value-of select="/ShoppingCart/CartPageUrl"></xsl:value-of>
				</xsl:attribute>
				<xsl:value-of select="/ShoppingCart/ChangeText"></xsl:value-of>
			</a>
		</div>
		<div class="cart-order-summary">
			<table>
				<tbody>
					<xsl:apply-templates select="/ShoppingCart/CartItem"></xsl:apply-templates>
					<tr class="amount">
						<td>Tạm tính</td>
						<td>
							<xsl:value-of select="/ShoppingCart/SubTotal"></xsl:value-of>
						</td>
					</tr>
					<tr class="amount">
						<td>Giảm giá
							<!-- <span class="fas fa-question-circle" data-toggle="tooltip" data-placement="top" title="Tooltip nội dung ở đây"></span> -->
						</td>
						<td>
							<xsl:value-of select="/ShoppingCart/DiscountTotal"></xsl:value-of>
						</td>
					</tr>
					<tr class="amount">
						<td>Phí vận chuyển</td>
						<td>
							<xsl:value-of select="/ShoppingCart/ShippingTotal"></xsl:value-of>
						</td>
					</tr>
					<tr class="amount price">
						<td>Số tiền phải thanh toán</td>
						<td>
							<xsl:value-of select="/ShoppingCart/Total"></xsl:value-of>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</xsl:template>

	<xsl:template match="CartItem">
		<tr>
			<td>
				<figure>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="Url"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="target">
							<xsl:value-of select="target"></xsl:value-of>
						</xsl:attribute>
						<img>
						<xsl:attribute name="src">
							<xsl:value-of select="ThumbnailUrl"></xsl:value-of>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="Title"></xsl:value-of>
						</xsl:attribute>
						</img>
					</a>
					<figcaption>
						<h4>

							<a>
								<xsl:attribute name="href">
									<xsl:value-of select="Url"></xsl:value-of>
								</xsl:attribute>
								<xsl:attribute name="target">
									<xsl:value-of select="target"></xsl:value-of>
								</xsl:attribute>
								<xsl:value-of select="Title"></xsl:value-of>
							</a>
						</h4>
						<p>
							<xsl:value-of select="Code"></xsl:value-of>
						</p>
					</figcaption>
				</figure>
				
				<xsl:if test="GiftProduct !=''">
					<div class="miniGift">
						<xsl:value-of select="GiftProduct" disable-output-escaping="yes"></xsl:value-of>
					</div>
				</xsl:if>
			</td>
			<td>
				<p class="price">
					<xsl:value-of select="Price"></xsl:value-of>
				</p>
				<p> <span>x </span>
					<span class="quantity">
						<xsl:value-of select="Quantity"></xsl:value-of>
					</span></p>
				<p class="total-price">
					<xsl:value-of select="ItemTotal"></xsl:value-of>
				</p>
			</td>
		</tr>


	</xsl:template>

</xsl:stylesheet>