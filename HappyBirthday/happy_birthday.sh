#!/bin/bash

# Domyślne wiadomości
message="Wszystkiego najlepszego!"
from="Twój przyjaciel"
play_game=false

# Parsowanie opcji
while getopts "m:f:g" option; do
    case $option in
        m) message=$OPTARG;;       # Własna wiadomość
        f) from=$OPTARG;;           # Imię osoby wysyłającej życzenia
        g) play_game=true;;         # Flaga do gry
        *) echo "Użycie: $0 [-m wiadomość] [-f imię] [-g gra]" 
           exit 1;;
    esac
done

# Wyświetlenie życzeń urodzinowych
echo -e "\n🎉 $message 🎉"
echo -e "Pozdrowienia od: $from\n"

# Jeśli włączono opcję gry
if [ "$play_game" = true ]; then
    echo "🎲 Gra urodzinowa: Zgadnij liczbę od 1 do 10!"

    # Generowanie losowej liczby
    random_number=$((RANDOM % 10 + 1))
    attempts=0

    while true; do
        read -p "Zgadnij liczbę: " guess
        ((attempts++))

        if [[ "$guess" -eq "$random_number" ]]; then
            echo "Brawo! Zgadłeś za $attempts razem. 🎉"
            break
        elif [[ "$guess" -lt "$random_number" ]]; then
            echo "Za mało!"
        else
            echo "Za dużo!"
        fi
    done
fi
