## Shell 重定向
    定义：
        改变输入或输出的默认路径

### 1、 输入和输出
    Linux中一切皆文件， 所以硬件在Linux中也表示为文件
    
    文件描述符：
        0：
            标准输入, 键盘  -- 从文件(默认是键盘) 读取输入
        1：
            标准输出, 屏幕  -- 发生数据到文件(默认是屏幕)
        2：
            标准错误, 屏幕  -- 发生所有错误信息到一个文件(默认是文件)
        

##### 1、 标准输入

标准输入特点：

- 默认的输入方式，被所有命令使用 来读取输入
- 用数字 0 表示
- 被称为 stdin
- 默认标准输入设备是 键盘

    
    操作符 " < " 是输入重定向操作符
    语法：
        commands  < input_filename

##### 2、 标准输出

标准输出特点：

- 被命令用来写入或显示命令自身的输出
- 用数字 1 表示
- 被称为 stdout
- 默认标准输入设备是 屏幕


    操作符 " > " 是输出重定向操作符
    语法：
        commands > output_filename


##### 3、 标准错误

标准输出特点：

- 被命令用来写入或显示命令自身的输出
- 用数字 2 表示
- 被称为 stderr
- 默认标准输入设备是 屏幕


    操作符 " 2> " 是输出重定向操作符
    语法：
        commands 2> output_filename




























