#!/bin/bash

# CESS一键管理脚本

# 检查必要的工具是否已安装
function check_requirements() {
    echo "Checking system requirements..."
    
    # 更新系统
    sudo apt update && sudo apt upgrade -y
    
    # 安装必要依赖
    echo "Installing required packages..."
    sudo apt install wget tar curl docker.io -y
    
    # 检查Intel SGX支持
    echo "Checking for Intel SGX support..."
    if ! grep -i sgx /proc/cpuinfo > /dev/null; then
        echo "Error: Intel SGX not supported. Please enable it in BIOS."
        exit 1
    fi
    
    # 启动Docker服务
    sudo systemctl enable --now docker
}

# 检查公网IP
function check_public_ip() {
    echo "Checking for static public IP..."
    public_ip=$(curl -4 ifconfig.co)
    echo "Your public IP is: $public_ip"
    echo "Please ensure the IP address is static and not behind a NAT. Press Enter to continue or Ctrl+C to exit."
    read -p ""
}

# 安装CESS客户端
function install_cess() {
    echo "Installing CESS node management tool..."

    # 下载CESS Node管理工具
    wget https://github.com/CESSProject/cess-nodeadm/releases/download/v0.5.7/cess-nodeadm-v0.5.7-linux-amd64.tar.gz
    tar -xvf cess-nodeadm-v0.5.7-linux-amd64.tar.gz
    sudo mv cess-nodeadm /usr/local/bin/

    # 确保CESS命令在PATH中
    if ! command -v cess &> /dev/null; then
        echo "CESS command not found. Adding it to PATH."
        export PATH=$PATH:/usr/local/bin
        echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
        source ~/.bashrc
    fi

    echo "CESS node installed and configured."
}

# 启动CESS节点
function start_node() {
    echo "Starting CESS node..."
    cess start
}

# 查询节点状态
function query_status() {
    echo "Querying CESS node status..."
    cess status
}

# 提取奖励
function redeem_rewards() {
    echo "Redeeming rewards..."
    echo "Please visit CESS Explorer: Network > Staking > Payouts > Payout"
}

# 退出并提取质押资金
function exit_and_unbond() {
    echo "Stopping the consensus and unbonding funds..."
    echo "1. Stop consensus in CESS Explorer: Network > Staking > Account Actions > Stop"
    echo "2. Unbond funds after 28 eras in CESS Explorer: Network > Staking > Account Actions > Unbond Funds"
    cess stop
}

# 停止并移除服务
function stop_and_remove() {
    echo "Stopping and removing all CESS services..."
    cess stop
    cess down
}

# 更新CESS客户端
function update_cess() {
    echo "Updating CESS client..."
    wget https://github.com/CESSProject/cess-nodeadm/releases/download/v0.5.7/cess-nodeadm-v0.5.7-linux-amd64.tar.gz
    tar -xvf cess-nodeadm-v0.5.7-linux-amd64.tar.gz
    sudo mv cess-nodeadm /usr/local/bin/
}

# 菜单
function show_menu() {
    echo "====================================="
    echo "CESS Node Management Menu"
    echo "====================================="
    echo "1. 启动节点"
    echo "2. 节点查询"
    echo "3. 提取奖励"
    echo "4. 退出并提取质押资金"
    echo "5. 停止并移除服务"
    echo "6. 更新CESS客户端"
    echo "0. 退出"
    echo "====================================="
}

# 执行必要的系统检查和客户端安装
check_requirements
check_public_ip
install_cess

# 主循环
while true; do
    show_menu
    read -p "请选择操作 [0-6]: " choice
    case $choice in
        1)
            start_node
            ;;
        2)
            query_status
            ;;
        3)
            redeem_rewards
            ;;
        4)
            exit_and_unbond
            ;;
        5)
            stop_and_remove
            ;;
        6)
            update_cess
            ;;
        0)
            echo "退出脚本。"
            exit 0
            ;;
        *)
            echo "无效选项，请输入 0-6."
            ;;
    esac
done



