# Happy Birthday Script 🎉

`happy_birthday.sh` to prosty skrypt w Bashu, który generuje życzenia urodzinowe i oferuje opcjonalne ustawienia za pomocą `getopts`. Skrypt pozwala również uruchomić małą grę, w której użytkownik zgaduje losowo wygenerowaną liczbę od 1 do 10.

## Wymagania

- System Linux/Mac z zainstalowanym Bashem

## Instalacja

1. Skopiuj skrypt `happy_birthday.sh` do dowolnego katalogu na swoim komputerze.
2. Nadaj skryptowi prawa do uruchamiania:
   ```bash
   chmod +x happy_birthday.sh

# Obsługa flag
Skrypt obsługuje następujące flagi:

 - `-m "wiadomość"` – Umożliwia ustawienie niestandardowej wiadomości życzeń.
 - `-f "imię"` – Określa imię osoby wysyłającej życzenia.
 - `-g` – Uruchomienie gry zagadki

# Przykładowe wywołania
```
./happy_birthday.sh -g
```
```
./happy_birthday.sh
```
```
./happy_birthday.sh -m "Szczęścia, zdrowia i pomyślności!" -f "Janek"
```
