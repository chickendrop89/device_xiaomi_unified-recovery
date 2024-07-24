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

process_device() {
	dev=$(getprop "ro.boot.hwname");
	[ -z "$dev" ] && dev=tapas;

	setdevicename "$dev";

	case "$dev" in
	topaz)
        echo "I:Variant-Script: Loaded topaz (NFC) variant" | tee -a $LOG_PATH
		setdevicemodel "23021RAA2Y";
	;;
	tapas)
        echo "I:Variant-Script: Loaded tapas variant" | tee -a $LOG_PATH
		setdevicemodel "23021RAAEG";
	;;
	sapphiren)
        echo "I:Variant-Script: Loaded sapphiren (NFC) variant" | tee -a $LOG_PATH
		setdevicemodel "23124RA7EO";
	;;
	sapphire)
        echo "I:Variant-Script: Loaded sapphire variant" | tee -a $LOG_PATH
		setdevicemodel "23129RAA4G";
	;;
	*)
        echo "I:Variant-Script: Loaded tapas variant" | tee -a $LOG_PATH
		setdevicename "tapas";
		setdevicemodel "23021RAAEG";
	;;
	esac
}

process_device;
exit 0;
