{ inputs, ... }:
{
    services.minecraft-server = {
        enable = true;
        eula = true;
        # package = pkgs.papermcServers.papermc-1_21_9;
        package = inputs.nix-minecraft.legacyPackages.fabricServers.fabric-1_21_9;
        openFirewall = true; # Opens the port the server is running on (by default 25565 but in this case 43000)
        declarative = true;
        serverProperties = {
            server-port = 43000;
            difficulty = 3;
            gamemode = 0;
            max-players = 2;
            motd = "PUCraft!";
            white-list = true;
            allow-cheats = true;
            view-distance=16;
            enforce-whitelist = true;
            hide-online-players = true;
        };
        jvmOpts = "-Xms2048M -Xmx8192M";
    };
}

