PRODUCT_SOONG_NAMESPACES += \
    vendor/extra

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/%

PRODUCT_PACKAGES += \
    F-DroidPrivilegedExtension \
    F-Droid \

PRODUCT_OTA_PUBLIC_KEYS += vendor/extra/security/releasekey.x509.pem
PRODUCT_ADB_KEYS += vendor/extra/security/adb.key.pub
