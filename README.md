# Archcraft GE

**Archcraft Gaming Edition** es un conjunto comunitario de configuraciones y recursos para personalizar Archcraft con Openbox y X11. No es una distribución independiente ni un instalador de paquetes.

## 1.1.0 | Deep Space

Una colección modular: instala solo lo que quieras y conserva tus configuraciones originales mediante respaldos.

### Incluye

- Openbox: atajos GE y perfil básico.
- Rofi: configuración y dos temas visuales.
- Rofimoji: preferencias para el selector de emojis con `Super + .`.
- Picom: perfil opcional de sombras y desenfoque.
- Dunst: estilo de notificaciones.
- Polybar: barra GE de ejemplo, separada de la barra que ya tengas.
- Alacritty y Kitty: perfiles de terminal.
- Scripts para lanzar aplicaciones, emojis, barra y diagnóstico.
- Instalador gráfico modular con YAD, instalador de respaldo por terminal y restaurador.
- Guías detalladas y perfiles opcionales.

## Descarga e instalación

1. Descarga el ZIP desde **Releases** de GitHub.
2. Extrae el contenido.
3. Sigue [`docs/INSTALLATION.md`](docs/INSTALLATION.md).
4. Revisa [`docs/COMPONENTS.md`](docs/COMPONENTS.md) para activar solo los componentes que necesites.

Para instalar sin escribir comandos, abre `scripts/install-gui.sh` con YAD desde el administrador de archivos. También puedes ejecutar `bash scripts/install.sh` desde una terminal. El instalador respalda cada archivo que vaya a reemplazar; no instala paquetes ni modifica el autostart de Openbox.

## Requisitos

- Archcraft con Openbox y X11 para los perfiles de Openbox.
- Las herramientas adicionales son opcionales y se detallan en [`docs/DEPENDENCIES.md`](docs/DEPENDENCIES.md).

## Filosofía del proyecto

- **Modular:** no es necesario instalar todos los perfiles.
- **Reversible:** el instalador respalda lo que reemplaza.
- **Transparente:** los archivos de configuración son legibles y editables.
- **Ligero:** no se fuerza el inicio de servicios ni se instalan dependencias automáticamente.

## Documentación

- [Instalación](docs/INSTALLATION.md)
- [Componentes](docs/COMPONENTS.md)
- [Atajos](docs/KEYBINDINGS.md)
- [Dependencias opcionales](docs/DEPENDENCIES.md)
- [Solución de problemas](docs/TROUBLESHOOTING.md)
- [Historial de versiones](docs/RELEASES.md)

## Aviso de origen

El XML de Openbox conserva el encabezado de copyright que ya estaba presente en el archivo fuente entregado por el usuario. Antes de publicar el repositorio, define una licencia para tus aportaciones y conserva los avisos de terceros que correspondan. Consulta [`NOTICE.md`](NOTICE.md).
