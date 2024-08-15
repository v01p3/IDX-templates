# No user-configurable parameters
{ pkgs, ... }: {
  packages = [
  pkgs.go
  pkgs.hugo
  ];
  # Shell script that produces the final environment
  bootstrap = ''
    mkdir "$out"
    # Copy the folder containing the `idx-template` files to the final
    # project folder for the new workspace. ${./.} inserts the directory
    # of the checked-out Git folder containing this template.
    hugo new site "$out"
    cp -r ${./papermod} "$out"/themes/papermod
    echo "theme = 'papermod'" >> "$out"/hugo.toml
    mkdir -p "$out"/.idx
    cp ${./dev.nix} "$out"/.idx/dev.nix

    # Set some permissions

    # Remove the template files themselves and any connection to the template's
    # Git repositor
  '';
}
