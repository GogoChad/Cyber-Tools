#!/bin/bash

# Kali Linux Security Tools Installer
# This script installs additional penetration testing and security tools on Kali Linux
# Run with: sudo bash install_security_tools.sh

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo -e "${RED}Please run as root (use sudo)${NC}"
    exit 1
fi

# Check if running on Kali Linux
if ! grep -q "Kali" /etc/os-release 2>/dev/null; then
    echo -e "${YELLOW}Warning: This script is designed for Kali Linux${NC}"
    read -p "Continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}Kali Security Tools Installer${NC}"
echo -e "${GREEN}================================${NC}\n"

# Update system first
echo -e "${YELLOW}[*] Updating system...${NC}"
apt update && apt upgrade -y

# Install essential packages
echo -e "${YELLOW}[*] Installing essential packages...${NC}"
apt install -y \
    curl \
    wget \
    git \
    build-essential \
    python3 \
    python3-pip \
    python3-venv \
    pipx \
    golang-go \
    default-jdk \
    ruby \
    ruby-dev \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev

# Kali-specific tools (many are pre-installed, but ensure they're available)
echo -e "${YELLOW}[*] Installing/updating Kali repository tools...${NC}"
KALI_PACKAGES=(
    kali-tools-top10
    kali-tools-web
    kali-tools-passwords
    kali-tools-wireless
    kali-tools-information-gathering
    kali-tools-vulnerability
    kali-tools-forensics
    kali-tools-reverse-engineering
    aircrack-ng
    amass
    android-tools-adb
    bloodhound
    burpsuite
    chisel
    crackmapexec
    dirb
    dirsearch
    dnsenum
    enum4linux
    ettercap-graphical
    evil-winrm
    exiftool
    exploitdb
    ffuf
    feroxbuster
    fping
    ghidra
    gobuster
    hashcat
    hydra
    impacket-scripts
    john
    masscan
    metasploit-framework
    mimikatz
    mitmproxy
    ncat
    netexec
    nikto
    nmap
    nuclei
    openssh-server
    passing-the-hash
    proxychains4
    python3-impacket
    radare2
    reaver
    responder
    rustscan
    seclists
    smbclient
    smbmap
    sqlmap
    sslscan
    steghide
    subfinder
    tcpdump
    theharvester
    tor
    traceroute
    wfuzz
    whatweb
    whois
    wifite
    wireshark
    wordlists
    wpscan
    zaproxy
)

for package in "${KALI_PACKAGES[@]}"; do
    echo -e "${GREEN}[+] Installing/updating $package${NC}"
    apt install -y "$package" 2>/dev/null || echo -e "${RED}[-] Package $package not available or failed${NC}"
done

# Python-based tools via pipx (isolated environments)
echo -e "${YELLOW}[*] Installing Python-based tools with pipx...${NC}"

# Ensure pipx is properly set up
sudo -u $SUDO_USER pipx ensurepath

PIPX_TOOLS=(
    "bloodhound"
    "certipy-ad"
    "coercer"
    "impacket"
    "lsassy"
    "masky"
    "mitm6"
    "netexec"
    "pypykatz"
    "roadrecon"
    "trufflehog"
)

for tool in "${PIPX_TOOLS[@]}"; do
    echo -e "${GREEN}[+] Installing $tool with pipx${NC}"
    sudo -u $SUDO_USER pipx install "$tool" 2>/dev/null || echo -e "${RED}[-] Failed to install $tool${NC}"
done

# Additional pip tools that don't work well with pipx
echo -e "${YELLOW}[*] Installing additional Python tools...${NC}"
pip3 install --break-system-packages \
    frida-tools \
    objection \
    pwntools \
    ropper \
    volatility3 \
    2>/dev/null || echo -e "${YELLOW}Some Python tools may have failed${NC}"

# Go-based tools
echo -e "${YELLOW}[*] Installing Go-based tools...${NC}"

# Set Go environment for the user
export GOPATH=/home/$SUDO_USER/go
export PATH=$PATH:$GOPATH/bin
mkdir -p "$GOPATH"

GO_TOOLS=(
    "github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
    "github.com/projectdiscovery/httpx/cmd/httpx@latest"
    "github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest"
    "github.com/projectdiscovery/katana/cmd/katana@latest"
    "github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
    "github.com/projectdiscovery/dnsx/cmd/dnsx@latest"
    "github.com/tomnomnom/waybackurls@latest"
    "github.com/tomnomnom/assetfinder@latest"
    "github.com/tomnomnom/httprobe@latest"
    "github.com/tomnomnom/gf@latest"
    "github.com/lc/gau/v2/cmd/gau@latest"
    "github.com/ffuf/ffuf/v2@latest"
    "github.com/OJ/gobuster/v3@latest"
    "github.com/ropnop/kerbrute@latest"
    "github.com/projectdiscovery/chaos-client/cmd/chaos@latest"
    "github.com/hakluke/hakrawler@latest"
)

for tool in "${GO_TOOLS[@]}"; do
    echo -e "${GREEN}[+] Installing Go tool: $tool${NC}"
    sudo -u $SUDO_USER bash -c "GOPATH=$GOPATH go install $tool" 2>/dev/null || echo -e "${RED}[-] Failed to install $tool${NC}"
done

# Set ownership of Go directory
chown -R $SUDO_USER:$SUDO_USER "$GOPATH"

# Manual installations for specific tools
echo -e "${YELLOW}[*] Setting up manual tool installations...${NC}"

# Create tools directory
TOOLS_DIR="/opt/security-tools"
mkdir -p "$TOOLS_DIR"

