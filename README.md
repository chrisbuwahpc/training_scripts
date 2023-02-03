
#How to set up a setup a vm using openstack for Rstudio

```
openstack keypair create --private-key human.pem human 
```
human.pem file is on local machine 
human file is added to the openstack project keypairs

# to check the available keypairs 
```
openstack keypair list
```

 # list of openstack flavors and ids
```
openstack flavor list

+--------------------------------------+-----------+-------+------+-----------+-------+-----------+
| ID                                   | Name      |   RAM | Disk | Ephemeral | VCPUs | Is Public |
+--------------------------------------+-----------+-------+------+-----------+-------+-----------+
| 506876b7-b8a3-42af-9636-e7b797b51214 | n3.2c8r   |  8192 |   40 |         0 |     2 | True      |
| 5b51ce63-2f79-4def-af47-243a829ef9f5 | n3.4c16r  | 16384 |   40 |         0 |     4 | True      |
| 649d7ca6-16be-4821-981f-c4f73eba1bff | n3.1c4r   |  4096 |   40 |         0 |     1 | True      |
| c291f88d-6987-424b-bd6b-2b9128595c74 | n3.8c32r  | 32768 |   40 |         0 |     8 | True      |
| fe996a66-ecbe-4e14-9ec0-af177937acf3 | n3.16c64r | 65536 |   40 |         0 |    16 | True      |
+--------------------------------------+-----------+-------+------+-----------+-------+-----------+
```

Example command for creating a new vm with user-data and passing a file to the image
```
openstack server create --flavor n3.2c8r --image 578525b1-f1e3-495d-b673-3a3b9cd32b23 \\
--network dfb2cfd9-b746-410d-ab4b-f2e7d5bafacf \\
--security-group 0ca043f3-37cd-432b-baf8-24d05b48746d \\
--user-data r-studio.yaml --key-name human \\
--file /home/ubuntu/zerotoR.sh=zerotoR.sh --boot-from-volume 135 anatomy
```



