# Setup for Ubuntu 20.04

## Pre-Requisites
1. Make sure to have lsd installed (https://github.com/Peltoche/lsd)

## Additional Softwares Installed
I have installed few additional softwares on my Linux machine and I have used an alais to launch them. Here is a list of Software that I have installed:

1. SimpleScreenRecorder - https://www.maartenbaert.be/simplescreenrecorder/

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

3. Install Ammonite Scala REPL

```
sudo sh -c '(echo "#!/usr/bin/env sh" && curl -L https://github.com/lihaoyi/Ammonite/releases/download/2.2.0/2.13-2.2.0) > /usr/local/bin/amm && chmod +x /usr/local/bin/amm' && amm
```
After installing Ammonite REPL, you should have the .ammonite folder in your home directory. Copy the predef.sc file from [here](https://github.com/joesan/bash_profile/blob/master/linux/predef.sc) into that directory. This enables certain default libraries to be loaded before hand into your REPL.

## Additional Steps - Install Rust
Perform this to install Rust on a specific folder of your choice (in my case on Ubuntu, it is the /opt/softwares folder)

1. curl https://sh.rustup.rs -sSf | sudo RUSTUP_HOME=/opt/softwares/rustup sh -s -- -y

## Additional Steps - Install ROS
Add the following line to source the bash setup file (.bash_profile) for running ROS

```
source /opt/ros/noetic/setup.bash
```

Make sure to adapt the ROS distribution accordingly. Here in this case it is the noetic for me on my Ubuntu 20.04
