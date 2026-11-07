# DeepSeek Harness Linux 桌面版 (AUR / yay 打包仓库)

本仓库是 [DeepSeek Harness](https://github.com/deepseek-ai/deepseek-harness) 的 Arch Linux / yay 原生桌面安装包仓库 (`deepseek-harness-desktop-bin`)。

---

## 🚀 快速安装 (无需重新编译)

只要你的系统是 Arch Linux 或其衍生版（Manjaro, EndeavourOS 等），克隆本项目后直接通过 `yay` 或 `makepkg` 即可一键自动下载 Release 二进制产物并完成安装：

```bash
git clone https://github.com/furina707/deepseek-harness-desktop-bin.git
cd deepseek-harness-desktop-bin
makepkg -si
# 或者使用 yay 直接构建安装:
# yay -Bi .
```

### 安装完成后：
- **应用菜单**：搜索 `DeepSeek Harness` 即可点击启动，带有高清系统图标。
- **终端执行**：运行 `deepseek-harness-desktop` 即可启动。
- **协议支持**：支持 `dsh://` URL scheme 唤醒。

---

## 🛠️ 本地从源码构建并安装

如果你在本地已经拉取了 `deepseek-harness` 源码并进行了修改：

```bash
# 自动构建并打包安装
./build-and-install-local.sh
```

---

## 📦 仓库包含内容
- `PKGBUILD`：符合 Arch Linux 标准的安装包构建脚本
- `.SRCINFO`：AUR 规范元数据
- `deepseek-harness-desktop.desktop`：桌面快捷方式定义
- `deepseek-harness.png`：官方图标
- `build-and-install-local.sh`：本地快速迭代安装脚本
