{ lib
, fetchFromGitHub
, python3Packages
, dbus
, dnsmasq
, gawk
, getent
, gobject-introspection
, gtk3
, kmod
, lxc
, iproute2
, iptables
, util-linux
, which
, wrapGAppsHook
, xclip
, runtimeShell
}:

python3Packages.buildPythonApplication rec {
  pname = "waydroid";
  version = "1.4.0";
  format = "other";

  src = fetchFromGitHub {
    owner = pname;
    repo = pname;
    rev = version;
    sha256 = "sha256-zm5CIJd4FBWHRVNT4ObuznI6+8+ACqunQ1g35OcESno=";
  };

  buildInputs = [
    gtk3
    dbus
  ];

  nativeBuildInputs = [
    gobject-introspection
    wrapGAppsHook
  ];

  propagatedBuildInputs = with python3Packages; [
    dbus-python
    gbinder-python
    pyclip
    pygobject3
  ];

  dontUseSetuptoolsBuild = true;
  dontUsePipInstall = true;
  dontUseSetuptoolsCheck = true;
  dontWrapPythonPrograms = true;
  dontWrapGApps = true;

  installPhase = ''
    make install PREFIX=$out USE_SYSTEMD=0
  '';

  preFixup = ''
    makeWrapperArgs+=("''${gappsWrapperArgs[@]}")

    patchShebangs --host $out/lib/waydroid/data/scripts
    wrapProgram $out/lib/waydroid/data/scripts/waydroid-net.sh \
      --prefix PATH ":" ${lib.makeBinPath [ dnsmasq getent iproute2 iptables ]}

    wrapPythonProgramsIn $out/lib/waydroid/ "${lib.concatStringsSep " " [
      "$out"
      dbus
      python3Packages.dbus-python
      python3Packages.gbinder-python
      python3Packages.pygobject3
      python3Packages.pyclip
      gawk
      kmod
      lxc
      util-linux
      which
      xclip
    ]}"

    substituteInPlace $out/lib/waydroid/tools/helpers/*.py \
      --replace '"sh"' '"${runtimeShell}"'

    substituteInPlace $out/share/applications/*.desktop \
      --replace  "/usr" "$out"
  '';

  meta = with lib; {
    description = "Waydroid is a container-based approach to boot a full Android system on a regular GNU/Linux system like Ubuntu";
    homepage = "https://github.com/waydroid/waydroid";
    license = licenses.gpl3;
    platforms = platforms.linux;
    maintainers = with maintainers; [ mcaju ];
  };
}
