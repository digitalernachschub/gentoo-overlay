# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} pypy )
inherit distutils-r1

DESCRIPTION="Checks completeness of MANIFEST.in in a Python source package"
HOMEPAGE="https://github.com/mgedmin/${PN}"
SRC_URI="https://github.com/mgedmin/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
