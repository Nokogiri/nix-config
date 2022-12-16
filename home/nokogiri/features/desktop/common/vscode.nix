{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      bodil.file-browser
      catppuccin.catppuccin-vsc
    ];
  };
}
