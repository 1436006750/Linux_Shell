## Bash Shell

#### Shell在Linux环境里的角色

##### 与登陆Shell相关的文件
    /etc/profile
        系统级的初始化文件，定义了一些环境变量，由登陆 Shell 调用执行
        
    /etc/bash.bashrc  或   /etc/bashrc
        其文件名根据不同版本的Linux发行版而异，每个交互式Shell的系统级的启动脚本，定义了一些函数和别名
        
    /etc/bash.logout
        系统级的登陆 Shell 清理脚本，当登陆Shell推出时执行，部分Linux发行版默认没有此文件
        
    $HOME/.bash_profile  $HOME/.bash_login   #HOME/.profile
        用户个人初始化脚本，由登陆Shell时调用执行，这三个脚本只会执行一个，按照此顺序执行，第一个存在的将被执行
        
    $HOME/.bashrc
        用户个人的每个交互式Shell的启动脚本
    
    $HOME/.bash_logout
        用户个人的登陆 Shell 清理脚本，当登陆Shell推出时执行
    
    $HOME/.inputrc
        用户个人的由readline使用的启动脚本，定义了处理某些情况下的键盘映射
    

#### Shell中的变量



#### Shell环境进阶


