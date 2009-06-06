# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=1

tPN="${PN/-cal/}"
DESCRIPTION="Calibration tool for the stlc45xx wifi driver"
SRC_URI="http://tablets-dev.nokia.com:80/d2.php?f=${P}&/${P}"
LICENSE="stlc45xx"
HOMEPAGE="http://tablets-dev.nokia.com/"

SLOT="0"
KEYWORDS="~arm"
IUSE="+udev"

DEPEND=""
RDEPEND="
	udev? ( sys-fs/udev )
"

RESTRICT="fetch mirror"

pkg_nofetch() {
	einfo "Please download (click through license):"
	einfo "${SRC_URI}"
	einfo "and move it to ${DISTDIR}"
}

src_install() {
	exeinto "/sbin"
	newexe "${DISTDIR}/${A}" "${PN}" ||
		die "${PN} binary not installed properly"
	
	if use udev; then
		exeinto "/$(get_libdir)/udev"
		doexe "${FILESDIR}/${PN}" ||
			die "${PN} script not installed properly"
		insinto "/etc/udev/rules.d"
		newins "${FILESDIR}/${tPN}.rules" "40-${tPN}.rules" ||
			die "${tPN} udev rules not installed properly"
	fi
}
