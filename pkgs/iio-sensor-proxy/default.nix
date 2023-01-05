{ lib
, stdenv
, fetchFromGitLab
, gettext
, libtool
, glib
, gtk3
, gtk-doc
, libgudev
, pkg-config
, systemd
, meson
, polkit
, ninja
}:

stdenv.mkDerivation rec {
  pname = "iio-sensor-proxy";
  version = "3.4";

  src = fetchFromGitLab {
    domain = "gitlab.freedesktop.org";
    owner = "hadess";
    repo = pname;
    rev = version;
    sha256 = "sha256-O1rob/LVjNNY4F0d/Z9h8ZO7gVHZR8fvRhPpZ6GcyX0=";
  };

  patches = [ ./fix-install-path.patch ];

  mesonFlags = [
    "--sysconfdir=${placeholder "out"}/etc"
    "--localstatedir=/var"
    "-Dudevrulesdir=${placeholder "out"}/lib/udev/rules.d"
    "-Dsystemdsystemunitdir=${placeholder "out"}/lib/systemd/system"
  ];

  buildInputs = [ glib gtk3 gtk-doc libgudev polkit systemd ];

  nativeBuildInputs = [ ninja meson gettext pkg-config ];

  preInstall = ''
    # We have pkexec on PATH so Meson will try to use it when installation fails
    # due to being unable to write to e.g. /etc.
    # Let’s pretend we already ran pkexec –
    # the pkexec on PATH would complain it lacks setuid bit,
    # obscuring the underlying error.
    # https://github.com/mesonbuild/meson/blob/492cc9bf95d573e037155b588dc5110ded4d9a35/mesonbuild/minstall.py#L558
    export PKEXEC_UID=-1
  '';

  meta = with lib; {
    description = "Proxy for sending IIO sensor data to D-Bus";
    homepage = "https://gitlab.freedesktop.org/hadess/iio-sensor-proxy";
    license = licenses.gpl3;
    maintainers = with maintainers; [ peterhoeg ];
    platforms = platforms.linux;
  };
}
