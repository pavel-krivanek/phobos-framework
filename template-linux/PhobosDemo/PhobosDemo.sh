#!/bin/bash

which xulrunner >/dev/null 2>&1 || {
  [ $(uname) == 'Darwin' ] && PATH=/Library/Frameworks/XUL.framework/Versions/Current/:${PATH}
}

xulrunner -app $(cd $(dirname $0); pwd)/application.ini $@