# Clone GitHub repositories for additional tools
echo -e "${GREEN}[+] Cloning additional tools from GitHub...${NC}"

GITHUB_TOOLS=(
    "https://github.com/dirkjanm/ldapdomaindump.git"
    "https://github.com/login-securite/DonPAPI.git"
    "https://github.com/p0dalirius/pywhisker.git"
    "https://github.com/ShutdownRepo/targetedKerberoast.git"
    "https://github.com/Hackndo/sprayhound.git"
    "https://github.com/CravateRouge/bloodyAD.git"
    "https://github.com/p0dalirius/coercer.git"
    "https://github.com/Pennyw0rth/NetExec.git"
    "https://github.com/ly4k/Certipy.git"
    "https://github.com/WithSecureLabs/chainsaw.git"
    "https://github.com/carlospolop/PEASS-ng.git"
    "https://github.com/rebootuser/LinEnum.git"
    "https://github.com/giterlizzi/SecLists.git"
)

cd "$TOOLS_DIR"
for repo in "${GITHUB_TOOLS[@]}"; do
    repo_name=$(basename "$repo" .git)
    if [ ! -d "$repo_name" ]; then
        echo -e "${GREEN}[+] Cloning $repo_name${NC}"
        git clone --depth 1 "$repo" 2>/dev/null || echo -e "${RED}[-] Failed to clone $repo${NC}"
    else
        echo -e "${YELLOW}[*] $repo_name already exists, updating...${NC}"
        cd "$repo_name" && git pull 2>/dev/null || echo -e "${YELLOW}[-] Failed to update $repo_name${NC}"
        cd "$TOOLS_DIR"
    fi
done

# Install requirements for cloned tools
echo -e "${YELLOW}[*] Installing requirements for cloned tools...${NC}"
for dir in "$TOOLS_DIR"/*/; do
    if [ -f "${dir}requirements.txt" ]; then
        echo -e "${GREEN}[+] Installing requirements for $(basename "$dir")${NC}"
        pip3 install --break-system-packages -r "${dir}requirements.txt" 2>/dev/null || echo -e "${YELLOW}Some requirements may have failed${NC}"
    fi
done

# Set permissions
chown -R $SUDO_USER:$SUDO_USER "$TOOLS_DIR"

# Update PATH in .zshrc (Kali default shell)
if [ -f /home/$SUDO_USER/.zshrc ]; then
    if ! grep -q "export PATH=\$PATH:\$HOME/go/bin" /home/$SUDO_USER/.zshrc; then
        echo 'export PATH=$PATH:$HOME/go/bin' >> /home/$SUDO_USER/.zshrc
    fi
    if ! grep -q "export PATH=\$PATH:/home/$SUDO_USER/.local/bin" /home/$SUDO_USER/.zshrc; then
        echo 'export PATH=$PATH:/home/$SUDO_USER/.local/bin' >> /home/$SUDO_USER/.zshrc
    fi
fi

# Also update .bashrc for compatibility
if [ -f /home/$SUDO_USER/.bashrc ]; then
    if ! grep -q "export PATH=\$PATH:\$HOME/go/bin" /home/$SUDO_USER/.bashrc; then
        echo 'export PATH=$PATH:$HOME/go/bin' >> /home/$SUDO_USER/.bashrc
    fi
    if ! grep -q "export PATH=\$PATH:/home/$SUDO_USER/.local/bin" /home/$SUDO_USER/.bashrc; then
        echo 'export PATH=$PATH:/home/$SUDO_USER/.local/bin' >> /home/$SUDO_USER/.bashrc
    fi
fi

# Update locate database
echo -e "${YELLOW}[*] Updating locate database...${NC}"
updatedb 2>/dev/null || echo -e "${YELLOW}updatedb not available${NC}"

# Install some useful aliases and functions
echo -e "${YELLOW}[*] Setting up useful aliases...${NC}"
cat >> /home/$SUDO_USER/.zshrc << 'EOF'

# Security tools aliases
alias ll='ls -lah'
alias nse='ls /usr/share/nmap/scripts | grep'
alias ports='netstat -tulanp'
alias myip='curl ifconfig.me'
alias serve='python3 -m http.server'
alias smbserve='impacket-smbserver share . -smb2support'
EOF

chown $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.zshrc

echo -e "\n${GREEN}================================${NC}"
echo -e "${GREEN}Installation Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo -e "${YELLOW}Installed tools summary:${NC}"
echo -e "  - Updated Kali repository tools"
echo -e "  - Python tools via pipx in isolated environments"
echo -e "  - Go-based reconnaissance tools in ~/go/bin"
echo -e "  - Additional GitHub tools in $TOOLS_DIR"
echo -e "\n${YELLOW}Next steps:${NC}"
echo -e "  1. Restart your terminal or run: source ~/.zshrc"
echo -e "  2. Update tool databases: sudo nuclei -update-templates"
echo -e "  3. Extract wordlists: sudo gunzip /usr/share/wordlists/rockyou.txt.gz"
echo -e "  4. Check tool versions: nuclei -version, subfinder -version, etc."
echo -e "\n${YELLOW}Important paths:${NC}"
echo -e "  - Cloned tools: $TOOLS_DIR"
echo -e "  - Go tools: ~/go/bin"
echo -e "  - Pipx tools: ~/.local/bin"
echo -e "  - Wordlists: /usr/share/wordlists"
echo -e "  - Seclists: /usr/share/seclists"
echo -e "\n${GREEN}Happy hacking! 🎯${NC}\n"
