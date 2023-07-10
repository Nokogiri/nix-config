{ pkgs, config, ... }: {
  console = {
    useXkbConfig = true;
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v20b.psf.gz";
    packages = [ pkgs.terminus_font ];
  };

  boot = {
    plymouth = {
      enable = false;
      theme = "catppuccin-mocha";
      themePackages = [ pkgs.plymouth-catppuccin-mocha ];
      # [
      #  (pkgs.plymouth-catppuccin-frappe.override {
      #    inherit (config.boot.plymouth) logo;
      #  })
      #];
    };
    loader.timeout = 0;
    kernelParams = [
      "fbcon=nodefer"
      #"quiet"
      #"splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "vt.global_cursor_default=0"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}
