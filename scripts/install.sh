#!/usr/bin/env bash
set -Eeuo pipefail
ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
STATE="$HOME/.local/share/archcraft-ge"
STAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP="$STATE/backups/$STAMP"
MANIFEST="$STATE/last-install.manifest"
mkdir -p "$BACKUP" "$STATE"
: > "$MANIFEST"

install_one() {
  local src="$1" rel="$2" dest="$HOME/$2"
  if [[ ! -f "$ROOT/$src" ]]; then
    printf 'No se encontró el archivo: %s\n' "$src" >&2
    exit 1
  fi
  mkdir -p "$(dirname -- "$dest")"
  if [[ -e "$dest" ]]; then
    mkdir -p "$BACKUP/$(dirname -- "$rel")"
    cp -a -- "$dest" "$BACKUP/$rel"
    printf 'BACKUP|%s\n' "$rel" >> "$MANIFEST"
  else
    printf 'CREATED|%s\n' "$rel" >> "$MANIFEST"
  fi
  install -m 0644 -- "$ROOT/$src" "$dest"
  printf 'Instalado: ~/%s\n' "$rel"
}

install_exec() {
  local src="$1" rel="$2" dest="$HOME/$2"
  if [[ -e "$dest" ]]; then
    mkdir -p "$BACKUP/$(dirname -- "$rel")"
    cp -a -- "$dest" "$BACKUP/$rel"
    printf 'BACKUP|%s\n' "$rel" >> "$MANIFEST"
  else
    printf 'CREATED|%s\n' "$rel" >> "$MANIFEST"
  fi
  mkdir -p "$(dirname -- "$dest")"
  install -m 0755 -- "$ROOT/$src" "$dest"
  printf 'Instalado: ~/%s\n' "$rel"
}

install_one configs/openbox/rc.xml .config/openbox/rc.xml
install_one configs/rofi/config.rasi .config/rofi/config.rasi
install_one configs/rofimoji/rofimoji.rc .config/rofimoji.rc
install_one themes/rofi/archcraft-ge.rasi .config/rofi/themes/archcraft-ge.rasi
install_one configs/picom/archcraft-ge.conf .config/picom/archcraft-ge.conf
install_one configs/dunst/dunstrc .config/archcraft-ge/dunst/dunstrc
install_one configs/polybar/config.ini .config/archcraft-ge/polybar/config.ini
install_one configs/terminals/alacritty.toml .config/archcraft-ge/terminals/alacritty.toml
install_one configs/terminals/kitty.conf .config/archcraft-ge/terminals/kitty.conf
install_exec scripts/ge-launcher .local/bin/ge-launcher
install_exec scripts/ge-emoji .local/bin/ge-emoji
install_exec scripts/ge-check .local/bin/ge-check
install_exec scripts/ge-polybar .local/bin/ge-polybar
install_exec scripts/ge-session-start .local/bin/ge-session-start

printf '%s\n' "$BACKUP" > "$STATE/last-backup.path"
printf '\nInstalación de Archcraft GE completada.\n'
printf 'Respaldo: %s\n' "$BACKUP"
printf 'Recarga Openbox con: openbox --reconfigure\n'
printf 'La barra Polybar GE es opcional: ejecuta ge-polybar cuando quieras probarla.\n'
printf 'No se modificó tu autostart ni se instalaron paquetes.\n'
