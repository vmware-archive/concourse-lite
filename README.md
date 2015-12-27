# Concourse Lite


How to make the worker disk store bigger (200 GB) on an AMI after it's been spun up:

```
sudo apt-get update && sudo apt-get install btrfs-tools -y
sudo /var/vcap/packages/baggageclaim/bin/fs_mounter -remove -diskImage /var/vcap/data/baggageclaim/volumes.img -mountPath /var/vcap/data/baggageclaim/volumes
sudo /var/vcap/packages/baggageclaim/bin/fs_mounter -diskImage /var/vcap/data/baggageclaim/volumes.img -mountPath /var/vcap/data/baggageclaim/volumes -sizeInMegabytes 200000
sudo mkdir /var/vcap/data/baggageclaim/volumes/{live,dead,init}
