{ pkgs, config, ... }: {

  #imports = [
    #./steam.nix 
    #./wine.nix
  #];
  home.packages = with pkgs; [

    # general
    gamescope
    mangohud
    prismlauncher

    # native packaged games

    #zeroad
    airshipper # veloren
    eduke32
    #dhewm3
    gzdoom
    #minetest
    openmw
    #solarus
    sm64ex
    vkquake
    yquake2
    yquake2-all-games

    # emulation
    cemu
    #config.nur.repos.kira-bruneau.bcml # botw mod loader
    citra-canary
    dolphinEmuMaster
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
    ppsspp
    rpcs3
    ryujinx
    yuzu-early-access

  ];
}
