# Instalación de Archcraft GE 1.1.0

Archcraft GE distribuye **configuraciones y guías**, no instala paquetes ni reemplaza el gestor de paquetes del sistema. Puedes descargar el repositorio desde GitHub y copiar los archivos con Thunar.

## Antes de empezar

- Sesión Openbox sobre X11.
- Haz una copia de seguridad de `~/.config/openbox/rc.xml`.
- Descarga y extrae el ZIP de la versión desde GitHub Releases.

## Instalación visual con Thunar

1. Abre Thunar y presiona `Ctrl + L`.
2. Escribe `~/.config/openbox/` y pulsa Enter. Si la carpeta no existe, créala.
3. Copia el `rc.xml` actual a un respaldo, por ejemplo `rc.xml.backup`.
4. Desde el paquete de Archcraft GE, abre `configs/openbox/`.
5. Copia `rc.xml` a `~/.config/openbox/` y acepta reemplazar el archivo. Este perfil mantiene los atajos de tu configuración y añade `Super + .` para el selector de emojis.
6. Para Rofi, copia `configs/rofi/config.rasi` a `~/.config/rofi/config.rasi` y `themes/rofi/archcraft-ge.rasi` a `~/.config/rofi/themes/archcraft-ge.rasi`. Crea las carpetas que falten.
7. Para el selector, copia `configs/rofimoji/rofimoji.rc` a `~/.config/rofimoji.rc`.
8. El resto de configuraciones son perfiles opcionales. Consulta `docs/COMPONENTS.md` para sus destinos y activación.
8. Recarga Openbox con `Ctrl + Shift + R` o ejecuta `openbox --reconfigure` en una terminal.

## Instalación gráfica (recomendada)

1. Abre la carpeta extraída en Thunar.
2. Entra en `scripts/` y ejecuta `install-gui.sh`.
3. Marca los componentes que quieras y pulsa **Instalar selección**.
4. El instalador gráfico usa YAD, crea respaldos y no instala paquetes ni modifica el autostart.

Si el administrador de archivos pregunta cómo ejecutar el script, elige ejecutarlo. También puedes lanzarlo con `bash scripts/install-gui.sh` si tu sesión no permite ejecutar scripts desde Thunar.

## Instalación automática por terminal

El script hace respaldos antes de copiar archivos. No instala paquetes y no modifica el autostart de Openbox.

```bash
bash scripts/install.sh
```

Para restaurar el respaldo de la última instalación:

```bash
bash scripts/uninstall.sh
```

El instalador coloca los perfiles de Picom, Dunst, Polybar y terminales en rutas propias de Archcraft GE para evitar sobrescribir configuraciones estándar de esos programas. La configuración activa de Polybar no se toca.

## Activar funciones opcionales

- **Selector de emojis:** necesita `rofimoji`, `rofi` y `xdotool`. El atajo configurado es `Super + .`. Rofimoji se lanza como selector independiente; no como un modo interno de Rofi, para conservar la acción de escritura directa.
- **Rofi GE:** ejecuta `ge-launcher` después de instalar los scripts, o usa el lanzador de Rofi que ya tengas. La variante ámbar está en `themes/rofi/archcraft-ge-amber.rasi`; puedes copiarla como `archcraft-ge.rasi` para cambiar el color.
- **Picom GE:** si Picom no está iniciado, puedes ejecutar `picom --config ~/.config/picom/archcraft-ge.conf --daemon`.
- **Notificaciones GE:** si Dunst no está activo, ejecuta `dunst -config ~/.config/archcraft-ge/dunst/dunstrc`.
- **Polybar GE:** ejecuta `ge-polybar`. No detiene ni reemplaza las barras que ya estén activas.
- **Terminales:** los perfiles se guardan en `~/.config/archcraft-ge/terminals/`. Para activarlos, copia el perfil elegido a la ruta estándar de tu terminal después de respaldar su archivo actual.

## Volver atrás

Si instalaste manualmente, restaura `rc.xml.backup` desde Thunar. Si usaste el instalador, ejecuta `bash scripts/uninstall.sh` desde la carpeta del repositorio.
