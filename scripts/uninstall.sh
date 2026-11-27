#!/usr/bin/env bash
set -Eeuo pipefail
STATE="$HOME/.local/share/archcraft-ge"
MANIFEST="$STATE/last-install.manifest"
BACKUP_FILE="$STATE/last-backup.path"
if [[ ! -f "$MANIFEST" || ! -f "$BACKUP_FILE" ]]; then
  printf 'No se encontró el registro de instalación de Archcraft GE.\n' >&2
  exit 1
fi
BACKUP="$(<"$BACKUP_FILE")"
if [[ ! -d "$BACKUP" ]]; then
  printf 'No se encontró el respaldo: %s\n' "$BACKUP" >&2
  exit 1
fi
printf 'Esto restaurará el respaldo de la última instalación: %s\n' "$BACKUP"
read -r -p '¿Continuar? [s/N] ' answer
[[ "$answer" == [sS] ]] || exit 0
while IFS='|' read -r action rel; do
  [[ -n "${rel:-}" ]] || continue
  target="$HOME/$rel"
  case "$action" in
    BACKUP)
      mkdir -p "$(dirname -- "$target")"
      cp -a -- "$BACKUP/$rel" "$target"
      printf 'Restaurado: ~/%s\n' "$rel"
      ;;
    CREATED)
      rm -f -- "$target"
      printf 'Eliminado: ~/%s\n' "$rel"
      ;;
  esac
done < "$MANIFEST"
printf '\nRestauración terminada. Recarga Openbox con: openbox --reconfigure\n'
printf 'Los respaldos se conservaron en %s\n' "$BACKUP"
