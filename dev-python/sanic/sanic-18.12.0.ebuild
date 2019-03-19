# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
# Python 3.7 compatibility blocked by uvloop and ujson
PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="An asynchronous web microframework inspired by Flask"
HOMEPAGE="https://github.com/huge-success/${PN}"
SRC_URI="mirror://pypi/s/${PN}/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="ujson uvloop"

RDEPEND="
	>=dev-python/aiofiles-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/httptools-0.0.10[${PYTHON_USEDEP}]
	>=dev-python/multidict-4.0[${PYTHON_USEDEP}]
	<dev-python/multidict-5.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-6.0[${PYTHON_USEDEP}]
	<dev-python/websockets-7.0[${PYTHON_USEDEP}]
	ujson? ( >=dev-python/ujson-1.35[${PYTHON_USEDEP}] )
	uvloop? ( >=dev-python/uvloop-0.5.3[${PYTHON_USEDEP}] )
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

python_configure_all() {
	export SANIC_NO_UJSON=$(usex ujson "no" "yes")
	export SANIC_NO_UVLOOP=$(usex uvloop "no" "yes")
}
