pattern: 模式
parameter: 参数

### Shell 脚本第一行 #!
    脚本中的 #！ 行(第一行) 用于指示一个解释文件


### Shell 中的注释
    # 是注释标识符
        除了 $#
    
    还可以利用 Bash 的HERE DOCUMENT特性添加多行注释


### 设置脚本权限和执行脚本
    添加权限：
        chmod u+x ./test.sh
        chmod +x ./test.sh     给所有用户权限 
    
    运行脚本：
        绝对路径：
        相对路径：


### Shell变量进阶

#### Bash 中的参数扩展
    1、基本的参数扩展：
        $parameter
        ${parameter}
    
    2、间接参数扩展：
        ${!parameter}
            被引用的不是 pattern 参数本身， 而是 pattern 的值
    
    3、变量名扩展：
        列出所有 PARAM 开头的变量名， 默认用空格分割
        ${!PARAM*}
        ${!PARAM@}
    
    4、字符串移除：
        用指定的模式描述 从 参数值字符串中 移除
            #：从开头匹配指定的模式
            %：从结尾匹配指定的模式     
        ${parameter#pattern}
        ${parameter##pattern}
        ${parameter%pattern}
        ${parameter%%pattern}
        
        常用：
            1、移除文件名，保留后缀
            2、移除后缀，保留文件名
            3、移除文件名，保留目录
            4、移除目录，保留文件名
    
    5、字符串搜索与替换：
        ${parameter/pattern/string}    # 匹配替换一次
        ${parameter//pattern/string}   # 匹配替换全部
        ${parameter/pattern}           # 替换为空字符(即删除)
        ${parameter//pattern}
    
    6、求字符串长度：
        ${#parameter}
    
    7、子字符串扩展：
        扩展参数值的一部分。 从指定位置开始截取到 参数尾部/指定长度字符(截取某个长度字符串) 
        ${parameter:offset}
        ${parameter:offset:length}
        
        使用默认值：
            ${parameter:-WORD}  # a、parameter未定义或者为NULL时，这种模式会扩展WORD，否则扩展参数parameter
            ${parameter-WORD}   # b、parameter 未定义时才会使用WORD
        指定默认值：
            与使用默认值类似,区别在于 这种模式不仅扩展 WORD，还会将WORD 赋值给参数
            ${parameter:=WORD}  #
            ${parameter=WORD}   # 
        使用替代值：
            # parameter未定义或者为NULL时，这种模式不会扩展任何内容，  若参数parameter已定义且不为空，只扩展WORD
            ${parameter:+WORD}  #
            ${parameter+WORD}   # 
            
    8、参数扩展：



|大小写修改：    |  结果           |
|--------------|-----------------|
|$test_ABC     | 原字母
|${test_ABC^}  | 第一个字符改为大写
|${test_ABC^^} |    所有为大写
|${test_ABC,}  | 第一个字符改为小写
|${test_ABC,,} |    所有为小写
|${test_ABC~}  | 第一个字符改为相反
|${test_ABC~~} |    所有为相反

已定义的变量，可以被重新定义，如：
复制代码 代码如下:

your_name="tom"
echo $your_name

your_name="alibaba"
echo $your_name

#### Bash的内部变量
    Bash 的内部变量会影响 Bash 脚本的行为。
    
    1、 $BASH : 用于引用Bash实例的全路经名
    2、 $HOME : 当前用户的 home 目录， 通常是 /home/zx
    3、 $IFS  : ISF是内部分隔符的缩写。 此变量决定当 Bash 解析字符串时将怎么识别字段，或单词分界线
                变量 $ISF 的默认值是空格(空格、制表符、换行)，但可以被修改
    4、 $OSTYPE : 擦作系统类型
    5、 $SECONDS : 脚本以运行的秒数 
                 
    6、 $TMOUT : 如果非0，则为超时的秒数
                设置命令等待时间长度
    7、 $UID : 当前用户的账号表示码， 与 /etc/passwd记录相同
                判断当前账号是否为 root


#### Bash 中的位置参数和特殊参数
    位置参数： Bash 中的位置参数是由 除0 以外的一个或多个数字表示的参数。
        位置参数是当Shell或Shell的函数 被引用时 由 Shell或Shell函数的参数赋值，并且可以使用Bash的内部命令set来重新赋值。
        注意： 多余一个数字的位置参数必须放在大括号中
        位置参数不能通过赋值语句来赋值，只能通过 Bash 内部命令 set 和 shift 来设置和取消它们
    
    特殊参数： Bash对一些参数的处理比较特殊。 这些参数只能被引用，但不能修改它们的值

|特殊参数 |作用|举例|
|----|----|----|
| *  | 将扩展为从1开始的所有位置参数  |  |
| @  | 将扩展为从1开始的所有位置参数  |  |
| ?  | 将扩展为最近一个在前台执行的命令的退出状态| 检查Shell脚本是否成功执行，成功返回0 |
| -  | 将扩展为当前的选项标志|  |
| $  | 将扩展为当前Shell的进程号|  |
| !  | 将扩展为最近一次执行的后台命令的进程号|  |
| 0  | 将扩展为Shell或Shell脚本的名字|  |
| _  | 在Shell启动时，它被设置为开始运行的Shell或Shell脚本的路径|  |



#### 使用 declare 指定变量的类型
    declare 是Bash 的内部命令，用于声明变量和修改变量的属性。
    declare 与 另一Bash内部变量 typeset 的用法完全一样
    
    1、declare :
        直接使用declare命令 (没有指定变量),显示所有变量的值
    2、declare -r :
        把指定的变量指定为只读变量， 这些变量将不能再被赋予新值或被清除
    3、declare -i :
        把指定的变量定义为整数型变量，赋予整数型变量的任何值都会被转换为整数
    4、declare -x :
        把指定的变量通过环境输出到后续命令
    5、declare -p :
        显示指定变量的属性和值        


nohup COMMAND [ARG] ... $
    让运行的命令或脚本在退出系统后继续在后台运行
    
    COMMAND : Shell脚本或者命令的名称
    [ARG] : 脚本或命令的参数
    $ : nohup 命令不能自动的将人物放在后台运行， 必须明确的在 nohup 命令的末尾添加操作控制符 $



#### Bash 中的数组变量
    一个数组是包含多个值的变量。
    任何变量也可以作为一个数组使用。
    数组的大小没有限制，也不需要成员变量是连续分配的  数组下标从0 开始
    
    声明一个数组变量的语法：
        间接声明：
            array_name[index]=value
                index：是一个正数， 或值为正数的算术表达式
        显示声明：
            数组的属性可以使用 Bash 的内部命令 declare 和 readonly 指定，这些属性被应用到所有的数组变量中
            declare -a array_name
                例如： declare -a linux=('Debian' 'Redhat' 'Suse' ...)
        复合赋值：
            array_name=(value1 value2 value3 .....)        
    
    使用数组变量：
        必须使用花括号 {}
        如果 索引是 {@} 或 {*} , 则表示数组的所有成员将被引用
        
        如果不加索引，默认为使用数组的第一个元素
        
        可以使用 unset 清除一个 数组 或 数组成员变量
            array_name{3}  # 删除索引为3的变量
            array_name{@}  # 删除数组


#### Shell 算术运算符
    Shell可以对算术表达式求值
        1、 Shell 算术扩展
        2、 内部命令 let 

##### Bash 的算术运算符
    操作符优先级分组：
|操作符   |  用途     |
|-----------------|-------|
| id++  id--      | 变量 后递增/递减      |
| ++id  --id      | 变量 前递增/递减         |
| -+             |  单目 正号/负号        |
| !~             |  逻辑取反 按位取反        |
| **           | 求幂         |
| */%          | 乘 除 求余         |
| +-           | 双目 加/减         |
| << >>        | 按位左移/按位右移         |
| <= >= < >     | 比较        |
| == !=         | 相等/不相等       |
| $             | 按位与      |
| ^             | 按位异或       |
|           |          |
| &&             |          |
|              |          |
| expr? expr: expr  | 条件运算符          |
|              | 赋值         |
| expr1,expr2  | 逗号运算          |

##### 数字常量
    默认情况下，Shell算术表达式用的都是十进制数，除非数字有特殊开头
        0x/0X : 十六进制
        0 ： 八进制


​        
#####　使用算数扩展和　let 进行算数运算
    1、 算数扩展--- 只能是整数
        $(算数表达式)
        
    2、 let运算符
        let命令按照从左到右顺序讲提供给它的每一个参数进行算术表达式的求值。(分开了要加双引号)
        let i=i+5
        let "i = i + 5"


##### 使用expr命令
    用于对表达式进行求值并输出相应结果的命令行工具 (同时，只支持整数运算)  (表达式两边必须分开)
    expr 6 + 8


​    
​    
​    


#### 退出脚本
    exit N ： 命令语句 用于从Shell脚本中退出并返回指定的退出状态码N，来表示 Shell脚本是否成功结束 (0:表示成功)
              如果省略 N， 则返回最后一条语句的退出状态

#### 调试脚本
    1、 运行命令时 加参数 -x
        bash -x test.sh
    
    2、 Shell脚本里     调试一段代码或全部代码
        set -x
        .....
        .....
        (set +x)


    3、 运行时参数 -v 或者 -vx
        bash -vx test.sh


​    








