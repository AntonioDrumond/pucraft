{ ... }:
{
    services.tailscale = { 
        enable = true;
    };

    networking = {
        hostName = "pucraft";
        networkmanager.enable = true;
        firewall.allowedTCPPorts = [ 43000 ];
    };
}
