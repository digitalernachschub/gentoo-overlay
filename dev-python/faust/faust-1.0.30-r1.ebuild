# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
# Python 3.7 support blocked by dependencies
PYTHON_COMPAT=( python3_6 )

inherit distutils-r1

DESCRIPTION="A stream processing library inspired by Kafka Streams"
HOMEPAGE="https://github.com/robinhood/${PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD doc? ( CC-BY-SA-4.0 )"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="doc examples rocksdb"

CDEPEND="
	>=dev-python/aiohttp-2.3.9[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	~dev-python/click-6.7[${PYTHON_USEDEP}]
	>=dev-python/click-completion-0.3.1[${PYTHON_USEDEP}]
	>=dev-python/colorclass-2.2[${PYTHON_USEDEP}]
	~dev-python/mode-1.15.1[${PYTHON_USEDEP}]
	~dev-python/robinhood-aiokafka-0.4.18[${PYTHON_USEDEP}]
	~dev-python/terminaltables-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/venusian-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/aiocontextvars[${PYTHON_USEDEP}]' 'python3_6')
	rocksdb? ( >=dev-python/python-rocksdb-0.6.7[${PYTHON_USEDEP}] )
"
RDEPEND="${CDEPEND}"
DEPEND="${CDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/alabaster[${PYTHON_USEDEP}]
		dev-python/sphinx[${PYTHON_USEDEP}]
		>=dev-python/sphinx_celery-1.4.0[${PYTHON_USEDEP}]
		dev-python/sphinx-autodoc-annotation[${PYTHON_USEDEP}]
		dev-python/sphinxcontrib-asyncio[${PYTHON_USEDEP}]
	)
"

DOCS=( AUTHORS.rst CODE_OF_CONDUCT.rst Changelog.rst README.rst )

src_prepare() {
	# Prevent examples from being installed into site-packages
	# See https://github.com/robinhood/faust/pull/144
	rm "${S}/examples/__init__.py" || die "Cannot find examples package"
	distutils-r1_src_prepare
}

python_compile_all() {
	use doc && emake -C docs html
}

python_install_all() {
	use doc && local HTML_DOCS=( docs/_build/html/. )
	use examples && dodoc -r examples
	distutils-r1_python_install_all
}
