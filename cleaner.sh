#!/bin/bash
apps_directory='/usr/share/applications/'

if [[ -e "${apps_directory}" ]]; then
    cd "${apps_directory}"
    echo "[+] Removing NoDisplay attribute"
    for shortcut in $(grep -rn 'NoDisplay=true' | cut -d ':' -f 1); do
        echo "    ${shortcut}"
        sed -i 's/NoDisplay=true//g' "${shortcut}"
    done
fi
