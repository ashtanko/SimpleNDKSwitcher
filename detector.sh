#!/usr/bin/env bash

DEFAULT_NDK_PATH=$1
BUNDLES_NDK_PATH=$2

DETECT_ON_BLUEPRINT="DETECT ON"

function do_detect_default_ndk() {
    if [ -d $DEFAULT_NDK_PATH ]; then
        echo "DEFAULT NDK PATH $DETECT_ON_BLUEPRINT: $DEFAULT_NDK_PATH"
    fi
}

function do_detect_ndk_bundles() {
    if [ -d $DEFAULT_NDK_PATH ]; then
        echo "BUNDLES NDK PATH $DETECT_ON_BLUEPRINT: $BUNDLES_NDK_PATH"
    fi
}

function do_detect_ndk_system_path() {
    if [ -z "$ANDROID_NDK" ]; then
        echo "SET ANDROID_NDK TO PATH"
        exit 1
    else
        echo "ANDROID_NDK $DETECT_ON_BLUEPRINT: $ANDROID_NDK"
    exit 1
    fi
}

do_detect_default_ndk
do_detect_ndk_bundles
do_detect_ndk_system_path



