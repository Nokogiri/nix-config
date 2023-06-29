{ config, ... }: {
  home.file.".mozilla/native-messaging-hosts/ff2mpv.json".text = ''
    {
      "name": "ff2mpv",
      "description": "ff2mpv's external manifest",
      "path": "/home/${config.home.username}/.nix-profile/bin/ff2mpv.py",
      "type": "stdio",
      "allowed_extensions": ["ff2mpv@yossarian.net"]
    }
  '';
}
