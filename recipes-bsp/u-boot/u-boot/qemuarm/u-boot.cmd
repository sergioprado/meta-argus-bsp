env set fit_image "/fitImage"
env set fit_addr_r "0x48000000"

env set bootargs "console=tty1 console=ttyAMA0 root=/dev/vda2 rootfstype=squashfs ${bootargs_argus}"

env set load_fit 'ext4load ${devtype} ${devnum}:${distro_bootpart} ${fit_addr_r} ${fit_image}'

env set bootcmd_run 'run load_fit; bootm ${fit_addr_r}'

run bootcmd_run
