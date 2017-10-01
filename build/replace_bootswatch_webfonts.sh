#!/bin/bash
DIR="out/roxid/src/css/colorthemes"
echo "Replacing all @import commands for webfonts with variable definitions"
sed -i ".sedbackup" 's/@web-font-path: "https:\/\/fonts.googleapis.com\/css?family=\(.*\)";/@fonts_bootswatch: "\1";/g' $DIR/theme_*/bootswatch.less
rm $DIR/theme_*/*.sedbackup

for FILE in $DIR/theme_*/bootswatch.less
  do
  THEMEDIR=`dirname $FILE`
  grep "@fonts_bootswatch" $FILE > $THEMEDIR/fonts.less
  grep -v "@fonts_bootswatch" $FILE | grep -v ".web-font(@web-font-path);" > $THEMEDIR/bootswatch.less.new
  mv $THEMEDIR/bootswatch.less.new $THEMEDIR/bootswatch.less
done
