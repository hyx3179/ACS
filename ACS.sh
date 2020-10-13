#!/bin/bash
#sudo apt-get install wget git
#PA=`dpkg --print-architecture`
PA=linux64
wget https://github.com/tindy2013/subconverter/releases/latest/download/subconverter_${PA}.tar.gz
tar zxf subconverter_${PA}.tar.gz
./subconverter/subconverter -g
git clone https://gist.github.com/${GITHUB_ACTOR}/${INPUT_REPOSITORY}.git
cat ./subconverter/output.yml > ./${INPUT_REPOSITORY}/clash
cd ./${INPUT_REPOSITORY}/
git config --global user.email ${INPUT_EMAIL}
git config --global user.name ${INPUT_NAME}
git commit -am 'update'
remote_repo="https://${GITHUB_ACTOR}:${INPUT_GITHUB_TOKEN}@gist.github.com/${GITHUB_ACTOR}/${INPUT_REPOSITORY}.git"
git push "${remote_repo}"
