#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #directory of the current script
find application/views/roxid* -name "*.tpl" | xargs -I{} cat {} | grep "{\$oViewConf->getRoxidIc" | $DIR/icons_check.rb | grep ERROR
