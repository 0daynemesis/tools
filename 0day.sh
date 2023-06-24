#!/bin/bash

#Note, this is a script that I started to build after repeatedly needing to roll out builds. 
#I thought about creating a custom Kali Distro, however with needing to install custom tools from github 
#I decided on a modifiable script instead. When I started to build the script, 
#I built upon the foundation that Matthew Clark May had used in a Repository he created, but no longer maintains. Credit where it's due.

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get install git -y
sudo apt-get install python3 -y
sudo apt-get install screen -y
pip install ldapdomaindump

sudo dpkg-reconfigure kali-grant-root

echo "-------------------------------------------------------------------"
echo "----- Sublime Text, Installation Starting... ------"
echo "-------------------------------------------------------------------"

sudo apt-get install apt-transport-https -y
sudo wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
sudo echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text

echo "-------------------------------------------------------------------"
echo "---------- Sublime Text Installed, Next Phase ---------------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "----- Terminator, Installation Starting... ------------------------"
echo "-------------------------------------------------------------------"

sudo apt-get update
sudo apt-get install terminator -y
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
sudo rm -rf fonts
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "-------------------------------------------------------------------"
echo "---------- Terminator Installed, Next Phase -----------------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "----- Plank, Installation Starting... -----------------------------"
echo "-------------------------------------------------------------------"

sudo apt-get update
sudo apt-get install plank -y

echo "-------------------------------------------------------------------"
echo "---------- Plank Installed, Next Phase ----------------------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "----- Brave, Installation Starting... -----------------------------"
echo "-------------------------------------------------------------------"

sudo apt install curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y

echo "-------------------------------------------------------------------"
echo "---------- Brave Installed, Next Phase ----------------------------"
echo "-------------------------------------------------------------------"

cd /opt
ls | xargs -I{} git -C {} pull

echo "-------------------------------------------------------------------"
echo "----- Updated Github Tools, Next Phase ----------------------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "----- Update, Upgrade, and Dist-Upgrade Complete, Next Phase ------"
echo "-------------------------------------------------------------------"

sudo apt-get install htop hexedit exiftool exif -y 
sudo apt-get install terminator -y

echo "-------------------------------------------------------------------"
echo "---------- Basic Tools Installed, Next Phase ------------"
echo "-------------------------------------------------------------------"

sudo apt-get install metasploit-framework -y
sudo /etc/init.d/postgresql start
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb> msfinstall && chmod 755 && msfinstall && ./msfinstall
sudo msfdb init

echo "-------------------------------------------------------------------"
echo "--------------- Metasploit configured, Next Phase -----------------"
echo "-------------------------------------------------------------------"

apt-get install brutespray -y
apt-get install -y gobuster
apt-get install -y amass
apt-get install -y masscan

echo "-------------------------------------------------------------------"
echo "--------------- Changeme Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/FortyNorthSecurity/EyeWitness.git
cd EyeWitness/
cd setup/
sudo ./setup.sh -y
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- EyeWitness Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/danielmiessler/SecLists.git

echo "-------------------------------------------------------------------"
echo "--------------- SecLists Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/leebaird/discover.git
cd discover/
sudo ./update.sh
cd /opt

echo "-------------------------------------------------------------------"
echo "--------------- Discover Installed, It installed Lots!! Next Tool! ----------------"
echo "-------------------------------------------------------------------"

cd /opt/
sudo wget https://github.com/RustScan/RustScan/releases/download/1.8.0/rustscan_1.8.0_amd64.deb
sudo dpkg -i rustscan_1.8.0_amd64.deb
sudo rm rustscan_1.8.0_amd64.deb

cd /opt/
sudo mkdir tools
cd tools/

echo "-------------------------------------------------------------------"
echo "--------------- DDoS Tools Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

sudo mkdir DDos-Tools
cd DDos-Tools/

sudo git clone https://github.com/anonymous24x7/Saphyra-DDoS
cd Saphyra-DDoS/
cd /opt/tools/DDos-Tools/

echo "-------------------------------------------------------------------"
echo "--------------- Saphyra-DDoS Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/iTzPrime/zambie.git
cd zambie/
cd /opt/tools/DDos-Tools/

echo "-------------------------------------------------------------------"
echo "--------------- Zambie Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/GinjaChris/pentmenu.git
cd pentmenu/
cd /opt/tools/DDos-Tools/

echo "-------------------------------------------------------------------"
echo "--------------- Pentmenu Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/epsylon/ufonet.git
cd ufonet/
cd /opt/tools/DDos-Tools/

echo "-------------------------------------------------------------------"
echo "--------------- Ufonet Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/jseidl/GoldenEye.git
cd https://github.com/jseidl/GoldenEye.git/
cd /opt/tools/DDos-Tools/

echo "-------------------------------------------------------------------"
echo "--------------- GoldenEye Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

sudo git clone https://github.com/XCHADXFAQ77X/XERXES.git
cd XERXES/
cd /opt/tools/DDos-Tools/

