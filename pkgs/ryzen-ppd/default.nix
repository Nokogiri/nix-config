{ lib, fetchFromGitHub, python3Packages, ryzenadj }:
with python3Packages;

buildPythonApplication rec {
  pname = "ryzen-ppd";
  version = "0.5";

  src = fetchFromGitHub {
    owner = "nokogiri";
    repo = pname;
    rev = "master";
    sha256 = "sha256-w3Nq14QJkI68E4WH0gEiyp9ZQ01mLu8uWH8icy1w6Sc=";
  };

  propagatedBuildInputs = [
    python3Packages.dbus-python
    python3Packages.pygobject3
    python3Packages.setuptools
    python3Packages.dbus-next
    ryzenadj
  ];
  buildInputs = [ ryzenadj ];
  nativeBuildInputs = [ ryzenadj ];
  postInstall = ''
    install -Dm644 $src/scripts/systemd/ryzen-ppd.service -t $out/lib/systemd/system
    substituteInPlace $out/lib/systemd/system/ryzen-ppd.service --replace "/usr/bin/ryzen-ppd" "$out/bin/ryzen-ppd"
    substituteInPlace $out/lib/python3.10/site-packages/ryzen_ppd/cpu.py --replace "libryzenadj.so" "${pkgs.ryzenadj}/lib/libryzenadj.so"
  '';

  meta = with lib; {
    description = "CHANGE";
    homepage = "https://github.com/CHANGE/ryzen-ppd";
    license = licenses.gpl3;
    maintainers = with maintainers; [ ];
  };
}
