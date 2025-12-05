# Arch Linux Security Tools Installation Guide

## Overview
This repository contains an automated installation script for a comprehensive collection of penetration testing and security tools on Arch Linux. The script installs 200+ security tools from official repositories, AUR, Python packages, Go packages, and GitHub repositories.

## Prerequisites

### System Requirements
- **OS**: Arch Linux (up to date)
- **Disk Space**: Minimum 20GB free space, 50GB recommended
- **RAM**: 4GB minimum, 8GB+ recommended
- **Internet**: Stable broadband connection required
- **User**: Root/sudo access required

### Dependencies
The script will automatically install:
- `git`
- `base-devel`
- `yay` (AUR helper)
- `python` and `pip`
- `go`

## Installation

### Quick Start
```bash
# Download the script
wget https://raw.githubusercontent.com/yourusername/yourrepo/main/install_security_tools.sh

# Make it executable
chmod +x install_security_tools.sh

# Run with sudo
sudo ./install_security_tools.sh
```

### Manual Installation
```bash
# Clone this repository
git clone https://raw.githubusercontent.com/GogoChad/Cyber-Tools/refs/heads/main/cyber-tool.sh
cd Cyber-tools

# Make script executable
chmod +x install_security_tools.sh

# Run the installer
sudo ./install_security_tools.sh
```

## Installation Time
**Expected Duration**: Approximately 1 hour 40 minutes

**Note**: Installation time may vary depending on:
- Internet connection speed (faster connection = quicker downloads)
- System specifications (more CPU cores = faster compilation)
- Number of tools successfully installed
- AUR compilation times
- Current system load

*Typical range: 1-3 hours*

## Post-Installation

### Update PATH
```bash
# Reload your shell configuration
source ~/.bashrc

# Or restart your terminal
```

### Tool Locations
- **Official packages**: `/usr/bin/`
- **AUR packages**: `/usr/bin/`
- **Go tools**: `~/go/bin/`
- **GitHub clones**: `/opt/security-tools/`
- **Python packages**: System-wide or `~/.local/bin/`

## Complete Tool List

### Network Analysis & Scanning
- aircrack-ng
- amass
- arp-scan
- bettercap
- hping3
- masscan
- naabu
- nbtscan
- netdiscover
- nmap
- rustscan
- tcpdump
- traceroute
- tshark
- udpx
- wireshark

### Web Application Testing
- arjun
- burpsuite
- byp4xx
- cewl
- cewler
- cmsmap
- corscanner
- dirb
- dirsearch
- droopescan
- drupwn
- eyewitness
- feroxbuster
- ffuf
- fuxploider
- gobuster
- gowitness
- h2csmuggler
- hakrawler
- httpmethods
- httprobe
- httpx
- jsluice
- jwt-tool
- kadimus
- katana
- kiterunner
- linkfinder
- moodlescan
- nikto
- nosqlmap
- nuclei
- photon
- smuggler
- sqlmap
- ssrfmap
- testssl
- wafw00f
- wfuzz
- whatweb
- wpscan
- wuzz
- xspear
- xsrfprobe
- xsser
- xsstrike
- zaproxy (ZAP)

### Active Directory & Windows
- abuseacl
- aclpwn
- ad-miner
- adidnsdump
- asrepcatcher
- autobloody
- bloodhound
- bloodhound-ce
- bloodhound.py
- bloodhound-quickwin
- bloodyad
- bqm
- certipy
- coercer
- conpass
- crackhound
- cyperoth
- dfscoerce
- donpapi
- dploot
- enum4linux-ng
- evilwinrm
- extractbitlockerkeys
- gmsadumper
- goldencopy
- gpp-decrypt
- impacket
- kerbrute
- krbjack
- krbrelayx
- ldapdomaindump
- ldaprelayscan
- ldapsearch
- ldapsearch-ad
- ldapwordlistharvester
- ldeep
- lsassy
- manspider
- masky
- mitm6
- nopac
- ntlmv1-multi
- ntlm_theft
- passthecert
- petitpotam
- pkinittools
- polenum
- pre2k
- pretender
- privexchange
- pygpoabuse
- pykek
- pylaps
- pywerview
- pywhisker
- pywsus
- roadrecon
- roadtx
- roastinthemiddle
- rusthound
- rusthound-ce
- sccmhunter
- sccmwtf
- shadowcoerce
- smartbrute
- smbclient
- smbclient-ng
- smbmap
- sprayhound
- targetedkerberoast
- webclientservicescanner
- windapsearch-go

### Password Cracking & Generation
- cewl
- cowpatty
- crackstat
- crackhound
- crunch
- cupp
- geowordlists
- hashcat
- hashonymize
- hob0rules
- hydra
- john
- legba
- name-that-hash
- nsakey-rules
- onelistforall
- oneruletorulethem
- pantagrule
- patator
- pwninit

### Reconnaissance & OSINT
- assetfinder
- carbon14
- censys
- cloudfail
- dnsenum
- dnsx
- fierce
- finalrecon
- findomain
- gau
- genusernames
- geopincer
- githubemail
- h8mail
- hakrevdns
- holehe
- ignorant
- ipinfo
- linkedin2username
- maigret
- osrframework
- phoneinfoga
- recon-ng
- recondog
- sherlock
- spiderfoot
- subfinder
- sublist3r
- theharvester
- toutatis
- waybackurls
- yalis

