{ pkgs, ... }: {
  #home.file.".local/bin/ff2mpv.py" = {
  home.packages = [
    (pkgs.writeTextFile {
      name = "ff2mpv.py";
      destination = "/bin/ff2mpv.py";
      executable = true;
      text = ''
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
            args = ["${pkgs.mpv}/bin/mpv", "--no-terminal", "--", url]
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
    })
  ];
}
