{ ... }:
{
  services.tailscale.enable = true;

  networking = {
    hostName = "pucraft";
    networkmanager.enable = true;
    allowedTCPPorts = [ ];
    interfaces."tailscale0".allowedTCPPorts = [ 22 ];
  };
}
