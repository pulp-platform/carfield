#!/bin/bash
# Copyright 2023 ETH Zurich and University of Bologna.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
#
# Cyril Koenig <cykoenig@iis.ee.ethz.ch>

# Replace files in a bender script with override version

for f in `find src/overrides -not -type d -printf "%f\n"`; do
  echo "Removing $f"
  grep -v -P "(?<!overrides/)${f}" $1 > overrides-tmp
  diff overrides-tmp $@ | grep ">\|<"
  cp overrides-tmp $1
done

for f in `find src/overrides -not -type d -printf "%f\n"`; do
  echo "Removing $f"
  grep -v -P "(?<!overrides/)${f}" $1 > overrides-tmp
  diff overrides-tmp $@ | grep ">\|<"
  cp overrides-tmp $1
done
