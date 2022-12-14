# System configuration for my laptop
{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ../common/global
    ../common/users/nokogiri

    ../common/optional/pipewire.nix
    ../common/optional/quietboot.nix
    ../common/optionql/systemd-boot.nix

  ]; 
