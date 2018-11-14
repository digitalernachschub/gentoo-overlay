# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Support for Python 3.7 blocked by missing support of dev-python/async_generator
PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="Asyncio support for pytest"
HOMEPAGE="https://github.com/pytest-dev/pytest-asyncio"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

SLOT="0"
LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Tests are not included in the PyPI tarball
# See https://github.com/pytest-dev/pytest-asyncio/issues/94
RESTRICT="test"

RDEPEND="
	>=dev-python/pytest-3.0.6[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/async_generator-1.3[${PYTHON_USEDEP}]' 'python3_5')
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/async_generator-1.3[${PYTHON_USEDEP}]
	)
"

python_test() {
	pytest -vv || die "Tests failed with ${EPYTHON}"
}
