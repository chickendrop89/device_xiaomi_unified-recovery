#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/tapas

# Architecture
TARGET_ARCH             := arm64
TARGET_ARCH_VARIANT     := armv8-a
TARGET_CPU_ABI          := arm64-v8a
TARGET_CPU_ABI2         :=
TARGET_CPU_VARIANT      := kryo

TARGET_2ND_ARCH         := arm
TARGET_2ND_ARCH_VARIANT := $(TARGET_ARCH_VARIANT)
TARGET_2ND_CPU_ABI      := armeabi-v7a
TARGET_2ND_CPU_ABI2     := armeabi
TARGET_2ND_CPU_VARIANT  := $(TARGET_CPU_VARIANT)

# Bootloader
TARGET_NO_BOOTLOADER          := true
TARGET_USES_UEFI              := true

# Platform
TARGET_BOARD_PLATFORM         := bengal
TARGET_BOARD_PLATFORM_GPU     := qcom-adreno610
BOARD_USES_QCOM_HARDWARE      := true

# Kernel
BOARD_KERNEL_PAGESIZE         := 4096
TARGET_KERNEL_ARCH            := arm64
TARGET_KERNEL_HEADER_ARCH     := arm64
BOARD_KERNEL_IMAGE_NAME       := Image
BOARD_BOOT_HEADER_VERSION     := 4
TARGET_KERNEL_CLANG_COMPILE   := true
TARGET_PREBUILT_KERNEL        := /dev/null # empty kernel image
BOARD_MKBOOTIMG_ARGS          += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS          += --pagesize $(BOARD_KERNEL_PAGESIZE)

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
