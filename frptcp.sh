#!/bin/bash
# FRP TCP Tunnel 
# Author: github.com/Azumi67
# Special thanks to github.com/opiran-club as always.
# Source: github.com/fatedier/frp
#
# This script is designed to simplify the installation and configuration of IPV6/IPV4 tunnels using FRP.
# It provides load balancing on single and multiple ports, also supports v2ray simple IPV6/IPV4 tunnel with it's own dashboard.
#
# Supported architectures: x86_64, amd64
# Supported operating systems: Tested on Ubuntu 20 - Digital Ocean
# Disclaimer:
# This script comes with no warranties or guarantees. Use it at your own risk.

# root
if [ "$EUID" -ne 0 ]; then
    echo -e "\n ${RED}This script must be run as root.${NC}"
    exit 1
fi
function create_decorated_box() {
    local text="$1"
    local length=$((${#text} + 4))
    local line=""

    for ((i=0; i<length; i++)); do
        line="${line}+"
    done

    echo "$line"
    echo "| $text |"
    echo "$line"
}
# baraye checkmark
function display_checkmark() {
  echo -e "\xE2\x9C\x94 $1"
}
#logo
function display_logo() {
echo -e "\033[1;34m$logo\033[0m"
}

# art
logo=$(cat << "EOF"
    ______    _______   __      _______        __      _____  ___  
   /    " \  |   __ "\ |" \    /"      \      /""\    (\"   \|"  \ 
  // ____  \ (. |__) :)||  |  |:        |    /    \   |.\\   \    |
 /  /    ) :)|:  ____/ |:  |  |_____/   )   /' /\  \  |: \.   \\  |
(: (____/ // (|  /     |.  |   //      /   //  __'  \ |.  \    \. |
 \        / /|__/ \    /\  |\ |:  __   \  /   /  \\  \|    \    \ |
  \"_____/ (_______)  (__\_|_)|__|  \___)(___/    \___)\___|\____\)
EOF
)
function main_menu() {
    while true; do
        display_logo
        echo -e "\e[93m╔═════════════════════════════════════════════╗\e[0m"  
        echo -e "\e[93m║                  Main Menu                  ║\e[0m"   
        echo -e "\e[93m╠═════════════════════════════════════════════╣\e[0m"  
        display_service_status
        echo -e "\e[92mAuthor: Azumi\e[0m ( •_ •) ▬▬ι═══════ﺤ \e[92mJoin Opiran Telegram \e[34m@https://t.me/OPIranClub\e[0m\e[0m"
        echo 
        printf "\e[93m+ꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥꕥ+\e[0m\n" 

        echo -e "1. \e[96mInstallation\e[0m"
        echo -e "2. \e[92mFRP Simple V2Ray\e[0m"
        echo -e "3. \e[36mFRP Load Balance\e[0m"
        echo -e "4. \e[93mRestart Service\e[0m"
        echo -e "5. \e[91mUninstall\e[0m"
        echo "0. Exit"
      
        read -p $'\e[5mEnter your choice Please: \e[0m' choice

        case $choice in
            1)
                installation_menu
                ;;
            2)
                frp_simple_v2ray_menu
                ;;
            3)
                load_balancer_menu
                ;;
            4)
                restart_service
                ;;
            5)
                uninstall
                ;;
            0)
                echo "Exiting..."
                exit 0
                ;;
            *)
                echo "Invalid choice."
                ;;
        esac

        echo "Press Enter to continue..."
        read
        clear
    done
}
function installation_menu() {
    echo -e "\033[93mStarting installation...\033[0m"
    SECONDS=0

    # clean up
    stop_loading() {
        kill $loading_bar_pid &>/dev/null
        echo ""
    }

    # (Ctrl+C)
    trap stop_loading INT

 # add DNS address
    echo "nameserver 8.8.8.8" >> /etc/resolv.conf > /dev/null
    display_checkmark $'\e[92mTemporary DNS added.\e[0m'

    # modify sysctl.conf
    echo -e "\033[93mModifying sysctl.conf...\033[0m"
    sed -i '/^#net\.ipv4\.ip_forward=/s/^#//' /etc/sysctl.conf > /dev/null
    sed -i '/^#net\.ipv6\.conf\.all\.forwarding=/s/^#//' /etc/sysctl.conf > /dev/null
    display_checkmark $'\e[92mIP forward enabled.\e[0m'

    # Azumi is working in the background
 (
    while true; do
        echo -ne "\033[92mRunning update:  [          ]  $(printf "%02d:%02d" $((SECONDS/60)) $((SECONDS%60)))  \r\033[0m"
        sleep 0.3
        echo -ne "\033[92mRunning update:  [█         ]  $(printf "%02d:%02d" $((SECONDS/60)) $((SECONDS%60)))  \r\033[0m"
        sleep 0.3
        echo -ne "\033[92mRunning update:  [██        ]  $(printf "%02d:%02d" $((SECONDS/60)) $((SECONDS%60)))  \r\033[0m"
        sleep 0.3
        echo -ne "\033[92mRunning update:  [███       ]  $(printf "%02d:%02d" $((SECONDS/60)) $((SECONDS%60)))  \r\033[0m"
        sleep 0.3
        echo -ne "\033[92mRunning update:  [████      ]  $(printf "%02d:%02d" $((SECONDS/60)) $((SECONDS%60)))  \r\033[0m"
        sleep 0.3
        echo -ne "\033[92mRunning update:  [█████     ]  $(printf "%02d:%02d" $((SECONDS/60)) $((SECONDS%60)))  \r\033[0m"
        sleep 0.3
        echo -ne "\033[92mRunning update:  [██████    ]  $(printf "%02d:%02d" $((SECONDS/60)) $((SECONDS%60)))  \r\033[0m"
        sleep 0.3
        echo -ne "\033[92mRunning update:  [███████   ]  $(printf "%02d:%02d" $((SECONDS/60)) $((SECONDS%60)))  \r\033[0m"
        sleep 0.3
    done
) &

    loading_bar_pid=$!
    # run update 
    apt update > /dev/null 2>&1

    # clean up
    stop_loading

   display_checkmark $'\e[92mUpdate completed.\e[0m'
   sleep 1
   echo -e "\033[93mInstalling FRP...\033[0m"
   sleep 1
   echo -e "\033[93mDownloading FRP package...\033[0m"

    # Loading for FRP
    (
while true; do
    echo -ne "\033[94mLoading: [\033[1m=\033[0m          ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m==\033[0m         ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m===\033[0m        ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m====\033[0m       ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m=====\033[0m      ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m======\033[0m     ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m=======\033[0m    ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m========\033[0m   ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m=========\033[0m  ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m==========\033[0m ]\r"
    sleep 0.5
    echo -ne "\033[94mLoading: [\033[1m===========\033[0m]\r"
    sleep 0.5
done
) &

    loading_bar_pid=$!
    # FRP
    wget -q https://github.com/fatedier/frp/releases/download/v0.51.3/frp_0.51.3_linux_amd64.tar.gz
    # clean
    stop_loading

    tar -xf frp_0.51.3_linux_amd64.tar.gz > /dev/null 2>&1 

    display_checkmark $'\e[92mFRP installation completed.\e[0m'


    # Time needed for setup
    duration=$SECONDS
    echo -e "\033[93mInstallation completed in \033[92m$(($duration / 60)) minutes and $(($duration % 60)) seconds.\033[0m"

    # Reset interrupt
    trap - INT
}

