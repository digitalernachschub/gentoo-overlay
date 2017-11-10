# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} pypy )
inherit distutils-r1

DESCRIPTION="CFFI bindings to the Argon2 password hashing library"
HOMEPAGE="https://github.com/hynek/argon2_cffi"
SRC_URI="https://github.com/hynek/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	>=app-crypt/argon2-20161029:=
	dev-python/six[${PYTHON_USEDEP}]
	>=dev-python/cffi-1.0.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep 'dev-python/enum34[${PYTHON_USEDEP}]' 'python2_7' 'pypy')
	"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"

PATCHES=(
	"${FILESDIR}/${P}-system-argon2.patch"
)
