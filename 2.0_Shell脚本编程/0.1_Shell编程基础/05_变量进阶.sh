#!/bin/bash 

WORD=car

echo $WORDs
# 没有输出  $WORDs是未定义的， 对于不使用大括号的参数扩展, Bash会从字符 $开始, 到最后一个有效符结束

echo ${WORD}s
# 输出： cars






