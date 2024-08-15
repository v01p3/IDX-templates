{ pkgs, ... }: {
  packages = [
  pkgs.go
  pkgs.hugo
  pkgs.nodejs_20
  pkgs.tailwindcss
  ];
  bootstrap = ''
    hugo new site "$WS_NAME"
    cp -r ${./blog_simple} "$WS_NAME/themes/blog_simple"
    cp -r ${./hugo.toml} "$WS_NAME/hugo.toml"
    cp -r ${./content} "$WS_NAME/content"
   
    mkdir "$WS_NAME/.idx"
    cp -rf ${./dev.nix} "$WS_NAME/.idx/dev.nix"
    cp -rf ${./icon.png} "$WS_NAME/.idx/icon.png"
    chmod -R +w "$WS_NAME"
    cd "$WS_NAME"; tailwindcss init
    mv "$WS_NAME" "$out"
  '';
}
