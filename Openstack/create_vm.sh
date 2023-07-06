#!/bin/bash

for ((i=1; i<=$1; i++))
do
  echo "create keypair " uwahpc-t$i 
  
  openstack keypair create --private-key uwahpc-t$i.pem uwahpc-t$i
  
  echo "Finished keypairs "
  echo ""

  echo "create vm " uwahpc-train$i
# --image 67bab16e-453b-46a8-a262-c0796fa35d85 = Pawsey - Ubuntu 20.04 - 2022-05
# --image  9c37814e-1e77-4b47-a14e-4368420408de = Pawsey - Ubuntu 22.04 - 2022-05    
# --image  a6dede08-16b8-4c47-b348-2d0cfaa9a09a  = Pawsey - Ubuntu 22.04 - 2023-06
# --network dfb2cfd9-b746-410d-ab4b-f2e7d5bafacf = Public external
# --security-group 0ca043f3-37cd-432b-baf8-24d05b48746d = research-training-SSH-ICMP
# --boot-from-volume 50 
  openstack server create --flavor n3.2c8r --image a6dede08-16b8-4c47-b348-2d0cfaa9a09a \
  --network dfb2cfd9-b746-410d-ab4b-f2e7d5bafacf  \
  --security-group  0ca043f3-37cd-432b-baf8-24d05b48746d \
  --user-data r-studio.yaml --key-name uwahpc-t$i \
  --file /home/ubuntu/zerotoR.sh=zerotoR.sh uwahpc_train$i 


  echo ""
done
echo "Finished VM"

