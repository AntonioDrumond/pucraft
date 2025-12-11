{
    description = "NixOS System Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
        # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        # nixvim.url = "github:AntonioDrumond/nixvim";
        nvf = {
            url = "github:notashelf/nvf";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-minecraft = {
            url = "github:Infinidoge/nix-minecraft";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        { nixpkgs, nvf, nix-minecraft, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in
        {
            nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    # Import configuration
                    ./config
                    # NVF module and config file
                    nvf.nixosModules.default
                    ./nvf.nix

                    # Minecraft modules
                    nix-minecraft
                    /*
                    {
                      nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];
                    }
                    */
                ];
            };
        };
}
