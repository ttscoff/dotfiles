# export PATH="/Developer/usr/lib:/Developer/usr/bin:/Developer/usr/sbin/:/usr/local/bin:/usr/local/sbin:/usr/local/lib:/usr/local/mysql/bin:/Users/ttscoff/bin:/Users/ttscoff/.gem/ruby/1.8/bin:/Users/ttscoff/scripts:$PATH"
export PATH="/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/local/lib:/usr/local/mysql/bin:/Users/ttscoff/bin:/Users/ttscoff/scripts:/Users/ttscoff/.cabal/bin:/Users/ttscoff/.gem/ruby/1.8/bin:/usr/texbin:/Users/ttscoff/Library/Application Support/MultiMarkdown/bin:$PATH"
export PYTHONPATH="/Library/Python/2.7/site-packages:/System/Library/Frameworks/Python.framework/Versions/2.7/lib:/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7:/System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python:/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-dynload:/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/lib-dynload"

[[ -z $DISPLAY ]] && export DISPLAY=":0.0"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.

export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL="en_US.UTF-8"
export LESSCHARSET=utf-8
export VMAIL_VIM=mvim
# export CC=gcc-4.2
export CC=

prompt_command () {
  if [ $? -eq 0 ]; then # set an error string for the prompt, if applicable
    ERRPROMPT=" "
  else
    ERRPROMPT='->($?) '
  fi
  if [ "\$(type -t __git_ps1)" ]; then # if we're in a Git repo, show current branch
      BRANCH="\$(__git_ps1 '[ %s ] ')"
  fi
  local TIME=`fmt_time` # format time for prompt string
  # local LOAD=`uptime|awk '{min=NF-2;print $min}'`
  local GREEN="\[\033[0;32m\]"
  local CYAN="\[\033[0;36m\]"
  local BCYAN="\[\033[1;36m\]"
  local BLUE="\[\033[0;34m\]"
  local GRAY="\[\033[0;37m\]"
  local DKGRAY="\[\033[1;30m\]"
  local WHITE="\[\033[1;37m\]"
  local RED="\[\033[0;31m\]"
  local BLACK="\[\033[0;30m\]"
  # return color to Terminal setting for text color
  local DEFAULT="\[\033[0;39m\]"
  # set the titlebar to the last 2 fields of pwd
  local TITLEBAR='\[\e]2;`pwdtail`\a'
  # export PS1="\[${TITLEBAR}\]${CYAN}[ ${BCYAN}\u${GREEN}@${BCYAN}\
# \h${DKGRAY}(${LOAD}) ${WHITE}${TIME} ${CYAN}]${RED}$ERRPROMPT${GRAY}\
# \w\n${GREEN}${BRANCH}${DEFAULT}$ "
  export PS1="\[${TITLEBAR}\]${CYAN}[ ${BCYAN}\u${GREEN}@${BCYAN}\
\h${WHITE} ${TIME} ${CYAN}]${RED}$ERRPROMPT${GRAY}\
\w\n${GREEN}${BRANCH}${DEFAULT}$ "
  # [[ $(history 1|sed -e "s/^[ ]*[0-9]*[ ]*//") =~ ^((cd|z|j|g)([ ]|$)) ]] && na
}

PROMPT_COMMAND=prompt_command

if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
source ~/.git-completion.bash
source ~/.git-flow-completion.bash
source ~/.app_completions
#source /usr/local/etc/bash_completion.d/cdargs-bash.sh
source ~/scripts/bashmarks.sh

SUDO_COMPLETE=( $(echo $PATH | sed 'y/:/\n/' | xargs ls -1 2>/dev/null) )
complete -o default -W "${SUDO_COMPLETE[*]}" sudo

SSH_COMPLETE=( $(perl -ne 'print "$1 " if /^Host (.+)$/' ~/.ssh/config) )
complete -o default -W "${SSH_COMPLETE[*]}" ssh

# See ~/.app_completions

export CLICOLOR=1
export LSCOLORS=cxFxCxDxBxegedabagacad

# history handling
#
# Erase duplicates
export HISTCONTROL=erasedups
# resize history size
export HISTSIZE=10000
# append to bash_history if Terminal.app quits
shopt -s histappend
## shopt -s cdspell
shopt -s dotglob
shopt -s cmdhist

