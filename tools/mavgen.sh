#!/bin/bash

mavgen=$1
xml=$2
out=$3

$mavgen --lang C --wire-protocol 2.0 -o $(dirname "$out")/mavlink $xml
touch $out
