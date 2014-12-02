#!/bin/bash
apps_directory="/usr/share/applications/"
app_shortcut="$1"

if [[ "${app_shortcut}" != "" ]]; then
    if [[ -e "${app_shortcut}" ]]; then
        exclusion_pattern='^Comment\['
        exclusion_pattern+='|^Name\['
        exclusion_pattern+='|^NoDisplay'
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
            rm -f "${temp_shortcut}"
        fi
    else
        echo "[x] File does not exists: ${app_shortcut}"
    fi

elif [[ -e "${apps_directory}" ]]; then
    cd "${apps_directory}"
    echo "[+] Removing NoDisplay attribute"
    counter=0

    for shortcut in $(grep -rn 'NoDisplay=true' | cut -d ':' -f 1); do
        echo "    ${shortcut}"
        sed -i 's/NoDisplay=true//g' "${shortcut}"
        counter=$(( $counter + 1 ))
    done

    if [[ "${counter}" -eq 0 ]]; then
        echo "    No hidden shortcuts were found"
    fi
fi
