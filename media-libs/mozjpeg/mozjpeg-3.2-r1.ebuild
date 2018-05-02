# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Improved JPEG encoder based on libjpeg-turbo"
HOMEPAGE="https://github.com/mozilla/mozjpeg"
SRC_URI="https://github.com/mozilla/${PN}/releases/download/v${PV}/${P}-release-source.tar.gz"

LICENSE="BSD IJG"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="jpeg"

RDEPEND="sys-libs/zlib"
DEPEND="${RDEPEND}
	dev-lang/nasm
	!jpeg? ( !!media-libs/libjpeg-turbo )
"

S=${WORKDIR}/${PN}

src_install() {
	if use jpeg; then
		# wrapper to use renamed libjpeg.so (allows coexistence with libjpeg-turbo)
		echo -e '#!/bin/sh\nLD_PRELOAD="libmozjpeg.so $LD_PRELOAD" .$(basename $0) "$@"' > wrapper
		newbin wrapper mozcjpeg
		newbin wrapper mozjpegtran

		newbin .libs/cjpeg .mozcjpeg
		newbin .libs/jpegtran .mozjpegtran
		newlib.so .libs/libjpeg.so.62.2.0 libmozjpeg.so
	else
		dobin .libs/cjpeg
		dobin .libs/jpegtran
		dolib.so .libs/libjpeg.so.62.2.0
	fi
	dodoc README.md README-mozilla.txt usage.txt wizard.txt
}
