<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">

		<xsl:if test="count(/CheckoutMethod/Shipping)>0">
			<div class="checkout-title">
				<h3><span class="fas fa-shopping-cart"></span><span>Phương thức vận chuyển</span></h3>
			</div>
			<div class="cart-payment-wrapper">
				<div class="payment-row">
					<xsl:apply-templates select="/CheckoutMethod/Shipping"></xsl:apply-templates>
				</div>
			</div>
		</xsl:if>
		<xsl:if test="count(/CheckoutMethod/Payment)>0">
			<div class="checkout-title">
				<h3><span class="fas fa-shopping-cart"></span><span>Phương thức thanh toán</span></h3>
			</div>
			<div class="cart-payment-wrapper">
				<div class="payment-row">
					<xsl:apply-templates select="/CheckoutMethod/Payment"></xsl:apply-templates>
				</div>
				<div class="agree" style="margin-top: .5rem; display: none">
					<input id="PaymentAgree" type="checkbox" checked="checked" name="PaymentAgree" required="required"
						aria-required="" />
					<label for="PaymentAgree">Tôi đã đọc và đồng ý điều khoản trên</label>
				</div>
			</div>
		</xsl:if>


		<div class="cart-button-checkout">
			<a class="btn btn-prev">
				<xsl:attribute name="href">
					<xsl:text>/gio-hang</xsl:text>
				</xsl:attribute>
				<span class="mdi mdi-chevron-left"></span>
				<span>Quay lại</span>
			</a>
			<a class="btn btn-next">
				<xsl:attribute name="onclick">
					<xsl:text>AjaxCheckout.saveorder(true, '</xsl:text>
					<xsl:text>/checkout-complete</xsl:text>
					<!-- <xsl:value-of select="/CheckoutMethod/NextPageUrl"></xsl:value-of> -->
					<xsl:text>');return false;</xsl:text>
				</xsl:attribute>
				<span>
					<!-- <xsl:value-of select="/CheckoutAddress/ContinueShoppingText"></xsl:value-of> -->
					Tiếp tục
				</span>
				<span class="mdi mdi-chevron-right"></span>
			</a>
		</div>
	</xsl:template>

	<xsl:template match="Shipping">
		<div class="method">
			<input type="radio" name="ShippingMethod">
			<xsl:attribute name="id">
				<xsl:value-of select="Id"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="Id"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="position()=1">
				<xsl:attribute name="checked">
					<xsl:text>checked</xsl:text>
				</xsl:attribute>
			</xsl:if>
			</input>
			<label style="text-align: center;">
				<xsl:attribute name="for">
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<!-- <div class="img">
							<img>
							<xsl:attribute name="src">
								<xsl:value-of select="ImageUrl"></xsl:value-of>
							</xsl:attribute>
							<xsl:attribute name="alt">
								<xsl:value-of select="Title"></xsl:value-of>
							</xsl:attribute>
							</img>
						</div>
						<div class="text">
						</div> -->

				<!-- <xsl:if test="position()=1">
							<xsl:attribute name="class">
								<xsl:text>active</xsl:text>
							</xsl:attribute>
						</xsl:if> -->
				<xsl:if test="Description!=''">
					<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
				</xsl:if>
				<xsl:if test="Description = ''">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:if>
			</label>
		</div>
		<!-- <div class="form-group method">
			<input type="radio" name="ShippingMethod" onchange="AjaxCheckout.getshippingtotal(this)">
			<xsl:if test="position()=1">
				<xsl:attribute name="checked">
					<xsl:text>checked</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<xsl:attribute name="value">
				<xsl:value-of select="Id"></xsl:value-of>
			</xsl:attribute>
			</input>
			<label>
				<xsl:value-of select="Title"></xsl:value-of>
			</label>
			<xsl:if test="Description!=''">
				<div class="des">
					<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
				</div>
			</xsl:if>
		</div> -->
	</xsl:template>

	<xsl:template match="Payment">
		<div class="method">
			<input type="radio" name="PaymentMethod">
			<xsl:attribute name="id">
				<xsl:value-of select="Id"></xsl:value-of>
			</xsl:attribute>
			<xsl:attribute name="value">
				<xsl:value-of select="Id"></xsl:value-of>
			</xsl:attribute>
			<xsl:if test="position()=1">
				<xsl:attribute name="checked">
					<xsl:text>checked</xsl:text>
				</xsl:attribute>
			</xsl:if>
			</input>
			<label>
				<xsl:attribute name="for">
					<xsl:value-of select="Id"></xsl:value-of>
				</xsl:attribute>
				<!-- <div class="img">
					<img>
					<xsl:attribute name="src">
						<xsl:value-of select="ImageUrl"></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name="alt">
						<xsl:value-of select="Title"></xsl:value-of>
					</xsl:attribute>
					</img>
				</div>
				<div class="text">
				</div> -->

				<!-- <xsl:if test="position()=1">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if> -->
				<xsl:if test="Description!=''">
					<xsl:value-of select="Description" disable-output-escaping="yes"></xsl:value-of>
				</xsl:if>
				<xsl:if test="Description = ''">
					<xsl:value-of select="Title" disable-output-escaping="yes"></xsl:value-of>
				</xsl:if>
			</label>
		</div>
	</xsl:template>

</xsl:stylesheet>