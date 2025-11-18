{ pkgs, ... }:
{
  users = {
    users.admin = {
      isNormalUser = true;
      description = "Administrô";
      extraGroups = [
        "wheel"
      ];
      shell = pkgs.fish;
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAilxUfZRgFyrYKgIyPFyL0tqIBLHNdQEzV4tzFdWYoP my-nixos-server-key"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE4L3orN6izro3j6pfJy7vQ724wyS2Y+lpASapZ6VRsZ minecraft-server"
      ];
    };
  };

}
