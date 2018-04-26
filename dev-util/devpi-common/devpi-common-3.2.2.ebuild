# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} pypy )
inherit distutils-r1 versionator

MY_PV=$(delete_version_separator _)
MY_P=${PN}-${MY_PV}

DESCRIPTION="Utilities for devpi-server and devpi-client"
HOMEPAGE="https://github.com/devpi/devpi"
SRC_URI="https://github.com/devpi/devpi/archive/common-${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=dev-python/requests-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/py-1.4.20[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"

S=${WORKDIR}/${MY_P}/common
