#!/bin/bash
# Selector de fondo de pantalla con Rofi; aplica la imagen con transición (requiere rofi, swww, hyprctl)

# Carpeta donde están los wallpapers
DIR="$HOME/Documentos/wallpapers-hyprland"

# Si la carpeta no existe, avisar y salir
if [ ! -d "$DIR" ]; then
    notify-send "Error" "Carpeta no encontrada"
    exit 1
fi

# Listar imágenes y elegir una con Rofi
SELECTED=$(ls "$DIR" | rofi -dmenu -p "  Wallpapers" -theme-str 'window {width: 400px;}')

if [ ! -z "$SELECTED" ]; then
    # Posición del cursor para que la transición salga desde ahí (hyprctl; tr quita espacios)
    CURSOR_POS=$(hyprctl cursorpos | tr -d " ")

    # Aplicar fondo con transición tipo grow desde el cursor
    swww img "$DIR/$SELECTED" \
        --transition-type grow \
        --transition-pos "$CURSOR_POS" \
        --transition-step 90 \
        --transition-fps 60 \
        --transition-duration 2
fi