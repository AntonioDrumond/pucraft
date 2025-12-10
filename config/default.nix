{ lib, self, ... }:
{
  imports = [
    ./pkgs
    ./networking.nix
    ./hardware-configuration.nix
    ./system.nix
    ./users.nix
    ./localization.nix
    ./audio.nix
    ./sh.nix
    ./ssh.nix
    ./minecraft.nix
  ];
}
