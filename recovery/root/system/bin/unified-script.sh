#!/system/bin/sh
# This script is needed to automatically set device props.

LOG_PATH=/tmp/recovery.log

setdevicename() {
    resetprop "ro.product.name" "$1"
    resetprop "ro.build.product" "$1"
    resetprop "ro.vendor.product.device" "$1"
    resetprop "ro.system.product.device" "$1"
    resetprop "ro.system_ext.product.device" "$1"
    resetprop "ro.odm.product.device" "$1"
    resetprop "ro.product.device" "$1"
    resetprop "ro.product.product.device" "$1"
    resetprop "ro.product.bootimage.device" "$1"
    resetprop "ro.product.odm.device" "$1"
    resetprop "ro.product.system.device" "$1"
    resetprop "ro.product.system_ext.device" "$1"
    resetprop "ro.product.vendor.device" "$1"
    resetprop "ro.product.board" "$1"
}

setdevicemodel() {
    resetprop "ro.product.model" "$1"
    resetprop "ro.product.vendor.model" "$1"
    resetprop "ro.product.odm.model" "$1"
    resetprop "ro.product.system.model" "$1"
    resetprop "ro.product.system_ext.model" "$1"
    resetprop "ro.product.product.model" "$1"
}

load_tapas()
{
    echo "I:Variant-Script: Loaded tapas variant" | tee -a $LOG_PATH
    setdevicename "tapas"
    setdevicemodel "23021RAAEG"
}

load_topaz()
{
    echo "I:Variant-Script: Loaded topaz (NFC) variant" | tee -a $LOG_PATH
    setdevicename "topaz"
    setdevicemodel "23021RAA2Y"
}

variant=$(resetprop ro.boot.hwname)

case $variant in
    "tapas")
        load_tapas
        ;;
    "topaz")
        load_topaz
        ;;
    *)
        load_tapas
        ;;
esac

exit 0