# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_6 )
inherit distutils-r1

DESCRIPTION="Gentoo-based Docker container builder"
HOMEPAGE="https://www.digitalernachschub.de"
if [ "${PV}" == "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="git://digitalernachschub.de/staves.git"
	KEYWORDS=""
else
	SRC_URI="https://pypi.digitalernachschub.de/packages/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="all-rights-reserved"
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
