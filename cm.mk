## Specify phone tech before including mini_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := Legend

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/legend/legend.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := legend
PRODUCT_NAME := cm_legend
PRODUCT_BRAND := htc
PRODUCT_MODEL := Legend
PRODUCT_MANUFACTURER := HTC
PRODUCT_VERSION_DEVICE_SPECIFIC := -UNOFFICIAL-ALPHA1
CM_RELEASE := true
