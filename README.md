# Concourse Lite


How to make the worker disk store bigger (200 GB) on an AMI after it's been spun up:

```
sudo apt-get update && sudo apt-get install btrfs-tools -y
sudo /var/vcap/packages/baggageclaim/bin/fs_mounter --remove --disk-image=/var/vcap/data/baggageclaim/volumes.img --mount-path /var/vcap/data/baggageclaim/volumes
sudo /var/vcap/packages/baggageclaim/bin/fs_mounter --disk-image=/var/vcap/data/baggageclaim/volumes.img --mount-path=/var/vcap/data/baggageclaim/volumes --size-in-megabytes=200000
sudo mkdir /var/vcap/data/baggageclaim/volumes/{live,dead,init}
