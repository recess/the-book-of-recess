#!/bin/bash

input=recess-docbook.xml

base=`pwd`
xalan=libs/xalan/xalan-j_2_7_1
xsl=libs/docbook-xsl/docbook-xsl-ns-1.75.0
xslChunked=$xsl/html/chunk.xsl
xslAllInOne=$xsl/html/docbook.xsl
xslFO=$xsl/fo/docbook.xsl
fop=libs/fop/fop-0.95
outputAllInOne=pub/html/the-book-of-recess.html
outputChunked=pub/html/index.html
outputFO=pub/fo/the-book-of-recess.fo
outputPDF=pub/pdf/the-book-of-recess.pdf

if [ ! -f $xalan/xalan.jar ]; then
	echo "Xalan not found. Run install script: ./scripts/install.sh"
	exit
fi

if [ ! -f $xsl_template ]; then
	echo "XSL stylesheets not found. Run install script: ./scripts/install.sh"
	exit
fi

if [ ! -d "pub" ]; then
	mkdir pub
fi

if [ ! -d "pub/html" ]; then
	mkdir pub/html
fi

if [ ! -d "pub/fo" ]; then
	mkdir pub/fo
fi

if [ ! -d "pub/pdf" ]; then
	mkdir pub/pdf
fi

java \
	-Djava.endorsed.dirs=$xalan  \
    -cp "$xalan/xalan.jar;$xalan/xml-apis.jar;$xalan/xercesImpl.jar;$xsl/extensions/xalan27.jar" \
    -Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration \
	org.apache.xalan.xslt.Process \
    -in $input  \
    -out $outputChunked  \
    -xsl $xslChunked  \
    -param use.extensions 1

java \
	-Djava.endorsed.dirs=$xalan  \
    -cp "$xalan/xalan.jar;$xalan/xml-apis.jar;$xalan/xercesImpl.jar;$xsl/extensions/xalan27.jar" \
    -Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration \
	org.apache.xalan.xslt.Process \
    -in $input  \
    -out $outputAllInOne  \
    -xsl $xslAllInOne  \
    -param use.extensions 1
    
java \
	-Djava.endorsed.dirs=$xalan  \
    -cp "$xalan/xalan.jar;$xalan/xml-apis.jar;$xalan/xercesImpl.jar;$xsl/extensions/xalan27.jar" \
    -Dorg.apache.xerces.xni.parser.XMLParserConfiguration=org.apache.xerces.parsers.XIncludeParserConfiguration \
	org.apache.xalan.xslt.Process \
    -in $input  \
    -out $outputFO  \
    -xsl $xslFO  \
    -param use.extensions 1
    
cd $fop
java \
	-jar "build/fop.jar" \
	-fo ../../../$outputFO -pdf ../../../$outputPDF

cd $base

echo "Published Recess DocBook to $output"