#
# Copyright (C) 2015 The Android Open Kang Project
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

LOCAL_PATH := device/samsung/zerofltexx

## device overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths_0.xml:system/etc/mixer_paths_0.xml
    
## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/zerofltexx/zerofltexx-vendor.mk)

# Carrier init
PRODUCT_PACKAGES += \
    init.carrier.rc

# KiroOS boot logo (PARAM partition), S6 flat only: the PARAM image is model specific, so
# the edge variants never get it. It travels in the OTA as install/param.bin and
# universal7420-common/releasetools.py flashes it.
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/param.bin:install/param.bin

# cpboot daemon
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ril/sbin/cbd:root/sbin/cbd

# Inherit from zero-common
$(call inherit-product, device/samsung/universal7420-common/universal7420-common.mk)

# KiroOS: Vulkan version as the zero-common Mali driver reports it (1.0.26, measured on the S6)
PRODUCT_COPY_FILES += \
    device/samsung/universal7420-common/kiroos/permissions/android.hardware.vulkan.version-1_0_26.xml:system/etc/permissions/android.hardware.vulkan.version.xml
