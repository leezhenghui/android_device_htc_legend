#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## Specify phone tech before including mini_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := Legend

TARGET_BOOTANIMATION_NAME := vertical-320x480


# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/legend/legend.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := legend
PRODUCT_NAME := cm_legend
PRODUCT_BRAND := Htc
PRODUCT_MODEL := Legend
PRODUCT_VERSION_DEVICE_SPECIFIC := -UNOFFICIAL-ALPHA1
CM_RELEASE := true

#Set build fingerprint / ID / Prduct Name ect.

