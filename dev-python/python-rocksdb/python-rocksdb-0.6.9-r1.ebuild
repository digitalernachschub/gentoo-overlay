# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
inherit distutils-r1

DESCRIPTION="Python bindings for the key-value store RocksDB"
HOMEPAGE="https://github.com/twmht/${PN}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-db/rocksdb-5.3.0[bzip2,lz4,snappy,zlib]
"
DEPEND="${RDEPEND}
	>=dev-python/cython-0.20[${PYTHON_USEDEP}]
	>=dev-python/setuptools-25[${PYTHON_USEDEP}]
	"
