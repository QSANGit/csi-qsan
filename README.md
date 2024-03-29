﻿# csi-qsan
A Container Storage Interface ([CSI](https://github.com/container-storage-interface/spec)) Driver for [Qsan](https://qsan.com) XEVO Storage.

## Features
- Support iSCSI and FC protocol on Qsan QSM storage
- Support MPIO for both iSCSI and FC
- Support dynamic volume provisioning
- Support online and offline volume expansion
- Support topology
- Kubernetes ver. 1.21 and later

## Deployment
### Install
Clone the git repository code
```
git clone https://gitlab.qsan.com/qsan/csi-qsan-release
```

Enter the deploy directory
```
cd csi-qsan/deploy
```

Modify qsan-auth.yaml secret file to specify Qsan storage address and login credentials.
It can support multiple Qsan storages.
```
storageArrays:
- server: 192.168.1.1
  port: 80
  https: false
  username: admin
  password: 1234
- server: 192.168.1.2
  username: admin
  password: 1234
```

Finally execute install.sh script to deploy
```
./install.sh
```

### Uninstall
```
cd csi-qsan/deploy
./uninstall.sh
```
