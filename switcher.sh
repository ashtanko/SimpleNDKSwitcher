#!/usr/bin/env bash

DEFAULT_NDK_PATH=/Users/alexeyshtanko/Library/Android/sdk/ndk-bundle
BUNDLES_NDK_PATH=/Users/alexeyshtanko/Library/Android/sdk/ndk-bundles

sh detector.sh $DEFAULT_NDK_PATH $BUNDLES_NDK_PATH

bundles=()

function do_print_aviable_ndk_bundles() {
    echo "DETECT: ${1##*/}"
    value=${1##*/}
    bundles+=("$value")
}

for path in $BUNDLES_NDK_PATH/*; do
    if [ -d $path ]; then
        do_print_aviable_ndk_bundles $path
    fi
done

for i in "${bundles[@]}"
do
let "typeCounter = $typeCounter + 1"
echo "SELECT BUNDLE: $typeCounter $i"
done

function do_choose() {
    read -r event
    BUNDLES_LENGHT=${#bundles[@]}
    if [ "$event" -ge 1 -a "$event" -le $BUNDLES_LENGHT ]; then
        echo "CHOOSED: ${bundles[$event-1]}"
    else
        echo "OUT OF RANGE, CHOOSE ANOTHER VALUE"
        do_choose
    fi
}

do_choose







