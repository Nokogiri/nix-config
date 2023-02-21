{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [ ryzen-ppd ];

  systemd.services.ryzen-ppd = {
    after = [ "dbus.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = ":${pkgs.ryzen-ppd}/bin/ryzen-ppd";
      Environment = "PYTHONUNBUFFERED=1";
    };
  };

  environment.etc."ryzen-ppd.ini".text = ''
    [ryzenadj]
    limits = ["stapm_limit", "fast_limit", "slow_limit", "apu_slow_limit", "tctl_temp", "apu_skin_temp_limit"]
    monitor = fast_limit
    [profiles]
    battery     = [ 8000,  8000,  8000, 12000, 60, 45 ]
    low-power   = [ 11000,  9900,  9900, 13500, 60, 45 ]
    balanced    = [ 20000, 20000, 15000, 15000, 70, 45 ]
    performance = [ 44000, 44000, 37000, 30000, 86, 64 ]
    #custom      = [ 30000, 30000, 28000, 17000, 96, 64 ]

    [dytc]

    [ac]
    profile = performance
    # Rate in seconds at which a profile is applied. Default: 4
    update_rate_s = 14
    # ACPI platform profile. Default: balanced
    platform_profile = performance
    # Settings that are applied when using a battery as the power source.
    [battery]
    # Power profile. Default: low-power
    profile = battery
    # Rate in seconds at which a profile is applied. Default: 32
    update_rate_s = 32
    # ACPI platform profile. Default: low-power
    platform_profile = low-power
  '';

}
