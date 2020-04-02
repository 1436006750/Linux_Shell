## Shell 函数
    定义：
        Shell 函数是 Shell脚本中由命令集和语句组成的代码块，这个代码块可以被其它脚本或脚本中其它部分所调用。
        
    任务：
        1、 定义一个函数
        2、 函数传参、处理参数
        3、 函数中的变量(范围、作用域)
        4、 函数的返回
        5、 函数的调用
        6、 后台运行函数或其它应用


#### 1、 函数的定义
    方法a：
        # 函数名
        function_name()
        {
            # 函数体
            commands.....
        
            # 参数返回  
            [return n]
            return语句是可选的。
            1、 没有return ： 返回函数最后一条命令的结果
            2、 有return   : 返回 n (0~255)      
        }
    
    方法b:
        加上 function 关键字：
        function function_name()
        {
            commands.....
        }
    
    方法c:
        在一行内定义
        function function_name() { command1; command2; ... }
        
    
可以使用 unset 的 -f命令来取消函数的定义


#### 2、 函数变量、参数、返回值

###### 1、 像函数传递参数
    Shell函数有自己的命令行参数。
    函数使用特殊变量 $1 $2 $3 .... $n 来访问传递给它的参数
        $0 : 代指脚本的名字
        $* 或 $@ : 保存传递给函数的所有参数
        $# : 保存传递给函数的位置参数个数

```shell script
name(){
arg1=$1
arg2=$2
command on $arg1
}

name foo bar
```
    
###### 2、 本地变量
    默认情况下，脚本中所有的变量都是全局的。
    
    local 命令：
        只能在函数内部使用
        讲变量名的可见范围限制在函数内部


###### 3、 return
    特殊参数：$?
        可以得到最近一次执行命令的退出状态
```shell script
# 调用函数 checkpid
checkpid $pid1 $pid2 $pid3

# 如果上述命令执行成功， 则 $? = 0
if [ $? = 0 ]; then
  echo "OK"
else 
  echo "Error"
fi
```




#### 3、 函数的调用
    1、 Shell命令调用函数
    2、 脚本中调用函数
    3、 从函数文件中调用函数
    4、 递归调用函数
    


### 4、 讲函数放在后台运行
    $ 操作符:
        可以将命令放在后台运行并释放你的终端

```shell script
# 定义函数 name
name()
{
  echo "Do something"
  sleep 1
}

# 将函数放在后台运行
name $

# 继续执行其它命令
# .........
```










