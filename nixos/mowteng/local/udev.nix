{ pkgs, ... }: {
  services.udev.extraRules = ''
    ACTION=="add", ATTR{idVendor}=="0c45", ATTR{idProduct}=="6739", RUN="${pkgs.bash}/bin/sh -c 'echo 1 >/sys/\$devpath/remove'"
  '';
}
