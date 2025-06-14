{
  description = "Python venv development template";

  inputs = {
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    utils,
    ...
  }:
    utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
      pythonPackages = pkgs.python3Packages;
    in {
      devShells.default = pkgs.mkShell {
        name = "python-venv";
        venvDir = "./.venv";
        buildInputs = [
          pythonPackages.python
          pythonPackages.venvShellHook

          # Add any additional dependencies that we would like to pull in from
          # nixpkgs in the venv.
          # pythonPackages.numpy
        ];
        postVenvCreation = ''
          # allow pip to install wheels
          unset SOURCE_DATE_EPOCH
          pip install -r requirements.txt
        '';
        postShellHook = ''
          # allow pip to install wheels
          unset SOURCE_DATE_EPOCH
        '';
      };
    });
}
