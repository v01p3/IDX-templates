{pkgs}: {
  channel = "stable-23.11";
  packages = [
    pkgs.go
    pkgs.hugo
    pkgs.git
  ];
  idx = {
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["hugo" "server" "-D" "-p" "$PORT" "--bind" "0.0.0.0"];
          manager = "web";
        };
      };
    };
  };
}
