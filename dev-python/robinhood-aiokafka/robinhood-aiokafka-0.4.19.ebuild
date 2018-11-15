# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python{3_4,3_5,3_6} )

inherit distutils-r1

DESCRIPTION="Asynchronous Python client for Apache Kafka"
HOMEPAGE="https://github.com/robinhood/aiokafka"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="snappy"

RDEPEND="
	!dev-python/aiokafka[${PYTHON_USEDEP}]
	~dev-python/robinhood-kafka-python-1.3.8[${PYTHON_USEDEP}]
	virtual/python-typing[${PYTHON_USEDEP}]
	snappy? ( >=dev-python/snappy-0.5[${PYTHON_USEDEP}] )
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
"
