# DeepSeek Harness Arch Linux / yay 打包指南

本目录包含将 DeepSeek Harness 桌面版安装为 Arch Linux 原生系统软件包的所有配置。

## 目录结构
- `PKGBUILD`: Arch Linux 包构建脚本
- `.SRCINFO`: AUR / yay 索引元数据
- `deepseek-harness-desktop.desktop`: XDG 桌面快捷方式（包含 `dsh://` 协议与系统分类）
- `deepseek-harness.png`: 高清应用图标（1104x1104）
- `build-and-install-local.sh`: 本地一键构建并自动通过 yay / pacman 安装的脚本

---

## 方案 1：本地一键构建并通过 yay 安装（当前推荐）

直接在终端执行脚本：
```bash
./build-and-install-local.sh
```
或者手动执行：
```bash
# 1. 编译生成 Linux x64 桌面端资源
pnpm run package:desktop:linux:x64:dir

# 2. 构建 pacman 安装包并安装
cd packaging/arch
makepkg -si
# 或者使用 yay 直接安装：
yay -Bi .
```

安装后：
- 可执行文件路径：`/usr/bin/deepseek-harness-desktop`
- 桌面启动器会自动出现 **DeepSeek Harness** 图标。

---

## 方案 2：结合 GitHub Releases 供任何人通过 yay 远程安装

当你将仓库推送到 GitHub 后：
1. 本地生成打包好的独立应用产物（例如 `AppImage` 或 `tar.zst`）。
2. 在你的 GitHub 仓库创建一个 **Release**（例如 `v0.2.2-rc.1`），并将文件上传到 Releases 附件。
3. 修改 `PKGBUILD` 中的 `source_x86_64` 下载地址为该 Release 的直接下载 URL。
4. 任何 Arch Linux 用户克隆你的仓库后，进入 `packaging/arch` 执行：
   ```bash
   yay -Bi .
   ```
   即可全自动下载、校验并安装。

---

## 方案 3：未来 AUR 重新开放注册后的发布方法

当 AUR 恢复新用户注册后：
```bash
git clone ssh://aur@aur.archlinux.org/deepseek-harness-desktop-bin.git
cd deepseek-harness-desktop-bin
cp /path/to/packaging/arch/* .
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO deepseek-harness-desktop.desktop deepseek-harness.png
git commit -m "feat: initial commit for deepseek-harness-desktop-bin"
git push origin master
```
发布后，即可在任意机器上直接运行：
```bash
yay -S deepseek-harness-desktop-bin
```
