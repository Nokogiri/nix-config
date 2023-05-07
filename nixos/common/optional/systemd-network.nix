{
  systemd.network = {
    enable = true;
    wait-online = {
      enable = true;
      timeout = 20;
      anyInterface = false;
      ignoredInterfaces = [ "haos" "veth0" "veth1" "podman0" "veth0@if2" ];
    };
  };
}
