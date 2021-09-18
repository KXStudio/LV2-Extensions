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

cp kx-control-input-port-change-request.lv2/* documentation/cipcr/
cp kx-external-ui.lv2/*                       documentation/extui/
cp kx-programs.lv2/*                          documentation/progs/
cp kx-rtmempool.lv2/*                         documentation/rtmpl/

lv2specgen.py $(pwd)/kx-control-input-port-change-request.lv2/manifest.ttl /usr/share/lv2specgen/ ../style.css $(pwd)/documentation/cipcr/index.html $(pwd)/documentation/cipcr "" -i -p cipcr
lv2specgen.py $(pwd)/kx-external-ui.lv2/manifest.ttl                       /usr/share/lv2specgen/ ../style.css $(pwd)/documentation/extui/index.html $(pwd)/documentation/extui "" -i -p extui
lv2specgen.py $(pwd)/kx-programs.lv2/manifest.ttl                          /usr/share/lv2specgen/ ../style.css $(pwd)/documentation/progs/index.html $(pwd)/documentation/progs "" -i -p progs
lv2specgen.py $(pwd)/kx-rtmempool.lv2/manifest.ttl                         /usr/share/lv2specgen/ ../style.css $(pwd)/documentation/rtmpl/index.html $(pwd)/documentation/rtmpl "" -i -p rtmpl
