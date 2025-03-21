maintainer=("Alxhr0 <alxhr0@protonmail.me>")

pkgname="hourglass-git"
gives="hourglass"
pkgdesc="Install age tool"
source=(
  "https://gitlab.com/alxhr0/hourglass.git"
)
arch=("any")
pkgver="1.0"
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app")
makedepends=("cargo")
external_connection=true
sha512sums=(
  "SKIP"
)

build() {
  cd "hourglass"
  cargo b --release -j"${NCPU}"
}

package() {
  cd "hourglass"

  # Install license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"

  # Install hourglass
  install -Dm755 "target/release/${gives}" "${pkgdir}/usr/bin/${gives}"
}

# vim:set ft=sh ts=2 sw=2 et:
