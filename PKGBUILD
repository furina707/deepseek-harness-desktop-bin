# Maintainer: DeepSeek Harness Community <https://github.com/deepseek-ai/deepseek-harness>
pkgname=deepseek-harness-desktop-bin
_pkgname=deepseek-harness-desktop
pkgver=0.2.2.rc.1
pkgrel=1
pkgdesc="Electron desktop application for DeepSeek Harness"
arch=('x86_64')
url="https://github.com/deepseek-ai/deepseek-harness"
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'cups'
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

# 提示：上传到你的 GitHub 仓库 Release 页面后，请将下面的 URL 替换为实际下载链接
# 例如：https://github.com/<YOUR_GITHUB_USER>/deepseek-harness/releases/download/v${pkgver}/...
source_x86_64=(
  "deepseek-harness-desktop.desktop"
  "deepseek-harness.png"
  # "deepseek-harness-${pkgver}.AppImage::https://github.com/<YOUR_GITHUB>/deepseek-harness/releases/download/v${pkgver}/deepseek-harness-${pkgver}-linux-x64-unsigned.AppImage"
)
sha256sums_x86_64=(
  'SKIP'
  'SKIP'
  # 'SKIP'
)

package() {
  # 1. 桌面图标与 .desktop 启动项安装
  install -Dm644 "${srcdir}/deepseek-harness-desktop.desktop" \
    "${pkgdir}/usr/share/applications/deepseek-harness-desktop.desktop"

  install -Dm644 "${srcdir}/deepseek-harness.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/deepseek-harness.png"

  # 2. 从本地打包产物（或解压后的 AppImage）安装至 /opt/deepseek-harness
  local _src_app="${srcdir}/squashfs-root"
  if [ ! -d "${_src_app}" ]; then
    # 尝试从本地仓库产物路径复制
    _src_app="${startdir}/../../apps/desktop/.desktop-build/targets/linux-x64/unsigned-artifacts/linux-unpacked"
  fi

  if [ -d "${_src_app}" ]; then
    install -d "${pkgdir}/opt/deepseek-harness"
    cp -rL "${_src_app}/"* "${pkgdir}/opt/deepseek-harness/"
    chmod +x "${pkgdir}/opt/deepseek-harness/deepseek-harness"

    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/deepseek-harness/deepseek-harness" "${pkgdir}/usr/bin/deepseek-harness-desktop"
  else
    echo "请提供构建产物或从 GitHub Release 下载 AppImage"
  fi
}
