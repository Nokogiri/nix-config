{ config, pkgs, user, ... }: {
  xdg.configFile."zsh/zgenom-setup".source = ./zsh-zgenom;
  programs = {
    zsh = {
      dotDir = ".config/zsh";
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
      autocd = true;
      initExtraFirst = ''
        WORDCHARS=""
      '';
      initExtra = ''
        source $ZDOTDIR/zgenom-setup

        export COMPLETION_WAITING_DOTS="true"

        setopt correct
        unsetopt correctall
        # Miscellaneous settings
        #setopt INTERACTIVE_COMMENTS  # Enable comments in interactive shell.

        setopt extended_glob # Enable more powerful glob features

        # Long running processes should return time after they complete. Specified
        # in seconds.
        REPORTTIME=2
        TIMEFMT="%U user %S system %P cpu %*Es total"

        autoload -U zmv

        ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)

        setopt hist_verify
        setopt INC_APPEND_HISTORY
        unsetopt BEEP
        setopt hist_expire_dups_first
        setopt hist_ignore_all_dups


        # Add some completions settings
        setopt ALWAYS_TO_END     # Move cursor to the end of a completed word.
        setopt AUTO_LIST         # Automatically list choices on ambiguous completion.
        setopt AUTO_MENU         # Show completion menu on a successive tab press.
        setopt AUTO_PARAM_SLASH  # If completed parameter is a directory, add a trailing slash.
        setopt COMPLETE_IN_WORD  # Complete from both ends of a word.
        unsetopt MENU_COMPLETE   # Do not autoselect the first completion entry.


        if test -n "$KITTY_INSTALLATION_DIR"; then
          export KITTY_SHELL_INTEGRATION="enabled"
          autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
          kitty-integration
          unfunction kitty-integration
        fi
      '';
      history = {
        expireDuplicatesFirst = true;
        extended = true;
        ignoreDups = true;
        ignoreSpace = true;
        path = "${config.xdg.configHome}/zsh/zsh_history";
        save = 100000;
        share = true;
        size = 100000;
      };
      #localVariables = { POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD = true; };
      #oh-my-zsh = { enable = true; };
      #profileExtra = ''
      #  export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
      #'';
      shellAliases = {
        sys = "doas systemctl";
        sysu = "systemctl --user";
      };
    };
  };
}
