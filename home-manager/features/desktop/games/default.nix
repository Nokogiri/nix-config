{ pkgs, config, ... }: {

  imports = [ ./steam.nix ./wine.nix ];
  home.packages = with pkgs; [

    # general
    #gamemode
    gamescope
    heroic
    mangohud
    moonlight-qt
    #portmod
    prismlauncher
    steam

    # native packaged games

    #zeroad
    airshipper # veloren
    eduke32
    dhewm3
    gzdoom
    minetest
    openmw
    RBDOOM-3-BFG-vk
    solarus
    sm64ex
    vkquake
    yquake2
    yquake2-all-games

    # emulation
    cemu
    #config.nur.repos.kira-bruneau.bcml # botw mod loader
    citra-canary
    #dolphin-emu-beta
    dolphinEmuMaster
    #dolphin-emu-primehack
    retroarch
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
    dotnetCorePackages.sdk_7_0
    #dotnetCorePackages.runtime_7_0
    yuzu-early-access

  ];
}
