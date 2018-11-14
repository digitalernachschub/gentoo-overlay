# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
# Python 3.7 is supported by mode, but not by dependencies (e.g. sphinx_celery)
PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="Service abstraction layer for Python Asyncio"
HOMEPAGE="https://github.com/ask/mode"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD doc? ( CC-BY-SA-4.0 )"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc examples test"

# Source tarball does not contain tests
# See https://github.com/ask/mode/pull/12
RESTRICT="test"

RDEPEND="
	>=dev-python/colorlog-2.9.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/aiocontextvars-0.2[${PYTHON_USEDEP}]' python3_6)
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/alabaster[${PYTHON_USEDEP}]
		dev-python/sphinx-autodoc-annotation[${PYTHON_USEDEP}]
		>=dev-python/sphinx_celery-1.1[${PYTHON_USEDEP}]
		dev-python/sphinxcontrib-asyncio[${PYTHON_USEDEP}]
	)
	test? (
		>=dev-python/hypothesis-3.31[${PYTHON_USEDEP}]
		>=dev-python/pytest-3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiofiles-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.8[${PYTHON_USEDEP}]
		>=dev-python/pytest-base-url-1.4.1[${PYTHON_USEDEP}]
		dev-python/pytest-forked[${PYTHON_USEDEP}]
		>=dev-python/pytest-openfiles-0.2.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-random-order-0.5.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-1.20[${PYTHON_USEDEP}]
	)
"

python_compile_all() {
	use doc && emake -C docs html
}

python_test() {
	pytest -vv t/ || die "Tests failed with ${EPYTHON}"
}

python_install_all() {
	dodoc Changelog
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
