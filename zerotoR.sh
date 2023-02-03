#/bin/bash

module load maali

maali -t system-gcc -v 9.4.0 -c $1 

maali -t R -v 3.6.3 -c $1 
maali -t R -v 4.0.5 -c $1 
echo "#"
echo "# you should be able to run rstudio"
#echo "# this is done using the following command"
#echo "# "
#echo "# echo "rsession-which-r=/nimbus/ubuntu20.04/apps/r/4.0.5/bin/R" | sudo tee -a /etc/rstudio/rserver.conf"
#echo " "
#echo "# check that rstudio is running!"
#echo "sudo rstudio-server status "
echo " "
wget https://swcarpentry.github.io/shell-novice/data/shell-lesson-data.zip
unzip shell-lesson-data.zip 
rm shell-lesson-data.zip

