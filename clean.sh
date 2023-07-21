#!/usr/bin/env zsh

# Title Colors / Format Vars
BOLD="$(tput bold)"
UNDERLINE="$(tput smul)"
NORMAL="$(tput sgr0)"
GREEN='\033[1;32m'
RED='\033[1;31m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
RC='\033[0m'  # Reset Color

clear

echo "${GREEN}#-------------------------------------------------------------#"
echo "#          ${BLUE}Electron-based application cache cleaner${GREEN}           #"
echo "#-------------------------------------------------------------#"
echo "# ${RED}Remember to close the application(s) you are about to clean${GREEN} #"
echo "#-------------------------------------------------------------#"
echo "#    ${PURPLE}Some application may require to re-login (ex. Authy)${GREEN}     #"
echo "#-------------------------------------------------------------#${RC}"

setopt +o nomatch

bye() {
echo "${CYAN}Bye Bye${RC}"
exit
}
trap bye SIGINT

authy() {
set -x
for i in ~/Library/Application\ Support/Authy\ Desktop/Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Authy\ Desktop/GPUCache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Authy\ Desktop/Local\ Storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Authy\ Desktop/blob_storage/*; do rm -rf "$i"; done
set +x
}

browserosaurus() {
set -x
for i in ~/Library/Application\ Support/Browserosaurus/Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Browserosaurus/GPUCache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Browserosaurus/Local\ Storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Browserosaurus/blob_storage/*; do rm -rf "$i"; done
set +x
}

code() {
set -x
for i in ~/Library/Application\ Support/Code/Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Code/GPUCache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Code/Local\ Storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Code/Service\ Worker/CacheStorage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Code/User/workspaceStorage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Code/blob_storage/*; do rm -rf "$i"; done
set +x
}

insomnia() {
set -x
for i in ~/Library/Application\ Support/Insomnia/Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Insomnia/GPUCache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Insomnia/Local\ Storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Insomnia/blob_storage/*; do rm -rf "$i"; done
set +x
}

lens() {
set -x
for i in ~/Library/Application\ Support/Lens/Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Lens/GPUCache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Lens/IndexedDB/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Lens/Local\ Storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Lens/blob_storage/*; do rm -rf "$i"; done
set +x
}

teams() {
set -x
for i in ~/Library/Application\ Support/Microsoft/Teams/Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Microsoft/Teams/GPUCache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Microsoft/Teams/IndexedDB/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Microsoft/Teams/Local\ Storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Microsoft/Teams/Service\ Worker/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Microsoft/Teams/blob_storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Microsoft/Teams/Code\ Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Microsoft/Teams/media-stack/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Microsoft/Teams/ai_models/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Microsoft/Teams/*.txt; do rm -rf "$i"; done
set +x
}

signal() {
set -x
for i in ~/Library/Application\ Support/Signal/Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Signal/GPUCache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Signal/IndexedDB/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Signal/Local\ Storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Signal/blob_storage/*; do rm -rf "$i"; done
set +x
}

slack() {
set -x
for i in ~/Library/Application\ Support/Slack/Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Slack/GPUCache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Slack/IndexedDB/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Slack/Local\ Storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/Slack/blob_storage/*; do rm -rf "$i"; done
set +x
}

whatsApp() {
set -x
for i in ~/Library/Application\ Support/WhatsApp/Cache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/WhatsApp/GPUCache/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/WhatsApp/IndexedDB/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/WhatsApp/Local\ Storage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/WhatsApp/Service\ Worker/CacheStorage/*; do rm -rf "$i"; done
for i in ~/Library/Application\ Support/WhatsApp/blob_storage/*; do rm -rf "$i"; done
set +x
}

other() {
set -x
for i in ~/Library/Application\ Support/zoom.us/data/tmp/*; do rm -rf "$i"; done
set +x
}

while true; do
     cat << EOF

What to clean?

s)  Safe ones (all but Authy and WhatsApp)
a)  All of the following
1)  Authy
2)  Browserosaurus
3)  VSCode
4)  Insomnia
5)  Lens
6)  Teams
7)  Signal
8)  Slack
9)  WhatsApp
10) Other caches

e)  exit!

EOF
    read "?: "
    case $REPLY in
        e)  bye ;;
        a)  authy
            whatsApp ;&
        s)  browserosaurus
            code
            insomnia
            lens
            teams
            signal
            slack
            other ;;
        1)  authy ;;
        2)  browserosaurus ;;
        3)  code ;;
        4)  insomnia ;;
        5)  lens ;;
        6)  teams ;;
        7)  signal ;;
        8)  slack ;;
        9)  whatsApp ;;
        10) other ;;
        *) echo "Unknown response, type 'e' to quit" ;;
    esac
done
