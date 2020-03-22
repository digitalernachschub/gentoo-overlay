# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils systemd
DESCRIPTION="A lightweight continuous integration server"

HOMEPAGE="http://laminar.ohwg.net/"
LICENSE="GPL-3+"

SLOT="0"
KEYWORDS="~amd64 ~x86"

if [ "${PV}" = "9999" ]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/ohwgiles/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/ohwgiles/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

IUSE=""
# Disable network sandboxing so that CMake can download JavaScript dependencies
RESTRICT="network-sandbox"

DEPEND="
	acct-user/laminar
	acct-group/laminar
"
RDEPEND="${DEPEND}
	>=dev-libs/capnproto-0.7.0
	>=dev-libs/rapidjson-1.1.0
	>=dev-cpp/websocketpp-0.7.0
	>=dev-libs/boost-1.62
	dev-db/sqlite:3"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/"
	)

	cmake-utils_src_configure
}

src_install() {
	newinitd "${FILESDIR}"/laminar.initd laminar
	keepdir /var/log/${PN}
	fowners ${PN}:${PN} /var/log/${PN}

	cmake-utils_src_install
}
