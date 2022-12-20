{ pkgs, lib, inputs, ... }:

let addons = inputs.firefox-addons.packages.${pkgs.system};
in {
  home.file = {
    ".mozilla/native-messaging-hosts/ff2mpv.json".text = ''
      {
        "name": "ff2mpv",
        "description": "ff2mpv's external manifest",
        "path": "/home/nokogiri/.local/bin/ff2mpv.py",
        "type": "stdio",
        "allowed_extensions": ["ff2mpv@yossarian.net"]
      }
    '';
    ".local/bin/ff2mpv.py".executable = true;
    ".local/bin/ff2mpv.py".text = ''
      #!/usr/bin/env python3

      import json
      import os
      import platform
      import struct
      import sys
      import subprocess

      def main():
          message = get_message()
          url = message.get("url")
          args = ["mpv", "--no-terminal", "--", url]
          kwargs = {}
          subprocess.Popen(args, **kwargs)

          send_message("ok")

      def get_message():
          raw_length = sys.stdin.buffer.read(4)
          if not raw_length:
              return {}
          length = struct.unpack("@I", raw_length)[0]
          message = sys.stdin.buffer.read(length).decode("utf-8")
          return json.loads(message)

      def send_message(message):
          content = json.dumps(message).encode("utf-8")
          length = struct.pack("@I", len(content))
          sys.stdout.buffer.write(length)
          sys.stdout.buffer.write(content)
          sys.stdout.buffer.flush()

      if __name__ == "__main__":
          main()
    '';
  };

  programs.firefox = {
    enable = true;
    extensions = with addons; [
      vimium
      ublock-origin
      tree-style-tab
      stylus
      sponsorblock
      refined-github
      #onetab
      netflix-1080p
      gopass-bridge
      ff2mpv
      darkreader
    ];
    profiles.nokogiri = {
      name = "nokogiri";
      path = "nokogiri";
      bookmarks = { };
      id = 0;
      isDefault = true;
      settings = {
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "identity.fxaccounts.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "dom.security.https_only_mode" = false;
        #"signon.rememberSignons" = false;
        "browser.topsites.blockedSponsors" = ''["amazon"]'';
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.disableResetPrompt" = true;
        "media.hardwaremediakeys.enabled" = true;
        #"browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":["ublock0_raymondhill_net-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","downloads-button","library-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":17,"newElementCount":3}'';
      };
    };
    profiles.private = {
      name = "private";
      path = "private";
      bookmarks = { };
      id = 1;
      settings = {
        "browser.startup.homepage" = "https://start.duckduckgo.com";
        "identity.fxaccounts.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "dom.security.https_only_mode" = true;
        #"signon.rememberSignons" = false;
        "browser.topsites.blockedSponsors" = ''["amazon"]'';
        "browser.shell.checkDefaultBrowser" = false;
        "browser.shell.defaultBrowserCheckCount" = 1;
        "browser.disableResetPrompt" = true;
        #"browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":["ublock0_raymondhill_net-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","home-button","urlbar-container","downloads-button","library-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","ublock0_raymondhill_net-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","widget-overflow-fixed-list"],"currentVersion":17,"newElementCount":3}'';
      };

    };
  };
}
