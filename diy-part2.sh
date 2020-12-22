#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i '/set network.globals.ula_prefix/d' openwrt/package/base-files/files/bin/config_generate
echo "DISTRIB_REVISION='Compiled by zhangdi '" > openwrt/package/base-files/files/etc/openwrt_release1
curl -fsSL  https://raw.githubusercontent.com/zzd/other/master/patch/poweroff/poweroff.htm > openwrt/feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm 
curl -fsSL  https://raw.githubusercontent.com/zzd/other/master/patch/poweroff/system.lua > openwrt/feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua
# sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po
sed -i 's/Turbo ACC 网络加速/ACC网络加速/g' package/lean/luci-app-sfe/po/zh-cn/sfe.po
# sed -i 's/带宽监控/监控/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po
./openwrt/scripts/feeds update -i