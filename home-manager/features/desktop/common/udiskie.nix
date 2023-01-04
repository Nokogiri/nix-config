{
  services.udiskie = {
    enable = false;
    automount = true;
    notify = true;
    tray = "auto";
    settings = { 
    icon_names = {
    media = [ "drive-removable-media" ]; 
    browse  = [ "document-open" ];
    mount = [ "media-mount"];
    unmount = [ "media-mount"];
    };
    };
  };
}
