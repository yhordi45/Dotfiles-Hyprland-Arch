#!/bin/bash
# Subir, bajar o silenciar volumen con notificación (requiere pamixer)

# Paso de volumen en %
step=2   # Paso de volumen (2%)

# Mostrar notificación con el nivel actual (mismo ID para que no se acumulen)
function send_notification {
    volume=$(pamixer --get-volume)
    # Icono según el nivel
    if [ "$volume" -eq 0 ]; then
        icon=""
    elif [ "$volume" -lt 50 ]; then
        icon=""
    else
        icon=""
    fi
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i audio-volume-medium "$icon Volumen: ${volume}%"
}

case $1 in
    up)
        # Sube volumen (pamixer no pasa del 100 %)
        pamixer -i $step
        send_notification
        ;;
    down)
        pamixer -d $step
        send_notification
        ;;
    mute)
        pamixer -t
        if $(pamixer --get-mute); then
            notify-send -h string:x-canonical-private-synchronous:sys-notify -u low " Silenciado"
        else
            send_notification
        fi
        ;;
esac