#!/bin/sh

set -ex

if [ -d hamidashi-pdf ]
then
  rm -rf hamidashi-pdf
fi

bundle exec review-pdfmaker config.yml
mv hamidashi.pdf ..
