#!/bin/bash

# Prerequisites:
#	Java

if [ ! -d "./libs" ]; then
	mkdir "libs"
fi
cd libs

# Install necessary components for Docbook Publishing
#	1) Xalan
#	2) Docbook XSL NS Stylesheets

# Xalan Install
if [ ! -f xalan.zip ]; then
	echo "Downloading and extracting Xalan"
	curl -o xalan.zip http://mirrors.ibiblio.org/pub/mirrors/apache/xml/xalan-j/xalan-j_2_7_1-bin-2jars.zip
	unzip xalan.zip -d xalan
fi

# FOP Install
if [ ! -f fop.zip ]; then
	echo "Downloading and extracting FOP"
	curl -o fop.zip http://mirrors.ibiblio.org/pub/mirrors/apache/xmlgraphics/fop/binaries/fop-0.95-bin.zip
	unzip fop.zip -d fop
fi

# DocBook NS XSL Stylesheets
if [ ! -f docbook-xsl.zip ]; then
	echo "Downloading and extracting DocBook XSL NS"
	curl -o docbook-xsl.zip http://voxel.dl.sourceforge.net/sourceforge/docbook/docbook-xsl-ns-1.75.0.zip
	unzip docbook-xsl.zip -d docbook-xsl
fi

echo "The DocBook XSL tools have been installed."
echo "Publish with: ./scripts/publish.sh"