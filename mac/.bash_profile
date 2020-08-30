# -------------------------------
# 1. ENVIRONMENT CONFIGURATION
# -------------------------------
# Set Paths
# -----------------------------------------------------
# For Java & Scala projects
export JAVA_HOME_8_131="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home/"
export JAVA_HOME_8="/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home/"
export JAVA_HOME_11="/Library/Java/JavaVirtualMachines/jdk-11.0.2.jdk/Contents/Home/"
export SBT_HOME="/Users/$USER/Softwares/sbt/sbt-1.2.8"
export SCALA_HOME="/Users/$USER/Softwares/scala/scala-2.12.7"
# For C# Projects
export MONO_HOME="/Library/Frameworks/Mono.framework/Commands/"
# For Rust projects
export RUST_HOME="/Users/$USER/.cargo"
# For Go projects, we set the GOPATH
export GOROOT="/usr/local/opt/go/libexec"
export GOPATH="/Users/$USER/Projects/Private/go-projects"
export GODEPS="/Users/$USER/Projects/Private/go-projects/bin/godep"
# For Python projects
export PYTHON_HOME="/Library/Frameworks/Python.framework/Versions/3.6"
export ANACONDA_HOME="/Users/$USER/anaconda2"
export WORKON_HOME="/Users/$USER/Projects/Private/ml-projects/virtualenvs"
# For Apache Maven
export MAVEN_HOME="/Users/$USER/Softwares/apache/apache-maven-3.6.0"
# We set the PATH
export PATH="$JAVA_HOME_8_131/bin:$SBT_HOME/bin:$SCALA_HOME/bin:$MONO_HOME:$RUST_HOME/bin:$MAVEN_HOME/bin:$GOROOT/bin:$PYTHON_HOME/bin:$ANACONDA_HOME/bin:$ML_PATH:$GODEPS:$GOPATH/bin:$PATH:/usr/local/bin"
# Set Default Editor (change 'Nano' to the editor of your choice)
# ------------------------------------------------------------
export EDITOR=/usr/bin/nano
export TERM=xterm-color

# Set default blocksize for ls, df, du
# from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
# ------------------------------------------------------------
export BLOCKSIZE=1k  
# -----------------------------
# PROJECT FOLDER ALIAS
# -----------------------------
alias ua-client='python3 /usr/local/bin/opcua-client'
alias ml-projects='cd /Users/$USER/Projects/Private/ml-projects'
alias go-projects='cd /Users/$USER/Projects/Private/go-projects'
alias scala-projects='cd /Users/$USER/Projects/Private/scala-projects'
alias blockchain-projects='cd /Users/$USER/Projects/Private/blockchain-projects'
alias rust-projects='cd /Users/$USER/Projects/Private/rust-projects'
alias private-projects='cd /Users/$USER/Projects/Private'
alias python-projects='/Users/$USER/Projects/Private/python-projects'
alias plant-simulator='cd /Users/$USER/Projects/Private/scala-projects/plant-simulator'
alias ros-projects='cd /home/$USER/Projects/Private/ros-projects'
# -----------------------------
# TERMINAL ALIAS
# -----------------------------
repl () {
    ( cd /Users/$USER/Projects/Private/scala-projects/REPLesent && scala -Dscala.color -language:_ -nowarn -i REPLesent.scala )
}
alias lpsolve='/Users/$USER/Softwares/lp_solve_5.5.2.5_exe_osx32/lp_solve'
alias mqtt='/usr/local/sbin/mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf'
alias terraform='/Users/$USER/Softwares/terraform/terraform'
alias sbt-console='/Users/$USER/Projects/Private/scala-projects/sbt-console sbt'
alias haskell='ghci'
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
# -----------------------------------
# RASPBERRY PI ALIAS
# -----------------------------------
alias cctv='ssh -Y joesan@cctv.local'
alias worker-1='ssh pi@k8s-worker-01.local'
alias worker-2='ssh pi@k8s-worker-02.local'
alias worker-3='ssh pi@k8s-worker-03.local'
alias master-1='ssh pi@k8s-master-01.local'

# lr:  Full Recursive Directory Listing
# ------------------------------------------
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# -------------------------------
# FILE AND FOLDER MANAGEMENT
# -------------------------------
zipf () { zip -r "$1".zip "$1" ; }     # To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'

# extract:  Extract most know archives with one command
# ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }

# ---------------------------
# NETWORKING
# ---------------------------

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

# ---------------------------
# K8s ALIAS
# ---------------------------
alias kl='kubectl'
alias pods='kubectl get pods --show-labels --all-namespaces'
alias kserv='kubectl get svc'

# ---------------------------
# DOCKER ALIAS
# ---------------------------
alias dockerStopAll='docker stop $(docker ps -aq)'
alias dockerRemoveAll='docker rm $(docker ps -aq)'

export PATH=$PATH:/Users/jothi/Softwares/azure-cli/bin
export PATH="$HOME/.cargo/bin:$PATH"d
