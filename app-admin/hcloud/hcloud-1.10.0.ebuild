# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_SRC="github.com/hetznercloud/cli"
EGO_PN=${EGO_SRC}/...
EGO_VENDOR=(
	"github.com/dustin/go-humanize bb3d318650d48840a39aa21a027c6630e198e626"
	"github.com/fatih/structs ebf56d35bba727c68ac77f56f2fcf90b181851aa"
	"github.com/gosuri/uilive ac356e6e42cd31fcef8e6aec13ae9ed6fe87713e"
	"github.com/gosuri/uiprogress d0567a9d84a1c40dd7568115ea66f4887bf57b33"
	"github.com/hetznercloud/hcloud-go v1.11.0"
	"github.com/pelletier/go-toml v1.1.0"
	"github.com/spf13/cobra 615425954c3b0d9485a7027d4d451fdcdfdee84e"
	"github.com/spf13/pflag v1.0.1"
	"github.com/thcyron/uiprogress 25e98ffb0e98b5192b475d8f2fd78083bfe9a67e"
	"golang.org/x/crypto d6449816ce06963d9d136eee5a56fca5b0616e7e github.com/golang/crypto"
	"golang.org/x/sys 3b87a42e500a6dc65dae1a55d0b641295971163e github.com/golang/sys"
)
inherit golang-build golang-vcs-snapshot bash-completion-r1

DESCRIPTION="Command-line interface for Hetzner Cloud"
HOMEPAGE="https://github.com/hetznercloud/cli"
ARCHIVE_URI="https://github.com/hetznercloud/cli/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="${ARCHIVE_URI}	${EGO_VENDOR_URI}"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"

src_install() {
	golang-build_src_install
	dobin "bin/${PN}"
	rm -rf "${D%/}$(get_golibdir_gopath)" || die

	"${S}/bin/${PN}" completion bash > ${PN}.bash-completion || die "Unable to create bash completion file"
	newbashcomp ${PN}.bash-completion ${PN}
}
