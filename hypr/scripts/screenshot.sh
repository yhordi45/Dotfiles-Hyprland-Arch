#!/bin/bash
# Captura de pantalla por región: guarda en Imágenes y copia al portapapeles (requiere grim, slurp, wl-copy)

DIR="$HOME/Imágenes"
FILE="$DIR/Captura_$(date +%Y-%m-%d_%H-%M-%S).png"

# Crear carpeta si no existe
if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
fi

# Pedir al usuario que marque el área
GEOMETRY=$(slurp)

# Si cancelaste (Esc o clic derecho), salir sin guardar nada
if [ -z "$GEOMETRY" ]; then
    exit 0
fi

# Capturar el área, guardar el archivo y copiarlo al portapapeles
grim -g "$GEOMETRY" - | tee "$FILE" | wl-copy

# Avisar que se guardó y se copió
notify-send "Captura Guardada" "Copiada al portapapeles"