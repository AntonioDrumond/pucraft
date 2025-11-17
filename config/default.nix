{ lib, self, ... }:
{
  imports = [
    ./pkgs

    ./hardware-configuration.nix
    ./system.nix
    ./users.nix
    ./localization.nix
    ./audio.nix
    ./sh.nix
    ./ssh.nix
  ];
}
