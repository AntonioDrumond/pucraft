{ inputs, ... }:
{
    imports = [
        inputs.sops-nix.nixosModules.sops
    ];

    sops = {
        defaultSopsFile = "${inputs.self}/secrets/secrets.yaml";
        defaultSopsFormat = "yaml";
        age.keyFile = "/home/admin/.config/sops/age/keys.txt";

        secrets.minecraft_server_whitelist = { 
            owner = "minecraft";
            group = "minecraft";
        };

        secrets.minecraft_server_seed = {
            owner = "minecraft";
            group = "minecraft";
        };
    };
}
