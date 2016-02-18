# openwrt-pxa-target
This target feed adds support for the Zipit Z2 (pxa) platform to openwrt

## Usage:
Edit _feeds.conf_ in your openwrt directory and add a line:

     src-git pxa-target https://github.com/mozzwald/openwrt-pxa-target

Next, update and install the target feeds:

     scripts/feeds update
     scripts/feeds install -p pxa-target pxa

Now run _make menuconfig_ and the _Marvell/Intel PXA27x_ target will be available.
