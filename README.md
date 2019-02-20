# vim写c语言的一个环境


### 安装方法

```bash
yum install -y passwd openssl openssh-server
type git &> /dev/null

if [ $?  -eq 1 ] ; then
    yum install -y git
fi

cd ~
git clone https://github.com/vimtoo-com/vim-for-c-conf.git
cd vim-for-c-conf
git submodule update --init --recursive
. ./install.sh
```

### 联网问题可以使用


```bash

type git &> /dev/null

if [ $?  -eq 1 ] ; then
    yum install -y git
fi

cd ~
git clone https://gitee.com/vimtoo/vim-for-c-conf-static.git

cd vim-for-c-conf-static
time . ./install.sh
```

### 参考

<https://gitee.com/vimtoo/vim-for-c-conf-static/>
