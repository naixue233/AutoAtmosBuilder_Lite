#!/bin/sh
set -e
### Create a new folder for storing files
if [ -d SwitchSD ]; then
  rm -rf SwitchSD
fi
if [ -e description.txt ]; then
  rm -rf description.txt
fi
mkdir -p ./SwitchSD/atmosphere/config
mkdir -p ./SwitchSD/atmosphere/hosts
mkdir -p ./SwitchSD/switch/DBI
mkdir -p ./SwitchSD/switch/Goldleaf
mkdir -p ./SwitchSD/switch/Checkpoint
mkdir -p ./SwitchSD/switch
mkdir -p ./SwitchSD/switch/.packages
mkdir -p ./SwitchSD/warmboot_mariko
mkdir -p ./SwitchSD/themes
mkdir -p ./SwitchSD/bootloader
mkdir -p ./SwitchSD/bootloader/ini
mkdir -p ./SwitchSD/bootloader/res
mkdir -p ./SwitchSD/bootloader/payloads
mkdir -p ./SwitchSD/config/tesla
mkdir -p ./SwitchSD/config/Tesla-Menu/
cd SwitchSD

### Fetch latest atmosphere from https://github.com/Atmosphere-NX/Atmosphere/releases
curl -sL https://api.github.com/repos/Atmosphere-NX/Atmosphere/releases \
  | jq '.[0] | .name' \
  | xargs -I {} echo {} >> ../description.txt
curl -sL https://api.github.com/repos/Atmosphere-NX/Atmosphere/releases \
  | jq '.[0].assets' | jq '.[0].browser_download_url' \
  | xargs -I {} curl -sL {} -o atmosphere.zip
if [ $? -ne 0 ]; then
    echo "atmosphere download\033[31m failed\033[0m."
else
    echo "atmosphere download\033[32m success\033[0m."
    unzip -oq atmosphere.zip
    rm atmosphere.zip
fi
### Fetch latest Hekate + Nyx Chinese from https://github.com/easyworld/hekate/releases/latest
curl -sL https://api.github.com/repos/easyworld/hekate/releases/latest \
  | jq '.name' \
  | xargs -I {} echo {} >> ../description.txt
curl -sL https://api.github.com/repos/easyworld/hekate/releases/latest \
  | jq '.assets' | jq '.[0].browser_download_url' \
  | xargs -I {} curl -sL {} -o hekate.zip
if [ $? -ne 0 ]; then
    echo "Hekate + Nyx download\033[31m failed\033[0m."
else
    echo "Hekate + Nyx download\033[32m success\033[0m."
    unzip -oq hekate.zip
    rm hekate.zip
fi
### Fetch latest MissionControl from https://api.github.com/repos/ndeadly/MissionControl/releases/latest
curl -sL https://api.github.com/repos/ndeadly/MissionControl/releases/latest \
  | jq '.tag_name' \
  | xargs -I {} echo MissionControl {} >> ../description.txt
curl -sL https://api.github.com/repos/ndeadly/MissionControl/releases/latest \
  | jq '.assets' | jq '.[0].browser_download_url' \
  | xargs -I {} curl -sL {} -o MissionControl.zip
if [ $? -ne 0 ]; then
    echo "MissionControl download\033[31m failed\033[0m."
else
    echo "MissionControl download\033[32m success\033[0m."
    unzip -oq MissionControl.zip
    rm MissionControl.zip
fi

### Fetch latest ldn_mitm from https://api.github.com/repos/spacemeowx2/ldn_mitm/releases/latest
curl -sL https://api.github.com/repos/spacemeowx2/ldn_mitm/releases/latest \
  | jq '.tag_name' \
  | xargs -I {} echo ldn_mitm {} >> ../description.txt
curl -sL https://api.github.com/repos/spacemeowx2/ldn_mitm/releases/latest \
  | jq '.assets' | jq '.[0].browser_download_url' \
  | xargs -I {} curl -sL {} -o ldn_mitm.zip
if [ $? -ne 0 ]; then
    echo "ldn_mitm download\033[31m failed\033[0m."
