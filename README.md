### NOTE: this repo is deprecated and has moved to [https://github.com/openwrt-zipit/openwrt-pxa-target](https://github.com/openwrt-zipit/openwrt-pxa-target)

# openwrt-pxa-target
This target feed adds support for the Zipit Z2 (pxa) platform to openwrt. It has been tested with openwrt trunk as of commit [1e22c9b9eb691878156dfe32fb1e117737f1d248](https://github.com/openwrt/openwrt/commit/1e22c9b9eb691878156dfe32fb1e117737f1d248)

## Usage:
Download openwrt trunk with git and checkout commit 1e22c9b9eb691878156dfe32fb1e117737f1d248:

     git clone https://github.com/openwrt/openwrt.git openwrt-trunk
     git checkout 1e22c9b9eb691878156dfe32fb1e117737f1d248

Change to your openwrt directory and edit _feeds.conf_ adding a line:

     cd openwrt-trunk
     echo "src-git pxa_target https://github.com/mozzwald/openwrt-pxa-target" > feeds.conf

Update and install the target feed:

     scripts/feeds update
     scripts/feeds install -p pxa_target pxa

Copy the _feeds.conf_ and default Zipit config files:

     cp feeds/pxa_target/feeds.conf ./feeds.conf
     cp feeds/pxa_target/zipit_openwrt_defconfig ./.config

Update the feeds again:

     scripts/feeds update
     scripts/feeds install -a

Run _make_ to do the default build or run _make menuconfig_ to add/remove packages.

