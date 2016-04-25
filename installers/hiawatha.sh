#!/usr/bin/env bash

print_stderr "Running installation for hiawatha."

readonly CURRENT_DIRECTORY=$(pwd)

apt-get -y install libc6-dev libssl-dev dpkg-dev debhelper fakeroot libxml2-dev libxslt1-dev
apt-get -y install cmake

#attempt to find the hiest version of hiawatha
readonly LATEST_HIAWATHA_SOURCE=$(curl https://www.hiawatha-webserver.org/files/ | grep -Ee ".*>(hiawatha[-0-9.]*\.tar\.gz)<.*" | sed -r "s/.*>(hiawatha[-0-9.]*\.tar\.gz)<.*/\1/")


readonly temp_directory=$(mktemp -d)
cd $temp_directory
wget http://www.hiawatha-webserver.org/files/${LATEST_HIAWATHA_SOURCE}
tar -xzvf ${LATEST_HIAWATHA_SOURCE}


cd ${LATEST_HIAWATHA_SOURCE%.*}/extra

./make_debian_package

cd ..
dpkg -i hiawatha_10.1_amd64.deb


cd ${CURRENT_DIRECTORY}

rm -rf cd $temp_directory

service hiawatha restart

# replace the default html file with content from this file
# https://raw.githubusercontent.com/h5bp/html5-boilerplate/master/src/404.html

readonly INSTALLATION_STATUS=$?

exit $INSTALLATION_STATUS