else
    echo "ldn_mitm download\033[32m success\033[0m."
    unzip -oq ldn_mitm.zip
    rm ldn_mitm.zip
fi

### Fetch latest ldn_mitm from https://api.github.com/repos/masagrator/SaltyNX/releases/latest
curl -sL https://api.github.com/repos/masagrator/SaltyNX/releases/latest \
  | jq '.name' \
  | xargs -I {} echo {} >> ../description.txt
curl -sL https://api.github.com/repos/masagrator/SaltyNX/releases/latest \
  | jq '.assets' | jq '.[0].browser_download_url' \
  | xargs -I {} curl -sL {} -o SaltyNX.zip
if [ $? -ne 0 ]; then
    echo "SaltyNX download\033[31m failed\033[0m."
else
    echo "SaltyNX download\033[32m success\033[0m."
    unzip -oq SaltyNX.zip
    rm SaltyNX.zip
fi
### Fetch latest Bootloader-Resources from https://github.com/naixue233/SwitchScript
curl -sL https://raw.github.com/naixue233/AutoAtmosBuilder_Lite/main/resources/bootloader.zip -o bootloader.zip
if [ $? -ne 0 ]; then
    echo "Bootloader-Resources download\033[31m failed\033[0m."
else
    echo "Bootloader-Resources download\033[32m success\033[0m."
    unzip -oq bootloader.zip
    rm bootloader.zip
fi

curl -sL https://raw.github.com/naixue233/AutoAtmosBuilder/main/resources/Tesla.zip -o Tesla.zip
if [ $? -ne 0 ]; then
    echo "Tesla download\033[31m failed\033[0m."
else
    echo "Tesla download\033[32m success\033[0m."
    unzip -oq Tesla.zip
    rm Tesla.zip
fi


### Fetch latest boot.dat-Resources from https://github.com/naixue233/AutoAtmosBuilder
curl -sL https://raw.github.com/naixue233/AutoAtmosBuilder/main/resources/boot.dat -o boot.dat
if [ $? -ne 0 ]; then
    echo "boot.dat-Resources download\033[31m failed\033[0m."
else
    echo "boot.dat-Resources download\033[32m success\033[0m."
fi
### Fetch latest SigPatches.zip from https://raw.github.com/naixue233/naixue_nx_atm_Auto_Script/main/resources/
curl -sL https://sigmapatches.su/sigpatches.zip -o sigpatches.zip
if [ $? -ne 0 ]; then
    echo "SigPatches download\033[31m failed\033[0m."
else
    echo "SigPatches download\033[32m success\033[0m."
    unzip -oq sigpatches.zip
    rm sigpatches.zip
fi
### Fetch lastest wiliwili from https://github.com/xfangfang/wiliwili/releases/latest
curl -sL https://api.github.com/repos/xfangfang/wiliwili/releases/latest \
  | jq '.tag_name' \
  | xargs -I {} echo wiliwili {} >> ../description.txt
curl -sL https://api.github.com/repos/xfangfang/wiliwili/releases/latest \
  | jq '.assets' | jq '.[8].browser_download_url' \
  | xargs -I {} curl -sL {} -o wiliwili-NintendoSwitch.zip
if [ $? -ne 0 ]; then
    echo "wiliwili download\033[31m failed\033[0m."
else
    echo "wiliwili download\033[32m success\033[0m."
    unzip -oq wiliwili-NintendoSwitch.zip
    mkdir -p ./switch/wiliwili
    mv wiliwili/wiliwili.nro ./switch/wiliwili
    rm -rf wiliwili
    rm wiliwili-NintendoSwitch.zip
fi

curl -sL https://raw.github.com/naixue233/AutoAtmosBuilder/main/resources/DBI.nro -o DBI.nro
if [ $? -ne 0 ]; then
    echo "DBI.nro download\033[31m failed\033[0m."
else
    echo "DBI.nro download\033[32m success\033[0m."
    mv DBI.nro ./switch/DBI
fi
curl -sL https://raw.github.com/naixue233/AutoAtmosBuilder/main/resources/.DBI.nro.star -o .DBI.nro.star
if [ $? -ne 0 ]; then
    echo ".DBI.nro.star download\033[31m failed\033[0m."
