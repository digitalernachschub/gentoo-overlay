# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
inherit distutils-r1 user versionator

MY_PV=$(delete_version_separator _)
MY_P=${PN}-${MY_PV}

DESCRIPTION="Proxy for the Python Package Index (PyPI)"
HOMEPAGE="https://github.com/devpi/devpi"
SRC_URI="https://github.com/devpi/devpi/archive/server-${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-python/py-1.4.23[${PYTHON_USEDEP}]
	>=dev-util/devpi-common-3.2.0_rc1[${PYTHON_USEDEP}]
	>=dev-python/itsdangerous-0.24[${PYTHON_USEDEP}]
	>=dev-python/execnet-1.2[${PYTHON_USEDEP}]
	>=dev-python/pyramid-1.5.1[${PYTHON_USEDEP}]
	>=dev-python/waitress-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/repoze-lru-0.6[${PYTHON_USEDEP}]
	>=dev-python/pluggy-0.3.0[${PYTHON_USEDEP}]
	dev-python/passlib[${PYTHON_USEDEP},argon2(-)]
	"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"

S=${WORKDIR}/${MY_P}/server

pkg_setup() {
	enewuser devpi
}

src_install() {
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	distutils-r1_src_install
}

pkg_config() {
	einfo "Setting permission of devpi-server directory…"
	chown devpi /var/lib/devpi
	einfo "Initializing devpi-server…"
	su -c "devpi-server --serverdir /var/lib/devpi --init" devpi
}
