{ lib, buildGoModule, fetchFromGitHub, pkg-config, gtk3, gtk-layer-shell }:

buildGoModule rec {
  pname = "nwg-bar";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "nwg-piotr";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-H/weLgPydNKWJy/8Yc2acWcEbtgs8oUG5rwc6VRMeNw=";
  };

  patches = [ ./fix-paths.patch ];
  postPatch = ''
    substituteInPlace config/bar.json --subst-var out
    substituteInPlace tools.go --subst-var out
  '';

  vendorHash = "sha256-EewEhkX7Bwnz+J1ptO31HKHU4NHo76r4NqMbcrWdiu4=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ gtk3 gtk-layer-shell ];

  preInstall = ''
    mkdir -p $out/share/nwg-bar
    cp -r config/* images $out/share/nwg-bar
  '';

  meta = with lib; {
    description =
      "GTK3-based button bar for sway and other wlroots-based compositors";
    homepage = "https://github.com/nwg-piotr/nwg-bar";
    license = licenses.mit;
    platforms = platforms.linux;
    maintainers = with maintainers; [ sei40kr ];
  };
}
