{
  services.mbpfan = {
    enable = true;
    settings.general = {
      low_temp = 55;
      high_temp = 70;
      max_temp = 85;
      polling_interval = 2;
      min_fan1_speed = 3000;
    };
  };

}
