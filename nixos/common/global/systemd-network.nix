{
  systemd.network = {
    enable = true;
    wait-online = {
      timeout = 20;
      anyInterface = true;
    };
  };
}
