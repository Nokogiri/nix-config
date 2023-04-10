# iio-hyprland
A fork of okeri/iio-sway for Hyprland

Listens to iio-sensor-proxy and automatically changes Hyprland output orientation

## Installing 

:warning: Make sure [iio-sensor-proxy](https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/) running :warning:

### Arch linux

`yay iio-hyprland-git`

`paru iio-hyprland-git`

### Build from scratch

```
git clone https://github.com/JeanSchoeller/iio-hyprland

cd iio-hyprland

mkdir build

meson build

cd build

ninja install
```

## Running
`iio-hyprland [monitor to rotate, default=eDP-1]`, run `hyprctl monitors` to list available outputs.

Add `exec iio-hyprland` to `~/.config/hypr/hyprland.conf`

## Touch rotation support

Please open an issue and list the touch devices of your specifications using `hyprctl devices`. The following list should refer to the device working:

Surface Pro
Lenovo Yoga
Zenbook
