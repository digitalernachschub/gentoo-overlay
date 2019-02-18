# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Support for Python 3.7 blocked by pytest-asyncio
PYTHON_COMPAT=( python2_7 python3_{5,6} )
inherit distutils-r1

DESCRIPTION="Library supporting Prometheus metrics in asynchronous web frameworks"
HOMEPAGE="https://prometheus-async.readthedocs.io/en/stable/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="~amd64"
SLOT="0"
IUSE="test"

RDEPEND="
	>=dev-python/prometheus_client-0.0.18[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/monotonic[${PYTHON_USEDEP}]' python2_7 python3_5)
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		<dev-python/pytest-4.1[${PYTHON_USEDEP}]
		$(python_gen_cond_dep 'dev-python/pytest-asyncio[${PYTHON_USEDEP}]' 'python3*')
	)
"

DOCS=( AUTHORS.rst CHANGELOG.rst README.rst )

python_test() {
	pytest -vv tests/test_utils.py || die "Tests failed with ${EPYTHON}"
}

pkg_postinst() {
	optfeature "aiohttp support" >=dev-python/aiohttp-3
	optfeature "consul support" >=dev-python/aiohttp-3
	optfeature "twisted support" dev-python/twisted
}
