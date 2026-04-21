#!/bin/bash

echo "🚀 Iniciando instalación de Dotfiles Hyprland para Arch Linux..."

# 1. Instalar paquetes necesarios
echo "📦 Instalando paquetes desde repositorios oficiales..."
sudo pacman -S --needed --noconfirm hyprland waybar rofi-wayland kitty swww pamixer \
    cava cliphist wl-clipboard swaync \
    brightnessctl grim slurp \
    pavucontrol polkit-gnome unzip ttf-font-awesome ttf-jetbrains-mono-nerd \
    wlogout

# 2. Copiar configuraciones
echo "📂 Copiando archivos de configuración..."
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/kitty
mkdir -p ~/.config/cava
mkdir -p ~/.config/swaync

cp -r hypr/* ~/.config/hypr/
cp -r waybar/* ~/.config/waybar/
cp -r rofi/* ~/.config/rofi/
cp -r kitty/* ~/.config/kitty/
cp -r cava/* ~/.config/cava/
cp -r swaync/* ~/.config/swaync/

# 3. Permisos de ejecución
echo "🔑 Dando permisos a scripts..."
chmod +x ~/.config/hypr/scripts/*.sh

echo "✅ ¡Instalación completada! Ahora puedes reiniciar o iniciar Hyprland."
echo "ℹ️  Nota: Recuerda poner tu imagen 'wallpaper.jpg' en ~/.config/hypr/ (o la ruta que hayas configurado)."
