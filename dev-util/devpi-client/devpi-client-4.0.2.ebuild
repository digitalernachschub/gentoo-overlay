# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} pypy )
inherit distutils-r1

DESCRIPTION="Management client for the PyPI proxy devpi"
HOMEPAGE="https://github.com/devpi/devpi"
SRC_URI="https://github.com/devpi/devpi/archive/client-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-python/tox-1.7.1[${PYTHON_USEDEP}]
	!=dev-python/tox-3.0.0_rc1[${PYTHON_USEDEP}]
	>=dev-python/py-1.4.31[${PYTHON_USEDEP}]
	>=dev-util/devpi-common-3.1.0[${PYTHON_USEDEP}]
	!>=dev-util/devpi-common-4[${PYTHON_USEDEP}]
	>=dev-python/pkginfo-1.4.2[${PYTHON_USEDEP}]
	>=dev-python/check-manifest-0.28[${PYTHON_USEDEP}]
	"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"

S=${WORKDIR}/${P}/client
