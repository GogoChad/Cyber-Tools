# Security Tools Installation Guide
## For Arch Linux & Kali Linux

## Overview
This repository contains automated installation scripts for a comprehensive collection of penetration testing and security tools. Choose the appropriate script for your Linux distribution:

- **Arch Linux**: Uses `pacman` and AUR (`yay`)
- **Kali Linux**: Uses `apt` and Debian repositories

Both scripts install 200+ security tools including network scanners, web application testers, Active Directory tools, password crackers, and more.

---

## Table of Contents
- [System Requirements](#system-requirements)
- [Quick Start](#quick-start)
- [Installation Time](#installation-time)
- [Post-Installation](#post-installation)
- [Complete Tool List](#complete-tool-list)
- [Troubleshooting](#troubleshooting)
- [Updates & Maintenance](#updates--maintenance)
- [Legal Disclaimer](#legal-disclaimer)

---

## System Requirements

### Arch Linux
- **OS**: Arch Linux (up to date)
- **Disk Space**: 20GB minimum, 50GB recommended
- **RAM**: 4GB minimum, 8GB+ recommended
- **Internet**: Stable broadband connection
- **User**: Root/sudo access required

### Kali Linux
- **OS**: Kali Linux (2023.1 or newer)
- **Disk Space**: 15GB minimum, 40GB recommended
- **RAM**: 4GB minimum, 8GB+ recommended
- **Internet**: Stable broadband connection
- **User**: Root/sudo access required

---

## Quick Start

### Arch Linux Installation

```bash
# Download the script
wget https://raw.githubusercontent.com/GogoChad/Cyber-Tools/refs/heads/main/pacman-cyber-tools.sh

# Rename for clarity (optional)
mv cyber-tool.sh install_security_tools_arch.sh

# Make it executable
chmod +x install_security_tools_arch.sh

# Run with sudo
sudo ./install_security_tools_arch.sh
```

### Kali Linux Installation

```bash
# Download the Kali script
wget https://raw.githubusercontent.com/GogoChad/Cyber-Tools/refs/heads/main/apt-cyber-tools.sh

# Make it executable
chmod +x kali-security-tools.sh

# Run with sudo
sudo ./kali-security-tools.sh
```

### Alternative: Clone Repository

```bash
# Clone this repository
git clone https://github.com/GogoChad/Cyber-Tools.git
cd Cyber-Tools

# Make scripts executable
chmod +x *.sh

# Run the appropriate script for your system
sudo ./install_security_tools_arch.sh    # For Arch Linux
# OR
sudo ./kali-security-tools.sh            # For Kali Linux
```

---

## Installation Time

### Arch Linux
**Expected Duration**: 1 hour 40 minutes (typical range: 1-3 hours)


### Kali Linux
**Expected Duration**: 30-60 minutes (typical range: 20-90 minutes)

---

## Post-Installation

### Update PATH (Both Systems)

**Arch Linux:**
```bash
# Reload your shell configuration
source ~/.bashrc

# Or restart your terminal
```

**Kali Linux:**
```bash
# Reload ZSH configuration (Kali default)
source ~/.zshrc

# Or restart your terminal
```

### Tool Locations

#### Arch Linux
- **Official packages**: `/usr/bin/`
- **AUR packages**: `/usr/bin/`
- **Go tools**: `~/go/bin/`
- **GitHub clones**: `/opt/security-tools/`
- **Python packages**: System-wide or `~/.local/bin/`

#### Kali Linux
- **APT packages**: `/usr/bin/`
- **Go tools**: `~/go/bin/`
- **Pipx tools**: `~/.local/bin/`
- **GitHub clones**: `/opt/security-tools/`
- **Wordlists**: `/usr/share/wordlists/`
- **SecLists**: `/usr/share/seclists/`

### First Steps After Installation

**For Both Systems:**
```bash
# Verify major tools are accessible
which nmap
which metasploit-framework
which nuclei
which sqlmap
which bloodhound

# Update tool databases
sudo nuclei -update-templates
```

**Kali Linux Specific:**
```bash
# Extract rockyou wordlist
sudo gunzip /usr/share/wordlists/rockyou.txt.gz

# Check tool versions
nuclei -version
subfinder -version
httpx -version
```

---

## Complete Tool List

### Network Analysis & Scanning
- **aircrack-ng** - Wireless network security tools
- **amass** - In-depth DNS enumeration
- **bettercap** - Network attack and monitoring framework
- **hping** - TCP/IP packet assembler/analyzer
- **masscan** - Fast port scanner
- **naabu** - Fast port discovery tool
- **nmap** - Network exploration and security auditing
- **rustscan** - Modern port scanner
- **tcpdump** - Packet analyzer
- **traceroute** - Network diagnostic tool
- **wireshark** - Network protocol analyzer

### Web Application Testing
- **burpsuite** - Web application security testing platform
- **cewl** - Custom wordlist generator
- **cmsmap** - CMS vulnerability scanner
- **dirb** - Web content scanner
- **dirsearch** - Web path scanner
- **eyewitness** - Website screenshot tool
- **feroxbuster** - Content discovery tool
- **ffuf** - Fast web fuzzer
- **gobuster** - Directory/file & DNS busting tool
- **gowitness** - Web screenshot utility
- **hakrawler** - Web crawler for reconnaissance
- **httprobe** - HTTP probe tool
- **httpx** - Fast HTTP toolkit
- **jwt-tool** - JWT security testing
- **katana** - Next-generation crawling framework
- **nikto** - Web server scanner
- **nuclei** - Vulnerability scanner
- **sqlmap** - SQL injection tool
- **testssl.sh** - SSL/TLS testing
- **wafw00f** - Web application firewall detector
- **wfuzz** - Web application fuzzer
- **whatweb** - Web scanner
- **wpscan** - WordPress security scanner
- **zaproxy** - OWASP ZAP proxy

### Active Directory & Windows Security
- **bloodhound** - AD relationship mapper
- **bloodhound.py** - Python BloodHound ingestor
- **bloodyad** - Active Directory privilege escalation
- **certipy-ad** - Active Directory certificate abuse
- **coercer** - Coerce authentication tool
- **crackmapexec** - Post-exploitation tool
- **donpapi** - Dump secrets from domain
- **enum4linux-ng** - Windows/Samba enumeration
- **evil-winrm** - WinRM shell
- **impacket** - Network protocol toolkit
- **kerbrute** - Kerberos enumeration
- **ldapdomaindump** - LDAP domain information dumper
- **lsassy** - Credentials extractor
- **masky** - Remote credential extraction
- **mitm6** - IPv6 attack tool
- **netexec** - Network execution tool
- **pypykatz** - Mimikatz in Python
- **pywhisker** - Shadow credentials manipulation
- **responder** - LLMNR/NBT-NS poisoner
- **roadrecon** - Azure AD reconnaissance
- **smbclient** - SMB client
- **smbmap** - SMB enumeration tool
- **sprayhound** - Password spraying tool
- **targetedkerberoast** - Targeted Kerberoasting

### Password Cracking & Generation
- **crunch** - Wordlist generator
- **hashcat** - Advanced password recovery
- **hydra** - Network authentication cracker
- **john** - John the Ripper password cracker
- **name-that-hash** - Hash type identifier
- **patator** - Multi-purpose brute-forcer

### Reconnaissance & OSINT
- **assetfinder** - Find domains and subdomains
- **dnsenum** - DNS enumeration tool
- **dnsx** - Fast DNS toolkit
- **findomain** - Subdomain discovery
- **gau** - Fetch known URLs
- **holehe** - Email OSINT tool
- **maigret** - Username search across sites
- **osrframework** - OSINT framework
- **recon-ng** - Reconnaissance framework
- **sherlock** - Social media username search
- **spiderfoot** - OSINT automation
- **subfinder** - Subdomain discovery
- **sublist3r** - Subdomain enumeration
- **theharvester** - Email/subdomain harvester
- **waybackurls** - Wayback Machine URL fetcher

### Reverse Engineering & Binary Analysis
- **binwalk** - Firmware analysis tool
- **ghidra** - Software reverse engineering suite
- **hexedit** - Hex editor
- **jadx** - Dex to Java decompiler
- **jd-gui** - Java decompiler
- **radare2** - Reverse engineering framework
- **ltrace** - Library call tracer
- **strace** - System call tracer

### Forensics & Data Recovery
- **autopsy** - Digital forensics platform
- **exiftool** - Metadata reader/writer
- **foremost** - File recovery tool
- **sleuthkit** - Forensic toolkit
- **testdisk** - Data recovery tool
- **volatility** - Memory forensics framework

### Mobile Security
- **android-tools** - Android SDK tools (adb, fastboot)
- **apktool** - Android APK reverse engineering
- **frida-tools** - Dynamic instrumentation toolkit
- **jadx** - Android app decompiler
- **mobsf** - Mobile Security Framework
- **objection** - Runtime mobile exploration
- **scrcpy** - Android screen control

### Cloud Security
- **aws-cli** - AWS command line interface
- **azure-cli** - Azure command line interface (Arch only)

### Exploitation Frameworks
- **metasploit-framework** - Penetration testing framework
- **routersploit** - Router exploitation framework
- **sliver** - C2 framework (Arch only)

### Wireless Security
- **aircrack-ng** - Wireless security tools
- **bully** - WPS brute force tool
- **reaver** - WPS attack tool
- **wifite** - Automated wireless auditor

### Cryptography & Steganography
- **steghide** - Steganography tool
- **hashcat** - Password cracker
- **john** - Password cracker

### Network Tunneling & Proxy
- **chisel** - Fast TCP/UDP tunnel
- **ngrok** - Secure tunneling (Arch only)
- **proxychains** - Proxy chains utility
- **tor** - Anonymity network

### Utilities & Development
- **curl** - Data transfer tool
- **git** - Version control
- **golang** - Go programming language
- **python3** - Python programming language
- **vim/neovim** - Text editors
- **pipx** - Python application installer
- **fzf** - Fuzzy finder (Arch only)

### Additional Kali Tools
- **kali-tools-top10** - Top 10 Kali tools metapackage
- **kali-tools-web** - Web application testing tools
- **kali-tools-passwords** - Password attack tools
- **kali-tools-wireless** - Wireless security tools
- **kali-tools-information-gathering** - Information gathering tools
- **kali-tools-vulnerability** - Vulnerability analysis tools
- **kali-tools-forensics** - Digital forensics tools
- **exploitdb** - Exploit database
- **seclists** - Security testing wordlists
- **wordlists** - Password cracking wordlists

---

## Troubleshooting

### Arch Linux Issues

#### AUR Package Build Failures
```bash
# Clear package cache
yay -Sc

# Rebuild with clean build
yay -S --rebuild packagename

# Update keyring if signature issues
sudo pacman -S archlinux-keyring
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

### Kali Linux Issues

#### Package Not Found
```bash
# Update package lists
sudo apt update

# Search for package
apt search packagename

# Try alternative package names
apt search nmap | grep ^nmap
```

#### Broken Packages
```bash
# Fix broken dependencies
sudo apt --fix-broken install

# Reconfigure packages
sudo dpkg --configure -a

# Force reinstall
sudo apt install --reinstall packagename
```

#### Permission Denied for Tools
```bash
# Add user to wireshark group
sudo usermod -aG wireshark $USER

# Reload groups
newgrp wireshark

# Or logout and login again
```

#### Pipx Installation Issues
```bash
# Ensure pipx path is correct
pipx ensurepath

# Reinstall pipx
sudo apt install --reinstall pipx

# Use pip as fallback
pip3 install --user toolname
```

### Common Issues (Both Systems)

#### Tool Not in PATH
```bash
# Check if tool is installed
which toolname
find /usr -name toolname 2>/dev/null

# Add to PATH temporarily
export PATH=$PATH:~/go/bin:~/.local/bin

# Add to PATH permanently
echo 'export PATH=$PATH:~/go/bin:~/.local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Go Tools Not Working
```bash
# Set Go environment
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Reinstall Go tool
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
```

#### Network/Firewall Issues
```bash
# Test internet connectivity
ping -c 4 8.8.8.8

# Check DNS resolution
nslookup google.com

# Disable firewall temporarily (for testing)
sudo systemctl stop iptables      # Arch
sudo ufw disable                  # Kali
```

---

## Updates & Maintenance

### Arch Linux

```bash
# Update official packages
sudo pacman -Syu

# Update AUR packages
yay -Syu

# Update all Go tools
cd ~/go/src && for d in */; do cd "$d" && go get -u ./... && cd ..; done

# Update Python tools
pip list --outdated
pip install --upgrade toolname

# Update GitHub repositories
cd /opt/security-tools
for dir in */; do cd "$dir" && git pull && cd ..; done
```

### Kali Linux

```bash
# Update system and packages
sudo apt update && sudo apt upgrade -y

# Update Kali-specific tools
sudo apt update && sudo apt full-upgrade -y

# Update Go tools
go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Update pipx tools
pipx upgrade-all

# Update specific pipx tool
pipx upgrade toolname

# Update nuclei templates
nuclei -update-templates

# Update GitHub repositories
cd /opt/security-tools
for dir in */; do (cd "$dir" && git pull); done
```

### Verify Installation (Both Systems)

```bash
# Check major tools
for tool in nmap metasploit sqlmap nuclei bloodhound burpsuite; do
    echo -n "$tool: "
    which $tool 2>/dev/null || echo "NOT FOUND"
done

# Check Go tools
ls ~/go/bin/

# Check Python tools
pipx list

# Check versions
nmap --version
nuclei -version
subfinder -version
```

---

## Configuration Tips

### Metasploit Database Setup (Both Systems)

```bash
# Initialize Metasploit database
sudo msfdb init

# Start Metasploit
msfconsole

# Check database connection
msf6 > db_status
```

### BloodHound Setup (Both Systems)

**Arch Linux:**
```bash
# Install and start Neo4j
sudo pacman -S neo4j
sudo systemctl start neo4j

# Access at http://localhost:7474
# Default credentials: neo4j/neo4j
```

**Kali Linux:**
```bash
# Neo4j is typically pre-configured
sudo neo4j start

# Or use BloodHound CE (Community Edition)
bloodhound
```

### Wireshark Permissions (Both Systems)

```bash
# Add user to wireshark group
sudo usermod -aG wireshark $USER

# Or manually set permissions (Arch)
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap

# Logout and login for changes to take effect
```

### Burp Suite Configuration (Both Systems)

```bash
# Launch Burp Suite
burpsuite &

# Configure browser proxy: 127.0.0.1:8080
# Import Burp CA certificate for HTTPS interception
```

---

## Performance Optimization

### Arch Linux

```bash
# Clean package cache
sudo pacman -Sc

# Remove orphaned packages
sudo pacman -Rns $(pacman -Qtdq)

# Clean AUR cache
yay -Sc
```

### Kali Linux

```bash
# Clean APT cache
sudo apt clean
sudo apt autoclean

# Remove unused packages
sudo apt autoremove

# Remove old kernels (keep current + 1 backup)
sudo apt autoremove --purge
```

---

## Security Considerations

### Important Notes

⚠️ **Legal Warning**: These tools are for authorized security testing only. Unauthorized access to systems is illegal.

⚠️ **Tool Responsibility**: Always obtain proper authorization before testing any system you don't own.

⚠️ **Data Privacy**: Be careful with sensitive data captured during testing. Follow responsible disclosure practices.


```bash
# Create a backup of tool configurations
tar -czf ~/pentesting-backup-$(date +%Y%m%d).tar.gz \
    ~/.config \
    ~/.msf4 \
    /opt/security-tools \
    ~/go/bin

# Encrypt sensitive data
gpg -c sensitive-file.txt

# Use separate user for pentesting
sudo useradd -m -s /bin/bash pentester
sudo usermod -aG sudo pentester
```

---

## Additional Resources

### Documentation
- **Arch Wiki**: https://wiki.archlinux.org/
- **Kali Documentation**: https://www.kali.org/docs/
- **Kali Tools**: https://www.kali.org/tools/
- **Metasploit Unleashed**: https://www.offensive-security.com/metasploit-unleashed/
- **OWASP Testing Guide**: https://owasp.org/www-project-web-security-testing-guide/

### Learning Resources
- **HackTheBox**: https://www.hackthebox.com/
- **TryHackMe**: https://tryhackme.com/
- **PentesterLab**: https://pentesterlab.com/
- **PortSwigger Web Security Academy**: https://portswigger.net/web-security

### Community
- **Kali Forums**: https://forums.kali.org/
- **Arch Forums**: https://bbs.archlinux.org/
- **r/Kalilinux**: https://reddit.com/r/Kalilinux
- **r/archlinux**: https://reddit.com/r/archlinux
- **r/netsec**: https://reddit.com/r/netsec

---

## Contributing

Contributions are welcome! If you find issues or want to add tools:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on both Arch and Kali (if applicable)
5. Submit a pull request

### Reporting Issues

When reporting issues, please include:
- Linux distribution and version
- Script version
- Error messages (full output)
- Steps to reproduce
- System specifications

---

## Credits

- **Script Author**: GogoChad
- **Based on**: Exegol tool list (exegol.csv)
- **Community**: Thanks to all security tool developers and maintainers

---

## License

This installation script is provided as-is for educational and authorized security testing purposes only.

**MIT License** - See LICENSE file for details

---

## Changelog

### Version 2.0 (Current)
- Added Kali Linux support
- Improved error handling
- Added pipx integration for Python tools
- Enhanced post-installation instructions
- Better tool organization

### Version 1.0
- Initial Arch Linux release
- 200+ tools installation
- AUR integration
- Go and Python tools support

---

## FAQ

### Q: Can I run this on other Debian-based distros?
**A**: The Kali script may work on Ubuntu/Debian, but some Kali-specific packages won't be available.

### Q: How much internet data will this use?
**A**: Approximately 5-15 GB depending on your system and which tools install successfully.

### Q: Can I select which tools to install?
**A**: Currently, scripts install all available tools. You can manually edit the script to comment out unwanted tools.

### Q: Will this break my system?
**A**: The scripts are designed to be safe, but always backup important data before running system-wide installations.

### Q: Can I run both scripts on the same system?
**A**: Not recommended. Choose the script appropriate for your distribution.

### Q: Some tools failed to install. Is this normal?
**A**: Yes, some tools may not be available or may have dependency issues. The script continues despite individual failures.

### Q: How do I uninstall everything?
**A**: There's no automated uninstall. You'll need to manually remove packages and directories. Keep a list of what was installed.

---

## Contact

- **GitHub**: https://github.com/GogoChad/Cyber-Tools
- **Issues**: https://github.com/GogoChad/Cyber-Tools/issues

---

**Remember**: With great power comes great responsibility. Use these tools ethically and legally. 🛡️
