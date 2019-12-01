<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
	<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<section class="news-detail">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<div class="content">
							<time>
								<xsl:value-of select='/NewsDetail/CreatedDate'></xsl:value-of>
							</time><span class="type-1">
								<xsl:value-of select='/NewsDetail/ZoneTitle'></xsl:value-of>
							</span>
							<h1 class="big-title">
								<xsl:value-of select='/NewsDetail/Title'></xsl:value-of>
								<xsl:value-of select='/NewsDetail/EditLink' disable-output-escaping='yes'>
								</xsl:value-of>
							</h1>
							<div class="full-content">
								<xsl:value-of select='/NewsDetail/FullContent' disable-output-escaping='yes'>
								</xsl:value-of>
							</div>
							<div class="social-share">
								<a href="#">
									<xsl:attribute name='href'>
										<xsl:text>https://www.facebook.com/sharer/sharer.php?u=</xsl:text>
										<xsl:value-of select='/NewsDetail/FullUrl'></xsl:value-of>
									</xsl:attribute>
									<img src="/Data/Sites/1/skins/default/img/fb.jpg" alt="" />
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg"></div>
					<div class="col-lg-3">
						<div class="other-news">
							<h2 class="big-title">Latest news</h2>
							<xsl:apply-templates select='/NewsDetail/NewsOther'></xsl:apply-templates>
						</div>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>
	<xsl:template match='NewsOther'>
		<div class="item">
			<time>
				<xsl:value-of select='CreatedDate'></xsl:value-of>
			</time>
			<h3>
				<a>
					<xsl:attribute name='href'>
						<xsl:value-of select='Url'></xsl:value-of>
					</xsl:attribute>
					<xsl:attribute name='title'>
						<xsl:value-of select='Title'></xsl:value-of>
					</xsl:attribute>
					<xsl:value-of select='Title'></xsl:value-of>
				</a>
			</h3>
		</div>
	</xsl:template>
</xsl:stylesheet>