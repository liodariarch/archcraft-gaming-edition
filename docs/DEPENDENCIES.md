# Dependencias opcionales

Archcraft GE no instala software. Esta tabla identifica las herramientas que activan funciones específicas.

| Herramienta | Necesaria para | Obligatoria |
|---|---|---|
| Openbox | Gestor de ventanas y lectura de `rc.xml` | Sí, para estos XML |
| YAD | Ventana del instalador gráfico | Solo para `install-gui.sh` |
| Rofi | Menú y selector visual | Solo para funciones Rofi |
| Rofimoji | Catálogo e inserción de emojis | Solo para `Super + .` |
| xdotool | Escribir el emoji en la ventana activa bajo X11 | Solo para escritura directa |
| xdotool | Envío del emoji a la ventana enfocada | Solo para el método configurado |
| Picom | Sombras, transparencia y desenfoque | No |
| Dunst | Notificaciones | No |
| Polybar | Barra GE | No |
| Alacritty | Terminal del atajo `Super + Enter` | Según el atajo |
| Kitty | Terminal del atajo `Super + Shift + Enter` | Según el atajo |
| JetBrains Mono | Tipografía preferida del perfil | Recomendada |
| Symbols Nerd Font | Glifos adicionales de Polybar | Opcional |

Las fuentes de emojis solo permiten representar los caracteres. No proporcionan por sí mismas una ventana de selección ni el mecanismo para insertar el emoji.