# status
function display_service_status() {
  sudo systemctl is-active azumifrpc.service &>/dev/null
  local frpc_status=$?
  if [[ $frpc_status -eq 0 ]]; then
    frpc_status_msg="\e[92m\xE2\x9C\x94 FRP Kharej service is running\e[0m" 
  else
    frpc_status_msg="\e[91m\xE2\x9C\x98 FRP Kharej service is not running\e[0m" 
  fi

  sudo systemctl is-active azumifrps.service &>/dev/null
  local frps_status=$?
  if [[ $frps_status -eq 0 ]]; then
    frps_status_msg="\e[92m\xE2\x9C\x94 FRP Iran service is running\e[0m" 
  else
    frps_status_msg="\e[91m\xE2\x9C\x98 FRP Iran service is not running\e[0m" 
  fi

  # box
  printf "\e[93m+-------------------------------------+\e[0m\n"  
  printf "\e[93m| %-35b |\e[0m\n" "$frpc_status_msg"  
  printf "\e[93m| %-35b |\e[0m\n" "$frps_status_msg"  
  printf "\e[93m+-------------------------------------+\e[0m\n"  
}

function frp_simple_v2ray_menu() {
    clear
    echo +══════════════════════════+
    echo -e "\e[93mFRP V2Ray Menu\e[0m"
    echo +══════════════════════════+
    echo "Select an option:"
    echo -e "1. \033[96mKharej\033[0m"
    echo -e "2. \033[92mIran\033[0m"
    echo -e "3. \033[33mBack to main menu\033[0m"
    read -p "Enter your choice Please: " choice

    case $choice in
        1)
            frp_simple_v2ray_kharej_menu
            ;;
        2)
            frp_simple_v2ray_iran_menu
            ;;
        3)
            clear            
            main_menu
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}

