# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1

MY_PV="$(ver_rs 2 - ${PV})"
MY_P="${PN}-${MY_PV}"
DESCRIPTION="Adds support for Python 3 annotations in sphinx-enabled docstrings"
HOMEPAGE="https://github.com/nicolashainaux/sphinx-autodoc-annotation"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

LICENSE="BSD"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

CDEPEND="
	>=dev-python/sphinx-1.1[${PYTHON_USEDEP}]
"
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${MY_P}"
