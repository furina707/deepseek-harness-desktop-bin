#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/../deepseek-harness" && pwd)"

echo "==> 1. 正在构建 DeepSeek Harness Linux 桌面包产物..."
cd "${ROOT_DIR}"
pnpm run package:desktop:linux:x64:dir

echo "==> 2. 正在通过 makepkg 打包为 Arch Linux 安装包..."
cd "${SCRIPT_DIR}"
makepkg -f

echo "==> 3. 正在调用 yay / pacman 安装到系统..."
PKG_FILE=$(ls -t deepseek-harness-desktop-bin-*.pkg.tar.zst 2>/dev/null | head -n 1)

if [ -n "${PKG_FILE}" ]; then
  echo "正在安装: ${PKG_FILE}"
  yay -U "${PKG_FILE}"
  echo "==> 安装完成！你可以在应用菜单中搜索 'DeepSeek Harness' 或在终端运行 'deepseek-harness-desktop'。"
else
  echo "错误: 未找到生成的 .pkg.tar.zst 文件！"
  exit 1
fi
