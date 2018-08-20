# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
# Python 3.7 support blocked by snappy
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Kafka protocol support in Python"
HOMEPAGE="https://github.com/robinhood/kafka-python/ https://pypi.org/project/robinhood-kafka-python/"
SRC_URI="https://github.com/robinhood/kafka-python/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="snappy test"

RDEPEND="snappy? ( dev-python/snappy[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
		dev-python/unittest2[${PYTHON_USEDEP}]
	)"

MY_P="kafka-python-${PV}"
S="${WORKDIR}/${MY_P}"

python_test() {
	unit2 -v || die "tests failed with ${EPYTHON}"
}
