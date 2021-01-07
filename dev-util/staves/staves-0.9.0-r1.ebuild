# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

DESCRIPTION="Gentoo-based Docker container builder"
HOMEPAGE="https://github.com/digitalernachschub/staves"
if [ "${PV}" == "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/digitalernachschub/staves.git"
	KEYWORDS=""

	# Cannot use distutils, because there is no proper way to generate a setup.py with the poetry package manager
	# See https://github.com/sdispater/poetry/issues/761
	inherit python-r1
	src_install() {
		python_foreach_impl python_domodule ${PN}
	}
else
	inherit distutils-r1
	SRC_URI="https://pypi.digitalernachschub.de/packages/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"
IUSE="git"
RESTRICT="mirror"

RDEPEND="
	app-eselect/eselect-repository:0
	>=dev-python/docker-py-3[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
	git? ( dev-vcs/git )
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
