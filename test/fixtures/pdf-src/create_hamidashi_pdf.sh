#!/bin/sh

set -ex

bundle exec review-pdfmaker config.yml
mv hamidashi.pdf ..

