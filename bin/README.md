## How to build a fresh box file

### Virtualbox

The Concourse team provides a prebuilt Virtualbox based box already - just use that.

### VMware

1. Be sure you have a copy of [Packer](https://www.packer.io) locally installed. Generally, for a Mac user, this is as simple as `brew install packer`.

2. Get a copy of the concourse executable from the [concourse.ci website](https://concourse.ci/downloads.html) specific to your target environment, typically Linux. Download and drop it in the root folder. This will get copied directly into the new .box file.

3.  Build the .box file for VMware Fusion/Desktop by passing it the version# like so:
```
./bin/build-vmware "1.3.0"
```
When this is done, you'll see a new output folder for the vmware based box, and a shiny new .box file in the root folder.

Note: After doing a `vagrant box add` and then trying to `vagrant up` my box, I had an issue with the HGFS stuff coming up. I ended up following [a KB article on the VMware website](https://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=1022525) to reinstall the Tools, and that fixed things up.

We prob need to fix the VMware Tools install script.
