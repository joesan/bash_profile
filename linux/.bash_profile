# ----------------------------------------------------------------------------
# SOFTWARE PATH & HOME LOCATIONS
# ----------------------------------------------------------------------------
export MAVEN_HOME="/opt/softwares/apache-maven-3.6.3"
export SCALA_HOME="/opt/softwares/scala-2.13.3"
export SBT_HOME="/opt/softwares/sbt"
export RUSTUP_HOME="/opt/softwares/rustup"
export KUBECTL_HOME="/opt/softwares/kubectl"
export MINIKUBE_HOME="/opt/softwares/minikube"
export TERRAFORM_HOME="/opt/softwares/terraform"
export CATKIN_WS_HOME="~/Projects/Private/ros-projects/ros_ws"

# ----------------------------------------------------------------------------
# SOURCE ADDITIONAL FILES
# ----------------------------------------------------------------------------
source /opt/softwares/.kubectl_aliases
source /opt/ros/neotic/setup.bash
# Dynamically source all setup.bash files from multiple catkin ros workspaces
while read -r f ; do source "$f" ;  done < <(find /home/$USER/Projects -wholename '*/devel/setup.bash')

export PATH="$SBT_HOME/bin:$SCALA_HOME/bin:$MAVEN_HOME/bin:$KUBECTL_HOME:$TERRAFORM_HOME:$MINIKUBE_HOME:$PATH:/usr/local/bin"

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
# PROJECT FOLDER ALIAS
# ----------------------------------------------------------------------------
alias rust-projects='cd /home/$USER/Projects/Private/rust-projects'
alias ml-projects='cd /home/$USER/Projects/Private/ml-projects'
alias go-projects='cd /home/$USER/Projects/Private/go-projects'
alias scala-projects='cd /home/$USER/Projects/Private/scala-projects'
alias infra-projects='cd /home/$USER/Projects/Private/infrastructure-projects'
alias ros-projects='cd /home/$USER/Projects/Private/ros-projects'

# ----------------------------------------------------------------------------
# TERMINAL ALIAS
# ----------------------------------------------------------------------------
alias cdd='cd; cls'
alias ls='lsd -al'
alias sls='sudo lsd -al'
alias .='cd /Users/$USER'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='lsd -Fll'
alias eon-projects='cd /Users/$USER/Projects/Official/eon'
cd() { builtin cd "$@"; ls; }  # Always list directory contents upon 'cd'
alias cd..='cd ../'
alias .1='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias cls='clear'
alias path='echo -e ${PATH//:/\\n}'
alias cic='set completion-ignore-case On' # Make tab completion case insensitive
mkdircd() { mkdir -p "$1" && cd "$1"; } # Makes new directory and jumps inside
# lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# -----------------------------------------------------------------------------
# ROS ALIAS
# -----------------------------------------------------------------------------
alias cw='cd $CATKIN_WS_HOME'
alias cs='cd $CATKIN_WS_HOME/src'
alias cm='catkin_make'

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
