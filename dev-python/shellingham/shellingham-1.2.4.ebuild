# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{2_7,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Tool to Detect Surrounding Shell"
HOMEPAGE="https://github.com/sarugaku/shellingham"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="ISC"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
