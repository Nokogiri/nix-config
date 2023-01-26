{
  services = {
  gnome-keyring = {
    enable = true;
    components = [ "secrets" ];
  };
  gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
    enableSshSupport = false;
    enableZshIntegration = false;
    defaultCacheTtl = 60480000;
    defaultCacheTtlSsh = 60480000;
    maxCacheTtl = 60480000;
    maxCacheTtlSsh = 60480000;
    extraConfig = ''
      allow-loopback-pinentry
    '';
    };
  };
}
