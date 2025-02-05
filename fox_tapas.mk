# OrangeFox maintainer - this will be shown on about screen
OF_MAINTAINER := chickendrop89

# Screen settings
OF_SCREEN_H := 2400
OF_STATUS_H := 95
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_ALLOW_DISABLE_NAVBAR := 0
OF_CLOCK_POS := 1 # Left & Right

# MIUI & Custom ROMs
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1
OF_DEFAULT_KEYMASTER_VERSION := 4.1

# A/B partitioning
OF_AB_DEVICE_WITH_RECOVERY_PARTITION := 1
OF_IGNORE_LOGICAL_MOUNT_ERRORS := 1
OF_ENABLE_ALL_PARTITION_TOOLS := 1

# Flashlight & LEDs
OF_FL_PATH1	:= /system/etc/flashlight
OF_USE_GREEN_LED := 0

# Remove the loop block errors after flashing ZIPs (Workaround)
OF_LOOP_DEVICE_ERRORS_TO_LOG := 1

# Security (Disables MTP & ADB during password prompt)
OF_ADVANCED_SECURITY := 1

# Ensure that /sdcard is bind-unmounted before f2fs data repair or format
OF_UNBIND_SDCARD_F2FS := 1

# Number of list options before scrollbar creation
OF_OPTIONS_LIST_NUM := 9
