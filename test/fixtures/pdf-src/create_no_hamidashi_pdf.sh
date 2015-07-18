#!/bin/sh

set -ex

cd $(dirname $0)

if [ -d hamidashi-pdf ]
then
  rm -rf hamidashi-pdf
fi

cp catalog-no_hamidashi.yml catalog.yml

bundle exec review-pdfmaker config.yml
mv hamidashi.pdf ../no_hamidashi.pdf
