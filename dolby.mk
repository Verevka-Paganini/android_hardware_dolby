#
# Copyright (C) 2022 FlamingoOS Project
# SPDX-FileCopyrightText: 2022 FlamingoOS Project
# SPDX-FileCopyrightText: 2025-2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Dolby path
DOLBY_PATH := hardware/dolby

# Soong Namespace
PRODUCT_SOONG_NAMESPACES += \
    $(DOLBY_PATH)

# Enable codec support
AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true

# DSP Volume Synchronizer
PRODUCT_PACKAGES += \
    DSPVolumeSynchronizer

# Spatial Audio
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml

# Overlays
PRODUCT_PACKAGES += \
    DolbyFrameworksResCommon

# Properties
PRODUCT_ODM_PROPERTIES += \
    audio.spatializer.pose_predictor_type=2 \
    audio.spatializer.prediction_duration_ms=50 \
    persist.vendor.audio.effectimplenter=dolby \
    persist.vendor.audio.spatializer.enable=false

PRODUCT_VENDOR_PROPERTIES += \
    audio.spatializer.effect.util_clamp_min=300 \
    debug.c2.use_dmabufheaps=1 \
    persist.vendor.audio.dolby.tws_tuning=true \
    persist.vendor.audio.effectimplenter=dolby \
    persist.vendor.audio.spatializer.speaker_enabled=true \
    persist.vendor.audio_fx.current=dolby \
    ro.audio.headtracking_enabled=true \
    ro.audio.spatializer_enabled=true \
    ro.audio.spatializer_transaural_enabled_default=false \
    ro.audio.stereo_spatialization_enabled=true \
    ro.vendor.dolby.dax.version=DAX3_3.12.0.8_r1 \
    vendor.audio.c2.preferred=true \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false \
    vendor.qc2audio.per_frame.flac.dec.enabled=true \
    vendor.qc2audio.suspend.enabled=true

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DOLBY_PATH)/sepolicy/vendor

# Init
PRODUCT_PACKAGES += \
    init.dolby.rc

# AIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DOLBY_PATH)/vintf/dolby_framework_matrix.xml

# LunarisDolby
PRODUCT_PACKAGES += \
    LunarisDolby

PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/vendor/etc/dolby/dax-default-spatializer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default-spatializer.xml \
    $(DOLBY_PATH)/proprietary/vendor/etc/dolby/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    $(DOLBY_PATH)/proprietary/vendor/etc/dolby/dax-default_retin.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default_retin.xml \
    $(DOLBY_PATH)/proprietary/vendor/etc/dolby/dax-moto_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-moto_1.xml \
    $(DOLBY_PATH)/proprietary/vendor/etc/dolby/dax-moto_2.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-moto_2.xml \
    $(DOLBY_PATH)/proprietary/vendor/etc/dolby/dax-moto_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-moto_3.xml \
    $(DOLBY_PATH)/proprietary/vendor/etc/init/dms-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/dms-service.rc \
    $(DOLBY_PATH)/proprietary/vendor/etc/init/vendor.dolby.media.c2-default-service-dax.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.media.c2-default-service-dax.rc \
    $(DOLBY_PATH)/proprietary/vendor/etc/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml

PRODUCT_PACKAGES += \
    libcodec2_soft_ac4dec \
    libcodec2_soft_ddpdec \
    libcodec2_store_dolby \
    libdapparamstorage \
    libdeccfg \
    libdlbdsservice \
    libdlbpreg \
    libdmshal \
    liboem_specific \
    libspatializerparamstorage \
    libdlbvolaidl \
    libswdapaidl \
    libswgamedapaidl \
    libswspatializeraidl \
    vendor.dolby.dms-V1-ndk \
    vendor.dolby.hardware.dms@2.0 \
    dms-service.xml \
    vendor.dolby.media.c2-default-service-dax.xml \
    vendor.dolby.dms.service \
    vendor.dolby.media.c2-default-service-dax
