#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include the common OEM chipset BoardConfig.
include device/tecno/mt6789-common/BoardConfigCommon.mk

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := lg8n

# Boot image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Display
TARGET_SCREEN_DENSITY := 396

# DTB
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PATH)/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PATH)/dtb

# Kernel
TARGET_NO_KERNEL_OVERRIDE := true
LOCAL_KERNEL := $(KERNEL_PATH)/Image.gz
PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel

# Kernel modules
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD))

# Also add recovery modules to vendor ramdisk
BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/ramdisk/modules.load.recovery))
RECOVERY_MODULES := $(addprefix $(KERNEL_PATH)/ramdisk/, $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD))

# Prevent duplicated entries (to solve duplicated build rules problem)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(sort $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES) $(RECOVERY_MODULES))

# Vendor modules (installed to vendor_dlkm)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PATH)/vendor_dlkm/modules.load))
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(KERNEL_PATH)/vendor_dlkm/*.ko)

# OTA assert
TARGET_OTA_ASSERT_DEVICE := LG8n,TECNO-LG8n,lg8n

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/configs/properties/product.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/configs/properties/phoneinfo.prop

# Workaround to make lineage's soong generator work
TARGET_KERNEL_SOURCE := $(KERNEL_PATH)/kernel-headers

# Inherit the proprietary files
include vendor/tecno/LG8n/BoardConfigVendor.mk
