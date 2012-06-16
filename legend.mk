#
# Copyright (C) 2009 The Android Open Source Project
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

# Kernel Targets
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/legend/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif # TARGET_PREBUILT_KERNEL

PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

DEVICE_PACKAGE_OVERLAYS := device/htc/legend/overlay


## (1) First, the most specific values, i.e. the aspects that are specific to GSM

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/legend/prebuilt/legend-keypad.kl:system/usr/keylayout/legend-keypad.kl \
    device/htc/legend/prebuilt/legend-keypad.kcm.bin:system/usr/keychars/legend-keypad.kcm.bin \
    device/htc/legend/prebuilt/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/legend/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/legend/prebuilt/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl


# Input device calibration files
PRODUCT_COPY_FILES += \
    device/htc/legend/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/legend/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/legend/prebuilt/usr/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc


#PRODUCT_COPY_FILES += \
#    device/htc/legend/prebuilt/init.legend.rc:root/init.legend.rc \
#    device/htc/legend/prebuilt/ueventd.legend.rc:root/ueventd.legend.rc




# Qualcomm ICS Adreno200 drivers  
PRODUCT_COPY_FILES += \
    device/htc/legend/prebuilt/lib/libC2D2.so:system/lib/libC2D2.so \
    device/htc/legend/prebuilt/lib/libgsl.so:system/lib/libgsl.so \
    device/htc/legend/prebuilt/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/htc/legend/prebuilt/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/htc/legend/prebuilt/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/htc/legend/prebuilt/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/htc/legend/prebuilt/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
    device/htc/legend/prebuilt/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/legend/prebuilt/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/htc/legend/prebuilt/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/htc/legend/prebuilt/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/legend/prebuilt/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/htc/legend/prebuilt/etc/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/legend/prebuilt/etc/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw


PRODUCT_COPY_FILES += \
    device/htc/legend/init.legend.rc:root/init.legend.rc \
    device/htc/legend/init.legend.usb.rc:root/init.legend.usb.rc \
    device/htc/legend/ueventd.legend.rc:root/ueventd.legend.rc



PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.enable.dtm=1 \
    ro.sf.lcd_density=160 \
    wifi.interface=tiwlan0 \
    ro.ril.def.agps.mode=1 \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.hsxpa=2 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2,gprs,ppp0 \
    wifi.supplicant_scan_interval=15 \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411 \
    ro.opengles.version=131072 \
    ro.telephony.ril.v3=signalstrength 

# Default network type.
# 0 => WCDMA preferred.
# 1 => only GSM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# For emmc phone storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage=0

# This is a 512MB device, so 32mb heapsize
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

# Enable TI HotSpot
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.hotspot.ti=1

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1


## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/legend/legend-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    settings.display.autobacklight=1 \
    settings.display.brightness=143 \
    persist.service.mount.playsnd = 0 \
    ro.com.google.locationfeatures = 1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    dalvik.vm.dexopt-flags=m=y \
    net.bt.name=Legend \
    ro.config.sync=yes \
    persist.sys.usb.config=mass_storage,adb \
    com.qc.hardware=true \
    com.qc.hdmi_out=false \
    persist.sys.tbwake=1 \
    debug.sf.hw=1 \
    debug.qctwa.statusbar=1 \
    debug.qctwa.preservebuf=1 \
    debug.camcorder.disablemeta=1	

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml


PRODUCT_COPY_FILES += \
    device/htc/legend/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES += \
	device/htc/legend/prebuilt/etc/vold.fstab:system/etc/vold.fstab 

#PRODUCT_COPY_FILES += \
#    device/htc/legend/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/legend/prebuilt/etc/init.d/05mountsd:system/etc/init.d/05mountsd

PRODUCT_COPY_FILES += \
    device/htc/legend/prebuilt/modules/sdio.ko:system/lib/modules/sdio.ko \
    device/htc/legend/prebuilt/modules/tiwlan_drv.ko:system/lib/modules/tiwlan_drv.ko \
    device/htc/legend/prebuilt/modules/tiap_drv.ko:system/lib/modules/tiap_drv.ko

PRODUCT_PACKAGES += \
    librs_jni \
    lights.legend \
    gralloc.msm7x27 \
    copybit.msm7x27 \
    sensors.legend \
    audio.primary.legend \
    audio_policy.legend \
    audio.a2dp.default \
    gps.legend \
    libmm-omxcore \
    libOmxCore \
    libdivxdrmdecrypt \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw \
    hwcomposer.default \
    hwcomposer.msm7x27 \
    libgenlock \
    libmemalloc \
    libtilerenderer \
    libQcomUI \
    com.android.future.usb.accessory \
    e2fsck \
    librpc \
    camera.msm7x27


#WiFi stuff
PRODUCT_PACKAGES += \
    wpa_supplicant.conf \
    tiwlan.ini \
    dhcpcd.conf \
    wlan_cu \
    wlan_loader \
    libCustomWifi

#HotSpot
PRODUCT_PACKAGES += \
   tiap_loader \
    tiap_cu \
    tiwlan_ap.ini \
    hostap \
    hostapd.conf


#media profiles and capabilities spec
$(call inherit-product, device/htc/legend/media_a1026.mk)


# Prebuilt libraries that are needed to build open-source libraries
#PRODUCT_COPY_FILES += \
#    device/htc/legend/prebuilt/lib/libcamera.so:obj/lib/libcamera.so


# PRODUCT_LOCALES += mdpi

$(call inherit-product, device/common/gps/gps_eu_supl.mk)
$(call inherit-product, device/htc/common/common.mk)
$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_NAME := generic_legend
PRODUCT_DEVICE := legend
