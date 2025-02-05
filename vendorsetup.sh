#!/bin/bash

 export TARGET_DEVICE_ALT="tapas,sapphire,sapphiren,topaz"
 export FOX_VARIANT="unified"

 # Binaries & Tools
 export FOX_USE_BASH_SHELL=1
 export FOX_USE_TAR_BINARY=1
 export FOX_USE_SED_BINARY=1
 export FOX_USE_XZ_UTILS=1
 export FOX_USE_ZSTD_BINARY=1
 export FOX_ASH_IS_BASH=1

 # OrangeFox Addons
 export FOX_ENABLE_APP_MANAGER=1
 export FOX_DELETE_AROMAFM=1
 export FOX_DELETE_INITD_ADDON=1

 # A/B partitioning
 export FOX_VIRTUAL_AB_DEVICE=1
 export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
 export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

 # Store settings at /data/recovery instead of internal storage
 # export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1

 # Use latest "magiskboot" binaries as this is a relatively new device
 export FOX_USE_UPDATED_MAGISKBOOT=1

 # CCACHE
 export USE_CCACHE=1
 export CCACHE_EXEC="/usr/bin/ccache"
 export CCACHE_MAXSIZE="32G"
 export CCACHE_DIR="/mnt/ccache"

 # Warn if CCACHE_DIR is an invalid directory
 if [ $USE_CCACHE = 1 ] && [ ! -d ${CCACHE_DIR} ];
  then
    echo "CCACHE Directory/Partition is not mounted at \"${CCACHE_DIR}\""
    echo "Please edit the CCACHE_DIR build variable or mount the directory."
 fi

 export LC_ALL="C"

 # Debugging
 ## export FOX_RESET_SETTINGS=0
 ## export FOX_INSTALLER_DEBUG_MODE=1
