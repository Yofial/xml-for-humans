<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- Root Template -->
	<xsl:template match="/">

		<xsl:variable name="title">
			<xsl:value-of select="document('map.xml')/map/entry[@key='page-title']" />
		</xsl:variable>

		<html>
			<head>
				<link rel="stylesheet"
					href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
					integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
					crossorigin="anonymous" />
				<title><xsl:value-of select="$title" /></title>
			</head>
			<body>
				<div class="container">
					<div class="row">
						<h1><xsl:value-of select="$title" /></h1>
						<table class="table table-bordered">
							<xsl:apply-templates select="node()" />
						</table>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>

	<!-- Elements Template -->
	<xsl:template match="*">

		<xsl:variable name="key">
			<xsl:value-of select="name()" />
		</xsl:variable>
		<xsl:variable name="translated">
			<xsl:value-of select="document('map.xml')/map/entry[@key=$key]" />
		</xsl:variable>
		<xsl:variable name="name">
			<xsl:choose>
				<xsl:when test="$translated != ''">
					<xsl:value-of select="$translated" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$key" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<tr>
			<th scope="row">
				<xsl:value-of select="$name" />
			</th>
			<td>
				<xsl:apply-templates select="text()" />
			</td>
		</tr>

		<!-- Element children -->
		<xsl:if test="*">
			<tr>
				<table class="table table-bordered table-hover">
					<xsl:apply-templates select="*" />
				</table>
			</tr>
		</xsl:if>

	</xsl:template>

	<!-- Text Template -->
	<xsl:template match="text()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
