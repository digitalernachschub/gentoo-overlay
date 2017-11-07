# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4,3_5,3_6} pypy )
inherit distutils-r1

DESCRIPTION="Pure Python implementation of the argon2 hash function"
HOMEPAGE="https://github.com/bwesterb/${PN}"
SRC_URI="mirror://github/bwesterb/${PN}/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/six[${PYTHON_USEDEP}]
	"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
