{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    extraConfig = ''
      set -ga terminal-overrides ",xterm-kitty:Tc"
      bind-key a last-window
      bind-key ^D detach-client

      set-option -g set-titles on
      set-option -g set-titles-string '[#S:#I #T] #W'
      set-option -g status-position top

      set-option -g repeat-time 0
    '';
    newSession = true;
    prefix = "C-a";
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavour 'mocha'";
      }
      tmuxPlugins.cpu
    ];
    shortcut = "a";
    terminal = "tmux-256color";
  };
}