function frp_simple_v2ray_kharej_menu() {
    clear
     echo +═══════════════════════════+
    echo -e "\e[93mFRP V2Ray - Kharej Menu\e[0m"
    echo +════════════════════════════+
    echo "Select an option:"
    echo -e "1. \e[92mIPv6 Tunnel\e[0m"
    echo -e "2. \e[96mIPv4 Tunnel\e[0m"
    echo -e "3. \e[33mBack to previous menu\e[0m"
    read -p "Enter your choice Please: " choice

    case $choice in
        1)
            frp_simple_ipv6_tunnel_menu
            ;;
        2)
            frp_simple_v2ray_kharej_ipv4_tunnel
            ;;
        3)
            clear
            frp_simple_v2ray_menu
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}
function frp_simple_ipv6_tunnel_menu() {
    clear
     echo +═══════════════════════════+
    echo -e "\e[93mFRP V2Ray - IPV6 Menu\e[0m"
    echo +════════════════════════════+
    echo "Select an option:"
    echo -e "1. \e[92mSingle IPv6 Tunnel\e[0m"
    echo -e "2. \e[96mMultiple IPv6 Tunnel\e[0m"
    echo -e "3. \e[33mBack to previous menu\e[0m"
    read -p "Enter your choice Please: " choice

    case $choice in
        1)
            frp_simple_ipv6_tunnel_single_ipv6_tunnel
            ;;
        2)
            frp_simple_ipv6_tunnel_multi_ipv6_tunnel
            ;;
        3)
            clear
            frp_simple_v2ray_kharej_menu
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}
function frp_simple_ipv6_tunnel_single_ipv6_tunnel() {
    read -p $'\e[93mEnter your \e[0m\e[92mKharej\e[0m\e[93m/Client IPV6: \e[0m' kharej_ipv6
    read -p $'\e[93mEnter your \e[0m\e[92mIran\e[0m\e[93m/Server IPV6: \e[0m' iranip
    read -p $'\e[93mEnter \e[92mTunnel\e[0m\e[93m Port:[Example: \e[92m443\e[0m\e[93m] \e[0m' tunnel_port
    read -p $'\e[93mEnter Tunnel \e[92mToken\e[93m: \e[92m[Same value for both Server & Client]\e[0m \e[0m' token 
    read -p $'\e[93mEnter \e[92mKharej\e[0m\e[93m/Client V2Ray Port:\e[92m[This is your current V2rayng port] \e[0m' kharej_v2ray_port
    read -p $'\e[93mEnter \e[92mIran\e[0m\e[93m/Server V2Ray Port:\e[92m[This will be your V2rayng port] \e[0m' iran_v2ray_port

    sleep 1
    echo -e "\e[93mGenerating config for you...\e[0m"
    cat > frp_0.51.3_linux_amd64/frpc.ini <<EOL
[common]
server_addr = $iranip
server_port = $tunnel_port
token = $token

[v2ray]
type = tcp
local_ip = $kharej_ipv6
local_port = $kharej_v2ray_port
remote_port = $iran_v2ray_port
use_encryption = true
use_compression = true
EOL

    display_checkmark $'\e[92mKharej - IPv6 configuration generated. Yours Truly, Azumi\e[0m'
    
# service for Kharej
    cat > /etc/systemd/system/azumifrpc.service <<EOL
[Unit]
Description=frpc service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frpc -c /root/frp_0.51.3_linux_amd64/frpc.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrpc > /dev/null 2>&1

    echo "Starting FRP service..."
    systemctl start azumifrpc

     display_checkmark $'\e[92mFRP Service started.\e[0m'

}
function frp_simple_ipv6_tunnel_multi_ipv6_tunnel() {
    echo +═════════════════════════════════════════════════════════════════════+
    echo -e "\e[93mKharej IPV6 Multi Config\e[0m [\e[92mYou can use different port for every new IPV6\e[0m]"
    echo +═════════════════════════════════════════════════════════════════════+
    read -p $'\e[93mNumber of Kharej IPv6 addresses needed: \e[0m' num_ipv6
    sleep 1
    echo "Generating Mutli Port Config for you..."

    read -p $'\e[93mEnter \e[92mIran\e[93m/Server IPv6 address: \e[0m' iran_ipv6
    read -p $'\e[93mEnter Tunnel \e[92mToken\e[93m:[Same value for Server & Client] \e[0m' frp_token
    read -p $'\e[93mEnter \e[92mTunnel\e[93m Port:[Example: 443] \e[0m' tunnel_port


    cat > frp_0.51.3_linux_amd64/frpc.ini <<EOL
[common]
server_addr = $iran_ipv6
server_port = $tunnel_port
authentication_mode = token
token = $frp_token

EOL

    for ((i=1; i<=$num_ipv6; i++)); do
        read -p $'\e[93mEnter your \e[92mKharej\e[93m/Client\e[92m '$i$'th IPv6 \e[93maddress:\e[0m\e[93m[Enter your Kharej IPV6s]\e[0m ' kharej_ipv6
        read -p $'\e[93mEnter \e[92mKharej\e[93m/Client port for V2ray:\e[0m\e[92m[This is your current V2rayng port]\e[0m ' kharej_port
        read -p $'\e[93mEnter \e[92mIran\e[93m/Server port for V2ray:\e[0m\e[92m[This will be your v2rayng port]\e[0m ' iran_port
        read -p $'\e[93mEnter \e[92mhealth check\e[93m intervals in seconds for \e[92m'$i$'th IPV6:\e[0m\e[93m[Example: 10]\e[0m ' health_check_interval
 
    
        cat >> frp_0.51.3_linux_amd64/frpc.ini <<EOL

[v2ray$i]
type = tcp
local_port = $kharej_port
remote_port = $iran_port
local_ip$i = $kharej_ipv6
health_check_type = tcp
health_check_timeout_s = 3
health_check_max_failed = 3
health_check_interval_s = $health_check_interval
use_encryption = true
use_compression = true

EOL
    done

    display_checkmark $'\e[92mKharej - Multi Port configuration generated. Yours Truly, Azumi.\e[0m'
# Add the service section for Kharej
    cat > /etc/systemd/system/azumifrpc.service <<EOL
[Unit]
Description=frpc service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frpc -c /root/frp_0.51.3_linux_amd64/frpc.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrpc > /dev/null 2>&1

    echo "Starting FRP  service..."
    systemctl start azumifrpc
    display_checkmark $'\e[92mFRP Service started.\e[0m'
}
function frp_simple_v2ray_kharej_ipv4_tunnel() {
    read -p $'\e[93mEnter your \e[92mKharej\e[0m\e[93m/Client IPV4: \e[0m' kharej_ipv4
    read -p $'\e[93mEnter your \e[92mIran\e[0m\e[93m/Server IPV4: \e[0m' iranip
    read -p $'\e[93mEnter \e[92mTunnel\e[0m\e[93m Port:[Example: \e[92m443\e[0m\e[93m] \e[0m' tunnel_port
    read -p $'\e[93mEnter Tunnel \e[92mToken\e[0m\e[93m:[\e[92mSame value for both Server & Client\e[0m\e[93m] \e[0m' token
    read -p $'\e[93mEnter \e[92mKharej\e[0m\e[93m/Client V2Ray Port:\e[92m[This is your current V2rayng port] \e[0m' kharej_v2ray_port
    read -p $'\e[93mEnter \e[92mIran\e[0m\e[93m/Server V2Ray Port:\e[92m[This will be your V2rayng port] \e[0m' iran_v2ray_port

    echo -e "\e[93mGenerating config for you...\e[0m"
    cat > frp_0.51.3_linux_amd64/frpc.ini <<EOL
[common]
server_addr = $iranip
server_port = $tunnel_port
token = $token

[v2ray]
type = tcp
local_ip = $kharej_ipv4
local_port = $kharej_v2ray_port
remote_port = $iran_v2ray_port
use_encryption = true
use_compression = true
EOL

   display_checkmark $'\e[92mKharej - IPv4 configuration generated. Yours Truly, Azumi.\e[0m'
   
# service for Kharej
    cat > /etc/systemd/system/azumifrpc.service <<EOL
[Unit]
Description=frpc service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frpc -c /root/frp_0.51.3_linux_amd64/frpc.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrpc > /dev/null 2>&1

    echo "Starting FRP  service..."
    systemctl start azumifrpc

    display_checkmark $'\e[92mFRP Service started.\e[0m'
}

