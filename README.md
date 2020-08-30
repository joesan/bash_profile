# bash_profile
A collection of bash profiles that I use for my Mac and Linux

## Pre-Requisites
1. Make sure to have lsd installed (https://github.com/Peltoche/lsd)

## For Linux
1. Make sure to source the .bash_profile in the .bashrc as below (Add the contents below to .bashrc)

```
# source the bash_profile that contains all the aliases, softwares
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi
```

2. I'm assuming that most the additional software packages that I use for software development will be installed in the /opt/softwares directory and this directory called softwares is owned by my user and belongs to my user group as can be seen below:

```
drwxr-xr-x  2 root   root       4096 Jul 17 17:35 skypeforlinux
drwxr-xr-x 11 joesan joesan     4096 Jul 18 19:49 softwares
drwxrwxr-x  5 root   root       4096 Jul 15 09:23 tuxedo-control-center
joesan@joesan-:/opt$ 
```

## Additional Steps - Install Rust
Perform this to install Rust on a specific folder of your choice (in my case on Ubuntu, it is the /opt/softwares folder)

1. curl https://sh.rustup.rs -sSf | sudo RUSTUP_HOME=/opt/softwares/rustup sh -s -- -y

## Additional Steps - Install ROS
Add the following line to source the bash setup file (.bash_profile) for running ROS

```
source /opt/ros/noetic/setup.bash
```


