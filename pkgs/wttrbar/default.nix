{ lib
, rustPlatform
, fetchFromGitHub
}:

rustPlatform.buildRustPackage rec {
  pname = "wttrbar";
  version = "0.3.1";

  src = fetchFromGitHub {
    owner = "bjesus";
    repo = pname;
    rev = "refs/tags/${version}";
    hash = "sha256-9KCtt2NqL5/xk5UvqJC5qtWtphCmyH9LNrs1aVazAR8=";
  };
  cargoHash = "sha256-WRTiLXw7r4oXpEKYQiKDKJ7DSEPxjbufh+DstRFXEAw=";  
}