function frp_simple_v2ray_iran_menu() {
    clear
    echo +══════════════════════════+
    echo -e "\e[93mFRP V2Ray - Iran Menu\e[0m"
    echo +══════════════════════════+
    echo "Select an option:"
    echo -e "1.\e[92mSingle Config With Dashboard\e[0m"
    echo -e "2.\e[93mMulti Config With Dashboard\e[0m"
    echo -e "3.\e[96mWithout Dashboard\e[0m"
    echo -e "4.\e[33mBack to previous menu\e[0m"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            frp_simple_v2ray_iran_with_dashboard
            ;;
        2) 
            frp_simple_v2ray_iran2_with_dashboard
            ;;
        3)
            frp_simple_v2ray_iran_without_dashboard
            ;;
        4)
            clear
            frp_simple_v2ray_menu
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}

function frp_simple_v2ray_iran_with_dashboard() {
    echo +═════════════════════════════════+
    echo -e "\e[93mIran [single Config] - Dashboard Menu\e[0m"
    echo +═════════════════════════════════+
    read -p $'\e[93mEnter your \e[92mSub-Domain\e[93m: [Better to make sure port 80 is available] \e[0m' domain
    read -p $'\e[93mEnter your \e[92mEmail\e[93m: \e[0m' email

echo "Installing Certbot..."

# Certbot installation
(
while true; do
    echo -ne "\e[93mInstalling Certbot, gimme a sec: [\\] \r\e[0m"
    sleep 0.1
    echo -ne "\e[93mInstalling Certbot, gimme a sec: [|] \r\e[0m"
    sleep 0.1
    echo -ne "\e[93mInstalling Certbot, gimme a sec: [/] \r\e[0m"
    sleep 0.1
    echo -ne "\e[93mInstalling Certbot, gimme a sec: [-] \r\e[0m"
    sleep 0.1
done
) &

loading_bar_pid=$!

apt install certbot -y > /dev/null 2>&1 

# stop loading
kill $loading_bar_pid &>/dev/null

    echo -e "\e[93mOpening port 80 on UFW Just in case...\e[0m"
    ufw allow 80

    echo "Checking port 80 availability..."
    local pid=$(lsof -t -i :80)
    if [ -n "$pid" ]; then
        echo -e "\e[93mPort 80 is in use by process with PID [$pid]. Stopping the process...\e[0m"
        sudo kill $pid
    fi

    echo -e "\e[93mStarting Certbot for your \e[92mDomain $domain...\e[0m"

    sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email "$email" -d "$domain"

    #stop loading
    kill $loading_bar_pid &>/dev/null
    clear
    echo  ════════════════════════════════════════════
    echo -e "\e[93mGenerating Config for Iran - With Dashboard...\e[0m"
    echo  ════════════════════════════════════════════
    read -p $'\e[93mEnter \e[92mTunnel Port\e[93m:[Example: \e[92m443\e[93m] \e[0m' tunnel_port
    read -p $'\e[93mEnter \e[92mTunnel Token\e[93m:[\e[93mSame Value for both Server & Client\e[93m] \e[0m' token
    read -p $'\e[93mEnter \e[92mKharej\e[93m/Client port for V2ray:\e[0m\e[92m[This is your current V2rayng port]\e[0m ' kharej_v2ray_port
    read -p $'\e[93mEnter \e[92mIran\e[93m/Server port for V2ray:\e[0m\e[92m[This will be your v2rayng port]\e[0m ' iran_v2ray_port
    read -p $'\e[93mEnter the \e[92mDashboard username\e[93m: \e[0m' dashboard_user
    read -p $'\e[93mEnter the \e[92mDashboard password\e[93m: \e[0m' dashboard_pwd
    read -p $'\e[93mEnter the \e[92mDashboard port\e[93m: \e[0m' dashboard_port
    
    echo -e "\e[93mGenerating config for you...\e[0m"
    cat > frp_0.51.3_linux_amd64/frps.ini <<EOL
[common]
bind_port = $tunnel_port
token = $token
dashboard_port = $dashboard_port
dashboard_user = $dashboard_user
dashboard_pwd = $dashboard_pwd
dashboard_tls_mode = true
dashboard_tls_cert_file = /etc/letsencrypt/live/$domain/fullchain.pem
dashboard_tls_key_file = /etc/letsencrypt/live/$domain/privkey.pem

[v2ray]
type = tcp
local_ip = 127.0.0.1
local_port = $iran_v2ray_port
remote_port = $kharej_v2ray_port
use_encryption = true
use_compression = true
EOL

    display_checkmark $'\e[92mIran configuration With Dashboard generated. Yours Truly, Azumi.\e[0m'
    sleep 1
    echo -e "\e[93mStarting Nginx or Apache...\e[0m"
    systemctl start nginx > /dev/null 2>&1
    systemctl start apache2 > /dev/null 2>&1

    display_checkmark $'\e[92mServer started.\e[0m'
    sleep 1
create_decorated_box "Your Dashboard Address: https://$domain:$dashboard_port"
create_decorated_box "Username: $dashboard_user"
create_decorated_box "Password: $dashboard_pwd"

    
# service iran
    cat > /etc/systemd/system/azumifrps.service <<EOL
[Unit]
Description=frps service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frps -c /root/frp_0.51.3_linux_amd64/frps.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrps > /dev/null 2>&1

    echo "Starting FRP service..."
    systemctl start azumifrps
    display_checkmark $'\e[92mFRP Service started.\e[0m'
}
function frp_simple_v2ray_iran2_with_dashboard() {
    echo +═════════════════════════════════+
    echo -e "\e[93mIran [mutli Config] - Dashboard Menu\e[0m"
    echo +═════════════════════════════════+
    read -p $'\e[93mEnter your \e[92mSub-Domain\e[93m: [Better to make sure port 80 is available] \e[0m' domain
    read -p $'\e[93mEnter your \e[92mEmail\e[93m: \e[0m' email

echo "Installing Certbot..."

# Certbot installation
(
while true; do
    echo -ne "\e[93mInstalling Certbot, gimme a sec: [\\] \r\e[0m"
    sleep 0.1
    echo -ne "\e[93mInstalling Certbot, gimme a sec: [|] \r\e[0m"
    sleep 0.1
    echo -ne "\e[93mInstalling Certbot, gimme a sec: [/] \r\e[0m"
    sleep 0.1
    echo -ne "\e[93mInstalling Certbot, gimme a sec: [-] \r\e[0m"
    sleep 0.1
done
) &

loading_bar_pid=$!

apt install certbot -y > /dev/null 2>&1 

# stop loading
kill $loading_bar_pid &>/dev/null

    echo -e "\e[93mOpening port 80 on UFW Just in case...\e[0m"
    ufw allow 80

    echo "Checking port 80 availability..."
    local pid=$(lsof -t -i :80)
    if [ -n "$pid" ]; then
        echo -e "\e[93mPort 80 is in use by process with PID [$pid]. Stopping the process...\e[0m"
        sudo kill $pid
    fi

    echo -e "\e[93mStarting Certbot for your \e[92mDomain $domain...\e[0m"

    sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email "$email" -d "$domain"

    #stop loading
    kill $loading_bar_pid &>/dev/null
    clear
    echo +═════════════════════════════════════════════════════════════════════+
    echo -e "\e[93mIRAN IPV6 Multi Config\e[0m [\e[92mYou can use different port for every new IPV6\e[0m]"
    echo +═════════════════════════════════════════════════════════════════════+
    read -p $'\e[93mNumber of Iran IPv6 addresses needed: \e[0m' num_ipv6
    sleep 1
    echo "Generating Mutli Port Config for you..."
    read -p $'\e[93mEnter \e[92mTunnel Port\e[93m:[Example: \e[92m443\e[93m] \e[0m' tunnel_port
    read -p $'\e[93mEnter \e[92mTunnel Token\e[93m:[\e[93mSame Value for both Server & Client\e[93m] \e[0m' token
    read -p $'\e[93mEnter the \e[92mDashboard username\e[93m: \e[0m' dashboard_user
    read -p $'\e[93mEnter the \e[92mDashboard password\e[93m: \e[0m' dashboard_pwd
    read -p $'\e[93mEnter the \e[92mDashboard port\e[93m: \e[0m' dashboard_port
    
    echo -e "\e[93mGenerating config for you...\e[0m"
    cat > frp_0.51.3_linux_amd64/frps.ini <<EOL
[common]
bind_port = $tunnel_port
token = $token
dashboard_port = $dashboard_port
dashboard_user = $dashboard_user
dashboard_pwd = $dashboard_pwd
dashboard_tls_mode = true
dashboard_tls_cert_file = /etc/letsencrypt/live/$domain/fullchain.pem
dashboard_tls_key_file = /etc/letsencrypt/live/$domain/privkey.pem
EOL

for ((i=1; i<=$num_ipv6; i++)); do
        read -p $'\e[93mEnter your \e[92mIran\e[93m/Server\e[92m '$i$'th IPv6 \e[93maddress:\e[0m\e[93m[Enter your Iran IPV6s]\e[0m ' iran_ipv6
        read -p $'\e[93mEnter \e[92mKharej\e[93m/Client port for V2ray:\e[0m\e[92m[This is your current V2rayng port]\e[0m ' kharej_v2ray_port
        read -p $'\e[93mEnter \e[92mIran\e[93m/Server port for V2ray:\e[0m\e[92m[This will be your v2rayng port]\e[0m ' iran_v2ray_port
 
    
        cat >> frp_0.51.3_linux_amd64/frps.ini <<EOL
[v2ray$i]
type = tcp
local_ip$i = $iran_ipv6
local_port = $iran_v2ray_port
remote_port = $kharej_v2ray_port
use_encryption = true
use_compression = true

EOL
    done

    display_checkmark $'\e[92mIran - Multi Port configuration generated. Yours Truly, Azumi.\e[0m'
# Add the service section for Kharej
    cat > /etc/systemd/system/azumifrps.service <<EOL
[Unit]
Description=frps service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frps -c /root/frp_0.51.3_linux_amd64/frps.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrps > /dev/null 2>&1

    echo "Starting FRP  service..."
    systemctl start azumifrps
    display_checkmark $'\e[92mFRP Service started.\e[0m'
}
function frp_simple_v2ray_iran_without_dashboard() {
    clear
    echo +════════════════════════════════+
    echo -e "\e[93mFRP V2Ray - Iran - Without Dashboard Menu\e[0m"
    echo +════════════════════════════════+
    echo -e "\e[97mGenerating Config for Iran - Without Dashboard...\e[0m"
    read -p $'\e[93mEnter \e[92mTunnel Port\e[93m:[Example: \e[92m443\e[93m] \e[0m' tunnel_port
    read -p $'\e[93mEnter \e[92mTunnel Token\e[93m:[\e[93mSame Value for both Server & Client\e[93m] \e[0m' token
    read -p $'\e[93mEnter \e[92mIran V2Ray Port\e[93m:[\e[93mThis will be your V2rayng port\e[93m] \e[0m' iran_v2ray_port
    read -p $'\e[93mEnter \e[92mKharej V2Ray Port\e[93m:[\e[93mThis is your current V2rayng port\e[93m] \e[0m' kharej_v2ray_port

    echo -e "\e[93mGenerating config for you...\e[0m"
    cat > frp_0.51.3_linux_amd64/frps.ini <<EOL
[common]
bind_port = $tunnel_port
token = $token

[v2ray]
type = tcp
local_ip = 127.0.0.1
local_port = $iran_v2ray_port
remote_port = $kharej_v2ray_port
use_encryption = true
use_compression = true
EOL

     display_checkmark $'\e[92mIran configuration generated. Yours Truly, Azumi.\e[0m'
    # service for iran
    cat > /etc/systemd/system/azumifrps.service <<EOL
[Unit]
Description=frps service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frps -c /root/frp_0.51.3_linux_amd64/frps.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrps > /dev/null 2>&1

    echo "Starting FRP  service..."
    systemctl start azumifrps

    display_checkmark $'\e[92mFRP Service started.\e[0m'
}
function load_balancer_menu() {
    clear
    echo +═════════════════════+
    echo -e "\e[93mLoad Balancer Menu\e[0m"
    echo +═════════════════════+
    echo -e "1.\e[92mKharej\e[0m"
    echo -e "2.\e[96mIran\e[0m"
    echo -e "3.\e[33mBack to main menu\e[0m"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            load_balancer_kharej_menu
            ;;
        2)
            load_balancer_iran_menu
            ;;
        3)
            clear
            main_menu
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}

