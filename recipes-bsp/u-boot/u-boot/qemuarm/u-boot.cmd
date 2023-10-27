env set kernel_image "/zImage"
env set dtb_image "/qemuarm.dtb"

env set bootargs "console=ttyAMA0 console=tty1 root=/dev/vda2 rootfstype=squashfs"

env set load_kernel 'ext4load ${devtype} ${devnum}:${distro_bootpart} ${kernel_addr_r} ${kernel_image}'
env set load_dtb 'ext4load ${devtype} ${devnum}:${distro_bootpart} ${fdt_addr} ${dtb_image}'

env set bootcmd_run 'run load_kernel; run load_dtb; bootz ${kernel_addr_r} - ${fdt_addr}'

run bootcmd_run
