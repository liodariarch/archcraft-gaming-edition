# Solución de problemas

## Openbox no carga el XML

1. Restaura el respaldo del `rc.xml` anterior.
2. Comprueba que estás en una sesión Openbox.
3. Ejecuta `openbox --reconfigure` para recargar la configuración.
4. Revisa que el XML se haya copiado como `~/.config/openbox/rc.xml` y no como `rc-archcraft-ge.xml`.

## `Super + .` no abre el selector

- Comprueba `rofimoji`, `rofi` y `xdotool` con `ge-check`.
- Ejecuta `ge-emoji` desde una terminal para ver un mensaje claro si falta algo.
- Confirma que otro programa no esté interceptando `Super + .`.

## Rofi aparece sin el tema GE

Comprueba las rutas `~/.config/rofi/config.rasi` y `~/.config/rofi/themes/archcraft-ge.rasi`. Puedes probar el lanzador con `ge-launcher`.

## Picom no acepta el desenfoque

Algunas compilaciones de Picom no incluyen el mismo método de blur. Comenta temporalmente las líneas `blur-method`, `blur-strength`, `blur-background` y `blur-background-exclude` del perfil, o usa la configuración que ya incluye tu distribución.

## Polybar no inicia

Confirma que Polybar está disponible y que la fuente JetBrains Mono existe. El módulo de iconos adicional usa Symbols Nerd Font; si no tienes esa fuente, elimina `font-1` y `content-font = 1` de `config.ini`.

## El sonido no aparece en la barra

El módulo incluido usa PulseAudio. En sistemas PipeWire, el servicio de compatibilidad PulseAudio debe estar disponible para que el módulo pueda consultar el volumen.
