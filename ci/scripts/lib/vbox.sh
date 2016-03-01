# wire up VirtualBox devices
# make sure these device numbers match the host!
mknod -m 0600 /dev/vboxdrv c 10 58
mknod -m 0666 /dev/vboxdrvu c 10 57
mknod -m 0600 /dev/vboxnetctl c 10 56

# clear out existing hostonlyifs (possibly from previous runs)
for name in $(VBoxManage list hostonlyifs | grep '^Name:' | awk '{print $NF}'); do
  VBoxManage hostonlyif remove $name
done
