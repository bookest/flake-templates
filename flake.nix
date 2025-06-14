{
  description = "bookest's flake templates";

  outputs = { self, ... }:
    {
      templates = {
        c-vcpkg = {
          path = ./c-vcpkg;
          description = "Minimal C application using clang, cmake, and vcpkg";
        };

        python-venv = {
          path = ./python-venv;
          description = "Python venv devShell";
       };

       java-gradle = {
         path = ./java-gradle;
         description = "Java 21 and Gradle devShell";
       };
    };
  };
}
