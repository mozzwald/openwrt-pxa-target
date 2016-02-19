#
# Copyright (C) 2006-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=pxa
BOARDNAME:=Marvell/Intel PXA2xx
FEATURES:=squashfs jffs2 usb usbgadget
MAINTAINER:=Imre Kaloz <kaloz@openwrt.org>

KERNEL_PATCHVER:=4.4

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
        kmod-leds-gpio

define Target/Description
	Build images for PXA2xx systems, eg. Zipit Z2
endef

KERNELNAME:=zImage dtbs

$(eval $(call BuildTarget))
