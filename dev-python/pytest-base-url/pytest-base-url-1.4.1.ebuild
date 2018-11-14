# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
# Support for pypy3 blocked by missing support in dev-python/pytest-localserver
PYTHON_COMPAT=( python2_7 python3_6 pypy )

inherit distutils-r1

DESCRIPTION="Provides a pytest fixture defining a base URL for tests"
HOMEPAGE="https://github.com/pytest-dev/${PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-python/pytest-2.7.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.9[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest-localserver[${PYTHON_USEDEP}]
	)
"

python_test() {
	pytest -vv tests/ || die "Tests failed with ${EPYTHON}"
}