echo "-------------------------------------------------------------------"
echo "--------------- Xerxes Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- DDoS-Tools Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Proxy-Tools Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir Proxy_Tools
cd Proxy_Tools

sudo git clone https://github.com/HiroshiManRise/anonym8.git 
cd anonym8/
cd /opt/tools/Proxy_Tools/

echo "-------------------------------------------------------------------"
echo "--------------- Proxy-Tools Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Exploits Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir Exploits
cd Exploits/

sudo git clone https://github.com/rand0m1ze/ezsploit.git
cd ezsploit/
cd /opt/tools/Exploits/

echo "-------------------------------------------------------------------"
echo "--------------- Exploits Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Hash-Cracking-Tools Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir Hash-Cracking
cd Hash-Cracking/

sudo git clone https://github.com/digininja/CeWL.git
cd CeWL/
cd /opt/tools/Hash-Cracking/

sudo git clone https://github.com/sc0tfree/mentalist.git
cd mentalist/
cd /opt/tools/Hash-Cracking/

sudo git clone https://github.com/BlackArch/wordlistctl.git
cd wordlistctl/
cd /opt/tools/Hash-Cracking/

sudo git clone https://github.com/tp7309/TTPassGen.git
cd TTPassGen/
cd /opt/tools/Hash-Cracking/

echo "-------------------------------------------------------------------"
echo "--------------- Hash-Cracking-Tools Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Backdoor Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir Backdoor
cd Backdoor/

sudo git clone https://github.com/tokyoneon/B2E.git
cd B2E/
cd /opt/tools/Backdoor/

sudo git clone https://github.com/ParrotSec/shellter.git 
cd shellter/
cd /opt/tools/Backdoor/

sudo git clone https://github.com/pasahitz/zirikatu.git
cd zirikatu/
cd /opt/tools/Backdoor/

echo "-------------------------------------------------------------------"
echo "--------------- Backdoor Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Wifi-Attacks Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir Wifi-Attacks
cd Wifi-Attacks/

sudo git clone https://github.com/vincenzogianfelice/RoguePortal.git
cd RoguePortal/
cd /opt/tools/Wifi-Attacks/

sudo git clone https://github.com/FluxionNetwork/fluxion.git 
cd fluxion/
cd /opt/tools/Wifi-Attacks/

sudo git clone https://github.com/v1s1t0r1sh3r3/airgeddon.git
cd airgeddon/
cd /opt/tools/Wifi-Attacks/

sudo git clone https://github.com/arismelachroinos/lscript.git
cd lscript/
cd /opt/tools/Wifi-Attacks/

echo "-------------------------------------------------------------------"
echo "--------------- Wifi-Attacks Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Windows-Exploits Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir Windows-Exploits
cd Windows-Exploits/

sudo git clone https://github.com/AonCyberLabs/Windows-Exploit-Suggester.git
cd Windows-Exploit-Suggester/
cd /opt/tools/Windows-Exploits/

echo "-------------------------------------------------------------------"
echo "--------------- Windows-Exploits Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Recon Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir Recon
cd Recon/

sudo git clone https://github.com/Jamalc0m/wphunter.git
cd wphunter/ 
cd /opt/tools/Recon/

sudo git clone https://github.com/hahwul/a2sv.git 
cd a2sv/
cd /opt/tools/Recon/

sudo git clone https://github.com/maldevel/IPGeoLocation.git
cd IPGeoLocation/
cd /opt/tools/Recon/

sudo git clone https://github.com/killvxk/Yuki-Chan-The-Auto-Pentest-1.git
cd Yuki-Chan-The-Auto-Pentest-1/ 
cd /opt/tools/Recon/

sudo git clone https://github.com/Anon-Exploiter/SiteBroker.git 
cd SiteBroker/
cd /opt/tools/Recon/

sudo git clone https://github.com/lightos/credmap.git
cd credmap/
cd /opt/tools/Recon/

sudo git clone https://github.com/bahatiphill/BillCipher.git
cd BillCipher/ 
cd /opt/tools/Recon/

sudo git clone https://github.com/Tuhinshubhra/RED_HAWK.git 
cd RED_HAWK/
cd /opt/tools/Recon/

sudo git clone https://github.com/devanshbatham/Passivehunter.git
cd Passivehunter/
cd /opt/tools/Recon/

sudo git clone https://github.com/projectdiscovery/subfinder.git
cd subfinder/ 
cd /opt/tools/Recon/

sudo git clone https://github.com/michenriksen/aquatone.git  
cd aquatone/
cd /opt/tools/Recon/

sudo git clone https://github.com/projectdiscovery/nuclei.git
cd nuclei/
cd /opt/tools/Recon/

sudo git clone https://github.com/aufzayed/HydraRecon.git
cd HydraRecon/ 
cd /opt/tools/Recon/

sudo git clone https://github.com/1ndianl33t/Gf-Patterns.git 
cd Gf-Patterns/
cd /opt/tools/Recon/

sudo git clone https://github.com/s0md3v/XSStrike.git 
cd XSStrike/
cd /opt/tools/Recon/

