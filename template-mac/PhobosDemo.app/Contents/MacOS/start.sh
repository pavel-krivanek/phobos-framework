#!/bin/sh

set -e

SELF_PATH=$(cd -P -- "$(dirname -- "$0")" &&  pwd -P) && SELF_PATH=$SELF_PATH/$(basename -- "$0")

# resolve symlinks
while [ -h $SELF_PATH ]; do
    DIR=$(dirname -- "$SELF_PATH")
    SYM=$(readlink $SELF_PATH)
    SELF_PATH=$(cd $DIR && cd $(dirname -- "$SYM") && pwd)/$(basename -- "$SYM")
done

CUR_DIR=$(dirname "$SELF_PATH")
CUR_DIR=$(dirname "$CUR_DIR")

"$CUR_DIR"/Frameworks/XUL.framework/Versions/20.0.1/xulrunner -app "$CUR_DIR"/Resources/application.ini 
