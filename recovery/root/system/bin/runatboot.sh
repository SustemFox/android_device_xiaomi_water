#!/system/bin/sh

module_path=/vendor/lib/modules

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=

# Load Needed Modules
insmod $module_path/bt_drv_connac1x.ko
insmod $module_path/connfem.ko
insmod $module_path/fmradio_drv_mt6631.ko
insmod $module_path/fpsgo.ko
insmod $module_path/gps_drv.ko
insmod $module_path/met.ko
insmod $module_path/mt6357-accdet.ko
insmod $module_path/wlan_drv_gen4m.ko
insmod $module_path/wmt_chrdev_wifi.ko
insmod $module_path/wmt_drv.ko

# Fix up chipone
if [[ -d /sys/class/touchscreen/ICNL9916 ]]; then
        echo "chipone"
        chipone_fw_path=/vendor/firmware/ICNL9916.bin
        flash_path=/sys/chipone-tddi/cts_firmware

        sleep 2

        echo $chipone_fw_path > $flash_path/update_from_file
fi

exit 0
