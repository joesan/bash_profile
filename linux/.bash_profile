# ----------------------------------------------------------------------------
# SOFTWARE PATH & HOME LOCATIONS
# ----------------------------------------------------------------------------
export JAVA_HOME="/opt/softwares/java/usr/lib/jvm/jdk-11.0.10"
export JAVA_HOME_8="/usr/lib/jvm/java-8-openjdk-amd64"
export MAVEN_HOME="/opt/softwares/apache-maven-3.6.3"
export SCALA_HOME_2_12="/opt/softwares/scala-2.12.2"
export SCALA_HOME_2_13="/opt/softwares/scala-2.13.8"
export SCALA_HOME_3_2="/opt/softwares/scala-3.2.1"
export SBT_HOME="/opt/softwares/sbt"
export RUSTUP_HOME="/opt/softwares/rustup"
export KUBECTL_HOME="/opt/softwares/kubectl"
export MINIKUBE_HOME="/opt/softwares/minikube"
export TERRAFORM_HOME="/opt/softwares/terraform"
export CATKIN_WS_HOME="/home/$USER/Projects/Private/ros-projects/ros_ws"
export SPARK_HOME="/opt/softwares/spark"
export ZEPPELIN_HOME="/opt/softwares/zeppelin-0.10.0-bin-all"
export PYENV_HOME="/opt/softwares/pyenv"
export GO_PATH="/usr/local/go"
export COURSIER_HOME="/home/joesan/.local/share/coursier"
export H2_HOME="/opt/softwares/h2"

# ----------------------------------------------------------------------------
# PYTHON VIRTUAL ENVIRONMENT
# ----------------------------------------------------------------------------
export WORKON_HOME=$HOME/.local/bin/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/virtualenv
source $HOME/.local/bin/virtualenvwrapper.sh

# Source additional files
source /opt/softwares/.kubectl_aliases
source /opt/ros/noetic/setup.bash
# Dynamically source all setup.bash files from multiple catkin ros workspaces
#find /home/joesan/Projects/Private/ros-projects -wholename '*/devel/setup.bash' | xargs source
while read -r f ; do source "$f" ;  done < <(find /home/$USER/Projects -wholename '*/devel/setup.bash')

export PATH="$GO_PATH/bin:$PYENV_HOME/bin:$JAVA_HOME/bin:$SPARK_HOME/bin:$H2_HOME/bin:$ZEPPELIN_HOME/bin:$SPARK_HOME/sbin:$SBT_HOME/bin:$SCALA_HOME_2_13/bin:$COURSIER_HOME/bin:$MAVEN_HOME/bin:$RUSTUP_HOME:$ROS_ROOT:$KUBECTL_HOME:$TERRAFORM_HOME:$MINIKUBE_HOME:$PATH:/usr/local/bin"

# pyenv virtual environmenmt
export PATH=$(pyenv root)/shims:$PATH
eval "$(pyenv init -)"  
eval "$(pyenv virtualenv-init -)"

# export path for Kubernetes krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# export path for kubernetes kustomize plugins
export KUSTOMIZE_ENABLE_PLUGINS=true
export KUSTOMIZE_PLUGIN_HOME=$HOME/.config/kustomize/plugin/kustomize.config.k8s.io/v1/chartinflator/

# Settings for GO Programming Language
export GO111MODULE=auto

# ----------------------------------------------------------------------------
# DOCKER START / STOP COMMANDS 
# ----------------------------------------------------------------------------
alias dstart='sudo systemctl start docker'
alias dstop='sudo systemctl stop docker.socket'
alias dstatus='systemctl status docker'

# ----------------------------------------------------------------------------
# MOSQUITTO START / STOP COMMANDS
# ----------------------------------------------------------------------------
alias mstart='sudo systemctl start mosquitto'
alias mstop='sudo systemctl stop mosquitto'
alias mstatus='sudo systemctl status mosquitto'

# ----------------------------------------------------------------------------
# PORTAINER UI START / STOP COMMANDS
# https://www.howtogeek.com/devops/how-to-get-started-with-portainer-a-web-ui-for-docker/
# ----------------------------------------------------------------------------
alias pstart='docker run -d -p 9000:9000 --name=portainer --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce'
alias pstop='docker stop portainer'

