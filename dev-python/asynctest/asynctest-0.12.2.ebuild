# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Adds asyncio support to Python's unittest module"
HOMEPAGE="https://github.com/Martiusweb/${PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Unit test seems to be broken
# See https://github.com/Martiusweb/asynctest/issues/112
RESTRICT="test"

RDEPEND=""
DEPEND=">=dev-python/setuptools-30.3.0[${PYTHON_USEDEP}]"

python_test() {
	PYTHONPATH=. "${PYTHON}" -m unittest --verbose test || die "Tests failed with ${EPYTHON}"
}