else
    echo ".DBI.nro.star download\033[32m success\033[0m."
    mv .DBI.nro.star ./switch/DBI
fi

curl -sL https://api.github.com/repos/J-D-K/JKSV/releases/latest \
  | jq '.name' \
  | xargs -I {} echo JKSV {} >> ../description.txt
curl -sL https://api.github.com/repos/J-D-K/JKSV/releases/latest \
  | jq '.assets' | jq '.[0].browser_download_url' \
  | xargs -I {} curl -sL {} -o JKSV.nro
if [ $? -ne 0 ]; then
    echo "JKSV download\033[31m failed\033[0m."
else
    echo "JKSV download\033[32m success\033[0m."
    mv JKSV.nro ./switch
fi

curl -sL https://raw.github.com/naixue233/AutoAtmosBuilder/main/resources/linkalho.nro -o linkalho.nro
if [ $? -ne 0 ]; then
    echo "linkalho.nro download\033[31m failed\033[0m."
else
    echo "linkalho.nro download\033[32m success\033[0m."
    mv linkalho.nro ./switch
fi

### Rename hekate_ctcaer_*.bin to payload.bin
find . -name "*hekate_ctcaer*" -exec mv {} payload.bin \;
if [ $? -ne 0 ]; then
    echo "Rename hekate_ctcaer_*.bin to payload.bin\033[31m failed\033[0m."
else
    echo "Rename hekate_ctcaer_*.bin to payload.bin\033[32m success\033[0m."
fi

### Write hekate_ipl.ini in /bootloader/ directory
cat > ./bootloader/hekate_ipl.ini << ENDOFFILE
[config]
autoboot=0
autoboot_list=0
bootwait=3
verification=1
backlight=100
autohosoff=0
autonogc=1
updater2p=1

[大气层虚拟系统]
emummcforce=1
fss0=atmosphere/package3
kip1=atmosphere/kips/loader.kip
icon=bootloader/res/icon_Atmosphere_emunand.bmp
id=Atm-Emu
{千叶奈雪自动构建Lite}

[大气层真实系统]
emummc_force_disable=1
fss0=atmosphere/package3
kip1=atmosphere/kips/loader.kip
icon=bootloader/res/icon_Atmosphere_sysnand.bmp
id=Atm-Sys
{千叶奈雪自动构建Lite}

[正版系统]
emummc_force_disable=1
fss0=atmosphere/package3
stock=1
icon=bootloader/res/icon_stock.bmp
id=OFW-SYS
{千叶奈雪自动构建Lite}

[大气层自动识别]
payload=bootloader/payloads/fusee.bin
icon=bootloader/res/icon_ams.bmp
kip1=atmosphere/kips/loader.kip
id=Atm-Auto
{千叶奈雪自动构建Lite}

