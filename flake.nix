{
  description = "bookest's flake templates";

  outputs = { self, ... }:
    {
      templates = {
        c-vcpkg = {
          path = ./c-vcpkg;
          description = "Minimal C application using clang, cmake, and vcpkg";
        };
      };
    };
}
