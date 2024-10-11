# CESS Node Management Script

这是一个用于管理CESS共识节点的一键安装脚本。此脚本支持以下功能：
- 启动CESS节点
- 查询节点状态
- 提取质押奖励
- 退出共识并提取质押资金
- 停止并移除服务
- 更新CESS客户端

## 如何快速安装

你可以通过一条命令快速下载并运行此脚本：

```bash
wget -O cess_manager.sh https://raw.githubusercontent.com/yourusername/cess-node-setup-script/main/cess_manager.sh && sed -i 's/\r//' cess_manager.sh && chmod +x cess_manager.sh && ./cess_manager.sh
详细步骤
1. 下载脚本
如果你想手动操作，也可以使用以下命令克隆仓库并进入目录：

git clone https://github.com/yourusername/cess-node-setup-script.git
cd cess-node-setup-script


2. 运行脚本
赋予脚本可执行权限并运行：
chmod +x cess_manager.sh
./cess_manager.sh
3. 脚本功能
运行脚本后，您可以通过交互菜单执行以下操作：

启动节点
查询节点状态
提取奖励
退出并提取质押资金
停止并移除服务
更新CESS客户端

### 说明：
1. **一键安装命令**：将以下命令作为一键安装方式，用户可以直接复制粘贴到VPS的终端中运行，简化使用流程：
    ```bash
    wget -O cess_manager.sh https://raw.githubusercontent.com/yourusername/cess-node-setup-script/main/cess_manager.sh && sed -i 's/\r//' cess_manager.sh && chmod +x cess_manager.sh && ./cess_manager.sh
    ```

2. **手动步骤**：保留手动克隆和运行脚本的部分，提供给希望通过标准Git流程操作的用户。

### 最终操作：
1. 在 **README.md** 中进行上述修改。
2. 更新 GitHub 仓库中的 **README.md**，这样用户可以直接通过一键命令安装和运行您的脚本。

如果这样修改符合您的需求，您可以在 **README.md** 中进行更新。如果还有其他问题，请告诉我！
