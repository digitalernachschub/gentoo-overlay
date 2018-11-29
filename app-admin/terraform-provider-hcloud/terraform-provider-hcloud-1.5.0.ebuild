# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_SRC="github.com/terraform-providers/terraform-provider-hcloud"
EGO_PN=${EGO_SRC}/...
inherit golang-build golang-vcs-snapshot

DESCRIPTION="Terraform provider for Hetzner Cloud resources"
HOMEPAGE="https://www.terraform.io/docs/providers/hcloud/index.html https://github.com/terraform-providers/terraform-provider-hcloud"
SRC_URI="https://github.com/terraform-providers/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="MPL-2.0"
SLOT="0"

src_install() {
	golang-build_src_install
	dobin "bin/${PN}"
	rm -rf "${D%/}$(get_golibdir_gopath)" || die
}
