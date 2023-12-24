#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo -e "\033[33mPlease run as root\033[0m"
    exit
fi

wait 

colorized_echo() {
    local color=$1
    local text=$2
    
    case $color in
        "red")
        printf "\e[91m${text}\e[0m\n";;
        "green")
        printf "\e[92m${text}\e[0m\n";;
        "yellow")
        printf "\e[93m${text}\e[0m\n";;
        "blue")
        printf "\e[94m${text}\e[0m\n";;
        "magenta")
        printf "\e[95m${text}\e[0m\n";;
        "cyan")
        printf "\e[96m${text}\e[0m\n";;
        *)
            echo "${text}"
        ;;
    esac
}

colorized_echo green "\n[+] - Please wait for a few seconde !"

echo " "

question="Please select your action?"
actions=("Update Bot" "Delete Bot" "Donate" "Exit")

select opt in "${actions[@]}"
do
    case $opt in 
        "Update Bot")
            echo -e "\n"
            read -p "Are you sure you want to update? [y/n] : " answer
            if [ "$answer" != "${answer#[Yy]}" ]; then
                if [ -d "/var/www/html/pooyaserverBot" ]; then
                    if [ -f "/var/www/html/pooyaserverBot/install/pooya.install" ]; then
                        if [ -s "/var/www/html/pooyaserverBot/install/pooya.install" ]; then
                            colorized_echo green "Please wait, Updating . . ."
                            # update proccess !
                            sudo apt update && apt upgrade -y
                            colorized_echo green "The server was successfully updated . . .\n"
                            sudo apt install curl -y
                            sudo apt install jq -y
                            sleep 2
                            mv /var/www/html/pooyaserverBot/install/pooya.install /var/www/html/pooya.install
                            sleep 1
                            rm -r /var/www/html/pooyaserverBot/
                            colorized_echo green "\nAll file and folder deleted for update bot . . .\n"

                            git clone https://github.com/pooyaserver/pooyaserver.git /var/www/html/pooyaserverBot/
                            sudo chmod -R 777 /var/www/html/pooyaserverBot/
                            mv /var/www/html/pooya.install /var/www/html/pooyaserverBot/install/pooya.install
                            sleep 2
                            
                            content=$(cat /var/www/html/pooyaserverBot/install/pooya.install)
                            token=$(echo "$content" | jq -r '.token')
                            dev=$(echo "$content" | jq -r '.dev')
                            domain=$(echo "$content" | jq -r '.main_domin')
                            db_name=$(echo "$content" | jq -r '.db_name')
                            db_username=$(echo "$content" | jq -r '.db_username')
                            db_password=$(echo "$content" | jq -r '.db_password')

                            source_file="/var/www/html/pooyaserverBot/config.php"
                            destination_file="/var/www/html/pooyaserverBot/config.php.tmp"
                            replace=$(cat "$source_file" | sed -e "s/\[\*TOKEN\*\]/${token}/g" -e "s/\[\*DEV\*\]/${dev}/g" -e "s/\[\*DB-NAME\*\]/${db_name}/g" -e "s/\[\*DB-USER\*\]/${db_username}/g" -e "s/\[\*DB-PASS\*\]/${db_password}/g")
                            echo "$replace" > "$destination_file"
                            mv "$destination_file" "$source_file"

                            sleep 2
                            
                            curl --location "https://${domain}/pooyaserverBot/sql/sql.php?db_password=${db_password}&db_name=${db_name}&db_username=${db_username}"
                            echo -e "\n"
                            TEXT_MESSAGE="✅ ربات شما با موفقیت به آخرین نسخه آپدیت شد."$'\n\n'"#️⃣ اطلاعات ربات :"$'\n\n'"▫️token: <code>${token}</code>"$'\n'"▫️admin: <code>${dev}</code> "$'\n'"▫️domain: <code>${domain}</code>"$'\n'"▫️db_name: <code>${db_name}</code>"$'\n'"▫️db_username: <code>${db_username}</code>"$'\n'"▫️db_password: <code>${db_password}</code>"$'\n\n'"🔎 - @pooyaserver | @pooyaserverGap"
                            curl -s -X POST "https://api.telegram.org/bot${token}/sendMessage" -d chat_id="${dev}" -d text="${TEXT_MESSAGE}" -d parse_mode="html"

                            sleep 2
                            clear
                            echo -e "\n\n"
                            colorized_echo green "[+] The pooyaserver Bot Has Been Successfully Updated"
                            colorized_echo green "[+] Telegram channel: @pooyaserver || Telegram group: @pooyaserverGap\n\n"
                            colorized_echo green "Your Bot Information:\n"
                            colorized_echo blue "[+] token: ${token}"
                            colorized_echo blue "[+] admin: ${dev}"
                            colorized_echo blue "[+] domain: ${domain}"
                            colorized_echo blue "[+] db_name: ${db_name}"
                            colorized_echo blue "[+] db_username: ${db_username}"
                            colorized_echo blue "[+] db_password: ${db_password}"
                            echo -e "\n"
                        else
                            echo -e "\n"
                            colorized_echo red "The pooya.install file is empty!"
                            echo -e "\n"
                            exit 1
                        fi
                    else
                        echo -e "\n"
                        colorized_echo red "The pooya.install file was not found and the update process was canceled!"
                        echo -e "\n"
                        exit 1
                    fi
                else
                    echo -e "\n"
                    colorized_echo red "The pooyaserverBot folder was not found for the update process, install the bot first!"
                    echo -e "\n"
                    exit 1
                fi
            else
                echo -e "\n"
                colorized_echo red "Update Canceled !"
                echo -e "\n"
                exit 1
            fi

            break;;
        "Delete Bot")
            echo -e "\n"
            read -p "Are you sure you want to update? [y/n] : " answer
            if [ "$answer" != "${answer#[Yy]}" ]; then
                if [ -d "/var/www/html/pooyaserverBot" ]; then
                    colorized_echo green "\n[+] Please wait, Deleting . . .\n"
                    rm -r /var/www/html/pooyaserverBot/

                    sleep 2

                    TEXT_MESSAGE="❌ The pooyaserver Bot Has Been Successfully Deleted -> @pooyaserver | @pooyaserverGap"
                    curl -s -X POST "https://api.telegram.org/bot${TOKEN}/sendMessage" -d chat_id="${CHAT_ID}" -d text="${TEXT_MESSAGE}"

                    sleep 2
                    echo -e "\n"
                    colorized_echo green "[+] The pooyaserver Bot Has Been Successfully Deleted"
                    colorized_echo green "[+] Telegram channel: @pooyaserver || Telegram group: @pooyaserverGap"
                    echo -e "\n"
                else
                    echo -e "\n"
                    colorized_echo red "The pooyaserverBot folder was not found for the update process, install the bot first!"
                    echo -e "\n"
                    exit 1
                fi
            else
                echo -e "\n"
                colorized_echo red "Delete Canceled !"
                echo -e "\n"
                exit 1
            fi

            break;;
        "Donate")
            echo -e "\n"
            colorized_echo green "[+] Bank Saman: 6219861935768316\n\n[+] Tron (TRX): TY3JFGRPktAjBQYbfwgMAc5F4sJrDB4Ed9\n\n[+] Bitcoin network: bc1q3fmrdkcwsz9yyzy8a9ud68kfdhxuuj37hewdut" 
            echo -e "\n"
            exit 0

            break;;
        "Exit")
            echo -e "\n"
            colorized_echo green "Exited !"
            echo -e "\n"

            break;;
            *) echo "Invalid option!"
    esac
done
