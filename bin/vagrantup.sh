#!/bin/bash -xe

OS=$(uname)
vagrant_url_osx=$(curl https://www.vagrantup.com/downloads.html | grep -oE "http.*dmg")
vagrant_url_deb=$(curl https://www.vagrantup.com/downloads.html | grep -oE "http.*64.deb")
vagrant_version=$( echo $vagrant_url_osx | grep -oE "([0-9]*\.){2}[0-9]*")
#if [[ $OS == "Linux" ]]; then
#    # Virtualbox
#    sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian raring contrib" >> /etc/apt/sources.list'
#    wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
#    sudo apt-get update
#    sudo apt-get -y install git mercurial python-setuptools python-dev build-essential virtualbox-4.3
#    pushd /tmp
#    wget $vagrant_url_deb
#    sudo dpkg -i ${vagrant_url_deb##*/}
#
#elif [[ $OS == "Darwin" ]]; then
#
#    VIRTUALBOX_URL=$(curl https://www.virtualbox.org/wiki/Downloads | grep dmg | egrep -o 'http.*dmg')
#    VIRTUALBOX_VERSION=$(echo $VIRTUALBOX_URL | cut -f5 -d/)
#    VIRTUALBOX_FILE=$(echo $VIRTUALBOX_URL | cut -f6 -d/)
#
#    pushd ~/Downloads/
#
#    cat << EOF > vboxurl
#    $VIRTUALBOX_URL
#EOF
#
#    wget -i vboxurl -O "$VIRTUALBOX_FILE" 
#    hdiutil attach $VIRTUALBOX_FILE
#    sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target /
#    hdiutil detach /Volumes/VirtualBox
#fi

echo -e "$vagrant_url_osx\n$vagrant_version"
