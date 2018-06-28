# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Apache Kafka client based on Python asyncio"
HOMEPAGE="https://github.com/aio-libs/aiokafka https://pypi.python.org/pypi/aiokafka"
SRC_URI="https://github.com/aio-libs/aiokafka/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="snappy"

RDEPEND="snappy? ( >=dev-python/snappy-0.5[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	=dev-python/kafka-python-1.3.5[${PYTHON_USEDEP}]
	virtual/python-typing
"
