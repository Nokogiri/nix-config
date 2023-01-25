{ pkgs, config, ... }: {

  imports = [ ./steam.nix ./wine.nix ];
  home.packages = with pkgs; [

    # general
    gamemode
    gamescope
    heroic
    mangohud
    moonlight-qt
    portmod
    prismlauncher
    steam

    # native packaged games

    zeroad
    airshipper # veloren
    eduke32
    gzdoom
    minetest
    openmw
    #RBDOOM-3-BFG
    solarus
    sm64ex
    vkquake
    yquake2
    yquake2-all-games

    # emulation
    cemu
    config.nur.repos.kira-bruneau.bcml # botw mod loader
    citra-canary
    dolphin-emu-beta
    #dolphin-emu-primehack
    libretro.beetle-pce-fast
    libretro.beetle-psx
    libretro.beetle-psx-hw
    libretro.beetle-supergrafx
    libretro.dolphin
    libretro.flycast
    libretro.mgba
    libretro.mupen64plus
    libretro.parallel-n64
    libretro.play
    libretro.snes9x
    libretro.swanstation
    pcsx2
    ppsspp
    rpcs3
    ryujinx
    yuzu-early-access

  ];
}
