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























