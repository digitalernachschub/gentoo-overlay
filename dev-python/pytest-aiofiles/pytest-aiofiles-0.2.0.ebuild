# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="Provides pytest fixtures for abstracting real file IO"
HOMEPAGE="https://github.com/ptpb/${PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Tests seem to be broken
# See https://github.com/ptpb/pytest-aiofiles/issues/2
RESTRICT="test"

RDEPEND="
	>=dev-python/pyfakefs-3.1[${PYTHON_USEDEP}]
	>=dev-python/aiofiles-0.3.1[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		>=dev-python/asynctest-0.10.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.0.5[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.5.0[${PYTHON_USEDEP}]
	)
"

python_test() {
	pytest -vv tests/ || die "Tests failed with ${EPYTHON}"
}
