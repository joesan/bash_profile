# ----------------------------------------------------------------------------
# SOFTWARE PATH & HOME LOCATIONS
# ----------------------------------------------------------------------------
export JAVA_HOME_11="/opt/softwares/java/usr/lib/jvm/jdk-11.0.10"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export MAVEN_HOME="/opt/softwares/apache-maven-3.6.3"
export SCALA_HOME_2_12="/opt/softwares/scala-2.12.2"
export SCALA_HOME_2_13="/opt/softwares/scala-2.13.3"
export SBT_HOME="/opt/softwares/sbt"
export RUSTUP_HOME="/opt/softwares/rustup"
export KUBECTL_HOME="/opt/softwares/kubectl"
export MINIKUBE_HOME="/opt/softwares/minikube"
export TERRAFORM_HOME="/opt/softwares/terraform"
export CATKIN_WS_HOME="~/Projects/Private/ros-projects/ros_ws"
export SPARK_HOME="/opt/softwares/spark"
export ZEPPELIN_HOME="opt/softwares/zeppelin-0.10.0-bin-all"
export PYENV_HOME="/opt/softwares/pyenv"

# ----------------------------------------------------------------------------
# SOURCE ADDITIONAL FILES
# ----------------------------------------------------------------------------
source /opt/softwares/.kubectl_aliases
source /opt/ros/neotic/setup.bash
# Dynamically source all setup.bash files from multiple catkin ros workspaces
while read -r f ; do source "$f" ;  done < <(find /home/$USER/Projects -wholename '*/devel/setup.bash')

export PATH="$JAVA_HOME/bin:$SPARK_HOME/bin:$SPARK_HOME/sbin:$SBT_HOME/bin:$SCALA_HOME_2_13/bin:$MAVEN_HOME/bin:$RUSTUP_HOME:$ROS_ROOT:$KUBECTL_HOME:$TERRAFORM_HOME:$MINIKUBE_HOME:$PATH:/usr/local/bin"

# pyenv virtual environmenmt
export PATH=$(pyenv root)/shims:$PATH
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# ----------------------------------------------------------------------------
# START / STOP COMMANDS
# ----------------------------------------------------------------------------
alias docker-start='sudo systemctl start docker'

# ----------------------------------------------------------------------------
# DOCKER & KUBERNETES ALIAS
# ----------------------------------------------------------------------------
alias dockerStopAll='docker stop $(docker ps -aq)'
alias dockerRemoveAll='docker rm $(docker ps -aq)'

# ----------------------------------------------------------------------------
# MICROK8S ALIAS
# ----------------------------------------------------------------------------
alias mks='microk8s'
alias mks.enable='microk8s.enable'
alias mks.kubectl='microk8s.kubectl'
alias mksproxy='microk8s kubectl proxy'

# ----------------------------------------------------------------------------
# PROJECT FOLDER ALIAS
# ----------------------------------------------------------------------------
alias rust-projects='cd /home/$USER/Projects/Private/rust-projects'
alias ml-projects='cd /home/$USER/Projects/Private/ml-projects'
alias go-projects='cd /home/$USER/Projects/Private/go-projects'
alias scala-projects='cd /home/$USER/Projects/Private/scala-projects'
alias infra-projects='cd /home/$USER/Projects/Private/infrastructure-projects'
alias ros-projects='cd /home/$USER/Projects/Private/ros-projects'
alias hardware-projects='cd /home/$USER/Projects/Private/hardware-projects'

# ----------------------------------------------------------------------------
# TERMINAL ALIAS
# ----------------------------------------------------------------------------
alias ssr='simplescreenrecorder'
alias cdd='cd; cls'
alias ls='lsd -al'
alias sls='sudo lsd -al'
alias .='cd /Users/$USER'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='lsd -Fll'
cd() { builtin cd "$@"; ls; }  # Always list directory contents upon 'cd'
alias cd..='cd ../'
alias .1='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias cls='clear'
alias path='echo -e ${PATH//:/\\n}'
alias cic='set completion-ignore-case On' # Make tab completion case insensitive
mkdircd() { mkdir -p "$1" && cd "$1"; } # Makes new directory and jumps inside
# Move the directory structure of a folder as it to the target location
move() {
  # create directories up to one level up
  mkdir -p "`dirname "$2"`"
  mv "$1" "$2"
}

# lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
# Git commit
commit(){
  git add --all . && git commit -m "'$1'" && git push origin master
}
# Git commit scala project with sbt header plugin
sbtcommit(){
  sbt chechHeader && commit
}

# Zeppelin Notebook Start & Stop
alias zstart='zeppelin-daemon.sh start'
alias zstop='zeppelin-daemon.sh stop'

# List all the services
alias services='service --status-all'
# -----------------------------------------------------------------------------
# ROS ALIAS
# -----------------------------------------------------------------------------
alias roscw='cd $CATKIN_WS_HOME'
alias roscs='cd $CATKIN_WS_HOME/src'
alias roscm='catkin_make'
alias rosversion='rosversion -d'

# -----------------------------------------------------------------------------
# NETWORKING ALIAS
# -----------------------------------------------------------------------------
alias hostname='hostname -I'                        # hostname:     Get the Hostname IPV4 & IPV6
alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias nmap='nmap -sP 192.168.0.1-254'
