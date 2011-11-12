# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-input-tslib/xf86-input-tslib-0.0.6-r2.ebuild,v 1.11 2011/05/08 12:33:38 scarabeus Exp $

EAPI=4

inherit xorg-2

PATCHLEVEL=7

DESCRIPTION="xorg input driver for use of tslib based touchscreen devices"
HOMEPAGE="http://www.pengutronix.de/software/xf86-input-tslib/index_en.html"
SRC_URI="
	ftp://cdn.debian.net/debian/pool/main/x/${PN}/${PN}_${PV}.orig.tar.gz
	ftp://cdn.debian.net/debian/pool/main/x/${PN}/${PN}_${PV}-${PATCHLEVEL}.debian.tar.gz
"

LICENSE="GPL-2"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sh sparc x86"
IUSE=""

RDEPEND="x11-libs/tslib"
DEPEND="${RDEPEND}
	x11-proto/randrproto"

DOCS=( COPYING ChangeLog )

PATCHES=(
	"${WORKDIR}"/debian/patches/95_update-manpage.diff
	"${WORKDIR}"/debian/patches/0001-fix-segfault.patch
	"${WORKDIR}"/debian/patches/xf86-input-tslib-port-ABI-12-r48.patch
)
