sudo apt dos2unix
cp bigmac /usr/bin
cd /usr/bin/
sudo chmod 777 bigmac
cd /usr/share
git clone https://github.com/rotherda/BigMac
cd BigMac
dos2unix bigmac.sh
