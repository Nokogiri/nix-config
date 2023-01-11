{
  programs.thunderbird = {
    enable = true;
    profiles."nokogiri" = {
      isDefault = true;
      withExternalGnupg = true;
    };
  };
}
