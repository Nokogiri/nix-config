{
  programs = {
    ssh = {
      enable = true;
      matchBlocks = {
        "calvin" = { hostname = "10.200.200.1"; };
        "gitlab.com" = { user = "gitolite"; };
        "github.com" = { user = "git"; };
        "codeberg.org" = { user = "git"; };
      };
    };
  };

}
