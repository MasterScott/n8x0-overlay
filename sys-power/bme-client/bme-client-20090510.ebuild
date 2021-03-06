# Copyright 2009 Luke Dashjr
# Distributed under the terms of the GNU General Public License v2
# $Header$

EAPI=2

DESCRIPTION="Simple command-line Battery Management Entity client"
HOMEPAGE="http://wiki.maemo.org/Mer/Documentation/BME_Protocol"
LICENSE="GPL-2"

SLOT='0'
KEYWORDS='arm'
SRC_URI="
	http://bowman.infotech.monash.edu.au/~pmoulder/${PN}.c -> ${P}.c
	http://github.com/downloads/slonopotamus/n8x0-overlay/${P}.c
	http://luke.dashjr.org/programs/gentoo-n8x0/distfiles/${P}.c
"
IUSE=''

DEPEND='
'
RDEPEND='
	sys-apps/nit-bootmenu-compat
'

S="${WORKDIR}"

src_prepare() {
	sed 's:/tmp/:/var/run/nokia/:' < "${DISTDIR}/${A}" > "${S}/${PN}.c"
}

src_compile() {
	cc ${CFLAGS} ${LDFLAGS} "${PN}.c" -o "${PN}"
}

src_install() {
	dobin "${PN}"
}
