{ pkgs, ... }: {
  packages = [
  pkgs.go
  pkgs.hugo
  ];
  bootstrap = ''
    hugo new site "$out"
    cp -rf ${./blog_simple} "$out"/themes/blog_simple
    cp -rf ${./hugo.toml} "$out"/hugo.toml
    cp -rf ${./content} "$out"/content

    mkdir -p "$out"/.idx
    cp -rf ${./dev.nix} "$out"/.idx/dev.nix
    cp -rf ${./icon.png} "$out"/.idx/icon.png
  '';
}
