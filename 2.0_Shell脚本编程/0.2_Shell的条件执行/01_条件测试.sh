#!/bin/bash 

a=2



if [ $a -eq 1 ];then
  echo 1
else
  echo 2
fi



echo '-------------------------------------'


case $a in
1)
  echo 1
  ;;
2)
  echo 2
  ;;
esac