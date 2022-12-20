{
  systemd.network = {
    enable = false;
    wait-online = {
      timeout = 20;
      anyInterface = true;
    };
  };
}
