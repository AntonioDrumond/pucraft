{ pkgs, lib, self, ... }:
{
    services.minecraft-server = {
        enable = true;
        eula = true;
        package = pkgs.papermcServers.papermc-1_21_9;
        openFirewall = true; # Opens the port the server is running on (by default 25565 but in this case 43000)
        declarative = true;
        serverProperties = {
            server-port = 43000;
            difficulty = 3;
            gamemode = 1;
            max-players = 1;
            motd = "PUCraft!";
            white-list = true;
            allow-cheats = true;
        };
        jvmOpts = "-Xms2048M -Xmx8192M";
    };
}