# Aliases
# alias ?="calc"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias abs="aboo -s" #address book search using aboo
alias atskill="atsutil server -shutdown;sleep 5;atsutil server -ping"
alias b="popd"
alias blitz="geistesblitz.rb"
alias bp="mate ~/.bash_profile"
alias c="clear"
# alias cd="pushd"
alias cd.="cd .."
alias cdd='cd -'
alias cl="/usr/local/bin/fuzzyclock" # python fuzzyclock
alias cpu='top -o cpu' # cpu
alias crush="pngcrush -e _sm.png -rem alla -brute -reduce"
alias cssedit="env DYLD_FRAMEWORK_PATH=/Applications/WebKit.app/Contents/Resources WEBKIT_UNSET_DYLD_FRAMEWORK_PATH=YES /Applications/CSSEdit.app/Contents/MacOS/CSSEdit"
alias f="open -a Finder ./"
alias fireproof="/Applications/Firefox.app/Contents/MacOS/firefox -safe-mode"
alias flush="dscacheutil -flushcache"
alias gitar="git ls-files -d -m -o -z --exclude-standard | xargs -0 git update-index --add --remove" # add and remove new/deleted files from git index automatically
alias goll="~/repos/gollum/bin/gollum"
alias gp="git push origin master"
alias gpa="git push --all"
alias gpd="git push origin develop"
alias grep="grep --color=auto"
alias ip="curl icanhazip.com"
alias jek="jekyll"
alias js="jsl -process"
alias kb="mate ~/Library/KeyBindings/DefaultKeyBinding.dict"
alias killbonjour="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist"
alias killflash="killall -9 WebKitPluginHost"
alias killgrowl="killall Growl && open -a Growl"
alias la="ls -aF"
alias ld="ls -ld"
alias lg="ls -AlG"
alias ll="ls -l"
# alias ls="ls -aF"
alias lt='echo "------Newest--" && ls -At1 && echo "------Oldest--"'
alias ltr='echo "------Oldest--" && ls -Art1 && echo "------Newest--"'
alias macirb="/usr/local/bin/macirb --simple-prompt"
# alias mark="open -a /Applications/Marked.app"
# alias mate="open -b com.macromates.textmate"
alias mem='top -o rsize' # memory
alias mkdir='mkdir -p -v'
alias mountall='system_profiler SPFireWireDataType | grep "BSD Name: disk.$" | sed "s/^.*: //" | (while read i; do /usr/sbin/diskutil mountDisk $i; done)'
alias o="open -a"
alias oacurl="java -cp /usr/local/bin/oacurl-1.1.0.jar com.google.oacurl.Fetch"
alias oacurl-login="java -cp /usr/local/bin/oacurl-1.1.0.jar com.google.oacurl.Login"
alias pd="pushd"
alias pf="open -a Path\ Finder ./"
alias ql="qlmanage -p &>/dev/null"
alias quit="quit -s"
alias r="fc -e -"
alias rb="osascript -e 'tell app \"TextMate\" to reload bundles'"
alias rsync="rsync -avz"
alias rtt="~/scripts/read2text" # python readability -> markdownify
alias scl="say `/usr/local/bin/fuzzyclock`"
alias snap="webkit2png -W 1000 -dFC -D ~/Desktop"
alias src="source ~/.bash_profile"
alias startbonjour="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist"
alias stfu="osascript -e 'set volume output muted true'"
alias tmlog="syslog -F '\$Time \$Message' -k Sender /System/Library/CoreServices/backupd -k Time ge -30m | tail -n 1"
alias tp='touch todo.taskpaper && open -a "Taskpaper" todo.taskpaper'
alias tower='open . -a "Tower"'
alias trash='rmf'
alias ungit="find . -name '.git' -exec rm -rf {} \;"
alias unmountall='system_profiler SPFireWireDataType | grep "BSD Name: disk.$" | sed "s/^.*: //" | (while read i; do /usr/sbin/diskutil unmountDisk $i; done)'
alias vless='vim -u /usr/share/vim/vim73/macros/less.vim'

source ~/.privatealias
source ~/scripts/z.sh
# source ~/scripts/f.sh
# alias e='f -e mate' # quick opening files with vim
# alias z='d -e cd' # quick cd into directories, mimicking autojump and z
# alias of='a -e open' # quick opening files with xdg-open

# set vi-compatible mode for the command line
# set -o vi

