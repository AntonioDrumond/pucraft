{ ... }:
{
  services.tailscale.enable = true;

  networking = {
    hostName = "pucraft";
    allowedTCPPorts = [ ];
    interfaces."tailscale0".allowedTCPPorts = [ 22 ];
  };
}