### Reverse Engineering
- androguard
- angr
- apktool
- binwalk
- dex2jar
- ghidra
- hexedit
- ida
- jadx
- jd-gui
- ltrace
- nasm
- radare2
- smali
- strace

### Forensics & Data Recovery
- autopsy
- chainsaw
- exif
- exifprobe
- exiftool
- exiv2
- foremost
- sleuthkit
- testdisk
- volatility2
- volatility3

### Mobile Security
- android-tools-adb
- androguard
- apksigner
- apktool
- frida
- jadx
- jd-gui
- mobsf
- objection
- scrcpy
- smali
- zipalign

### Cloud Security
- aws-cli
- azure-cli
- cloudfail
- cloudmapper
- cloudsplaining
- cloudsploit
- prowler
- scout

### Exploitation & Post-Exploitation
- empire
- havoc
- metasploit
- routersploit
- sliver
- villain
- weevely

### Wireless Security
- aircrack-ng
- bully
- cowpatty
- eaphammer
- hcxdumptool
- hcxtools
- pyrit
- reaver
- wifite2

### Cryptography & Encoding
- amber
- cyberchef
- haiti
- rsacracker
- rsactftool

### Steganography
- foremost
- steghide
- stegolsb
- stegosuite
- zsteg

### Hardware & IoT
- avrdude
- gqrx
- hackrf
- jackit
- libnfc
- libnfc-crypto1-crack
- mfcuk
- mfdread
- mfoc
- mousejack
- nfct
- proxmark3
- rtl-433

### Source Code Analysis
- brakeman
- gitleaks
- semgrep
- trufflehog

### Fuzzing & Payload Generation
- ffuf
- gopherus
- phpggc
- shellerator
- symfony-exploits
- wfuzz
- ysoserial

### Network Tunneling & Proxy
- chisel
- dns2tcp
- ligolo-ng
- ngrok
- proxychains
- sshuttle
- tailscale

### File Transfer & Servers
- goshs
- pyftpdlib
- updog
- uploader

### Utilities & Helpers
- anew
- arsenal
- asdf
- autoconf
- checksec-py
- fzf
- gf
- gron
- iptables
- mdcat
- neovim
- pass
- prips
- rlwrap
- tig
- timing
- tls-map
- trid
- uberfile
- upx
- vim
- whatportis

### Database Tools
- mariadb-client
- neo4j
- redis-tools

### Git & Version Control
- git-dumper
- gittools

### Deserialization & Java
- jdwp
- ysoserial

### CMS & Framework Specific
- cmsmap
- droopescan
- drupwn
- joomscan
- moodlescan
- wpscan

### Desktop Applications
- burpsuite
- maltego
- postman
- remmina
- soapui
- trilliumnext

### Document Analysis
- peepdf
- pst-utils

### Microsoft Security
- sccmhunter
- sccmwtf
- teamsphisher

### Container & Kubernetes
- kubectl

### Programming Languages & SDKs
- go
- powershell
- python

### Remote Desktop
- freerdp2-x11
- rdesktop
- remmina
- xtightvncviewer

### Communication Testing
- minicom
- sipvicious
- swaks

### Wordlist Management
- cewl
- crunch
- cupp
- seclists

## Troubleshooting

### Common Issues

#### AUR Package Build Failures
```bash
# Clear package cache
yay -Sc

# Rebuild with clean build
yay -S --rebuild packagename
```

#### Permission Issues
```bash
# Fix ownership of tools directory
sudo chown -R $USER:$USER /opt/security-tools

# Fix Go bin permissions
sudo chown -R $USER:$USER ~/go
```

#### Missing Dependencies
```bash
# Update system completely
sudo pacman -Syu

# Install base-devel if missing
sudo pacman -S base-devel
```

#### Python Package Conflicts
```bash
# Use pipx for isolated installations
pipx install toolname

# Or use virtual environments
python -m venv ~/pentesting-env
source ~/pentesting-env/bin/activate
pip install toolname
```

### Verify Installation
```bash
# Check if major tools are accessible
which nmap
which metasploit
which bloodhound
which burpsuite
which nuclei
which sqlmap
```

## Notes

### Tools Not Included
Some tools from the original list may not be available or installable on Arch Linux:
- Windows-only tools
- Discontinued projects
- Tools without Linux support
- Commercial tools requiring licenses

### Manual Configuration Required
Some tools may require additional setup:
- Metasploit (database initialization)
- BloodHound (Neo4j setup)
- WireShark (user group permissions)
- Burp Suite (Java configuration)

### Updates
Keep your tools updated:
```bash
# Update official packages
sudo pacman -Syu

# Update AUR packages
yay -Syu

# Update Go tools
go install toolname@latest

# Update Python tools
pip install --upgrade toolname
```

## License
This installation script is provided as-is for educational and authorized security testing purposes only.

## Disclaimer
These tools should only be used for legal security testing and educational purposes. Always obtain proper authorization before testing systems you don't own. Unauthorized access to computer systems is illegal.


## Also note that some of the packages may not be installed.
### This script was made by GogoChad using the exegol.csv file on the exegol website.
