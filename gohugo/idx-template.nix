{ pkgs, ... }: {
  packages = [
  pkgs.go
  pkgs.hugo
  pkgs.nodejs_20
  pkgs.tailwindcss
  ];
  bootstrap = ''
    mkdir "$out"
    chmod -R +w "$out"
    hugo new site "$out"
    cp -r ${./blog_simple} "$out"/themes/blog_simple
    cp -r ${./hugo.toml} "$out"/hugo.toml
    cp -r ${./content} "$out"/content
    mkdir -p "$out"/.idx
    cp ${./dev.nix} "$out"/.idx/dev.nix
    cp ${./icon.png} "$out"/.idx/icon.png
    cd "$out"/themes/blog_simple; tailwindcss init
  '';
}
