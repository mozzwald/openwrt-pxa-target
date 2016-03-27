#
# Copyright (C) 2013-2016 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

define KernelPackage/sound-zipit-z2
  SUBMENU:=Sound Support
  TITLE:=Zipit Z2 Sound Support
  KCONFIG:= \
	CONFIG_SND_PXA2XX_SOC=m \
	CONFIG_SND_PXA2XX_SOC_I2S=m \
 	CONFIG_SND_PXA2XX_AC97=n \
	CONFIG_SND_PXA2XX_SOC_Z2=n \
	CONFIG_SND_SIMPLE_CARD \
	CONFIG_SND_SOC_WM8750
  FILES:= \
	$(LINUX_DIR)/sound/core/snd-pcm-dmaengine.ko \
        $(LINUX_DIR)/sound/arm/snd-pxa2xx-lib.ko \
        $(LINUX_DIR)/sound/soc/pxa/snd-soc-pxa2xx.ko \
        $(LINUX_DIR)/sound/soc/pxa/snd-soc-pxa2xx-i2s.ko \
        $(LINUX_DIR)/sound/soc/generic/snd-soc-simple-card.ko \
        $(LINUX_DIR)/sound/soc/codecs/snd-soc-wm8750.ko
  AUTOLOAD:=$(call AutoLoad,60,snd-pcm-dmaengine snd-pxa2xx-lib snd-soc-pxa2xx snd-soc-pxa2xx-i2s snd-soc-wm8750 snd-soc-simple-card)
  DEPENDS:=@TARGET_pxa_ZipitZ2 +kmod-sound-core +kmod-sound-soc-core
  $(call AddDepends/sound)
endef

define KernelPackage/sound-zipit-z2/description
 Sound support for Zipit Z2
endef

$(eval $(call KernelPackage,sound-zipit-z2))

define KernelPackage/cpufreq-conservative
  SUBMENU:=Other modules
  TITLE:=CPUFreq conservative governor
  KCONFIG:=CONFIG_CPU_FREQ_GOV_CONSERVATIVE
  FILES:=$(LINUX_DIR)/drivers/cpufreq/cpufreq_conservative.ko
  AUTOLOAD:=$(call AutoProbe,cpufreq_conservative)
endef

define KernelPackage/cpufreq-conservative/description
 Conservative CPU Frequency Governor
endef

$(eval $(call KernelPackage,cpufreq-conservative))

define KernelPackage/usb-ohci-pxa27x
  SUBMENU:=USB Support
  TITLE:=PXA27x USB OHCI (Host) Support
  KCONFIG:= \
	CONFIG_USB_OHCI_HCD=m \
	CONFIG_USB_OHCI_HCD_PXA27X=m
  FILES:=$(LINUX_DIR)/drivers/usb/host/ohci-pxa27x.ko
  AUTOLOAD:=$(call AutoLoad,60,ohci-pxa27x)
  DEPENDS:=@TARGET_pxa +kmod-usb-ohci
  $(call AddDepends/usb)
endef

define KernelPackage/usb-ohci-pxa27x/description
 USB Host support for PXA27x
endef

$(eval $(call KernelPackage,usb-ohci-pxa27x))

define KernelPackage/fancy-beeper
  SUBMENU:=Other modules
  TITLE:=Fancy Beeper Device
  KCONFIG:=CONFIG_FANCY_BEEP=m
  FILES:=$(LINUX_DIR)/drivers/char/beep.ko
  AUTOLOAD:=$(call AutoLoad,60,beep)
  DEPENDS:=@TARGET_pxa
endef

define KernelPackage/fancy-beeper/description
 Fancy Beeper Char Device
endef

$(eval $(call KernelPackage,fancy-beeper))

