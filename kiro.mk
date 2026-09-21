#
# KiroOS Developer Beta 2 product: lunch kiro_zerofltexx-userdebug
# Galaxy S6 (SM-G920F), device tree device/samsung/zerofltexx
#

# Device configuration (zero hardware family: universal7420-common + KiroOS layer)
$(call inherit-product, device/samsung/zerofltexx/full_zerofltexx.mk)

TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="zerofltexx" \
    TARGET_DEVICE="zeroflte"

PRODUCT_NAME := kiro_zerofltexx
PRODUCT_DEVICE := zerofltexx
PRODUCT_BRAND := KiroOS
PRODUCT_MODEL := Galaxy S6
PRODUCT_MANUFACTURER := samsung
BUILD_FINGERPRINT := samsung/zerofltexx/zeroflte:7.0/NRD90M/G920FXXU5EQG3:user/release-keys

# Model facts read by Settings (About phone, Edge screen) and init (palm rejection)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kiroos.model=SM-G920F \
    ro.kiroos.battery_mah=2550 \
    ro.kiroos.ram_gb=3 \
    ro.kiroos.edge=0 \
    persist.sys.kiroos.edge_reject=0
