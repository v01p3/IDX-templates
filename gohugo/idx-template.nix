{ pkgs, ... }: {
  packages = [
  pkgs.go
  pkgs.hugo
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
    chmod -R +w "$out"
  '';
}