# ----------------------------------------------------------------------------
# DOCKER & KUBERNETES ALIAS
# ----------------------------------------------------------------------------
alias dockerStopAll='docker stop $(docker ps -aq)'
alias dockerRemoveAll='docker rm $(docker ps -aq)'

# kubectl aliases [see https://github.com/ahmetb/kubectl-aliases]
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

# ----------------------------------------------------------------------------
# OPEN-ELECTRONS ALIAS
# ----------------------------------------------------------------------------
# ssh alias for the k3s raspi master nodes
alias m1='ssh joesan@m1.open-electrons.com'
#alias m2='ssh joesan@m2.open-electrons.com'
#alias m3='ssh joesan@m3.open-electrons.com'

# ssh alias for the k3s raspi worker nodes
alias n1='ssh joesan@n1.open-electrons.com'
alias n2='ssh joesan@n2.open-electrons.com'
alias n3='ssh joesan@n3.open-electrons.com'

# ansibe alias for managing playbooks
alias ansible-up-test='ansible-playbook -i inventory/test/hosts site.yml --ask-become-pass'
alias ansible-down-test='ansible-playbook -i inventory/test/hosts shutdown.yml'
alias ansible-up-prod='ansible-playbook -i inventory/prod/hosts site.yml'
alias ansible-down-prod='ansible-playbook -i inventory/prod/hosts shutdown.yml'
alias ansible-check='ansible-playbook site.yml --syntax-check'

# ----------------------------------------------------------------------------
# POSTGRES ALIAS
# ----------------------------------------------------------------------------
alias pstart='sudo systemctl start postgresql'
alias pstop='sudo systemctl stop postgresql'
alias pstatus='sudo systemctl status postgresql'

# ----------------------------------------------------------------------------
# K3S ALIAS
# ----------------------------------------------------------------------------
alias k3s-proxy-start='kubectl proxy &'
alias k3s-proxy-stop='fg'
alias k3s-start='sudo systemctl start k3s'
alias k3s-stop='sudo systemctl stop k3s'
alias k3s-status='sudo systemctl status k3s'
alias k3s-version='kubectl version --short'
alias k3s-token='kubectl -n kubernetes-dashboard create token admin-user'

# ----------------------------------------------------------------------------
# K9S ALIAS
# ----------------------------------------------------------------------------
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# ----------------------------------------------------------------------------
# MICROK8S ALIAS
# ----------------------------------------------------------------------------
alias mks='microk8s'
alias mks.enable='microk8s.enable'
alias mks.kubectl='microk8s.kubectl'
alias mksproxy='microk8s kubectl proxy'

# ----------------------------------------------------------------------------
# NORDVPN ALIAS
# ----------------------------------------------------------------------------
alias nvpn='nordvpn'

# ----------------------------------------------------------------------------
# MISCALLANEOUS ALIAS
# ----------------------------------------------------------------------------
alias h2='h2.sh'

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
alias github-docs='cd /home/$USER/Projects/Private/github-docs'
alias joesan='cd /home/$USER/Projects/Private/github-docs/joesan-me'
alias wayang='cd /home/$USER/Projects/Private/apache-projects/incubator-wayang'
alias apache-projects='cd /home/$USER/Projects/Private/apache-projects'
alias open-electrons='cd /home/$USER/Projects/Private/scala-projects/open-electrons'
alias open-electrons-infra='cd /home/$USER/Projects/Private/scala-projects/open-electrons/open-electrons-infra/'
alias open-electrons-deployments='cd /home/$USER/Projects/Private/scala-projects/open-electrons/open-electrons-deployments/'

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
# Move the directory structure of a folder as it to the target location
move() {
  # create directories up to one level up
  mkdir -p "`dirname "$2"`"
  mv "$1" "$2"
}
# lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
# Git commit
commit() {
 git add --all . && git commit -m "'$1'" && git push origin master 
}
sbtcommit() {
 sbt headerCreate && commit
}

# git shortcut commands
alias gstat='find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '\''(echo {} && cd {} && git status -s && echo)'\'' \;'

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
alias navo-docs='cd /home/joesan/Projects/Private/github-docs/navo-docs'
# -----------------------------------------------------------------------------
# NETWORKING ALIAS
# -----------------------------------------------------------------------------
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
