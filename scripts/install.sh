#!/bin/bash

# Prerequisites:
#	Java

if [ ! -d "./libs" ]; then
	mkdir "libs"
fi
cd libs

# Install necessary components for Docbook Publishing
#	1) Saxon
#	2) Docbook XSL Stylesheets

# Saxon-Basic Install
curl -o saxon.zip http://voxel.dl.sourceforge.net/sourceforge/saxon/saxonb9-1-0-6j.zip
unzip saxon.zip -d saxon

# DocBook v5.0 XSL Stylesheets
curl -o docbook-xsl.zip http://docbook.sourceforge.net/snapshots/docbook-xsl2-snapshot.zip
unzip docbook-xsl.zip -d docbook-xsl

echo "The DocBook tools have been installed."
echo "Publish with: ./scripts/publish.sh"