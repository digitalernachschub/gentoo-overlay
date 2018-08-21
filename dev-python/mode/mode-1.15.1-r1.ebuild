# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
# Python 3.7 is supported by mode, but not by dependencies (e.g. sphinx_celery
PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="Service abstraction layer for Python Asyncio"
HOMEPAGE="https://github.com/ask/mode"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD doc? ( CC-BY-SA-4.0 )"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc examples"

CDEPEND="
	>=dev-python/colorlog-2.9.0[${PYTHON_USEDEP}]
"
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/alabaster[${PYTHON_USEDEP}]
		dev-python/sphinx-autodoc-annotation[${PYTHON_USEDEP}]
		>=dev-python/sphinx_celery-1.1[${PYTHON_USEDEP}]
		dev-python/sphinxcontrib-asyncio[${PYTHON_USEDEP}]
	)
"

python_compile_all() {
	use doc && emake -C docs html
}

python_install_all() {
	dodoc Changelog
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
