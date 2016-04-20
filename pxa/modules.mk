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

define KernelPackage/soc-camera
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=SOC Camera Support
  KCONFIG:=CONFIG_SOC_CAMERA=m
  FILES:= \
	$(LINUX_DIR)/drivers/media/v4l2-core/videobuf-core.ko \
	$(LINUX_DIR)/drivers/media/platform/soc_camera/soc_camera.ko \
	$(LINUX_DIR)/drivers/media/platform/soc_camera/soc_mediabus.ko
  AUTOLOAD:=$(call AutoLoad,65,videobuf-core soc_mediabus soc_camera)
# Dirty Fix: kmod-video-uvc isn't actually required, but videobuf2 package 
# won't build without a driver that requires CONFIG_VIDEOBUF2_MEMOPS
  DEPENDS:=+kmod-i2c-core +kmod-video-videobuf2 +kmod-video-uvc
  $(call AddDepends/camera)
endef

define KernelPackage/soc-camera/description
 SOC Camera Support
endef

$(eval $(call KernelPackage,soc-camera))

define KernelPackage/pxa-camera
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=PXA27x Camera Support
  KCONFIG:= \
	CONFIG_VIDEOBUF_DMA_SG \
	CONFIG_VIDEO_PXA27x
  FILES:= \
	$(LINUX_DIR)/drivers/media/v4l2-core/videobuf-dma-sg.ko \
	$(LINUX_DIR)/drivers/media/platform/soc_camera/pxa_camera.ko
  AUTOLOAD:=$(call AutoLoad,70,pxa-camera videobuf-dma-sg)
  DEPENDS:=@TARGET_pxa kmod-soc-camera
endef

define KernelPackage/pxa-camera/description                                                                                                                        
 PXA27x Camera Support
endef

$(eval $(call KernelPackage,pxa-camera))

define KernelPackage/ov2640-camera
  SUBMENU:=$(VIDEO_MENU)
  TITLE:=ov2640 Camera Support
  KCONFIG:=CONFIG_SOC_CAMERA_OV2640
  FILES:=$(LINUX_DIR)/drivers/media/i2c/soc_camera/ov2640.ko
  AUTOLOAD:=$(call AutoLoad,75,ov2640)
  DEPENDS:=kmod-soc-camera
endef

define KernelPackage/ov2640-camera/description
 ov2640 Camera Support
endef

$(eval $(call KernelPackage,ov2640-camera))
