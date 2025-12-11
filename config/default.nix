{ lib, self, ... }:
{
  imports = [
    ./pkgs
    ./minecraft

    ./networking.nix
    ./hardware-configuration.nix
    ./system.nix
    ./users.nix
    ./localization.nix
    ./audio.nix
    ./sh.nix
    ./ssh.nix
  ];
}
