{
  services.gitolite = {
    enable = true;
    adminPubkey =
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIExoigGlfblca2iJPTcyRc/bL5hqHuDlXmbBf/9PhVKZ nokogiri@frankenbook";
    description = "nokogiri";
    user = "git";
    group = "http";
    extraGitoliteRc = ''
      $RC{GIT_CONFIG_KEYS} = '.*';
      push( @{$RC{ENABLE}}, 'cgit' );
      push( @{$RC{ENABLE}}, 'symbolic-ref');
    '';
  };
}
