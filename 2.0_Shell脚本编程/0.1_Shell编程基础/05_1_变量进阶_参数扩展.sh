#!/bin/bash

echo "============================================================================================"
WORD=car

echo "$WORDs"
# 没有输出  $WORDs是未定义的， 对于不使用大括号的参数扩展, Bash会从字符 $开始, 到最后一个有效符结束

echo ${WORD}s
# 输出： cars


echo "============================================================================================"
# 间接参数扩展 ${!PARAMETER}   被引用的不是 PARAMETER 参数本身， 而是 PARAMETER 的值

PARAMENT=TEMP
TEMP="It's indirect"

echo ${!PARAMENT}   # It's indirect
echo $PARAMENT      # TEMP
echo "$TEMP"



echo "============================================================================================"
# 大小写修改：

test_ABC="ABCDEFG"

echo $test_ABC        # ABCDEFG
echo ${test_ABC^}     # ABCDEFG
echo ${test_ABC^^}    # ABCDEFG
echo ${test_ABC,}     # aBCDEFG
echo ${test_ABC,,}    # abcdefg
echo ${test_ABC~}     # aBCDEFG
echo ${test_ABC~~}    # abcdefg


echo "============================================================================================"
# 修改文件大小写

files="A.txt B.txt C.txt d.txt e.txt f.txt"
files2=""
for f in $files; do
    f=${f,,}
    files2=$files2$f
done

echo "$files"           # A.txt B.txt C.txt d.txt e.txt f.txt
echo "$files2"          # a.txtb.txtc.txtd.txte.txtf.txt


echo "============================================================================================"
# 列出所有 PARAM 开头的变量名

PARAM123123=1
PARAMcaffff=2

echo "${!PARAM*}"  # PARAM123123 PARAMENT PARAMcaffff
echo "${!PARAM@}"  # PARAM123123 PARAMENT PARAMcaffff



echo "============================================================================================"
# 删除字符
mystring="This is used for removing string"

# 从前往后删除, 删除最少/删除最多
echo "${mystring#* }"     # is used for removing string
echo "${mystring##* }"    # string

# 从后往前删除, 删除最少/删除最多
echo "${mystring% *}"     # This is used for removing
echo "${mystring%% *}"    # This


echo "============================================================================================"

unset mystring1     # 删除变量,为 NULL
echo "$mystring1"   # 打印空值
echo "${mystring1:-Hello World}"  # Hello World
mystring1=Hi
echo ${mystring1:-Hello World}    # Hi


unset mystring2     # 删除变量,为 NULL
echo "$mystring2"   # 打印空值
echo "${mystring2:=Hello World}"   # Hello World
echo "$mystring2"   # Hello World

mystring3=""
echo ${mystring3:+ NOTE: mystring3 seems to be set.}  # 输出： 空
mystring3="Hi"
echo ${mystring3:+ NOTE: mystring3 seems to be set.}  # 输出： NOTE: mystring3 seems to be set.













