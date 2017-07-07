# -------------------------------
# 1. ENVIRONMENT CONFIGURATION
# -------------------------------
# Set Paths
# -----------------------------------------------------
export SBT_HOME="/Users/${user}/Softwares/sbt/sbt-launcher-packaging-0.13.13"
export SCALA_HOME="/Users/${user}/Softwares/scala/scala-2.11.8"
export RUST_HOME="/Users/${user}/.cargo"
export PATH="$SBT_HOME/bin:$SCALA_HOME/bin:$RUST_HOME/bin:$PATH:/usr/local/bin"

# Set Default Editor (change 'Nano' to the editor of your choice)
# ------------------------------------------------------------
export EDITOR=/usr/bin/nano

# Set default blocksize for ls, df, du
# from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
# ------------------------------------------------------------
export BLOCKSIZE=1k  

# -----------------------------
# TERMINAL ALIAS
# -----------------------------
repl () {
    ( cd /Users/${user}/Projects/Private/scala-projects/REPLesent && scala -Dscala.color -language:_ -nowarn -i REPLesent.scala )
}
alias sbt-console='/Users/${user}/Projects/Private/scala-projects/sbt-console sbt'
alias haskell='ghci'
alias .='cd /Users/${user}'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='ls -FGlAhp'
alias eon='cd /Users/${user}/Projects/Official/eon'
cd() { builtin cd "$@"; ll; }  # Always list directory contents upon 'cd'
alias cd..='cd ../'
alias .1='cd ../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias cls='clear'
alias path='echo -e ${PATH//:/\\n}'
alias cic='set completion-ignore-case On' # Make tab completion case insensitive
mkdircd() { mkdir -p "$1" && cd "$1"; } # Makes new directory and jumps inside

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

export PATH=$PATH:/Users/${user}/Softwares/azure-cli/bin

source '/Users/${user}/Softwares/azure-cli/az.completion'
