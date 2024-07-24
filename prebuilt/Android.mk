LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
    LOCAL_MODULE := miui_prebuilt
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_CLASS := ETC
    LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)
    LOCAL_HOST_REQUIRED_MODULES := depmod
    LOCAL_POST_INSTALL_CMD += \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/vendor; \
        cp -rf $(LOCAL_PATH)/vendor $(TARGET_RECOVERY_ROOT_OUT)/; \
        echo "Calling depmod on miui_prebuilt"; \
        $(DEPMOD) -b $(TARGET_RECOVERY_ROOT_OUT)/vendor 1.1;
include $(BUILD_PHONY_PACKAGE)
