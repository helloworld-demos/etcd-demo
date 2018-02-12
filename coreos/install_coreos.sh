#!/bin/sh
set -euxo pipefail

COREOS_VAGRANT_PATH="coreos-vagrant"
DISCOVERY_URL=$(curl -s https://discovery.etcd.io/new\?size\=3)

# pull vagrantfile
rm -rf coreos-vagrant || true
git clone git@github.com:coreos/coreos-vagrant.git
(cd $COREOS_VAGRANT_PATH && git checkout 9f8556d0e686211e29d763eeda9787029a50d07b)

# configure https://github.com/coreos/coreos-vagrant#provisioning-with-ignition-virtualbox-provider-default
mv $COREOS_VAGRANT_PATH/cl.conf $COREOS_VAGRANT_PATH/cl.conf.sample
awk '{sub(/https:\/\/discovery.etcd.io\/<token>/,"'${DISCOVERY_URL}'")}1' $COREOS_VAGRANT_PATH/cl.conf.sample > $COREOS_VAGRANT_PATH/cl.conf 
## https://github.com/coreos/container-linux-config-transpiler/releases
./ct-v0.6.0-x86_64-apple-darwin --platform=vagrant-virtualbox < $COREOS_VAGRANT_PATH/cl.conf > coreos-vagrant/config.ign
cp config.rb coreos-vagrant/

# list diff
echo $(diff $COREOS_VAGRANT_PATH/cl.conf $COREOS_VAGRANT_PATH/cl.conf.sample)
echo $(diff config.rb $COREOS_VAGRANT_PATH/config.rb.sample)