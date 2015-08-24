mount
#umount /var/vcap/data/garden/btrfs_graph/btrfs
umount /var/vcap/data/garden/btrfs_graph
losetup -d $(losetup -j /var/vcap/data/garden/garden_graph_backing_store | cut -d: -f1)
rm -rf /var/vcap/data/garden
