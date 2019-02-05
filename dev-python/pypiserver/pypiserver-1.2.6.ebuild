# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
# python3_7, pypy and pypy3 compatibilty blocked by dependencies
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1 eutils user systemd

DESCRIPTION="A minimal server for a custom Python package index"
HOMEPAGE="https://pypiserver.readthedocs.io/en/latest/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

LICENSE="ZLIB libpng MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/setuptools-git-0.3[${PYTHON_USEDEP}]
	>=dev-python/wheel-0.25.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/passlib-1.6[${PYTHON_USEDEP}]
		>=dev-python/pip-7[${PYTHON_USEDEP}]
		>=dev-python/pytest-2.3[${PYTHON_USEDEP}]
		dev-python/twine[${PYTHON_USEDEP}]
		dev-python/webtest[${PYTHON_USEDEP}]
		virtual/python-unittest-mock[${PYTHON_USEDEP}]
	)
"

DOCS=( AUTHORS.rst CHANGES.rst README.rst )

SERVICE_NAME="pypiserver"
SERVICE_USER="${SERVICE_NAME}"
SERVICE_GROUP="${SERVICE_USER}"

pkg_setup() {
	enewuser "${SERVICE_USER}" -1 -1 "/var/lib/${SERVICE_NAME}"
	enewgroup "${SERVICE_GROUP}"
}

python_test() {
	pytest -vv tests/ || die "Tests failed with ${EPYTHON}"
}

src_install() {
	insinto /etc/
	doins "${FILESDIR}/${SERVICE_NAME}.conf"
	newinitd "${FILESDIR}/${SERVICE_NAME}.initd" "${SERVICE_NAME}"
	systemd_dounit "${FILESDIR}/${SERVICE_NAME}.service"
	keepdir "/var/log/${SERVICE_NAME}"
	keepdir "/var/lib/${SERVICE_NAME}/packages"
	fowners "${SERVICE_USER}":"${SERVICE_GROUP}" /var/{lib,log}/"${SERVICE_NAME}"

	distutils-r1_src_install
}

pkg_postinst() {
	optfeature "authentication support" dev-python/passlib
	optfeature "caching support" dev-python/watchdog
}
