# Componentes incluidos

| Componente | Archivo | Uso |
|---|---|---|
| Openbox | `configs/openbox/rc.xml` | Atajos y comportamiento de ventanas GE |
| Openbox básico | `configs/openbox/rc-basic.xml` | Copia de la configuración base sin el atajo nuevo de emojis |
| Rofi | `configs/rofi/config.rasi` | Menú de aplicaciones, comandos y ventanas |
| Rofimoji | `configs/rofimoji/rofimoji.rc` | Ajustes del selector de emojis y escritura directa en X11 |
| Rofi Deep Space | `themes/rofi/archcraft-ge.rasi` | Tema oscuro con acento cian |
| Rofi Ember | `themes/rofi/archcraft-ge-amber.rasi` | Tema alternativo ámbar; puede sustituir el tema activo |
| Picom | `configs/picom/archcraft-ge.conf` | Sombras, fundidos y desenfoque opcional |
| Dunst | `configs/dunst/dunstrc` | Notificaciones oscuras con acento cian |
| Polybar | `configs/polybar/config.ini` | Barra de ejemplo con escritorios, ventana, CPU, RAM, volumen y fecha |
| Alacritty | `configs/terminals/alacritty.toml` | Paleta GE para Alacritty |
| Kitty | `configs/terminals/kitty.conf` | Paleta GE para Kitty |

## Scripts

- `ge-launcher`: abre Rofi en modo aplicaciones con el tema GE.
- `ge-emoji`: valida las dependencias y abre Rofimoji.
- `ge-check`: muestra qué herramientas están disponibles.
- `ge-polybar`: inicia la barra GE sin matar una barra existente.
- `ge-session-start`: inicia Picom y Dunst solo si están instalados y no hay procesos activos.
- `install-gui.sh`: instalador gráfico modular basado en YAD.
- `install.sh`: copia los perfiles y crea respaldos.
- `uninstall.sh`: restaura los respaldos de la última instalación.

## Paleta

| Nombre | Color | Hex |
|---|---|---|
| Fondo | Muy oscuro | `#0D111B` |
| Panel | Azul carbón | `#151E2B` |
| Texto | Blanco frío | `#E6F1FF` |
| Secundario | Gris azulado | `#8293A8` |
| Acento | Cian | `#35D9FF` |
| Acento 2 | Violeta | `#9B7BFF` |
| Alerta | Naranja | `#FF8C42` |
