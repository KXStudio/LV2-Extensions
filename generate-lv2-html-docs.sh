#!/bin/bash

set -e

if [ ! -d kx-external-ui.lv2 ]; then
  echo "kx-external-ui.lv2 bundle missing"
  exit
fi

if (! which lv2specgen.py >/dev/null); then
  echo "lv2specgen.py tool missing"
  exit
fi

if [ ! -d documentation ]; then
  mkdir documentation
fi

if [ ! -f documentation/style.css ]; then
  git clone git://github.com/KXStudio/LV2-Extensions --depth 1 -b gh-pages documentation
fi

cp kx-external-ui.lv2/* documentation/extui/

lv2specgen.py $(pwd)/kx-external-ui.lv2/manifest.ttl /usr/share/lv2specgen/ ../style.css $(pwd)/documentation/extui/index.html $(pwd)/documentation/extui "" -i -p extui
