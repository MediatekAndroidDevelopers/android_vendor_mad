LOCAL_PATH := $(call my-dir)

ifeq ($(DEBUG_BOOT),true)

include $(CLEAR_VARS)
LOCAL_MODULE := init
LOCAL_SRC_FILES := init
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
ifneq ($(TARGET_SYSTEM_MINOR),)
SYSTEM_MINOR := $(TARGET_SYSTEM_MINOR)
$(shell (rm -f $(LOCAL_PATH)/mount_fs))
$(shell ($(LOCAL_PATH)/create_mount.sh $(LOCAL_PATH) $(SYSTEM_MINOR)))
$(shell (chmod 750 $(LOCAL_PATH)/mount_fs))
LOCAL_POST_INSTALL_CMD := $(hide) cp $(LOCAL_PATH)/mount_fs $(TARGET_ROOT_OUT)/mount_fs \
	$(shell (chmod 750 $(TARGET_ROOT_OUT)/init))
else
$(error $(LOCAL_PATH): Invalid TARGET_SYSTEM_MINOR specified for module $(LOCAL_MODULE))
endif
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := busybox
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)/sbin
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE := log-kmsg.sh
LOCAL_SRC_FILES := $(LOCAL_MODULE)
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

endif
