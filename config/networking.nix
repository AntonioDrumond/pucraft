{ pkgs, ... }:
{
    services.tailscale = { 
        enable = true;
    };

    networking = {
        hostName = "pucraft";
        networkmanager.enable = true;
        firewall.allowedTCPPorts = [ 43000 ];
        firewall.trustedInterfaces = [ "wlp2s0" ];
        interfaces.wlp2s0.ipv4.addresses = [{
            address = "192.168.0.197";
            prefixLength = 24;
        }];
    };

    systemd.services.router-heartbeat = {
        description = "Ping Gateway to prevent ARP/NAT Timeout";
        after = [ "network.target" ];
        wantedBy = [ "multi-user.target" ];
        serviceConfig = {
            ExecStart = "${pkgs.iputils}/bin/ping -i 15 192.168.0.1";
            Restart = "always";
            User = "root";
        };
    };
}