function console () {
  if [[ $# > 0 ]]; then
    query=$(echo "$*"|tr -s ' ' '|')
    tail -f /var/log/system.log|grep -i --color=auto -E "$query"
  else
    tail -f /var/log/system.log
  fi
}

# Commit pending changes and quote all args as message
function gg() {
    git commit -v -a -m "$*"
}

# Copy the contents of the passed file to the clipboard
function clip() {
  type=`mdls -name kMDItemContentTypeTree -raw $1|grep -c public.plain-text`
  if [ $type -gt 0 ]; then
    cat "$1"|pbcopy
    echo "Contents of $1 are in the clipboard."
  else
    echo "File \"$1\" is not plain text."
  fi
}
skype () {
  number=`echo $1|sed 's/[\(\)\+ \-]//g'|sed 's/^1//'|sed 's/^/+1/'`
  osascript -e "tell application \"Skype\" to send command \"CALL $number\" script name \"CLIDIALER\""
}
vacmail () {
  if [ -n "$(ps ax|grep Mail.app|grep -v grep)" ]; then
    echo -n "Mail running"
    osascript -e 'tell app "Mail" to quit' &
    COUNT=0
    while [ -n "$(ps ax|grep Mail.app|grep -v grep)" ]; do
      COUNT=$COUNT+1
      echo -n "."
      if [ $COUNT -gt 15 ]; then
        killall "Mail.app"
      else
        sleep 1
      fi
    done
    echo ". Quit."
  else
    echo "Mail not running, continuing."
  fi
  echo -n Vacuuming
  `sqlite3 ~/Library/Mail/Envelope\ Index vacuum;` &
  while [ -n "$(ps ax|grep "Envelope Index vacuum"|grep -v grep)" ]; do
    echo -n "."
    sleep 1
  done
  echo ". Done."
}

fp () { #find and list processes matching a case-insensitive partial-match string
    ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print substr($0,RSTART,RLENGTH)": "$1}'|grep -i $1|grep -v grep
}

fkill () { #find and kill first process matching a case-insensitive partial-match string
    pid=`ps Ao pid,comm|awk '{match($0,/[^\/]+$/); print $1" "substr($0,RSTART,RLENGTH)}'|grep -i $1|grep -v grep|awk '{print $1}'`
    kill $pid
}

# find processes matching (case-insensitive, partial) first parameter,
# build menu to kill process
fk () {
  IFS=$'\n'
  PS3='Kill which process? (1 to cancel): '
  select OPT in "Cancel" $(fp $1); do
    if [ $OPT != "Cancel" ]; then
      kill $(echo $OPT|awk '{print $NF}')
    fi
    break
  done
  unset IFS
}
h () {
  IFS=$'\n'
  PS3='Which command? '
  select OPT in "Cancel" $(history|grep -i $1|awk '{$1="";print $0}'|sed 's/^ //g'); do
    if [ $OPT != "Cancel" ]; then
      unset IFS
      $(echo -n "$OPT")
    fi
    break
  done
  unset IFS
}
# Edit Markdown File from Writing directory
# Finds Markdown files matching a Spotlight-style search query
# If there's more than one, you get a menu
edmd () {
  WRITINGDIR="/Users/ttscoff/Dropbox/Writing"
  EDITCMD="mate"
  filelist=$(mdfind -onlyin "$WRITINGDIR" "($@) AND kind:markdown")
  listlength=$(mdfind -onlyin "$WRITINGDIR" -count "($@) AND kind:markdown")
  if [[ $listlength > 0 ]]; then
    if [[ $listlength == 1 ]]; then
      $EDITCMD $filelist
    else
      IFS=$'\n'
      PS3='Edit which file? (1 to cancel): '
      select OPT in "Cancel" $filelist; do
        if [ $OPT != "Cancel" ]; then
          $EDITCMD $OPT
        fi
        break
      done
    fi
  else
    return 1
  fi
  return 0
}


extract () { #unarchive various compression formats based on extension
        if [ -f $1 ] ; then
                case $1 in
                        *.tar.bz2)          tar xjf $1       ;;
                        *.tar.gz)           tar xzf $1       ;;
                        *.bz2)              bunzip2 $1       ;;
                        *.rar)              rar x $1         ;;
                        *.gz)               gunzip $1        ;;
                        *.tar)              tar xf $1        ;;
                        *.tbz2)             tar xjf $1       ;;
                        *.tgz)              tar xzf $1       ;;
                        *.zip)              unzip $1         ;;
                        *.Z)                uncompress $1    ;;
                        *.dmg)              hdiutil mount $1 ;;
                        *)                  echo "'$1' cannot be extracted via extract()" ;;
                esac
        else
                echo "'$1' is not a valid file"
        fi
}

