include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoExInsta

NoExInsta_FILES = /mnt/d/codes/noexinsta/Tweak.xm
NoExInsta_FRAMEWORKS = CydiaSubstrate UIKit CoreGraphics
NoExInsta_PRIVATE_FRAMEWORKS = 
NoExInsta_LDFLAGS = -Wl,-segalign,4000

export ARCHS = armv7 arm64
NoExInsta_ARCHS = armv7 arm64

include $(THEOS_MAKE_PATH)/tweak.mk
	
all::
