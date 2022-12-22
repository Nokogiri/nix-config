{ pkgs, ... }: {
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
  };
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-manager-qt
    virt-top
  ];
}