fmt_time () { #format time just the way I likes it
  if [ `date +%p` = "PM" ]; then
    meridiem="pm"
  else
    meridiem="am"
  fi
  date +"%l:%M:%S$meridiem"|sed 's/ //g'
}

urlenc () { #url encode the passed string
  echo -n "$1" | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'
}

fymd () {
  encurl=$(urlenc $1)
  curl "http://fuckyeahmarkdown.com/go/?read=1&preview=0&showframe=0&u=$encurl"|pbcopy
  echo "In your clipboard, man."
}

pman () { #display man page as a PostScript PDF in Preview.app
  man -t "$1"|open -f -a "Preview.app"
}

tman () { #open man page in TextMate
  MANWIDTH=160 MANPAGER='col -bx' man $@ | mate
}

pwdtail () { #returns the last 2 fields of the working directory
  pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

#cb () { #clears screen with prompt at bottom
  #for((i=1;i<=$LINES;i++));do echo;done
#}

# gets the current 1m avg CPU load, was part of my prompt,
# but was too slow for prompt_command
chkload () {
  local CURRLOAD=`uptime|awk '{print $(NF-2)}'`
  if [ "$CURRLOAD" > "1" ]; then
    local OUTP="HIGH"
  elif [ "$CURRLOAD" < "1" ]; then
    local OUTP="NORMAL"
  else
    local OUTP="UNKNOWN"
  fi
  echo $CURRLOAD
}

# Get the aliases and functions

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export MUSICROOT="~/Music/"
function play {
  if [ $1 = '-v' ]; then
    shift 1
    find -LE $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -print -exec afplay "{}" \; &
  elif [ $1 = '-g' ]; then
    shift 1
    find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec open -a QuickTime\ Player "{}" \; -exec osascript -e 'tell application "QuickTime Player" to play document 1' \; &
  else
    find -E $MUSICROOT -type f -iname "*$**" -iregex '.*\.(3g[2|p]|a(ac|c3|dts|if[c|f]?|mr|nd|u)|caf|m4[a|r]|mp([1-4|a]|eg[0,9]?)|sd2|wav)' -exec afplay "{}" \; &
  fi
}
function cdl { cd "$1"; ls;}

# From Chris Wanstrath, less with color coding
# `easy_install pygments`
function pless() {
    pygmentize $1 | less -r
}

# Restart App
function ra () {
  quit "$1" && open -a "$1"
}

# wrapper for git to log commits to an nvALT note
# just an overall reminder of what I did all night
function ca(){
  note="/Users/ttscoff/Dropbox/Notes/nvALT2.1/universalgitlog.md"
  msg=$*
  path=$(pwd)
  before=$(cat "$note")
  echo "$(date '+%y-%m-%d %H:%M | ') (${path##*/}) $msg" > "$note"
  echo "$before" >> "$note"
  git commit -am "$msg"
}

# encode a given image file as base64 and output css background property to clipboard
function 64enc() {
  openssl base64 -in $1 | awk -v ext="${1#*.}" '{ str1=str1 $0 }END{ print "background:url(data:image/"ext";base64,"str1");" }'|pbcopy
  echo "$1 encoded to clipboard"
}

# experimental wrapper for git to log commits to Day One
# lots of credit to http://nnutter.com/2012/01/git-todo/
function cdo(){
  msg=$*
  GIT_DIR=$(git rev-parse --git-dir)
  if ! (( $? )); then
      GIT_DIR=$(echo "$GIT_DIR" | awk -F/ '{nlast = NF -1;print $nlast}')
      if [ -z "$GIT_DIR" ]; then
        path=$(pwd)
        GIT_DIR=${path##*/}
      fi
      ~/scripts/logtodayone.rb "@$GIT_DIR $msg"
  fi

  git commit -am "$msg"
}

# From http://github.com/suztomo/dotfiles
# also have `trash` installed as an alias
function rmf(){
    for file in $*
    do
        __rm_single_file $file
    done
}

function __rm_single_file(){
    if ! [ -d ~/.Trash/ ]
    then
        command /bin/mkdir ~/.Trash
    fi

    if ! [ $# -eq 1 ]
    then
        echo "__rm_single_file: 1 argument required but $# passed."
        exit
    fi

    if [ -e $1 ]
    then
        BASENAME=`basename $1`
        NAME=$BASENAME
        COUNT=0
        while [ -e ~/.Trash/$NAME ]
        do
            COUNT=$(($COUNT+1))
            NAME="$BASENAME.$COUNT"
        done

        command /bin/mv $1 ~/.Trash/$NAME
    else
        echo "No such file or directory: $file"
    fi
}

function bridge() {
  sdef /Applications/$1.app | sdp -fh --basename $1
  gen_bridge_metadata -c '-I.' $1.h > $1.bridgesupport
}

# exports a clean copy of the current git repo to a zip file
# `zipup ~/Desktop/gitarchive.zip`
function zipup() {
  git archive --format zip --output $1 master
}

function calc() {
  equat=$(echo ${@//[^0-9\.\+\/\*\(\)]/ }| sed 's/[ \t]*//g')
  echo $equat|bc -lq
}

? () { awk "BEGIN{ print $* }" ;}

## just for fun, ccalc trims the newline
## and copies the result directly to the clipboard
function ccalc() {
  calc $@|tr -d '\n'|pbcopy
}

# Just an experiment, but I really like it
# reads input from STDIN and keeps a running tally of numbers
function tally() {
  if [[ $# == 0 ]]; then
    echo "Enter numbers, press = for sum:"
    read -d "="
    input=$REPLY
    echo
    echo "================"
  else
    input="$@"
  fi
  sum=0
  for i in $input; do
    sum=$sum+$i
  done
  echo $sum|bc -l
}

# brch (Branch Changes)
# Git: Move uncommitted changes in master to a new branch
function brch() {
  # Convert the recent work on master to a feature branch
  git branch $1
  # Drop my master back to the same ref as origin
  git reset --hard origin/master
  # Switch to the new branch
  git checkout $1
}

# glorified strip_tags to get plain text from websites
# no markdownify
function webtext() {
  curl -s "$1"|php -r "echo trim(html_entity_decode(preg_replace('/([\n\s])+/misx',' ',strip_tags(preg_replace('/<script.*?\/script>/misx','',file_get_contents('php://stdin')))),ENT_QUOTES));"
}

# get any apps full-size icon, compression via jpegtran
function geticon() {
  # Autocompletes app names with modified .app_completions scripts
  APP=`echo $1|sed -e 's/\.app$//'`
  APPDIR=''
  for dir in "/Applications/" "/Applications/Utilities/" "/Developer/Applications/" "/Developer/Applications/Utilties/"; do
    if [[ -d ${dir}$APP.app ]]; then
        APPDIR=$dir
        break
    fi
  done
  if [[ $APPDIR == '' ]]; then
    echo "App not found"
  else
    ICON=`defaults read "${APPDIR}$APP.app/Contents/Info" CFBundleIconFile|sed -e 's/\.icns$//'`
    TMPFILE="${TMPDIR}${APP}_icon.jpg"
    OUTFILE="$HOME/Desktop/${APP}_icon.jpg"
    MAXAVAIL=`sips -g pixelWidth "${APPDIR}$APP.app/Contents/Resources/$ICON.icns"|tail -1|awk '{print $2}'`
    echo -n "Enter max pixel width ($MAXAVAIL): "
    read MAX
    if [[ $MAX == '' || $MAX -gt $MAXAVAIL ]]; then
      MAX=$MAXAVAIL
    fi
    /usr/bin/sips -s format jpeg --resampleHeightWidthMax $MAX "${APPDIR}$APP.app/Contents/Resources/$ICON.icns" --out "$TMPFILE" > /dev/null 2>&1
    /usr/local/bin/jpegtran -optimize "$TMPFILE" > "$OUTFILE"
    echo "Wrote JPG to $OUTFILE."
    echo -n 'Open in Preview? (y/N): '
    read ANSWER
    if [[ $ANSWER == 'y' ]]; then
      open -a "Preview.app" "$OUTFILE"
    fi
  fi
}

# get any app's full-size icon, PNG version
function geticonpng() {
  # Autocompletes app names with modified .app_completions scripts
  APP=`echo $1|sed -e 's/\.app$//'`
  APPDIR=''
  for dir in "/Applications/" "/Applications/Utilities/" "/Developer/Applications/" "/Developer/Applications/Utilties/"; do
    if [[ -d ${dir}$APP.app ]]; then
        APPDIR=$dir
        break
    fi
  done
  if [[ $APPDIR == '' ]]; then
    echo "App not found"
  else
    ICON=`defaults read "${APPDIR}$APP.app/Contents/Info" CFBundleIconFile|sed -e 's/\.icns$//'`
    TMPFILE="${TMPDIR}${APP}_icon.png"
    OUTFILE="$HOME/Desktop/${APP}_icon.png"
    MAXAVAIL=`sips -g pixelWidth "${APPDIR}$APP.app/Contents/Resources/$ICON.icns"|tail -1|awk '{print $2}'`
    echo -n "Enter max pixel width ($MAXAVAIL): "
    read MAX
    if [[ $MAX == '' || $MAX -gt $MAXAVAIL ]]; then
      MAX=$MAXAVAIL
    fi
    /usr/bin/sips -s format png --resampleHeightWidthMax $MAX "${APPDIR}$APP.app/Contents/Resources/$ICON.icns" --out "$OUTFILE" > /dev/null 2>&1
    # /usr/local/bin/jpegtran -optimize "$TMPFILE" > "$OUTFILE"
    echo "Wrote PNG to $OUTFILE."
    echo -n 'Open in Preview? (y/N): '
    read ANSWER
    if [[ $ANSWER == 'y' ]]; then
      open -a "Preview.app" "$OUTFILE"
    fi
  fi
}

# instant web server for current dir
function serve() {
  python -m SimpleHTTPServer ${1:-8080}
}

# Experimental command to open current folder's Espresso project
function esp() {
  if [[ $1 != "" ]]; then
    if [ -d "$1" ]; then
      target="$1"
    else
      target="`dirname $1`"
    fi
  else
    target="`pwd`"
  fi

  if [ -e "$target/`basename "$target" ".esproj"`.esproj" ]; then
    open -a Espresso "${target%/}/`basename $target ".esproj"`.esproj"
  else
    open -a Espresso "$target"
  fi
}

# Remote Mount (sshfs)
# creates mount folder and mounts the remote filesystem
rmount() {
  local host folder mname
  host="${1%%:*}:"
  [[ ${1%:} == ${host%%:*} ]] && folder='' || folder=${1##*:}
  if [[ $2 ]]; then
    mname=$2
  else
    mname=${folder##*/}
    [[ "$mname" == "" ]] && mname=${host%%:*}
  fi
  if [[ $(grep -i "host ${host%%:*}" ~/.ssh/config) != '' ]]; then
    mkdir -p ~/mounts/$mname > /dev/null
    sshfs $host$folder ~/mounts/$mname -oauto_cache,reconnect,defer_permissions,negative_vncache,volname=$mname,noappledouble && echo "mounted ~/mounts/$mname"
  else
    echo "No entry found for ${host%%:*}"
    return 1
  fi
}

# Remote Umount, unmounts and deletes local folder (experimental, watch you step)
rumount() {
  if [[ $1 == "-a" ]]; then
    ls -1 ~/mounts/|while read dir
    do
      [[ $(mount|grep "mounts/$dir") ]] && umount ~/mounts/$dir
      [[ $(ls ~/mounts/$dir) ]] || rm -rf ~/mounts/$dir
    done
  else
    [[ $(mount|grep "mounts/$1") ]] && umount ~/mounts/$1
    [[ $(ls ~/mounts/$1) ]] || rm -rf ~/mounts/$1
  fi
}

# Ruby cgi escape
esc() {
  ruby -e 'require "cgi"; puts CGI.escape(ARGV.join(" "))' $@
}

## From http://www.dotfiles.org/~foca/.bash_functions
#
# tag a directory in a command to come to it later
tag() {
  alias $1="cd $PWD"
}

# alias last command
a() {
  x=`history 1 | sed 's/.\{7\}//'`;
  alias ${1}="${x}";
}
## End ~foca

# a couple of my bigger scripts separated out
[[ -s "/Users/ttscoff/scripts/na.sh" ]] && source "/Users/ttscoff/scripts/na.sh"
[[ -s "/Users/ttscoff/scripts/oft2.sh" ]] && source "/Users/ttscoff/scripts/oft2.sh"

[[ -s "/Users/ttscoff/.rvm/scripts/rvm" ]] && source "/Users/ttscoff/.rvm/scripts/rvm"

# _f_bash_hook_cmd_complete e z of
# _f_bash_hook_word_complete_wrap_all