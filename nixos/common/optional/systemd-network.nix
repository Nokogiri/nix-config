{
  systemd.network = {
    enable = true;
    wait-online = {
      timeout = 20;
      anyInterface = false;
      ignoredInterfaces = [ "haos" "veth0" "podman0" "veth0@if2" ];
    };
  };
}
