#!/bin/bash

# Arch Linux Security Tools Installer
# This script installs penetration testing and security tools on Arch Linux
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

echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}Arch Security Tools Installer${NC}"
echo -e "${GREEN}================================${NC}\n"

# Update system first
echo -e "${YELLOW}[*] Updating system...${NC}"
pacman -Syu --noconfirm

# Install yay AUR helper if not present
if ! command -v yay &> /dev/null; then
    echo -e "${YELLOW}[*] Installing yay AUR helper...${NC}"
    pacman -S --needed --noconfirm git base-devel
    sudo -u $SUDO_USER bash -c "cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si --noconfirm"
fi

# Official repository packages
echo -e "${YELLOW}[*] Installing tools from official repositories...${NC}"
PACMAN_PACKAGES=(
    aircrack-ng
    android-tools
    autoconf
    autopsy
    avrdude
    aws-cli
    binwalk
    bully
    crunch
    dex2jar
    dirb
    ettercap
    exiftool
    fcrackzip
    foremost
    ghidra
    gqrx
    hackrf
    hashcat
    hexedit
    hping
    hydra
    imagemagick
    iptables
    john
    libnfc
    libusb
    ltrace
    masscan
    mitmproxy
    minicom
    nasm
    nmap
    nikto
    openssl
    openvpn
    proxychains-ng
    radare2
    reaver
    remmina
    rsync
    sleuthkit
    smbclient
    sqlmap
    sslscan
    steghide
    strace
    tcpdump
    testdisk
    tor
    traceroute
    vim
    weevely
    whois
    wireshark-qt
    wpscan
    xtightvncviewer
    zaproxy
)

for package in "${PACMAN_PACKAGES[@]}"; do
    echo -e "${GREEN}[+] Installing $package${NC}"
    pacman -S --needed --noconfirm "$package" 2>/dev/null || echo -e "${RED}[-] Failed to install $package${NC}"
done

# AUR packages
echo -e "${YELLOW}[*] Installing tools from AUR...${NC}"
AUR_PACKAGES=(
    amass
    assetfinder
    autorecon
    azure-cli
    bettercap
    bloodhound
    burpsuite
    chisel
    cewl
    checksec
    cloudfail
    cmsmap
    dirsearch
    dnsenum
    dnsx
    enum4linux-ng
    evil-winrm
    eyewitness
    feroxbuster
    ffuf
    findomain
    frida-tools
    fzf
    gau
    gittools
    gobuster
    gowitness
    haiti
    hakrawler
    holehe
    httprobe
    httpx
    impacket
    jadx
    jd-gui
    jwt-tool
    katana
    kerbrute
    kiterunner
    lgandx-responder
    lsassy
    maltego
    maigret
    metasploit
    mobsf-bin
    naabu
    name-that-hash
    nbtscan
    netexec
    neovim
    ngrok
    nuclei
    objection
    osrfframework
    patator
    phpggc
    postman-bin
    powershell-bin
    proxmark3
    pwncat
    pwntools
    pypykatz
    recon-ng
    routersploit
    rustscan
    scrcpy
    searchsploit
    seclists
    semgrep
    sherlock-git
    shuffledns
    sliver
    smbmap
    spiderfoot
    subfinder
    sublist3r
    swaks
    theharvester
    tig
    trufflehog
    updog
    upx
    wafw00f
    waybackurls
    weevely
    wesng
    wfuzz
    whatportis
    whatweb
    wifite2
    wpscan
    wuzz
    xsstrike
    ysoserial
    yt-dlp
)

for package in "${AUR_PACKAGES[@]}"; do
    echo -e "${GREEN}[+] Installing $package from AUR${NC}"
    sudo -u $SUDO_USER yay -S --needed --noconfirm "$package" 2>/dev/null || echo -e "${RED}[-] Failed to install $package${NC}"
done

# Python-based tools via pip
echo -e "${YELLOW}[*] Installing Python-based tools...${NC}"
pacman -S --needed --noconfirm python python-pip python-pipx

