# 🎨 Dotfiles de Hyprland para Arch Linux

Configuración personal de **Hyprland** adaptada para usuarios de Arch Linux. Esta versión va directo al grano: asume que conoces tu sistema y sabes cómo gestionar tus configuraciones.

## ✨ Características Principales

- **Hyprland**: Compositor Wayland rápido y fluido.
- **Waybar**: Barra de estado elegante.
- **Rofi**: Lanzador de aplicaciones (usando `rofi-wayland`).
- **Kitty**: Emulador de terminal.
- **SWWW**: Gestor de fondos de pantalla animado.
- **SwayNC**: Centro de notificaciones (`swaync`).
- **Cava**: Visualizador de audio en terminal.

## 📦 Dependencias Manuales

Si prefieres copiar los dotfiles a mano, asegúrate de tener instalados estos paquetes desde los repositorios de Arch:

```text
hyprland waybar rofi-wayland kitty swww pamixer cava cliphist wl-clipboard swaync brightnessctl grim slurp pavucontrol polkit-gnome unzip ttf-font-awesome ttf-jetbrains-mono-nerd wlogout
```

Solo tienes que copiar el contenido de las carpetas (`hypr`, `waybar`, `rofi`, `kitty`, `cava`, `swaync`) a tu directorio `~/.config/` y dar permisos de ejecución a los scripts (`chmod +x ~/.config/hypr/scripts/*.sh`).

---

## 🚀 Instalación desde cero (Para sistemas limpios)

¿Recién instalas Arch Linux y tienes el sistema puro (base, sin entorno gráfico)?
Para ahorrarte tiempo, incluí un script de instalación que descarga las dependencias con `pacman` y ubica todo en su lugar automáticamente.

### Pasos:

1. Clona este repositorio:
   ```bash
   git clone https://github.com/yhordi45/dotfiles-hyprland.git
   cd dotfiles-hyprland
   ```

2. Ejecuta el instalador:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

Una vez finalizado, puedes iniciar Hyprland escribiendo `Hyprland` en tu TTY o usando tu gestor de inicio de sesión favorito.

---

## ⌨️ Atajos Básicos

| Atajo | Acción |
| --- | --- |
| `Super + Q` | Abrir terminal (Kitty) |
| `Super + C` | Cerrar ventana activa |
| `Super + R` | Lanzador de aplicaciones (Rofi) |
| `Super + W` | Selector de Wallpaper (Rofi + swww) |
| `Super + V` | Historial del portapapeles (Cliphist) |
| `Super + Shift + S` | Captura de pantalla (Grim + Slurp) |
| `Super + M` | Salir de Hyprland |
| `Super + X` | Menú de energía (wlogout) |

*Para personalizar atajos, aplicaciones predeterminadas o distribución de teclado, edita el archivo `~/.config/hypr/hyprland.conf`.*

---

## 📁 Estructura del Proyecto

Esta es la organización de las configuraciones, para que sepas dónde modificar cada componente:

```text
dotfiles-hyprland/
├── hypr/
│   ├── hyprland.conf      # Configuración principal (reglas, atajos, monitores)
│   └── scripts/           # Scripts de volumen, brillo y capturas
├── waybar/                # Módulos y estilos CSS de la barra superior
├── rofi/                  # Temas y comportamiento del lanzador
├── kitty/                 # Colores, fuentes y ajustes de la terminal
├── cava/                  # Visualizador de audio (gradiente y configuración)
├── swaync/                # Panel lateral de notificaciones y su tema
├── dependencies.txt       # Lista completa de paquetes requeridos
└── install.sh             # Script de autoinstalación para Arch
```

---

## 💡 Tips Útiles para Arch Linux

Aquí tienes algunas configuraciones rápidas muy comunes al instalar Hyprland en Arch:

- **Inicio automático desde TTY**: Si no usas un gestor de sesiones (como SDDM o GDM), puedes iniciar Hyprland automáticamente al hacer login agregando esto al final de tu `~/.bash_profile` o `~/.zprofile`:
  ```bash
  if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec Hyprland
  fi
  ```
- **Usuarios de NVIDIA**: Wayland en tarjetas NVIDIA puede requerir ajustes extra. Asegúrate de tener `nvidia-drm.modeset=1` en los parámetros de tu bootloader (GRUB o systemd-boot) para evitar parpadeos o problemas gráficos.
- **Polkit**: Si algunas aplicaciones gráficas no te piden contraseña para acciones de root, el paquete `polkit-gnome` ya está incluido en los dotfiles y se lanza automáticamente en el `hyprland.conf`.
