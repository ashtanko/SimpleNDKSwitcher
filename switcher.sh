#!/usr/bin/env bash

DEFAULT_NDK_PATH=/Users/$USER/Library/Android/sdk/ndk-bundle
BUNDLES_NDK_PATH=/Users/$USER/Library/Android/sdk/ndk-bundles
NDK_BUILD_NUMBER=$1
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
if [ ! "$NDK_BUILD_NUMBER" ]; then
    read -r event
    NDK_BUILD_NUMBER=event
    exit 1
else
    echo "$NDK_BUILD_NUMBER"
fi

    BUNDLES_LENGHT=${#bundles[@]}
    if [ "$NDK_BUILD_NUMBER" -ge 1 -a "$NDK_BUILD_NUMBER" -le $BUNDLES_LENGHT ]; then
        echo "CHOOSED: ${bundles[$NDK_BUILD_NUMBER-1]} ON PATH: $BUNDLES_NDK_PATH/${bundles[$NDK_BUILD_NUMBER-1]}"
        export ANDROID_NDK="$BUNDLES_NDK_PATH/${bundles[$NDK_BUILD_NUMBER-1]}"
        echo $ANDROID_NDK
    else
        echo "OUT OF RANGE, CHOOSE ANOTHER VALUE"
        do_choose
    fi
}

do_choose







