{
  security = {
    doas = {
      enable = true;
      wheelNeedsPassword = true;
      extraRules = [
        {
          groups = [ "wheel" ];
          noPass = false;
          keepEnv = true;
          persist = true;
        }
        {
          users = [ "nokogiri" ];
          noPass = true;
          keepEnv = true;
          persist = false;
        }
      ];
    };
  };
}