echo "-------------------------------------------------------------------"
echo "--------------- Recon Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Phishing Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir Phishing 
cd Phishing/

sudo git clone https://github.com/UndeadSec/EvilURL.git
cd EvilURL/ 
cd /opt/tools/Phishing/

sudo git clone https://github.com/jaykali/maskphish.git 
cd maskphish/
cd /opt/tools/Phishing/

sudo git clone https://github.com/htr-tech/nexphisher.git
cd nexphisher/
cd /opt/tools/Phishing/

sudo git clone https://github.com/hangetzzu/saycheese.git
cd saycheese/ 
cd /opt/tools/Phishing/

sudo git clone https://github.com/4w4k3/BeeLogger.git 
cd BeeLogger/
cd /opt/tools/Phishing/

sudo git clone https://github.com/wifiphisher/wifiphisher.git
cd wifiphisher/
cd /opt/tools/Phishing/

sudo git clone https://github.com/htr-tech/zphisher.git
cd zphisher/ 
cd /opt/tools/Phishing/

sudo git clone https://github.com/iinc0gnit0/BlackPhish.git 
cd BlackPhish/
cd /opt/tools/Phishing/

echo "-------------------------------------------------------------------"
echo "--------------- Phishing Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- OSINT Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir OSINT
cd OSINT/

sudo git clone https://github.com/alpkeskin/mosint.git
cd mosint/ 
cd /opt/tools/OSINT/

sudo git clone https://github.com/TheSpeedX/TBomb.git 
cd TBomb/
cd /opt/tools/OSINT/

sudo git clone https://github.com/sherlock-project/sherlock.git
cd sherlock/
cd /opt/tools/OSINT/

sudo git clone https://github.com/Datalux/Osintgram.git
cd Osintgram/ 
cd /opt/tools/OSINT/

sudo git clone https://github.com/martinvigo/email2phonenumber.git 
cd email2phonenumber/
cd /opt/tools/OSINT/

sudo git clone https://github.com/sundowndev/phoneinfoga.git 
cd phoneinfoga/
cd /opt/tools/OSINT/

sudo git clone https://github.com/4mritGiri/NumberTracker.git
cd NumberTracker/ 
cd /opt/tools/OSINT/

echo "-------------------------------------------------------------------"
echo "--------------- OSINT Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Scripts Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir scripts
cd scripts/

sudo wget https://github.com/carlospolop/PEASS-ng/releases/download/20230618-1fa055b6/linpeas.sh

sudo git clone https://github.com/m0nad/awesome-privilege-escalation.git

sudo git clone https://github.com/rebootuser/LinEnum.git

sudo git clone https://github.com/The-Z-Labs/linux-exploit-suggester.git

sudo git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git

sudo git clone https://github.com/pentestmonkey/php-reverse-shell.git

sudo git clone https://github.com/JohnHammond/poor-mans-pentest.git

sudo git clone https://github.com/payloadbox/sql-injection-payload-list.git

echo "-------------------------------------------------------------------"
echo "--------------- Scripts Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- Other Tools Installation Starting... ----------------"
echo "-------------------------------------------------------------------"

cd /opt
sudo mkdir otherTools
cd otherTools/

sudo git clone https://github.com/maaaaz/impacket.git && cd impacket
pip install .
cd /opt/otherTools/

sudo git clone https://github.com/jhaddix/domain.git
cd /opt/otherTools/

sudo git clone https://github.com/cakinney/domained.git
cd domained/
sudo python domained.py --install
cd /opt/otherTools/

sudo git clone https://github.com/elceef/dnstwist.git
sudo apt-get install python-dnspython python-geoip python-whois python-requests python-ssdeep python-cffi -y
cd /opt/otherTools/

sudo git clone https://github.com/vulnersCom/nmap-vulners.git

sudo git clone https://github.com/si9int/cc.py.git

sudo git clone https://github.com/abhaybhargav/bucketeer.git

sudo git clone https://github.com/DanMcInerney/icebreaker.git

sudo git clone https://github.com/derv82/wifite2.git

echo "-------------------------------------------------------------------"
echo "--------------- Other Tools Installed, Success! ----------------"
echo "-------------------------------------------------------------------"

export DEBIAN_FRONTEND="noninteractive"

# remove previously installed Docker
sudo apt-get remove docker docker-engine docker.io* lxc-docker*

# install dependencies 4 cert
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y

# add Docker repo gpg key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

echo "deb https://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list 

sudo apt-get update

# install Docker
sudo apt-get install docker-io

# run Hellow World image
sudo docker run hello-world

# manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER

# configure Docker to start on boot
sudo systemctl enable docker

echo "-------------------------------------------------------------------"
echo "--------------- Docker Installed, Next Tool! ----------------"
echo "-------------------------------------------------------------------"

echo "-------------------------------------------------------------------"
echo "--------------- All Tools Installed! Go Break Some Stuff! ---------"
echo "-------------------------------------------------------------------"
