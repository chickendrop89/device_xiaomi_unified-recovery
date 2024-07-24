#!/bin/bash

 export TARGET_DEVICE_ALT="tapas,sapphire,sapphiren,topaz"
 export OF_MAINTAINER="chickendrop89"
 export FOX_VARIANT="unified"

 # Binaries & Tools
 export FOX_USE_BASH_SHELL=1
 export FOX_USE_NANO_EDITOR=1
 export FOX_USE_TAR_BINARY=1
 export FOX_USE_SED_BINARY=1
 export FOX_USE_XZ_UTILS=1
 export FOX_USE_ZSTD_BINARY=1
 export FOX_ASH_IS_BASH=1

 # OrangeFox Addons
 export FOX_ENABLE_APP_MANAGER=1
 export FOX_DELETE_AROMAFM=1

 # MIUI & Custom ROMs
 export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
 export OF_DEFAULT_KEYMASTER_VERSION=4.1

 # A/B partitioning
 export FOX_VIRTUAL_AB_DEVICE=1
 export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
 export OF_IGNORE_LOGICAL_MOUNT_ERRORS=1
 export OF_ENABLE_LPTOOLS=1
 export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
 export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"

 # Ensure that /sdcard is bind-unmounted before f2fs data repair or format
 export OF_UNBIND_SDCARD_F2FS=1

 # Number of list options before scrollbar creation
 export OF_OPTIONS_LIST_NUM=9

 # Store settings at /data/recovery instead of internal storage
 export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1

 # Flashlight & LEDs
 export OF_FL_PATH1="/system/etc/flashlight"
 export OF_USE_GREEN_LED=0

 # Remove the loop block errors after flashing ZIPs (Workaround)
 export OF_LOOP_DEVICE_ERRORS_TO_LOG=1

 # Use LZ4 ramdisk compression as specified in BoardConfig.mk
 export OF_USE_LZ4_COMPRESSION=1

 # Use latest "magiskboot" binaries as this is a relatively new device
 export FOX_USE_UPDATED_MAGISKBOOT=1

 # Security (Disables MTP & ADB during password prompt)
 export OF_ADVANCED_SECURITY=1

 # Screen settings
 export OF_SCREEN_H=2400
 export OF_STATUS_H=95
 export OF_STATUS_INDENT_LEFT=48
 export OF_STATUS_INDENT_RIGHT=48
 export OF_ALLOW_DISABLE_NAVBAR=0
 export OF_CLOCK_POS=1 # Left & Right

 # CCACHE
 export USE_CCACHE=1
 export CCACHE_EXEC="/usr/bin/ccache"
 export CCACHE_MAXSIZE="32G"
 export CCACHE_DIR="/mnt/ccache"

 # Warn if CCACHE_DIR is an invalid directory
 if [ ! -d ${CCACHE_DIR} ];
  then
    echo "CCACHE Directory/Partition is not mounted at \"${CCACHE_DIR}\""
    echo "Please edit the CCACHE_DIR build variable or mount the directory."
 fi

 export LC_ALL="C"

 # Debugging
 ## export FOX_RESET_SETTINGS=0
 ## export FOX_INSTALLER_DEBUG_MODE=1
 ## export OF_DISPLAY_FORMAT_FILESYSTEMS_DEBUG_INFO=1
