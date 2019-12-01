<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />

	<xsl:template match="/">

		<xsl:if test="count(/CheckoutMethod/Payment)>0">
			<div class="checkout-title">
				<h3><span class="fas fa-shopping-cart"></span><span>Phương thức vận chuyển</span></h3>
			</div>
			<div class="cart-payment-wrapper">
				<div class="payment-row">
					<xsl:apply-templates select="/CheckoutMethod/Shipping"></xsl:apply-templates>
				</div>
			</div>
		</xsl:if>

	</xsl:template>

	<xsl:template match="Shipping">
		<div class="form-group">
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
		</div>
	</xsl:template>

</xsl:stylesheet>