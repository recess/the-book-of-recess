<?xml version='1.0'?> 
<xsl:stylesheet  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"> 


<xsl:import href="../libs/docbook-xsl/docbook-xsl-ns-1.75.0/xhtml-1_1/docbook.xsl"/>
<xsl:import href="../libs/docbook-xsl/docbook-xsl-ns-1.75.0/highlighting/common.xsl"/>
<xsl:import href="../libs/docbook-xsl/docbook-xsl-ns-1.75.0/xhtml-1_1/highlight.xsl"/>

<xsl:param name="html.stylesheet">screen.css style.css</xsl:param>

<xsl:template match="*" mode="process.root">
  <xsl:variable name="doc" select="self::*"/>

  <xsl:call-template name="user.preroot"/>
  <xsl:call-template name="root.messages"/>

  <html>
    <head>
      <xsl:call-template name="system.head.content">
        <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
      <xsl:call-template name="head.content">
        <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
      <xsl:call-template name="user.head.content">
        <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
    </head>
    <body>
 	 <div class="container">
  	 <div class="span-18 push-3">
      <xsl:call-template name="body.attributes"/>
      <xsl:call-template name="user.header.content">
        <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
      <xsl:apply-templates select="."/>
      <xsl:call-template name="user.footer.content">
        <xsl:with-param name="node" select="$doc"/>
      </xsl:call-template>
   	  </div>
      </div>
    </body>
  </html>
  <xsl:value-of select="$html.append"/>
</xsl:template>

</xsl:stylesheet>