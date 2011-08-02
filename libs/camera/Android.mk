LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	Camera.cpp \
	CameraParameters.cpp \
	ICamera.cpp \
	ICameraClient.cpp \
	ICameraService.cpp

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libutils \
	libbinder \
	libhardware \
	libsurfaceflinger_client \
	libui

LOCAL_MODULE:= libcamera_client

ifeq ($(TARGET_USE_MOTO_CUSTOM_CAMERA_PARAMETERS),true)
    LOCAL_CFLAGS += -DMOTO_CUSTOM_PARAMETERS
endif

ifeq ($(TARGET_SIMULATOR),true)
    LOCAL_LDLIBS += -lpthread
endif

include $(BUILD_SHARED_LIBRARY)
