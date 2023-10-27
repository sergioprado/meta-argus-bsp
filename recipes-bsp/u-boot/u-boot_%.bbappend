FILESEXTRAPATHS:prepend := "${THISDIR}/${BPN}:"

SRC_URI += "\
    file://u-boot.cmd \
"

DEPENDS += "u-boot-mkimage-native"

do_deploy:append() {
    mkimage -T script -C none -n "Distro boot script" -d ${WORKDIR}/u-boot.cmd ${WORKDIR}/boot.scr
    install -m 0644 ${WORKDIR}/boot.scr ${DEPLOYDIR}
}
