FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "\
    file://qemuarm.dts \
    file://dm-verity.cfg \
"

do_configure:append() {
    install -m 664 ${WORKDIR}/qemuarm.dts ${S}/arch/arm/boot/dts/
}
