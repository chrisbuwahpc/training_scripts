#!/bin/bash

for ((i=1; i<=$1; i++))
do
  echo "create keypair " uwahpc-t$i 
  
  openstack keypair create --private-key uwahpc-t$i.pem uwahpc-t$i
  
  echo "Finished keypairs "
  echo ""

  echo "create vm " uwahpc-train$i

  openstack server create --flavor n3.2c8r --image 67bab16e-453b-46a8-a262-c0796fa35d85 \
  --network dfb2cfd9-b746-410d-ab4b-f2e7d5bafacf \
  --security-group 0ca043f3-37cd-432b-baf8-24d05b48746d \
  --user-data r-studio.yaml --key-name uwahpc-t$i \
  --file /home/ubuntu/zerotoR.sh=zerotoR.sh --boot-from-volume 50 uwahpc_train$i

  echo ""
done
echo "Finished VM"

