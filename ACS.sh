#!/bin/bash
#sudo apt-get install wget git
#PA=`dpkg --print-architecture`
PA=linux64
wget https://github.com/tindy2013/subconverter/releases/latest/download/subconverter_${PA}.tar.gz
tar zxf subconverter_${PA}.tar.gz
cp ./mylist.ini ./subconverter/config/
sed -i "8curl=${URL}" ./subconverter/profiles/example_profile.ini
sed -i '9cconfig=config/mylist.ini' ./subconverter/profiles/example_profile.ini
./subconverter/subconverter -g
git clone https://gist.github.com/${GITHUB_ACTOR}/${REPOSITORY}.git
cat ./subconverter/output.yml > ./${REPOSITORY}/clash
cd ./${REPOSITORY}/
git config --global user.email ${EMAIL}
git config --global user.name ${NAME}
git commit -am 'update'
remote_repo="https://${GITHUB_ACTOR}:${TOKEN}@gist.github.com/${GITHUB_ACTOR}/${REPOSITORY}.git"
git push "${remote_repo}"
