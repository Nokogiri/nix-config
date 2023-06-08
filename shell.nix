# Shell for bootstrapping flake-enabled nix and home-manager
# You can enter it through 'nix develop' or (legacy) 'nix-shell'

{ pkgs ? (import ./nixpkgs.nix) { } }: {
  default = pkgs.mkShell {
    # Enable experimental features without having to specify the argument
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [ neovim nix home-manager git sops gnupg nixpkgs-fmt nix-universal-prefetch yarn2nix onefetch jdk tes3cmd fribidi python310 ];
  };
}
