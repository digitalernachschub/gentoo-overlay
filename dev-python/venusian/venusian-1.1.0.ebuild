# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="A library for deferring decorator actions"
HOMEPAGE="http://www.pylonsproject.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="repoze"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# Doc generation uses git to fetch pylons-sphinx-theme and is therefore not supported in this ebuild
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
	"

DOCS=( CHANGES.rst CONTRIBUTORS.txt COPYRIGHT.txt README.rst )

python_test() {
	cd "${BUILD_DIR}"
	pytest lib/venusian/tests || die "Tests fail with ${EPYTHON}"
}
