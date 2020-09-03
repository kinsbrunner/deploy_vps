#!/bin/bash

sudo apt update
sudo pip3 install colored
sudo pip3 install tldextract
sudo apt-get install -y psmisc
sudo apt install  -y host
sudo apt install -y dnsutils
sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get install -y python-setuptools
sudo apt-get install -y libldns-dev
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y python-dnspython
sudo apt-get install -y git
sudo apt-get install -y rename
sudo apt-get install -y xargs
sudo apt-get install -y snapd
sudo apt-get install -y tmux
pip3 install dnsgen
pip install colored
sudo systemctl start snap
echo 'PATH=$PATH:/snap/bin' >> ~/.bashrc

echo "Installing Golang"
wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
sudo tar -xvf go1.13.4.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'   >> ~/.bashrc
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
sleep 1

#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

echo "Installing Aquatone"
go get github.com/michenriksen/aquatone

echo "Installing Assetfinder"
go get -u github.com/tomnomnom/assetfinder 

echo "Installing Httprobe"
go get -u github.com/tomnomnom/httprobe 

echo "Installing fff"
go get -u github.com/tomnomnom/fff

echo "Installing Concurl"
go get -u github.com/tomnomnom/concurl

echo "Installing gf"
go get -u github.com/tomnomnom/gf
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf

echo "Installing Gau"
go get -u github.com/lc/gau

echo "Installing Hakcheckurl"
go get github.com/hakluke/hakcheckurl

echo "Installing Hakrevdns"
go get github.com/hakluke/hakrevdns

echo "Installing ffuf"
go get github.com/ffuf/ffuf

echo "Installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/

echo "Installing Chromium"
sudo snap install chromium

echo "Installing Unwebpack sourcemap"
git clone https://github.com/rarecoil/unwebpack-sourcemap.git
cd ~/tools/

echo "Installing Subfinder"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/subfinder/cmd/subfinder

echo "Installing httpx"
GO111MODULE=on go get -u -v github.com/projectdiscovery/httpx/cmd/httpx

echo "Installing nuclei"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
git clone https://github.com/projectdiscovery/nuclei-templates.git

echo "Installing Nabu"
GO111MODULE=on go get -v github.com/projectdiscovery/naabu/cmd/naabu

echo "Installing relative-url-extractor"
git clone https://github.com/jobertabma/relative-url-extractor.git
cd ~/tools/

echo "Installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/

echo "Installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd knock
sudo python setup.py install
cd ~/tools/

echo "Installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/

echo "Installing nmap"
sudo apt-get install -y nmap

echo "Installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/

echo "Installing Corsy"
git clone https://github.com/s0md3v/Corsy.git
cd Corsy
sudo pip3 install -r requirments.txt
cd ..

echo "Installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt

echo "Retrieving smuggler.py"
cd ~/tools/
wget https://raw.githubusercontent.com/gwen001/pentest-tools/master/smuggler.py

echo "Installing amass"
go get -v -u github.com/OWASP/Amass/v3/...
cd $GOPATH/src/github.com/OWASP/Amass
go install ./...

echo "Creating Wordlist"
cd ~/tools/dirsearch/db/
wget https://github.com/xyele/hackerone_wordlist/releases/download/beta/wordlists.zip
unzip wordlists.zip
cp ~/tools/dirsearch/db/apiwords.txt .
cp ~/tools/recon/ffuf_extension.txt .
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt
wget https://raw.githubusercontent.com/assetnote/commonspeak2-wordlists/master/wordswithext/php.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-files.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/raft-large-directories.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/spring-boot.txt
wget https://raw.githubusercontent.com/milo2012/pathbrute/master/defaultPaths.txt
wget https://raw.githubusercontent.com/milo2012/pathbrute/master/cvePaths.txt
cd -

cd ~/tools
wget https://raw.githubusercontent.com/m4ll0k/Bug-Bounty-Toolz/master/getjswords.py
wget https://raw.githubusercontent.com/gwen001/github-search/master/github-endpoints.py
wget https://raw.githubusercontent.com/gwen001/github-search/master/github-subdomains.py
wget https://raw.githubusercontent.com/assetnote/commonspeak2-wordlists/master/subdomains/subdomains.txt

echo "Retrieving PayloadsAllTheThings repo"
cd ~/tools
git clone https://github.com/swisskyrepo/PayloadsAllTheThings.git

#Here is where Go executables are, to avoid needing to write full path before executing
#echo 'PATH=$PATH:/root/go/bin' >> ~/.bashrc
export PATH=$PATH:/root/go/bin

echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
cd ~/tools
ls -la
