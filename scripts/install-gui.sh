#!/usr/bin/env bash
# Instalador gráfico modular de Archcraft GE. Requiere YAD; no instala paquetes.
set -Eeuo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
STATE="$HOME/.local/share/archcraft-ge"

if ! command -v yad >/dev/null 2>&1; then
  printf 'El instalador gráfico necesita YAD. Usa scripts/install.sh o instala YAD desde tu gestor gráfico.\n' >&2
  exit 127
fi

selection="$(yad --list --checklist \
  --title='Archcraft GE | Instalador 1.1.0' \
  --text='Selecciona los componentes que quieres instalar. Los archivos existentes se respaldarán antes de reemplazarlos.' \
  --width=850 --height=470 --center --print-column=2 --separator='|' \
  --column='Instalar:CHK' --column='ID:TEXT' --column='Componente:TEXT' --column='Descripción:TEXT' \
  TRUE openbox 'Openbox GE' 'Atajos y configuración de ventanas' \
  TRUE rofi 'Rofi GE' 'Lanzador y tema Deep Space' \
  TRUE emojis 'Selector de emojis' 'Preferencias para Rofimoji (requiere Rofimoji/Rofi/xdotool)' \
  FALSE picom 'Picom GE' 'Sombras y desenfoque opcional' \
  FALSE dunst 'Dunst GE' 'Tema de notificaciones' \
  FALSE polybar 'Polybar GE' 'Barra de ejemplo, sin tocar la barra actual' \
  FALSE terminals 'Perfiles de terminal' 'Alacritty y Kitty en carpeta independiente' \
  TRUE tools 'Herramientas GE' 'Lanzadores, emojis y diagnóstico' \
  --button='Cancelar:1' --button='Instalar selección:0')" || exit 0

if [[ -z "$selection" ]]; then
  yad --info --title='Archcraft GE' --text='No seleccionaste componentes.' --button=OK
  exit 0
fi

STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP="$STATE/backups/$STAMP"
MANIFEST="$STATE/last-install.manifest"
mkdir -p "$BACKUP" "$STATE"
: > "$MANIFEST"

install_one() {
  local src="$1" rel="$2" dest="$HOME/$2"
  [[ -f "$ROOT/$src" ]] || { yad --error --text="No se encontró $src"; exit 1; }
  mkdir -p "$(dirname -- "$dest")"
  if [[ -e "$dest" ]]; then
    mkdir -p "$BACKUP/$(dirname -- "$rel")"
    cp -a -- "$dest" "$BACKUP/$rel"
    printf 'BACKUP|%s\n' "$rel" >> "$MANIFEST"
  else
    printf 'CREATED|%s\n' "$rel" >> "$MANIFEST"
  fi
  install -m 0644 -- "$ROOT/$src" "$dest"
}

install_exec() {
  local src="$1" rel="$2" dest="$HOME/$2"
  mkdir -p "$(dirname -- "$dest")"
  if [[ -e "$dest" ]]; then
    mkdir -p "$BACKUP/$(dirname -- "$rel")"
    cp -a -- "$dest" "$BACKUP/$rel"
    printf 'BACKUP|%s\n' "$rel" >> "$MANIFEST"
  else
    printf 'CREATED|%s\n' "$rel" >> "$MANIFEST"
  fi
  install -m 0755 -- "$ROOT/$src" "$dest"
}

IFS='|' read -r -a items <<< "$selection"
for item in "${items[@]}"; do
  case "$item" in
    openbox)
      install_one configs/openbox/rc.xml .config/openbox/rc.xml
      ;;
    rofi)
      install_one configs/rofi/config.rasi .config/rofi/config.rasi
      install_one themes/rofi/archcraft-ge.rasi .config/rofi/themes/archcraft-ge.rasi
      ;;
    emojis)
      install_one configs/rofimoji/rofimoji.rc .config/rofimoji.rc
      ;;
    picom)
      install_one configs/picom/archcraft-ge.conf .config/picom/archcraft-ge.conf
      ;;
    dunst)
      install_one configs/dunst/dunstrc .config/archcraft-ge/dunst/dunstrc
      ;;
    polybar)
      install_one configs/polybar/config.ini .config/archcraft-ge/polybar/config.ini
      ;;
    terminals)
      install_one configs/terminals/alacritty.toml .config/archcraft-ge/terminals/alacritty.toml
      install_one configs/terminals/kitty.conf .config/archcraft-ge/terminals/kitty.conf
      ;;
    tools)
      install_exec scripts/ge-launcher .local/bin/ge-launcher
      install_exec scripts/ge-emoji .local/bin/ge-emoji
      install_exec scripts/ge-check .local/bin/ge-check
      install_exec scripts/ge-polybar .local/bin/ge-polybar
      install_exec scripts/ge-session-start .local/bin/ge-session-start
      ;;
  esac
done

printf '%s\n' "$BACKUP" > "$STATE/last-backup.path"
yad --info --title='Archcraft GE | Instalación terminada' \
  --width=520 --text="Los componentes seleccionados se copiaron correctamente.\n\nRespaldo creado en:\n$BACKUP\n\nRecarga Openbox para aplicar los cambios. No se instalaron paquetes ni se modificó autostart." \
  --button='Cerrar:0'
