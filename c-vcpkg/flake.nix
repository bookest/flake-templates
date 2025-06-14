{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};
    in {
      devShells.default = pkgs.mkShell {
        name = "c-vcpkg";
        buildInputs = [
          pkgs.clang
          pkgs.cmake
          pkgs.vcpkg
        ];
        shellHook = ''
          export VCPKG_ROOT="${pkgs.vcpkg}/share/vcpkg"
        '';
      };
    });
}