PYTHON_TOOLS=(
    "git+https://github.com/fox-it/BloodHound.py.git#egg=bloodhound"
    "crackmapexec"
    "mitm6"
    "pypykatz"
    "lsassy"
    "certipy-ad"
    "coercer"
    "impacket"
    "masky"
    "netexec"
    "roadrecon"
)

for tool in "${PYTHON_TOOLS[@]}"; do
    echo -e "${GREEN}[+] Installing Python tool: $tool${NC}"
    pip install --break-system-packages "$tool" 2>/dev/null || pipx install "$tool" 2>/dev/null || echo -e "${RED}[-] Failed to install $tool${NC}"
done

# Go-based tools
echo -e "${YELLOW}[*] Installing Go-based tools...${NC}"
pacman -S --needed --noconfirm go

GO_TOOLS=(
    "github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
    "github.com/projectdiscovery/httpx/cmd/httpx@latest"
    "github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest"
    "github.com/projectdiscovery/katana/cmd/katana@latest"
    "github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
    "github.com/tomnomnom/waybackurls@latest"
    "github.com/tomnomnom/assetfinder@latest"
    "github.com/tomnomnom/httprobe@latest"
    "github.com/lc/gau/v2/cmd/gau@latest"
    "github.com/ffuf/ffuf@latest"
    "github.com/OJ/gobuster/v3@latest"
    "github.com/ropnop/kerbrute@latest"
)

for tool in "${GO_TOOLS[@]}"; do
    echo -e "${GREEN}[+] Installing Go tool: $tool${NC}"
    sudo -u $SUDO_USER go install "$tool" 2>/dev/null || echo -e "${RED}[-] Failed to install $tool${NC}"
done

# Manual installations for specific tools
echo -e "${YELLOW}[*] Setting up manual installations...${NC}"

# Create tools directory
TOOLS_DIR="/opt/security-tools"
mkdir -p "$TOOLS_DIR"

# Clone GitHub repositories for tools not in repos
echo -e "${GREEN}[+] Cloning additional tools from GitHub...${NC}"

GITHUB_TOOLS=(
    "https://github.com/dirkjanm/ldapdomaindump.git"
    "https://github.com/login-securite/DonPAPI.git"
    "https://github.com/ly4k/Certipy.git"
    "https://github.com/p0dalirius/pywhisker.git"
    "https://github.com/ShutdownRepo/targetedKerberoast.git"
    "https://github.com/Hackndo/sprayhound.git"
    "https://github.com/CravateRouge/bloodyAD.git"
    "https://github.com/p0dalirius/coercer.git"
)

cd "$TOOLS_DIR"
for repo in "${GITHUB_TOOLS[@]}"; do
    repo_name=$(basename "$repo" .git)
    if [ ! -d "$repo_name" ]; then
        echo -e "${GREEN}[+] Cloning $repo_name${NC}"
        git clone "$repo" 2>/dev/null || echo -e "${RED}[-] Failed to clone $repo${NC}"
    fi
done

# Set permissions
chown -R $SUDO_USER:$SUDO_USER "$TOOLS_DIR"

# Add Go bin to PATH if not already there
if ! grep -q "export PATH=\$PATH:\$HOME/go/bin" /home/$SUDO_USER/.bashrc; then
    echo 'export PATH=$PATH:$HOME/go/bin' >> /home/$SUDO_USER/.bashrc
fi

echo -e "\n${GREEN}================================${NC}"
echo -e "${GREEN}Installation Complete!${NC}"
echo -e "${GREEN}================================${NC}"
echo -e "${YELLOW}Note: Some tools may require additional configuration.${NC}"
echo -e "${YELLOW}Cloned repositories are in: $TOOLS_DIR${NC}"
echo -e "${YELLOW}Please restart your terminal or run: source ~/.bashrc${NC}"
echo -e "${YELLOW}Go tools are installed in: ~/go/bin${NC}\n"
