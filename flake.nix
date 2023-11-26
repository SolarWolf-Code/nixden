{
  # inputs are your dependencies
  inputs = {
    # main nixpkgs
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-23.05";
    # flake parts is a helper library that makes flakes less verbose
    # and easier to organize
    flake-parts.url = "github:hercules-ci/flake-parts/";
  };

  outputs = {self, flake-parts, nixpkgs, ...} @ inputs:
    # call main flake parts function
    flake-parts.lib.mkFlake {inherit inputs;} {
      # the systems you want to output
      systems = ["x86_64-linux"];
      # outputs for each system
      perSystem = {pkgs, ...}: {
        # dev shell that is loaded when doing `nix develop`
        # this is useful for having some probgrams to manage your system
        # like having `just` to run command recipies
        devShells.default = pkgs.mkShell {
          name = "nixden";
          # list packages that should be in the devshell here
          packages = with pkgs; [
            hello
          ];
        };
      };
      flake = {
        # various nixos hosts here
        # note that the name here should match your hostname
        nixosConfigurations = {
          wolftop = nixpkgs.lib.nixosSystem {
            # this passes `inputs` to all out nixos modules
            # this is very convient as it lets us access things within them
            # for example another nixpkgs revision
            specialArgs = {
              inherit inputs;
            };

            # list of modules to load; not that if that module imports another module
            # you don't need to load it again here
            modules = [
              ./os/configuration.nix
            ];
          };
        };
      };
    }; 
}