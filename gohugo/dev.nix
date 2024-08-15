# .idx/dev.nix
{pkgs}: {
  channel = "stable-23.11";
  packages = [
    pkgs.go
    pkgs.hugo
  ];
  idx = {
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        # Open editors for the following files by default, if they exist.
        # The last file in the list will be focused.
        default.openFiles = [
          
        ];
        # Include other scripts here, as needed, for example:
        # installDependencies = "npm install";
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
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
