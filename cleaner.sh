#!/bin/bash
apps_directory="/usr/share/applications/"
app_shortcut="$1"

if [[ -e "${apps_directory}" ]]; then
    cd "${apps_directory}"
    echo "[+] Removing NoDisplay attribute"
    for shortcut in $(grep -rn 'NoDisplay=true' | cut -d ':' -f 1); do
        echo "    ${shortcut}"
        sed -i 's/NoDisplay=true//g' "${shortcut}"
    done
fi

if [[ "${app_shortcut}" != "" ]]; then
    exclusion_pattern='^Comment\['
    exclusion_pattern+='|^Name\['
    exclusion_pattern+='|^$'

    echo "[+] Simplifying desktop shortcut: ${app_shortcut}"
    temp_shortcut="shortcut-$(date +%s).temp.txt"
    current_lines=$(cat "${app_shortcut}" | wc -l)
    cat "${app_shortcut}" | grep -vE "${exclusion_pattern}" > "${temp_shortcut}"
    new_lines=$(cat "${temp_shortcut}" | wc -l)
    echo "    From ${current_lines} to ${new_lines} lines"

    if [[ "${new_lines}" -lt "${current_lines}" ]]; then
        echo -n "    " && rm -fv "${app_shortcut}"
        echo -n "    " && mv -v "${temp_shortcut}" "${app_shortcut}"
    else
        echo "    App shortcut is already clean"
    fi
fi
