{ config, ... }:{
  sops.secrets.vaultwarden = {
    sopsFile = ../../common/secrets.yaml;
  };
  services.vaultwarden = {
    enable = true;
    backupDir = "/media/extHDD/warden";
    config = {
      DOMAIN = "https://vault.fishoeder.net";
    };
    environmentFile = config.sops.secrets.vaultwarden.path ;
  };
}
