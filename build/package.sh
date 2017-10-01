#!/bin/bash
ZIP=/usr/bin/zip

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script

source $DIR/package_config.sh


echo "Splitting into copy_this and changed_full"
cd $DIR
rm -rf package_unenc
mkdir package_unenc
cd package_unenc
mkdir copy_this changed_full
cp -r $DIR/productive/* copy_this/
mkdir -p changed_full/application/views
mkdir -p changed_full/out
mv copy_this/application/views/roxid_mod changed_full/application/views/
mv copy_this/out/roxid_mod changed_full/out
mv copy_this/sql .

cd $DIR

echo -e "   Adding install instructions..."
cp $DIR/install_instruction/README.txt .

echo -e "   Compressing to $FILENAME..."
rm -f ../$FILENAME
$ZIP -r -9 -q ../$FILENAME *

cd ..
rm -r package/

echo "Creating package"
cd package_unenc

echo "   Adding install instructions..."
cp $DIR/install_instruction/README.txt .

echo "   Adding license comment..."
for FILE in `find . -type f -name "*.php"`
do
  $DIR/add_license.rb $FILE $DIR/license_comment.txt > tmp.php
  mv tmp.php $FILE
done

echo "   Compressing to $FILENAME..."
rm -f ../$FILENAME
$ZIP -r -9 -q ../$FILENAME *
cd ..
rm -r package_unenc
