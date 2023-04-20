#!/usr/bin/env bash

get_install_dir() {
  install_path=$(find $HOME -name .bbpro_install_dir -print -quit 2>/dev/null)
  install_dir=$(dirname $install_path)
  echo $install_dir
}

echo -n "Finding bbpro directory..."

INSTALL_DIR=$(get_install_dir)

echo "Found bbpro at: $INSTALL_DIR"

echo "Ensuring fully installed..."

cd $INSTALL_DIR

npm i 
npm run parcel

if brew install gnu-getopt; then
 brew link --force gnu-getopt
fi

read -p "Continue?"

echo "Fully installed!"

echo -n "Copying bbpro application files to /usr/local/share/dosyago/ ..."
sudo mkdir -p /usr/local/share/dosyago

sudo cp -r $INSTALL_DIR /usr/local/share/dosyago
INSTALL_NAME=$(basename $INSTALL_DIR)
sudo rm -rf /usr/local/share/dosyago/$INSTALL_NAME/.git

echo "Copied!"

echo -n "Setting correct permissions for installation ... "

sudo chmod -R 755 /usr/local/share/dosyago/*

echo "Permissions set!"

echo -n "Copying bbpro command to /usr/local/bin/ ..."

sudo cp $INSTALL_DIR/deploy-scripts/_bbpro.sh /usr/local/bin/bbpro

echo "Copied!"

echo -n "Copying setup_bbpro command to /usr/local/bin/ ..."

sudo cp $INSTALL_DIR/deploy-scripts/_setup_bbpro.sh /usr/local/bin/setup_bbpro

echo "Copied!"

echo -n "Copying monitoring commands to /usr/local/bin/ ..."

sudo cp $INSTALL_DIR/monitor-scripts/* /usr/local/bin/

echo "Copied!"

echo -n "Copying sslcerts to /usr/local/share/dosyago/sslcerts ..."

sudo mkdir -p /usr/local/share/dosyago/sslcerts/
sudo rm -rf /usr/local/share/dosaygo/sslcerts/*
sudo cp $HOME/sslcerts/* /usr/local/share/dosyago/sslcerts/
sudo chmod -R 555 /usr/local/share/dosyago/sslcerts/*

echo "Copied!"

echo -n "Setting up deploy system ..."

cd $INSTALL_DIR/deploy/
./scripts/setup.sh

echo "Install complete!"


