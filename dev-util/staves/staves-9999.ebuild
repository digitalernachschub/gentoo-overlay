# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{3_5,3_6} )
inherit git-r3 python-r1

DESCRIPTION="Gentoo-based Docker container builder"
HOMEPAGE="https://www.digitalernachschub.de"
EGIT_REPO_URI="git://digitalernachschub.de/staves.git"

LICENSE="all-rights-reserved"

SLOT="0"
KEYWORDS="~amd64"
IUSE="git"
RESTRICT="mirror"

CDEPEND="
	${PYTHON_DEPS}
	dev-python/docker-py[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
"
RDEPEND="
	${CDEPEND}
	app-eselect/eselect-repository:0
	git? ( dev-vcs/git )
"
DEPEND="${CDEPEND}"

src_install() {
	python_foreach_impl python_domodule ${PN}.py
}
