# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
# Python 3.7 support blocked by pytest-asyncio
PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="Backport of PEP-550 for task-local variables in asyncio"
HOMEPAGE="https://github.com/fantix/aiocontextvars"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	$(python_gen_cond_dep '~dev-python/contextvars-2.3[${PYTHON_USEDEP}]' python3_5 python3_6)
"
# Building with <=setuptools-36.7.2 results in a SandboxViolation error
DEPEND="${RDEPEND}
	dev-python/pytest-runner[${PYTHON_USEDEP}]
	>=dev-python/setuptools-38.5.1[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.8.0[${PYTHON_USEDEP}]
	)
"

DOCS=( AUTHORS.rst CONTRIBUTING.rst HISTORY.rst README.rst )

python_test() {
	pytest -vv || die "Tests failed with ${EPYTHON}"
}
