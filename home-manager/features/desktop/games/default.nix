{ pkgs, ... }: {
  home.packages = with pkgs; [

    # general
    gamemode
    gamescope
    heroic
    mangohud
    prismlauncher
    steam

    # emulation
    cemu
    libretro.beetle-pce-fast
    libretro.beetle-psx
    libretro.beetle-psx-hw
    libretro.beetle-supergrafx
    libretro.dolphin
    libretro.mgba
    libretro.mupen64plus
    libretro.parallel-n64
    libretro.snes9x
    ppsspp
    rpcs3
    ryujinx
    yuzu-mainline

  ];
}
