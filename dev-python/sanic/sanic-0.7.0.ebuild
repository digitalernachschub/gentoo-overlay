# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_5,3_6} )

inherit distutils-r1

DESCRIPTION="An asynchronous web microframework inspired by Flask"
HOMEPAGE="https://github.com/channelcat/sanic"
SRC_URI="mirror://pypi/s/${PN}/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="ujson uvloop"

CDEPEND="
	>=dev-python/aiofiles-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/httptools-0.0.9[${PYTHON_USEDEP}]
	>=dev-python/websockets-4.0[${PYTHON_USEDEP}]
	ujson? ( >=dev-python/ujson-1.35[${PYTHON_USEDEP}] )
	uvloop? ( >=dev-python/uvloop-0.5.3[${PYTHON_USEDEP}] )
"
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

python_compile() {
	if [[ $(use ujson) ]]; then
		export SANIC_NO_UJSON="yes"
	fi
	if [[ $(use uvloop) ]]; then
		export SANIC_NO_UVLOOP="yes"
	fi
	distutils-r1_python_compile
}
