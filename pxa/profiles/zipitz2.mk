#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/ZipitZ2
	NAME:=ZipitZ2
	PACKAGES:=\
		kmod-libertas-spi libertas-spi-firmware kmod-sound-zipit-z2 kmod-pxa27x-udc wireless-tools wpa-supplicant-mini
endef

define Profile/ZipitZ2/Description
	Package set optimized for the Zipit Z2 Handheld
endef

$(eval $(call Profile,ZipitZ2))
