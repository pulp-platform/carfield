#!/bin/bash
# Copyright 2023 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>
#
# Replace files in a bender script with override version

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

for f in `find $SCRIPT_DIR/../src/overrides -not -type d -printf "%f\n"`; do
  echo "Removing $f $1.tmp"
  grep -v -P "(?<!overrides/)${f}" $1 > $1.tmp
  diff $1.tmp $@ | grep ">\|<"
  cp $1.tmp $1
done

for f in `find $SCRIPT_DIR/../src/overrides -not -type d -printf "%f\n"`; do
  echo "Removing $f $1.tmp"
  grep -v -P "(?<!overrides/)${f}" $1 > $1.tmp
  diff $1.tmp $@ | grep ">\|<"
  cp $1.tmp $1
done
