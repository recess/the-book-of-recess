#!/bin/bash

saxon="libs/saxon/saxon9.jar"
xsl="libs/docbook-xsl/docbook-xsl2-snapshot/base/html/docbook.xsl"

recessdocbook="recess-docbook.xml"
output="pub/recess.html"

if [ ! -f $saxon ]; then
	echo "Saxon not found. Run install script: ./scripts/install.sh"
	exit
fi

if [ ! -f $xsl ]; then
	echo "XSL2 stylesheets not found. Run install script: ./scripts/install.sh"
	exit
fi

if [ ! -d "pub" ]; then
	mkdir pub
fi

java -jar $saxon -xi:on -o $output $recessdocbook $xsl

echo "Published Recess DocBook to $recessdocbook"