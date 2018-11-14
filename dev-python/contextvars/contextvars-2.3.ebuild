# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{5,6} )

inherit distutils-r1

DESCRIPTION="Backport of the contextvars module of Python 3.7"
HOMEPAGE="https://github.com/MagickStack/contextvars"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	~dev-python/immutables-0.6[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

python_test() {
	"${EPYTHON}" -m unittest discover tests/ || die "Tests failed with ${EPYTHON}"
}
