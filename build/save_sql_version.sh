#!/bin/bash

DESTDIR=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script
# the most recent sql update file
CURRENTFILE=`ls -1 $DIR/../sql/update*.sql | xargs -n 1 basename | sort | tail -n 1`
VERSION=`echo $CURRENTFILE | sed "s/update-v.*-to-v//g" | sed "s/\.sql//g"`
echo "Found most recent SQL install version: $VERSION"

CONFIGKEY=`grep "sConfigKey" $DIR/../core/oxconfk.php | awk -F"\"" '{print $2}'`

# the SQL command to write the SQL version to the database
COMMAND="UPDATE oxconfig SET OXVARVALUE=ENCODE('$VERSION', '$CONFIGKEY') WHERE OXMODULE='theme:roxid' AND OXVARNAME='sqlVersion';"

DESTFILE="$DESTDIR/sql/$CURRENTFILE"

echo "" >> $DESTFILE
echo "" >> $DESTFILE
echo $COMMAND >> $DESTFILE
