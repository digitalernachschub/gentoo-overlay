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
IUSE=""
RESTRICT="mirror"

RDEPEND="
	app-portage/flaggie
	dev-python/docker-py
	dev-python/click
	dev-python/toml
"
DEPEND="${RDEPEND}"

src_install() {
	python_foreach_impl python_domodule ${PN}.py
}
