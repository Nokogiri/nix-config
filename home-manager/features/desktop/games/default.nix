{ pkgs, ... }: {

  imports = [ ./steam.nix ./wine.nix ];
  home.packages = with pkgs; [

    # general
    gamemode
    gamescope
    heroic
    mangohud
    portmod
    prismlauncher
    steam

    # native packaged games

    zeroad
    eduke32
    gzdoom
    openmw
    #RBDOOM-3-BFG
    solarus
    sm64ex
    vkquake
    yquake2
    yquake2-all-games
    zeroad

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
