# Using Packer to create RockyLinux8 Golden Image as per CIS Level1 Benchmark 

## Install packer

```cmd
wget https://releases.hashicorp.com/packer/1.8.7/packer_1.8.7_linux_amd64.zip
unzip packer_1.8.7_linux_amd64.zip
mv packer /usr/bin/
which packer
packer version
```

## Create Image

Commands to create an automated VM image:

To create a Rocky Linux 8 VM image using VMware Workstation use the following commands:

```cmd
packer build -only=vmware-iso rocky8.json
packer build -only=vmware-iso rocky8_uefi.json
```

To create a Rocky Linux 8 VM image using Oracle VM VirtualBox use the following commands:

```cmd
packer build -only=virtualbox-iso rocky8.json
packer build -only=virtualbox-iso rocky8_uefi.json
```

*If you omit the keyword "-only=" both the Workstation and Virtualbox VMs will be created.*

By default the .iso of Rocky Linux 8 is pulled from <https://download.rockylinux.org/pub/rocky/8.3/isos/x86_64/Rocky-8.3-x86_64-boot.iso>

You can change the URL to one closer to your build server. To do so change the **"iso_url"** parameter in the **"variables"** section of the rocky8.json file.

```json
{
  "variables": {
      "iso_url": "https://download.rockylinux.org/pub/rocky/8.3/isos/x86_64/Rocky-8.3-x86_64-boot.iso"
}
```

## Keyboard configuration

By default the keyboard is set to be US qwerty.
To switch it to something else edit the following file:

- ./http/ks.cfg

Set the `keyboard` parameter as desired, for example: `keyboard --vckeymap=fr --xlayouts='fr'`

## Default credentials

The default credentials for this VM image are:

|Username|Password|
|--------|--------|
|packer|packer|
|root|packer|
