# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A comment system that can be embedded into websites"

HOMEPAGE="https://remark42.com/"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

MY_PN="remark42"
SRC_URI="
	amd64? ( https://github.com/umputun/${MY_PN}/releases/download/v${PV}/${MY_PN}.linux-amd64.tar.gz -> ${MY_PV}.linux-amd64.tar.gz )
	arm64? ( https://github.com/umputun/${MY_PN}/releases/download/v${PV}/${MY_PN}.linux-arm64.tar.gz -> ${MY_PV}.linux-arm64.tar.gz )
	x86? ( https://github.com/umputun/${MY_PN}/releases/download/v${PV}/${MY_PN}.linux-386.tar.gz -> ${MY_PV}.linux.386.tar.gz )
"

IUSE=""
DEPEND="
	acct-user/remark42
	acct-group/remark42
"
RDEPEND=""
S="${WORKDIR}"

src_install() {
	newinitd "${FILESDIR}"/remark42.initd remark42
	newconfd "${FILESDIR}"/remark42.confd remark42
	insinto /etc
	doins "${FILESDIR}"/remark42.conf
	keepdir /var/log/${MY_PN}
	fowners ${MY_PN}:${MY_PN} /var/log/${MY_PN}

	local executable
	if use amd64; then
		executable="${S}/${MY_PN}.linux-amd64"
	elif use arm64; then
		executable="${S}/${MY_PN}.linux-arm64"
	elif use amd64; then
		executable="${S}/${MY_PN}.linux-386"
	fi
	newbin "${executable}" "${MY_PN}"
}
