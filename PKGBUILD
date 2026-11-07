# Maintainer: furina707 <https://github.com/furina707>
pkgname=deepseek-harness-desktop-bin
_pkgname=deepseek-harness-desktop
pkgver=0.2.2.rc.1
_realver=0.2.2-rc.1
pkgrel=3
pkgdesc="Electron desktop application for DeepSeek Harness"
arch=('x86_64')
url="https://github.com/furina707/deepseek-harness-desktop-bin"
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'libcups'
  'dbus'
  'expat'
  'glibc'
  'gtk3'
  'libdrm'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'nss'
  'pango'
  'systemd-libs'
)
optdepends=(
  'zenity: Native GNOME directory selection dialog'
  'kdialog: Native KDE directory selection dialog'
)
provides=('deepseek-harness-desktop')
conflicts=('deepseek-harness-desktop')
options=('!strip')

source_x86_64=(
  "deepseek-harness-desktop.desktop"
  "deepseek-harness.png"
  "deepseek-harness-${_realver}-linux-x64.tar.zst::https://github.com/furina707/deepseek-harness-desktop-bin/releases/download/v${_realver}/deepseek-harness-${_realver}-linux-x64.tar.zst"
)
sha256sums_x86_64=(
  'b4559e3ed1ee728b49dfcfef2199b483b8c06506506036e71bf21d9203351d7b'
  '982c2859568d83d2576110a527c545f04641f4008bdb2cfeb6758f333c0fb07a'
  '3c7a85d04ebecacedc959af60e4fd237b4ba0a9528bc59b26ea06c008d6e213d'
)

package() {
  # 1. 桌面图标与 .desktop 启动项安装
  install -Dm644 "${srcdir}/deepseek-harness-desktop.desktop" \
    "${pkgdir}/usr/share/applications/deepseek-harness-desktop.desktop"

  install -Dm644 "${srcdir}/deepseek-harness.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/deepseek-harness.png"

  # 2. 从解压后的产物安装至 /opt/deepseek-harness
  local _src_app="${srcdir}/linux-unpacked"
  if [ ! -d "${_src_app}" ]; then
    _src_app="${startdir}/../deepseek-harness/apps/desktop/.desktop-build/targets/linux-x64/unsigned-artifacts/linux-unpacked"
  fi

  if [ -d "${_src_app}" ]; then
    install -d "${pkgdir}/opt/deepseek-harness"
    cp -rL "${_src_app}/"* "${pkgdir}/opt/deepseek-harness/"
    chmod +x "${pkgdir}/opt/deepseek-harness/deepseek-harness"

    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/deepseek-harness/deepseek-harness" "${pkgdir}/usr/bin/deepseek-harness-desktop"
  else
    echo "错误：未找到解压产物！" >&2
    return 1
  fi
}
