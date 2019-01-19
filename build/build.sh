#!/bin/bash
NPM="/usr/local/bin/npm"
SLIDER_DIR="../modules/responsive_slider"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script

usage() {
  echo "Usage: $0 [-t TAG] [-n]"
  echo "Available options:"
  echo -e "\t-d\tbuild destination relative to build/. Default: productive/"
  echo -e "\t-g\tdo NOT use Grunt to build assets. Should ONLY be used by build scripts for ROXIDx."
  echo -e "\t-h\tprint this message"
  echo -e "\t-t\tBuild the version with a specified git tag"
}

TAG=""
DEST="productive"
GRUNT=true

while getopts "d:ght:" opt; do
  case "$opt" in
    d)
      DEST=$OPTARG
      ;;
    g)
      GRUNT=false
      ;;
    h)
      usage
      exit 0
      ;;
    t)
      TAG=$OPTARG
      ;;
  esac
done

cd $DIR
if [ "$DEST" != "productive" ]; then
  if [ "$(ls -A $DEST)" ]; then
     echo "Build destination $DEST is not empty. Exititng."
     exit 1
  fi
else
  rm -rf $DEST
  mkdir $DEST
fi

cd $DIR
rm -rf tmp
rm -rf encoder/encrypted_*

mkdir tmp
cd tmp

echo "Retrieving code from GIT repo..."
git clone --quiet ../.. .
if [[ -n "$TAG" ]]; then
  echo "Checking out commit tagged with: $TAG"
  git checkout --quiet tags/$TAG
fi

echo "Deleting files not needed in productive build..."
find . -type f -name ".gitkeep" -delete
find . -type f -name "*.ai" -delete
find . -type f -name "*.psd" -delete
find . -type f -name "README.md" -delete
find . -type f -name "UPGRADE.md" -delete
rm -rf .git .gitignore .ackrc .sass-cache *.sublime-project *.sublime-workspace build/


# install bower modules
echo "Installing Bower modules..."
cd out/roxid
bower install --quiet --production
cd ../..


if [ "$GRUNT" = true ]; then
  echo "Installing required NPM modules for Grunt..."
  # use node_modules from dev version. provides a significant speedup of built process
  cp -r $DIR/../node_modules .
  npm install
  echo "Running Grunt..."
  grunt all
  rm -rf node_modules .sass-cache

  # remove asset compiler assets src
  rm -rf modules/roxid/asset_compiler/assets/src
fi

echo "Copying logo and favicon from ROXID to ROXID_mod"
cp out/roxid/src/favicons/favicon.png out/roxid_mod/src/favicons/
cp out/roxid/img/logo.png out/roxid/img/logo_email.png out/roxid/img/pdf_logo.jpg out/roxid_mod/img

echo "Adjusting LiveReload Port for ROXID_mod"
cp $DIR/livereload_productive.tpl application/views/roxid/tpl/widget/livereload.tpl

if [ "$GRUNT" = true ]; then
  echo "Removing ROXID Grunt config and replacing it by ROXID_mod Grunt config"
  rm -r grunt Gruntfile.coffee
  sed 's/grunt_mod\//grunt\//g' Gruntfile_mod.coffee > Gruntfile.coffee
  rm Gruntfile_mod.coffee
  mv grunt_mod grunt

  echo "Installing required NPM modules for Grunt (for ROXID_mod)..."
  # use node_modules from dev version. provides a significant speedup of built process
  cp -r $DIR/../node_modules .
  npm install
  echo "Running Grunt (for ROXID_mod)..."
  grunt
  rm -rf node_modules .sass-cache
fi

echo "Building installation SQL..."
$DIR/save_sql_version.sh $DIR/tmp/
cd $DIR/tmp/sql
cat install-base.sql update*.sql install-v*.sql > install.sql
rm install-v*.sql
rm install-base.sql

cd $DIR
mv tmp/* $DEST

