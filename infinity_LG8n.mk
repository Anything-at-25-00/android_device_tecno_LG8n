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

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/infinity/config/common_full_phone.mk)

BOARD_VENDOR := TECNO
PRODUCT_NAME := infinity_LG8n
PRODUCT_DEVICE := LG8n
PRODUCT_MANUFACTURER := TECNO
PRODUCT_BRAND := TECNO
PRODUCT_MODEL := TECNO LG8n

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceName=LG8n \
    BuildFingerprint=TECNO/LG8n-GL/TECNO-LG8n:12/SP1A.210812.016/240531V1800:user/release-keys

# Infinity X Stuffs

INFINITY_MAINTAINER := "Ren (Shirayuki39/Shirayuki428)"
TARGET_SUPPORTS_BLUR := true
WITH_GAPPS := true
TARGET_BUILD_GOOGLE_TELEPHONY := true

PRODUCT_SYSTEM_PROPERTIES += \
   ro.infinity.soc=Helio G99 \
   ro.infinity.battery=6000 mAh \
   ro.infinity.display=1080x2400, 90 Hz \
   ro.infinity.camera=50MP + 8MP \
   ro.product.marketname=TECNO POVA 4 Pro

