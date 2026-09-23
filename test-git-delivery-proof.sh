#!/bin/sh
set -eu
actual=$(cat git-delivery-proof.txt)
[ "$actual" = "Animus Git delivery proof" ]
