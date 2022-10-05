#!/bin/bash

set -eux

# Usage:
#   place your ttf fonts as format `$(pwd)/data/*.ttf`.
#   execute this script to generate pbf files `$(pwd)/data/<fontname>/*.pbf`

for font in $(find data -type f -name '*.ttf')
do
  filepath=$font
  filepath_without_extension=${filepath%.ttf}
  outdir=$(pwd)/${filepath_without_extension}

  rm -rf "$outdir"
  mkdir -p "$outdir"
  docker run \
    --platform linux/amd64 \
    -v $(pwd)/data:/data \
    -it node-fontnik \
    ./bin/build-glyphs "/${filepath}" "/${filepath_without_extension}"
done