[安全模式]
fss0=atmosphere/package3
emummc_force_disable=1
cal0blank=0
{千叶奈雪自动构建Lite}
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing hekate_ipl.ini in ./bootloader/ directory\033[31m failed\033[0m."
else
    echo "Writing hekate_ipl.ini in ./bootloader/ directory\033[32m success\033[0m."
fi

### Write nyx.ini in /bootloader/ directory
cat > ./bootloader/nyx.ini << ENDOFFILE
[config]
themebg=2d2d2d
themecolor=320
entries5col=0
timeoff=edbe80
homescreen=0
verification=1
umsemmcrw=0
jcdisable=0
jcforceright=0
bpmpclock=1
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing nyx.ini in ./bootloader/ directory\033[31m failed\033[0m."
else
    echo "Writing nyx.ini in ./bootloader/ directory\033[32m success\033[0m."
fi

### write exosphere.ini in root of SD Card
cat > ./exosphere.ini << ENDOFFILE
[exosphere]
debugmode=1
debugmode_user=0
disable_user_exception_handlers=0
enable_user_pmu_access=0
blank_prodinfo_sysmmc=1
blank_prodinfo_emummc=1
allow_writing_to_cal_sysmmc=0
log_port=0
log_baud_rate=115200
log_inverted=0
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing exosphere.ini in root of SD card\033[31m failed\033[0m."
else
    echo "Writing exosphere.ini in root of SD card\033[32m success\033[0m."
fi


### Write emummc.txt in /atmosphere/hosts
cat > ./atmosphere/hosts/emummc.txt << ENDOFFILE
# Block Nintendo Servers
127.0.0.1 *nintendo.*
127.0.0.1 *nintendo-europe.com
127.0.0.1 *nintendoswitch.*
207.246.121.77 *conntest.nintendowifi.net
207.246.121.77 *ctest.cdn.nintendo.net
69.25.139.140 *ctest.cdn.n.nintendoswitch.cn
95.216.149.205 *conntest.nintendowifi.net
95.216.149.205 *ctest.cdn.nintendo.net
95.216.149.205 *90dns.test
ENDOFFILE
cp ./atmosphere/hosts/emummc.txt ./atmosphere/hosts/sysmmc.txt
if [ $? -ne 0 ]; then
    echo "Writing emummc.txt and sysmmc.txt in ./atmosphere/hosts\033[31m failed\033[0m."
else
    echo "Writing emummc.txt and sysmmc.txt in ./atmosphere/hosts\033[32m success\033[0m."
fi

### Write boot.ini in root of SD Card
if [ $? -ne 0 ]; then
    echo "Writing boot.ini in root of SD card\033[31m failed\033[0m."
else
    echo "Writing boot.ini in root of SD card\033[32m success\033[0m."
fi

### Write system_settings.ini in /atmosphere/config
cat > ./atmosphere/config/system_settings.ini << ENDOFFILE
[eupld]
; 禁用将错误报告上传到任天堂
upload_enabled = u8!0x0

[ro]
; 控制 RO 是否应简化其对 NRO 的验证。
; （注意：这通常不是必需的，可以使用 IPS 补丁。
ease_nro_restriction = u8!0x1

[atmosphere]
; 是否自动开启所有金手指。0=关。1=开。
dmnt_cheats_enabled_by_default = u8!0x0

; 如果你希望大气记住你上次金手指状态，请删除下方；号
; dmnt_always_save_cheat_toggles = u8!0x1

; 如果大气崩溃，10秒后自动重启
; 1秒=1000毫秒，转换16进制
fatal_auto_reboot_interval = u64!0x2710

; 使电源菜单的“重新启动”按钮重新启动到payload
; 设置"normal"正常重启l 设置"rcm"重启RCM，
; power_menu_reboot_function = str!payload

; 启动90DNS与任天堂服务器屏蔽
enable_dns_mitm = u8!0x1
add_defaults_to_dns_hosts = u8!0x1

; 是否将蓝牙配对数据库用与虚拟系统
enable_external_bluetooth_db = u8!0x1

[usb]
; 开启USB3.0   尾数改为0是关闭
usb30_force_enabled = u8!0x1

[tc]
sleep_enabled = u8!0x0
holdable_tskin = u32!0xEA60
tskin_rate_table_console = str!”[[-1000000, 28000, 0, 0], [28000, 42000, 0, 51], [42000, 48000, 51, 102], [48000, 55000, 102, 153], [55000, 60000, 153, 255], [60000, 68000, 255, 255]]”
tskin_rate_table_handheld = str!”[[-1000000, 28000, 0, 0], [28000, 42000, 0, 51], [42000, 48000, 51, 102], [48000, 55000, 102, 153], [55000, 60000, 153, 255], [60000, 68000, 255, 255]]”
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing system_settings.ini in ./atmosphere/config\033[31m failed\033[0m."
else
    echo "Writing system_settings.ini in ./atmosphere/config\033[32m success\033[0m."
fi


curl -sL https://api.github.com/repos/ndeadly/MissionControl/releases/latest \
  | jq '.tag_name' \
  | xargs -I {} echo MissionControl {} >> ../description.txt

curl -sL https://api.github.com/repos/ndeadly/MissionControl/releases/latest \
  | jq '.assets' | jq '.[0].browser_download_url' \
  | xargs -I {} curl -sL {} -o MissionControl.zip

# if [ $? -ne 0 ]; then
#     echo "MissionControl download\033[31m failed\033[0m."
# else
#     echo "MissionControl download\033[32m success\033[0m."
#     unzip -oq MissionControl.zip
#     rm MissionControl.zip
# fi


###
cat >> ../description.txt << ENDOFFILE
Tinfoil-17v3
ovlloader
ovlmenu
ovl-sysmodules
linkalho
EdiZon
StatusMonitor
sys-clk
ReverseNX-RT
emuiibo
ldn_mitm
fastcfwswitch
Edizon-SE
MissionControl
sys-con
DBI 647 中文版
ENDOFFILE

### Fetch lastest Zing from https://github.com/tomvita/Zing/releases/latest
curl -sL https://api.github.com/repos/tomvita/Zing/releases/latest \
  | jq '.tag_name' \
  | xargs -I {} echo Zing {} >> ../description.txt
curl -sL https://api.github.com/repos/tomvita/Zing/releases/latest \
  | jq '.assets' | jq '.[1].browser_download_url' \
  | xargs -I {} curl -sL {} -o Zing.ovl
if [ $? -ne 0 ]; then
    echo "Zing download\033[31m failed\033[0m."
else
    echo "Zing download\033[32m success\033[0m."
    mv Zing.ovl ./switch/.overlays
fi


# 写入到 "千叶奈雪自动构建.txt" 文件中
cat ../description.txt > 千叶奈雪自动构建Lite.txt << ENDOFFILE
$atmosphere_name+$hekate_name
ENDOFFILE
if [ $? -ne 0 ]; then
    echo "Writing 千叶奈雪自动构建.txt\033[31m failed\033[0m."
else
    echo "Writing 千叶奈雪自动构建.txt\033[32m success\033[0m."
fi

### Fetch Chinese lang
mkdir -p switch/.overlays/lang/fastCFWswitch
curl -sL https://raw.githubusercontent.com/zdm65477730/fastCFWswitch/master/lang/zh-Hans.json -o switch/.overlays/lang/fastCFWswitch/zh-Hans.json
curl -sL https://raw.githubusercontent.com/zdm65477730/fastCFWswitch/master/lang/zh-Hant.json -o switch/.overlays/lang/fastCFWswitch/zh-Hant.json
mkdir -p switch/.overlays/lang/QuickNTP
curl -sL https://raw.githubusercontent.com/zdm65477730/QuickNTP/master/lang/zh-Hans.json -o switch/.overlays/lang/QuickNTP/zh-Hans.json
curl -sL https://raw.githubusercontent.com/zdm65477730/QuickNTP/master/lang/zh-Hant.json -o switch/.overlays/lang/QuickNTP/zh-Hant.json
mkdir -p switch/.overlays/lang/sys-clk
curl -sL https://raw.githubusercontent.com/zdm65477730/sys-clk/develop/overlay/lang/zh-Hans.json -o switch/.overlays/lang/sys-clk/zh-Hans.json
curl -sL https://raw.githubusercontent.com/zdm65477730/sys-clk/develop/overlay/lang/zh-Hant.json -o switch/.overlays/lang/sys-clk/zh-Hant.json
mkdir -p config/ultrahand/lang
curl -sL https://raw.githubusercontent.com/ppkantorski/Ultrahand-Overlay/main/lang/zh-cn.json -o config/ultrahand/lang/zh-cn.json

### Write sort.cfg in /config/Tesla-Menu/sort.cfg
cat > ./config/Tesla-Menu/sort.cfg << ENDOFFILE
EdiZon
ovl-sysmodules
StatusMonitor
sys-clk-overlay
ReverseNX-RT
fastcfwswitch
ldn_mitm
emuiibo
QuickNTP
Zing
sys-patch
ENDOFFILE

### Delete reboot_to_payload.nro & reboot_to_hekate.nro
rm switch/reboot_to_payload.nro
rm switch/sys-clk-manager.nro
# -------------------------------------------

echo ""
echo "\033[32mYour Switch SD card is prepared! 千叶奈雪的自动构建Lite版已经完成\033[0m"
