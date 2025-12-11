{ lib, self, ... }:
{
    imports = [
        ./minecraft.nix
        ./whitelist.nix
        ./secrets.nix
    ];
}