function load_balancer_kharej_menu() {
    clear
    echo +═══════════════════════════+
    echo -e "\e[93mLoad Balancer - Kharej Menu\e[0m"
    echo +═══════════════════════════+
    echo -e "1.\e[92mSingle Port\e[0m"
    echo -e "2.\e[96mMulti port\e[0m"
    echo -e "3.\e[33mBack to previous menu\e[0m"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            load_balancer_kharej_single_port
            ;;
        2)
            load_balancer_kharej_multi_port
            ;;
        3)
            clear
            load_balancer_menu
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}
function load_balancer_kharej_single_port() {
    echo +══════════════════════════════════════════════════════════════════════════+
    echo -e "\e[93mLoad Balancer - Single Port\e[0m [\e[92mYou should use the same port for every new IPV6\e[0m]"
    echo +══════════════════════════════════════════════════════════════════════════+
    read -p $'\e[93mNumber of IPv6 addresses needed: \e[0m' num_ipv6
    sleep 1
    echo -e "Generating Single Port Config for you..."
    read -p $'\e[93mEnter \e[92mIran\e[93m/Server IPv6 address: \e[0m' iran_ipv6
    read -p $'\e[93mEnter \e[92mTunnel \e[93mToken:\e[0m\e[92m[Same value for Server & Client]\e[0m ' frp_token
    read -p $'\e[93mEnter \e[92mTunnel\e[93m Port:\e[0m\e[92m[Example: 443]\e[0m ' tunnel_port
    read -p $'\e[93mEnter \e[92mKharej\e[93m/Client port for V2ray:\e[0m\e[92m[This is your current V2rayng port]\e[0m ' kharej_port
    read -p $'\e[93mEnter \e[92mIran\e[93m/Server port for V2ray:\e[0m\e[92m[This will be your v2rayng port]\e[0m ' iran_port

    cat > frp_0.51.3_linux_amd64/frpc.ini <<EOL
[common]
server_addr = $iran_ipv6
server_port = $tunnel_port
authentication_mode = token
token = $frp_token

EOL

 for ((i=1; i<=$num_ipv6; i++)); do
    read -p $'\e[93mEnter your \e[92mKharej\e[93m/Client\e[92m '$i$'th IPv6 \e[93maddress:\e[0m\e[93m[Enter your Kharej IPV6s]\e[0m ' kharej_ipv6
    read -p $'\e[93mEnter \e[92mhealth check\e[93m intervals in seconds for \e[92m'$i$'th IPV6:\e[0m\e[93m[Example: 10]\e[0m ' health_check_interval
        cat >> frp_0.51.3_linux_amd64/frpc.ini <<EOL

[v2ray$i]
type = tcp
local_port = $kharej_port
remote_port = $iran_port
group = azumi
group_key = azumiisinyourarea
local_ip$i = $kharej_ipv6
health_check_type = tcp
health_check_timeout_s = 3
health_check_max_failed = 3
health_check_interval_s = $health_check_interval
use_encryption = true
use_compression = true
EOL
    done

    display_checkmark $'\e[92mKharej - Single Port configuration generated. Yours Truly, Azumi.\e[0m'
    # service for Kharej
    cat > /etc/systemd/system/azumifrpc.service <<EOL
[Unit]
Description=frpc service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frpc -c /root/frp_0.51.3_linux_amd64/frpc.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrpc > /dev/null 2>&1

    echo "Starting FRP  service..."
    systemctl start azumifrpc
    
    display_checkmark $'\e[92mFRP Service started.\e[0m'
}
function load_balancer_kharej_multi_port() {
    echo +═════════════════════════════════════════════════════════════════════+
    echo -e "\e[93mLoad Balancer - Multi Port\e[0m [\e[92mYou can use different port for every new IPV6\e[0m]"
    echo +═════════════════════════════════════════════════════════════════════+
    read -p $'\e[93mNumber of IPv6 addresses needed: \e[0m' num_ipv6
    sleep 1
    echo "Generating Mutli Port Config for you..."

    read -p $'\e[93mEnter \e[92mIran\e[93m/Server IPv6 address: \e[0m' iran_ipv6
    read -p $'\e[93mEnter Tunnel \e[92mToken\e[93m:[Same value for Server & Client] \e[0m' frp_token
    read -p $'\e[93mEnter \e[92mTunnel\e[93m Port:[Example: 443] \e[0m' tunnel_port


    cat > frp_0.51.3_linux_amd64/frpc.ini <<EOL
[common]
server_addr = $iran_ipv6
server_port = $tunnel_port
authentication_mode = token
token = $frp_token

EOL

    for ((i=1; i<=$num_ipv6; i++)); do
        read -p $'\e[93mEnter your \e[92mKharej\e[93m/Client\e[92m '$i$'th IPv6 \e[93maddress:\e[0m\e[93m[Enter your Kharej IPV6s]\e[0m ' kharej_ipv6
        read -p $'\e[93mEnter \e[92mKharej\e[93m/Client port for V2ray:\e[0m\e[92m[This is your current V2rayng port]\e[0m ' kharej_port
        read -p $'\e[93mEnter \e[92mIran\e[93m/Server port for V2ray:\e[0m\e[92m[This will be your v2rayng port]\e[0m ' iran_port
        read -p $'\e[93mEnter \e[92mhealth check\e[93m intervals in seconds for \e[92m'$i$'th IPV6:\e[0m\e[93m[Example: 10]\e[0m ' health_check_interval
 
    
        cat >> frp_0.51.3_linux_amd64/frpc.ini <<EOL

[v2ray$i]
type = tcp
local_port = $kharej_port
remote_port = $iran_port
group = azumi
group_key = azumiisinyourarea
local_ip$i = $kharej_ipv6
health_check_type = tcp
health_check_timeout_s = 3
health_check_max_failed = 3
health_check_interval_s = $health_check_interval
use_encryption = true
use_compression = true

EOL
    done

    display_checkmark $'\e[92mKharej - Multi Port configuration generated. Yours Truly, Azumi.\e[0m'
# Add the service section for Kharej
    cat > /etc/systemd/system/azumifrpc.service <<EOL
[Unit]
Description=frpc service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frpc -c /root/frp_0.51.3_linux_amd64/frpc.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrpc > /dev/null 2>&1

    echo "Starting FRP  service..."
    systemctl start azumifrpc
    display_checkmark $'\e[92mFRP Service started.\e[0m'
}
function load_balancer_iran_menu() {
    clear
    echo +══════════════════════════════+
    echo -e "\e[93mLoad Balancer - Iran Menu\e[0m"
    echo +══════════════════════════════+
    echo -e "1.\e[92m with dashboard\e[0m"
    echo -e "2.\e[96m without dashboard\e[0m"
    echo -e "3.\e[33mBack to previous menu\e[0m"
    read -p "Enter your choice: " choice

    case $choice in
        1)
            load_balancer_iran_with_dashboard
            ;;
        2)
            load_balancer_iran_without_dashboard
            ;;
        3)
            clear
            load_balancer_menu
            ;;
        *)
            echo "Invalid choice."
            ;;
    esac
}
function load_balancer_iran_with_dashboard() {
    clear
    echo +═══════════════════════════════════+
    echo -e "\e[93mIran - Loadbalance & Dashboard Menu\e[0m"
    echo +═══════════════════════════════════+
    read -p $'\e[93mEnter your \e[92mSUB-Domain\e[93m: \e[0m' domain
    read -p $'\e[93mEnter your \e[92mEmail\e[93m: \e[0m' email

 echo "Installing Certbot..."

# Start the loading bar for Certbot installation
(
    while true; do
    echo -ne "\e[93mInstalling Certbot: [\\] \e[0m\r"
    sleep 0.1
    echo -ne "\e[93mInstalling Certbot: [|] \e[0m\r"
    sleep 0.1
    echo -ne "\e[93mInstalling Certbot: [/] \e[0m\r"
    sleep 0.1
    echo -ne "\e[93mInstalling Certbot: [-] \e[0m\r"
    sleep 0.1
done
) &

loading_bar_pid=$!

apt install certbot -y > /dev/null 2>&1 

# stop loading
kill $loading_bar_pid &>/dev/null

    echo "Opening port 80 on UFW Just in case..."
    ufw allow 80

    echo "Checking port 80 availability..."
    local pid=$(lsof -t -i :80)
    if [ -n "$pid" ]; then
        echo "Port 80 is in use by process with PID [$pid]. Stopping the process..."
        sudo kill $pid
    fi

    echo -e "\e[93mStarting Certbot for \e[92mdomain\e[93m $domain...\e[0m"

    sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email "$email" -d "$domain"

    # Stop the loading bar for Certbot certificate generation
    kill $loading_bar_pid &>/dev/null
    read -p $'\e[93mEnter \e[92mTunnel Port\e[93m:[Example: \e[92m443\e[93m] \e[0m' tunnel_port
    read -p $'\e[93mEnter \e[92mTunnel Token\e[93m:[\e[93mSame Value for both Server & Client\e[93m] \e[0m' token
    read -p $'\e[93mEnter \e[92mIran V2Ray Port\e[93m:[\e[93mThis will be your V2rayng port\e[93m] \e[0m' iran_v2ray_port
    read -p $'\e[93mEnter \e[92mKharej V2Ray Port\e[93m:[\e[93mThis is your current V2rayng port\e[93m] \e[0m' kharej_v2ray_port
    read -p $'\e[93mEnter the \e[92mDashboard username\e[93m: \e[0m' dashboard_user
    read -p $'\e[93mEnter the \e[92mDashboard password\e[93m: \e[0m' dashboard_pwd
    read -p $'\e[93mEnter the \e[92mDashboard port\e[93m: \e[0m' dashboard_port
    
    echo -e "\e[93mGenerating config for you...\e[0m"
    cat > frp_0.51.3_linux_amd64/frps.ini <<EOL
[common]
bind_port = $tunnel_port
token = $token
dashboard_port = $dashboard_port
dashboard_user = $dashboard_user
dashboard_pwd = $dashboard_pwd
dashboard_tls_mode = true
dashboard_tls_cert_file = /etc/letsencrypt/live/$domain/fullchain.pem
dashboard_tls_key_file = /etc/letsencrypt/live/$domain/privkey.pem

[v2ray]
type = tcp
local_ip = 127.0.0.1
local_port = $iran_v2ray_port
remote_port = $kharej_v2ray_port
use_encryption = true
use_compression = true
EOL

    display_checkmark $'\e[92mIran configuration With Dashboard generated. Yours Truly, Azumi.\e[0m'
    sleep 1
    echo -e "\e[93mStarting Nginx or Apache...\e[0m"
    systemctl start nginx > /dev/null 2>&1
    systemctl start apache2 > /dev/null 2>&1

    display_checkmark $'\e[92mServer started.\e[0m'
    sleep 1
create_decorated_box "Your Dashboard Address: $domain: $dashboard_port"
create_decorated_box "Username: $dashboard_user"
create_decorated_box "Password: $dashboard_pwd"


systemctl start nginx > /dev/null 2>&1
systemctl start apache2 > /dev/null 2>&1
display_checkmark $'\e[92mWeb server started.\e[0m'
# service for iran
    cat > /etc/systemd/system/azumifrps.service <<EOL
[Unit]
Description=frps service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frps -c /root/frp_0.51.3_linux_amd64/frps.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrps > /dev/null 2>&1

    echo "Starting FRP  service..."
    systemctl start azumifrps

    display_checkmark $'\e[92mFRP Service started.\e[0m'
}

