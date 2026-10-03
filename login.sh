#!/bin/bash
# login.sh — імітація авторизації в системі у текстовому режимі
# Запуск: chmod +x login.sh && ./login.sh

VALID_USER="student"
VALID_PASS="linux123"
MAX_TRIES=3

clear
echo "GNU/Linux $(uname -r) $(hostname) tty1"
echo

for ((try = 1; try <= MAX_TRIES; try++)); do
    read -p "$(hostname) login: " username
    read -s -p "Password: " password
    echo

    if [[ "$username" == "$VALID_USER" && "$password" == "$VALID_PASS" ]]; then
        echo
        echo "Last login: $(date '+%a %b %d %H:%M:%S %Y') on tty1"
        echo "Welcome, $username! Авторизацію виконано успішно."
        exit 0
    fi

    sleep 1
    echo "Login incorrect"
    echo
done

echo "Забагато невдалих спроб. Сеанс завершено."
exit 1
