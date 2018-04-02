# Common overlays
DEVICE_PACKAGE_OVERLAYS += vendor/mad/overlay

# Shim libraries
PRODUCT_PACKAGES += \
    libmtkshim_log \
    libmtkshim_audio \
    libmtkshim_ui \
    libmtkshim_gui \
    libmtkshim_omx \
    libmtkshim_camera \
    libmtkshim_gps

# Display
PRODUCT_PACKAGES += \
    libion

# Gralloc
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.renderscript@1.0-impl

# HW Composer
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service

# Light HAL
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# VibratorHAL
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# UsbHAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service \
    libcurl

PRODUCT_COPY_FILES += \
    vendor/mad/prebuilt/etc/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

# Jelly
PRODUCT_PACKAGES += \
    Jelly

# OmniStyle
PRODUCT_PACKAGES += \
    OmniStyle

# OmniJaws
PRODUCT_PACKAGES += \
    OmniJaws

# madCamera
PRODUCT_PACKAGES += \
    madCamera

# madWallpapers
PRODUCT_PACKAGES += \
    madWallpapers

# madLauncher
PRODUCT_PACKAGES += \
    madLauncher

# Include explicitly to work around Facelock issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# FMRadio
PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs

# exFAT
PRODUCT_PACKAGES += \
    fsck.exfat \
    mkfs.exfat

# NTFS
PRODUCT_PACKAGES += \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    mad_charger_res_images

# WallpaperPicker
PRODUCT_PACKAGES += \
    WallpaperPicker

# Sensor Calibration
PRODUCT_PACKAGES += \
    libem_sensor_jni

# Audio Settings
PRODUCT_PACKAGES += \
    libaudio_volume_jni

# ThemeInterfacer
PRODUCT_PACKAGES += \
    ThemeInterfacer

# Eleven
PRODUCT_PACKAGES += \
    Eleven

# Bootanimation
ifneq ($(filter 720,$(TARGET_SCREEN_WIDTH)),)
    PRODUCT_COPY_FILES += \
        vendor/mad/prebuilt/bootanimation/720p.zip:system/media/bootanimation.zip
endif
ifneq ($(filter 1080,$(TARGET_SCREEN_WIDTH)),)
    PRODUCT_COPY_FILES += \
        vendor/mad/prebuilt/bootanimation/1080p.zip:system/media/bootanimation.zip
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# WiFi Display
# this property enables the user to access Google WFD settings.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# madOS Versioning
ANDROID_VERSION = 8.1.0
MADOS_VERSION = 2.1.3

ifndef MADOS_BUILD_TYPE
    MADOS_BUILD_TYPE := OFFICIAL
endif

MADOS_MOD_VERSION := madOS-$(MADOS_VERSION)-$(shell date -u +%Y%m%d)-$(MADOS_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.mados.version=$(MADOS_VERSION) \
    ro.mados.releasetype=$(MADOS_BUILD_TYPE) \
    ro.modversion=$(MADOS_MOD_VERSION)

MADOS_DISPLAY_VERSION := madOS-$(MADOS_VERSION)-$(MADOS_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.mados.display.version=$(MADOS_DISPLAY_VERSION)

# include other configs
include vendor/mad/config/permissions.mk
include vendor/mad/config/media.mk
include vendor/mad/config/wifi.mk
include vendor/mad/config/telephony.mk
include vendor/mad/config/google_override.mk

# DEBUG_BOOT
include vendor/mad/config/debug_boot.mk
