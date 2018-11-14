# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python2_7 python3_{5,6} )

inherit distutils-r1

DESCRIPTION="Pytest plugin for detecting open file handles"
HOMEPAGE="https://github.com/astropy/${PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Tests are not included in the PyPI of v0.3.0 sources
# This is fixed as of b9924b3b4e6f149225a2376a2ca101ab344c6be7
RESTRICT="test"

RDEPEND="
	>=dev-python/pytest-2.8.0[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

DOCS=( CHANGES.rst README.rst )

python_test() {
	pytest -vv tests/ || die "Tests failed with ${EPYTHON}"
}
