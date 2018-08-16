# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_5,3_6} )

inherit distutils-r1

DESCRIPTION="File support for asyncio"
HOMEPAGE="https://github.com/Tinche/${PN}"
SRC_URI="mirror://pypi/a/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
