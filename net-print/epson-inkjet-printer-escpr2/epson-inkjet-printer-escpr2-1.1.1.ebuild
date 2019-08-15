# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit estack rpm

DESCRIPTION="Epson Inkjet Printer Driver 2 (ESC/P-R)"
HOMEPAGE="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
SRC_URI="https://download3.ebz.epson.net/dsc/f/03/00/09/72/04/c6d928e83e558c4ba1e7e8bcb5c1fe080b8095eb/epson-inkjet-printer-escpr2-1.1.1-1lsb3.2.src.rpm"

LICENSE="LGPL-2.1 EPSON-EULA"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	app-text/ghostscript-gpl
	net-print/cups
"

src_configure() {
	econf --disable-shared

	# Makefile calls ls to generate a file list which is included in Makefile.am
	# Set the collation to C to avoid automake being called automatically
	unset LC_ALL
	export LC_COLLATE=C
}

src_install() {
	emake DESTDIR="${D}" install
	einstalldocs
}
