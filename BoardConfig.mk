#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/tapas

# Architecture
TARGET_ARCH                := arm64
TARGET_ARCH_VARIANT        := armv8-a
TARGET_CPU_ABI             := arm64-v8a
TARGET_CPU_ABI2            :=
TARGET_CPU_VARIANT         := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT    := armv7-a-neon
TARGET_2ND_CPU_ABI         := armeabi-v7a
TARGET_2ND_CPU_ABI2        := armeabi
TARGET_2ND_CPU_VARIANT     := cortex-a9

# Bootloader
TARGET_NO_BOOTLOADER          := true
TARGET_USES_UEFI              := true

# Platform
TARGET_BOARD_PLATFORM         := bengal
TARGET_BOARD_PLATFORM_GPU     := qcom-adreno610
BOARD_USES_QCOM_HARDWARE      := true

# Kernel
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_BOOT_HEADER_VERSION := 3
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_IMAGE_NAME := Image.gz
BOARD_KERNEL_SEPARATED_DTBO := true
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET := 0x00000100
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

BOARD_KERNEL_CMDLINE += androidboot.console=ttyMSM0
BOARD_KERNEL_CMDLINE += androidboot.usbcontroller=4e00000.dwc3
BOARD_KERNEL_CMDLINE += androidboot.fstab_suffix=default
BOARD_KERNEL_CMDLINE += androidboot.hardware=qcom
BOARD_KERNEL_CMDLINE += androidboot.memcg=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += console=ttyMSM0,115200n8
BOARD_KERNEL_CMDLINE += earlycon=msm_geni_serial,0x4a90000
BOARD_KERNEL_CMDLINE += loop.max_part=7
BOARD_KERNEL_CMDLINE += lpm_levels.sleep_disabled=1
BOARD_KERNEL_CMDLINE += msm_rtb.filter=0x237
BOARD_KERNEL_CMDLINE += service_locator.enable=1
BOARD_KERNEL_CMDLINE += swiotlb=2048

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CONFIG := vendor/fog-perf_defconfig
TARGET_KERNEL_HEADERS := kernel/xiaomi/fog
TARGET_KERNEL_SOURCE := kernel/xiaomi/fog
BOARD_RAMDISK_USE_LZ4 := true


# GSI && GKI
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

# Despite being VA/B device, there is a dedicated recovery partition
BOARD_USES_RECOVERY_AS_BOOT := false
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := false

# Use LZ4 Ramdisk compression instead of GZIP
BOARD_RAMDISK_USE_LZ4 := true

# Power
ENABLE_CPUSETS    := true
ENABLE_SCHEDBOOST := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    odm \
    product \
    recovery \
    system \
    system_dlkm \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot \
    vendor_dlkm

# Verified Boot
BOARD_AVB_ENABLE := true

# VNDK Treble
BOARD_VNDK_VERSION := current

# Partitions
BOARD_FLASH_BLOCK_SIZE                := 262144
BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 104857600
BOARD_DTBOIMG_PARTITION_SIZE          := 25165824
BOARD_BOOTIMAGE_PARTITION_SIZE        := 134217728
BOARD_INIT_BOOT_IMAGE_PARTITION_SIZE  := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 100663296

BOARD_USES_METADATA_PARTITION := true
BOARD_USES_VENDOR_DLKMIMAGE   := true
BOARD_USES_SYSTEM_DLKMIMAGE   := true
BOARD_USES_SYSTEM_EXTIMAGE    := true

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE        := 9653190656
BOARD_SUPER_PARTITION_GROUPS      := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 9648996352
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST += \
    system \
    system_ext \
    product \
    vendor \
    vendor_dlkm \
    odm

BOARD_PARTITION_LIST := $(call to-upper, $(BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := erofs))
$(foreach p, $(BOARD_PARTITION_LIST), $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_PRODUCT    := product

# Filesystems
TARGET_USERIMAGES_USE_EXT4    := true
TARGET_USERIMAGES_USE_F2FS    := true
TARGET_USES_MKE2FS            := true
BOARD_HAS_LARGE_FILESYSTEM    := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# System Properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
TARGET_RECOVERY_QCOM_RTC_FIX := true
TARGET_USES_LOGD := true
