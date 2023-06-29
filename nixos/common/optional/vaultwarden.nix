{ config, pkgs, ... }: {
  sops.secrets.vaultwarden = { sopsFile = ../../common/secrets.yaml; };
  services.vaultwarden = {
    enable = true;
    backupDir = "/media/extHDD/warden";
    config = {
      DOMAIN = "https://vault.fishoeder.net";
      WEB_VAULT_FOLDER = "${pkgs.bitwarden_rs-vault}/share/vaultwarden/vault";
      WEB_VAULT_ENABLED = true;
      #LOG_FILE = "/var/log/vaultwarden";
      WEBSOCKET_ENABLED = false;
      WEBSOCKET_ADDRESS = "0.0.0.0";
      WEBSOCKET_PORT = 3012;
      ROCKET_PORT = 8812;
      SMTP_HOST = "smtp.gmail.com";
      SMTP_FROM = "vault@gefjon.org";
      SMTP_FROM_NAME = "Vaultwarden";
      SMTP_PORT = 587;
      SMTP_SSL = true;
      SMTP_TIMEOUT = 15;
    };
    environmentFile = config.sops.secrets.vaultwarden.path;
  };
}
