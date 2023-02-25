{ lib
, stdenv
, fetchFromGitHub
, rustPlatform
, gtk4
, pkg-config
, greetd
}:

rustPlatform.buildRustPackage rec {
  pname = "ReGreet";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "rharish101";
    repo = "ReGreet";
    rev = "master";
    sha256 = "sha256-XELJsWjBiLQ2P37c4Btls17phYgJrlJGf1llaZvK81o=";
  };
  cargoSha256 = "sha256-/5q1emo+kSG/lPqxc1bxOP4DbOmkx/lthCtzl2/r6Vc=";

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ gtk4 greetd.greetd ];

  doCheck = false;

}