function load_balancer_iran_without_dashboard() {
    clear
    echo +════════════════════════════════════+
    echo -e "\e[93mIran - Loadbalance & NO Dashboard Menu\e[0m"
    echo +════════════════════════════════════+
    read -p $'\e[93mEnter \e[92mTunnel \e[93mPort:[Default:\e[92m443\e[0m ' tunnel_port
    read -p $'\e[93mEnter \e[92mTunnel \e[93mToken:[Same value for both Server & Client] \e[0m' token
    read -p $'\e[93mEnter your \e[92mIran V2Ray Port:\e[93m[This will be your V2rayng port] \e[0m' iran_v2ray_port
    read -p $'\e[93mEnter your \e[92mKharej V2Ray Port:\e[93m[This is your current V2rayng port] \e[0m' kharej_v2ray_port

    echo -e "\e[93mGenerating FRP Simple V2Ray config for Iran without Dashboard...\e[0m"
    cat > frp_0.51.3_linux_amd64/frps.ini <<EOL
[common]
bind_port = $tunnel_port
token = $token

[v2ray]
type = tcp
local_ip = 127.0.0.1
local_port = $iran_v2ray_port
remote_port = $kharej_v2ray_port
use_encryption = true
use_compression = true
EOL

    display_checkmark $'\e[92mIran Loadbalance configuration without Dashboard generated.Yours Truly, Azumi.\e[0m'
# service for iran
    cat > /etc/systemd/system/azumifrps.service <<EOL
[Unit]
Description=frps service
After=network.target

[Service]
ExecStart=/root/frp_0.51.3_linux_amd64/./frps -c /root/frp_0.51.3_linux_amd64/frps.ini
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOL
echo "Reloading daemon..." > /dev/null 2>&1
    systemctl daemon-reload > /dev/null 2>&1

    echo "Enabling FRP service..." > /dev/null 2>&1
    systemctl enable azumifrps > /dev/null 2>&1

    echo "Starting FRP  service..."
    systemctl start azumifrps

    display_checkmark $'\e[92mFRP service started.\e[0m'
}
function restart_service() {
    echo -e "\e[93mRestarting FRP service...\e[0m"

    # Check 
    if systemctl is-active --quiet azumifrpc; then
        systemctl daemon-reload
        systemctl restart azumifrpc
        echo "FRP service restarted."
    fi

    # Check 2
    if systemctl is-active --quiet azumifrps; then
        systemctl daemon-reload
        systemctl restart azumifrps
        echo "FRP service restarted."
    fi

    # Display the notification after restarting the service
    echo "╭───────────────────────────────────────────╮"
    echo "│         FRP Service Restarted            │"
    echo "│    FRP service has been restarted!       │"
    echo "╰───────────────────────────────────────────╯"
    sleep 2
}

