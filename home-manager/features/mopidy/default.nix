{ pkgs, ... }: {

  home.packages = with pkgs; [ snapcast librespot ];

  services.mopidy = {
    enable = false;
    extensionPackages = with pkgs; [
      mopidy-iris
      mopidy-mpd
      mopidy-mpris
      mopidy-muse
      mopidy-local
    ];
    settings = {
      file = {
        media_dirs =
          [ "$XDG_MUSIC_DIR|~/Music|/home/nokogiri/Music" "~/library|Library" ];
        follow_symlinks = true;
        excluded_file_extensions = [ ".html" ".zip" ".jpg" ".jpeg" ".png" ];
      };
      audio = {
        output =
          "audioresample ! audioconvert ! audio/x-raw,rate=48000,channels=2,format=S16LE ! filesink location=/tmp/snapfifo";
      };
    };
  };
}
