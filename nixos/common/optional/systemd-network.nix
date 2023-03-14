{
  systemd.network = {
    enable = true;
    wait-online = {
      timeout = 20;
      anyInterface = true;
      ignoredInterfaces = ["haos" "veth0" "podman0" "veth0@if2"];
    };
  };
}
