#!/bin/bash

URL="https://bootswatch.com"
DIR="out/roxid/src/css/colorthemes"

cd $DIR
for FILE in theme_*/bootswatch.less
  do
  THEMEDIR=`dirname $FILE`
  THEME=${THEMEDIR/theme_/}

  # don't download anything for the default theme
  if [[ "$THEME" == "default" ]]; then
    continue
  fi

  echo "Getting files for $THEME..."
  echo -e "\t$URL/$THEME/bootswatch.less"
  curl --silent -o $THEMEDIR/bootswatch.less $URL/$THEME/bootswatch.less
  echo -e "\t$URL/$THEME/variables.less"
  curl --silent -o $THEMEDIR/variables.less $URL/$THEME/variables.less
done
