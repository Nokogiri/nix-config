{ lib, ... }: {
  i18n = {
    defaultLocale = lib.mkDefault "en_US.UTF-8";
    extraLocaleSettings = {
      LC_MEASUREMENT = lib.mkDefault "de_DE.UTF-8";
      LC_MONETARY = lib.mkDefault "de_DE.UTF-8";
      LC_NUMERIC = lib.mkDefault "de_DE.UTF-8";
      LC_PAPER = lib.mkDefault "de_DE.UTF-8";
      LC_TIME = lib.mkDefault "de_DE.UTF-8";
    };
    supportedLocales = lib.mkDefault [ "en_US.UTF-8/UTF-8" "de_DE.UTF-8/UTF-8" ];
  };
  time.timeZone = lib.mkDefault "Europe/Berlin";
}
