# .idx/dev.nix
{pkgs}: {
  ...
  idx = {
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created with this `dev.nix` file
      onCreate = {
        # Open editors for the following files by default, if they exist.
        # The last file in the list will be focused.
        default.openFiles = [
          "src/index.css"
          "src/index.js"
          "src/index.html"
        ];
        # Include other scripts here, as needed, for example:
        # installDependencies = "npm install";
      };
      # To run something each time the workspace is (re)started, use the `onStart` hook
    };
    # Enable previews and customize configuration
    previews = { ... };
  };
}
