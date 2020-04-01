## Bash 循环

### for 循环
    for 循环语法：
        in : 后面可以是  字符串、数字、命令行参数、文件名、Linux命令的输出 
        
        1、 基本语法
            for var in itme1 itme2 ... itmeN; do
                command1
                .....
            done
        
        2、 循环变量
            for var in $file_names; do
                command1
                .....
            done
        
        3、 循环命令替换
            for var in $(Linux-commands-name); do
            或：
            for var in "Linux-commands-name"; do
            
            done
        
        4、 三项表达式
            for var in ((exp1; exp2; exp3;)); do
                commands
            done
            注释：
                exp1：初始化式
                exp2：循环条件
                exp3: 计算表达式

    嵌套for循环：
        
        
### while 循环
    重复的执行一个命令列表   条件为真，继续循环
    
    while 语法：
        while [condition]; do
            commands
        done
        
    无限循环：
        1、
            while : do       
        
        2、
            while true; do
            
    while + read : 读取文件
    
       
### until 循环
    条件为假时， 继续循环
    
    until 语法：
        until [condition]
            commands
        done


### select 循环
    select 语法：
        select var in List; do
            commands
        done
    
    select 特点：
        

### 循环控制
    1、 break语句
        break 语法：
            break [n]
            n 代表嵌套循环层数，如果指定了 n, break讲退出 n 级嵌套循环
                             如果没有指定n, 或者 n <=1, 则退出状态码为 0, 否则为 n
        
    2、continue语句
        跳过循环体中剩余的命令, 直接跳转到循环体的 顶部.
        
        continue 可用于 for、while、until循环
        
        continue语法：
            continue [n]    
            










