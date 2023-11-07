env set kernel_image "/zImage"
env set dtb_image "/qemuarm.dtb"
env set ramdisk_image "/ramdisk.img"

env set bootargs "console=tty1 console=ttyAMA0 root=/dev/vda2 rootfstype=squashfs ${bootargs_argus}"

env set load_kernel 'ext4load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} ${kernel_image}'
env set load_dtb 'ext4load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr} ${dtb_image}'
env set load_ramdisk 'ext4load ${devtype} ${devnum}:${distro_bootpart} ${ramdisk_addr_r} ${ramdisk_image}; setenv ramdisk_size 0x${filesize}'

env set bootcmd_run 'run load_kernel; run load_dtb; run load_ramdisk; bootz ${kernel_addr_r} ${ramdisk_addr_r}:${ramdisk_size} ${fdt_addr}'

run bootcmd_run
