{ system ? builtins.currentSystem
}:

(builtins.getFlake (toString ./.)).legacyPackages.${system}.plutus-hello.project
