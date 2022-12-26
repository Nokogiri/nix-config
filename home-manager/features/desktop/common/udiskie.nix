{
  services.udiskie = {
    enable = false;
    automount = true;
    notify = true;
    tray = "auto";
    settings = { icon_names.media = [ "media-optical" ]; };
  };
}
