#
# Copyright (C) 2013-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

#define KernelPackage/libertas-spi
#  $(call KernelPackage/mac80211/Default)
#  SUBMENU:=Wireless Drivers
#  DEPENDS+= +kmod-cfg80211 +kmod-lib80211 +@DRIVER_WEXT_SUPPORT +libertas-spi-firmware
#  KCONFIG:= \
#	CONFIG_LIBERTAS=m \
#	CONFIG_LIBERTAS_SPI=m
#  TITLE:=Marvell 88W8686 SPI Wireless Driver
#  FILES:= \
#	$(LINUX_DIR)/drivers/net/wireless/libertas/libertas.ko \
#	$(LINUX_DIR)/drivers/net/wireless/libertas/libertas_spi.ko
#  AUTOLOAD:=$(call AutoLoad,90,libertas libertas_spi)
#endef

#define KernelPackage/libertas-spi/description
# Support for Marvell 8688 SPI Wireless
#endef

#$(eval $(call KernelPackage,libertas-spi))

define KernelPackage/sound-soc-core
  SUBMENU:=Sound Support
  TITLE:=SoC sound support
  DEPENDS:=+kmod-regmap +kmod-sound-core
  KCONFIG:= \
        CONFIG_SND_SOC \
        CONFIG_SND_SOC_ALL_CODECS=n
  FILES:=$(LINUX_DIR)/sound/soc/snd-soc-core.ko
  AUTOLOAD:=$(call AutoLoad,55, snd-soc-core)
  $(call AddDepends/sound)
endef

define KernelPackage/sound-soc-core/description
 Support for SoC Sound
endef

$(eval $(call KernelPackage,sound-soc-core))

define KernelPackage/sound-zipit-z2
  SUBMENU:=Sound Support
  TITLE:=Zipit Z2 Sound Support
  KCONFIG:= \
        CONFIG_SND_PXA2XX_SOC \
        CONFIG_SND_PXA2XX_SOC_I2S \
        CONFIG_SND_PXA2XX_SOC_Z2 \
        CONFIG_SND_PXA2XX_AC97=n
  FILES:= \
        $(LINUX_DIR)/sound/arm/snd-pxa2xx-lib.ko \
        $(LINUX_DIR)/sound/soc/pxa/snd-soc-pxa2xx.ko \
        $(LINUX_DIR)/sound/soc/pxa/snd-soc-pxa2xx-i2s.ko \
        $(LINUX_DIR)/sound/soc/pxa/snd-soc-z2.ko \
        $(LINUX_DIR)/sound/soc/codecs/snd-soc-wm8750.ko
  AUTOLOAD:=$(call AutoLoad,65,snd-pxa2xx-lib snd-soc-pxa2xx snd-soc-pxa2xx-i2s snd-soc-wm8750 snd-soc-z2)
  DEPENDS:=@TARGET_pxa_ZipitZ2 +kmod-sound-core +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-zipit-z2/description
 Sound support for Zipit Z2
endef

$(eval $(call KernelPackage,sound-zipit-z2))
