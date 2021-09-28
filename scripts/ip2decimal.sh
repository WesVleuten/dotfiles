#!/bin/bash
IFS=.
read a b c d <<< "$@"
echo $((a * 256 ** 3 + b * 256 ** 2 + c * 256 + d))
