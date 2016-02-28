# openwrt-pxa-target
This target feed adds support for the Zipit Z2 (pxa) platform to openwrt. It has been tested with openwrt trunk as of commit [7d00e0c14f2ac50f6c72a0a6388d271ac87a85ed](https://github.com/openwrt/openwrt/commit/7d00e0c14f2ac50f6c72a0a6388d271ac87a85ed)

## Usage:
Download openwrt trunk with git:

     git clone https://github.com/openwrt/openwrt.git openwrt-trunk

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

