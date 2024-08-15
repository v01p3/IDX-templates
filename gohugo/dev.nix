{pkgs}: {
  channel = "stable-23.11";
  packages = [
    pkgs.go
    pkgs.hugo
    pkgs.git
    pkgs.nodejs_20
    pkgs.nodePackages.pnpm
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
