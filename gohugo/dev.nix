{pkgs}: {
  channel = "stable-23.11";
  packages = [
    pkgs.go
    pkgs.hugo
    pkgs.git
    pkgs.nodejs_20
  ];
  idx = {
    workspace.onCreate = {
      npm-init = "npm init -y"
      npm-install-tailwindcss = "npm install -D tailwindcss"
      npx-tailwind-init = "npx tailwindcss init"
    };
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
