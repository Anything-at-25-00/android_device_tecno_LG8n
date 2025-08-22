#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/tecno/LG8n/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

BOARD_VENDOR := TECNO
PRODUCT_NAME := lineage_LG8n
PRODUCT_DEVICE := LG8n
PRODUCT_MANUFACTURER := TECNO
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO LG8n

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=LG8n \
    BuildFingerprint=TECNO/LG8n-GL/TECNO-LG8n:12/SP1A.210812.016/240531V1800:user/release-keys

# AxionAOSP Flags
AXION_CAMERA_REAR_INFO := 50
AXION_CAMERA_FRONT_INFO := 8
AXION_MAINTAINER := Shirayuki39
AXION_PROCESSOR := Helio_G99
PRODUCT_NO_CAMERA := false
BYPASS_CHARGE_SUPPORTED := false

# Define small and big core groups
AXION_CPU_SMALL_CORES := 0,1,2,3,4,5
AXION_CPU_BIG_CORES := 6,7

## CPUsets configuration
# CPUset used for background cpusets 
AXION_CPU_BG := 0-2

# CPUset used for foreground cpusets
AXION_CPU_FG := 2-7

# All CPU Cores, will be used for restoration
AXION_ALL_CORES := 0-7

# CPUset that will be used when limiting background cpusets
AXION_CPU_LIMIT_BG := 0-1

# CPUset that will be used when limiting critical cpusets for UI
AXION_CPU_LIMIT_UI := 2-5

# CPUset that will be used for critical display processes
AXION_CPU_DISPLAY := 6-7
