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
      npm-init = "cd themes/blog_simple && npm init -y"
      install-tailwind = "cd themes/blog_simple && npm install -D tailwindcss"
      tailwind-init = "cd themes/blog_simple && npx tailwindcss init"
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
