# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{5,6,7} )

inherit distutils-r1

DESCRIPTION="Pytest plugin for randomizing test order"
HOMEPAGE="https://github.com/jbasko/${PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Source tarball does not contain tests
# See https://github.com/jbasko/pytest-random-order/issues/35
RESTRICT="test"

RDEPEND="
	>=dev-python/pytest-2.9.2[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

python_test() {
	pytest -vv tests/ || die "Tests failed with ${EPYTHON}"
}
