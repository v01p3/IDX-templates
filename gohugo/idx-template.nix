{ pkgs, ... }: {
  packages = [
  pkgs.go
  pkgs.hugo
  pkgs.nodejs_20
  ];
  bootstrap = ''
    mkdir "$out"
    hugo new site "$out"
    cp -r ${./blog_simple} "$out"/themes/blog_simple
    cp -r ${./hugo.toml} "$out"/hugo.toml
    cp -r ${./content} "$out"/content
    mkdir -p "$out"/.idx
    cp ${./dev.nix} "$out"/.idx/dev.nix
    cp ${./icon.png} "$out"/.idx/icon.png
    cd "$out"/themes/blog_simple; npm init -y && npm install -D tailwindcss && npx tailwindcss init
    chmod -R +w "$out"
  '';
}
