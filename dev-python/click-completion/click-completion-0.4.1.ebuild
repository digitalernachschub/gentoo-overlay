# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Enhanced completion for Click"
HOMEPAGE="https://github.com/click-contrib/click-completion"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""

CDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/jinja[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/shellingham[${PYTHON_USEDEP}]
"
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
