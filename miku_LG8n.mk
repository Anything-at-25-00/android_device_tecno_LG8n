#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/tecno/LG8n/device.mk)

# Inherit some common Miku UI stuff.
$(call inherit-product, vendor/miku/config/common_full_phone.mk)

BOARD_VENDOR := TECNO
PRODUCT_NAME := miku_LG8n
PRODUCT_DEVICE := LG8n
PRODUCT_MANUFACTURER := TECNO
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO LG8n

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=LG8n

# Maintaier
MIKU_MASTER := Ren(Shirayuki39/Shirayuki428)

MIKU_GAPPS := true