function uninstall() {
    clear
    echo "Uninstalling FRP..."

    # Stop and disable azumifrps.service
    if systemctl is-active --quiet azumifrps; then
        systemctl stop azumifrps > /dev/null 2>&1
        systemctl disable azumifrps > /dev/null 2>&1  
    fi

    # Stop and disable azumifrpc.service
    if systemctl is-active --quiet azumifrpc; then
        systemctl stop azumifrpc > /dev/null 2>&1
        systemctl disable azumifrpc > /dev/null 2>&1  
    fi

    # Remove azumifrps.service file
    if rm /etc/systemd/system/azumifrps.service 2>/dev/null; then
        display_checkmark $'\e[92mService removed.\e[0m'
    else
        echo -e "\e[91mFailed to remove azumifrps.service.\e[0m"
    fi

    # Remove azumifrpc.service file
    if rm /etc/systemd/system/azumifrpc.service 2>/dev/null; then
        display_checkmark $'\e[92mService removed.\e[0m'
    else
        echo -e "\e[91mFailed to remove azumifrpc.service.\e[0m"
    fi

    # symbolic
    if rm /etc/systemd/system/multi-user.target.wants/azumifrps.service 2>/dev/null; then
        display_checkmark $'\e[92mSymbolic link removed.\e[0m' 
    else
        echo -e "\e[91mFailed to remove symbolic link for azumifrps.service.\e[0m"
    fi

    if rm /etc/systemd/system/multi-user.target.wants/azumifrpc.service 2>/dev/null; then
        display_checkmark $'\e[92mSymbolic link removed.\e[0m'
    else
        echo -e "\e[91mFailed to remove symbolic link for azumifrpc.service.\e[0m"
    fi

    echo "Removing FRP, Working in the background..."
    echo -n "Progress: "

    # Loading bar
    cute_animation=("💖      "
                    "💖💖    "
                    "💖💖💖  "
                    "💖💖💖💖"
                    " 💖💖💖 "
                    "  💖💖  "
                    "   💖   ")

    # Process
    for i in $(seq 1 7); do
        echo -ne "\r[${cute_animation[i-1]}]"
        sleep 0.5
    done

    echo -e "\e[92m\nFRP uninstalled.\e[0m"
}

# Call the main_menu function
main_menu
