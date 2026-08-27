{ pkgs, config, lib, inputs, ... }:
let
    whitelistPath = config.sops.secrets.minecraft_server_whitelist.path;
    seedPath = config.sops.secrets.minecraft_server_seed.path;
in
{
    services.minecraft-server = {
        enable = true;
        eula = true;
        # package = pkgs.papermcServers.papermc-1_21_9;
        # package = inputs.nix-minecraft.legacyPackages.x86_64-linux.fabricServers.fabric-26_2;
        package = inputs.nix-minecraft.legacyPackages.x86_64-linux.fabricServers.fabric-1_21_9;
        openFirewall = true; # Opens the port the server is running on (by default 25565 but in this case 43000)
        declarative = true;
        serverProperties = {
            server-port = 43000;
            difficulty = 3;
            gamemode = 0;
            max-players = 10;
            motd = "PUCraft!";
            white-list = true;
            allow-cheats = true;
            view-distance=16;
            enforce-whitelist = true;
            hide-online-players = true;
            level-seed = 100001081160328852;
        };
        jvmOpts = "-Xms2048M -Xmx8192M";
        # Get UUID from https://mcuuid.net/
        whitelist = {
            Zack_Sousa = "b5d43927-077d-414a-a747-ecf057de3125";
            Telecuteo = "ea34636a-5d13-47ad-8ef5-037ea0c2c3d7";
            K3jira = "1ee6d080-ae42-41ff-ac3c-c6ed03180245";
            elmo_000_ = "5dda52f5-c728-4531-b8d5-aeea3fd504d5";
            GaBeeDrumond = "c77e98be-dcd6-4b44-8073-10fa81e7e607";
        };
    };

    systemd.timers.minecraft-restart = {
        description = "Restart Minecraft server daily";
        wantedBy = [ "timers.target" ];
        timerConfig = {
            OnCalendar = "*-*-* 04:15:00";
            Persistent = true;
        };
    };

    systemd.services.minecraft-restart = {
        description = "Restart Minecraft server";
        serviceConfig = {
            Type = "oneshot";
            ExecStart = "${pkgs.systemd}/bin/systemctl restart minecraft-server";
        };
    };

    /*
    systemd.services.minecraft-server.preStart = lib.mkAfter ''
        ln -sf ${whitelistPath} whitelist.json

        if [ -L server.properties ]; then
            cp --remove-destination "$(readlink -f server.properties)" server.properties.tmp
            mv server.properties.tmp server.properties
            chmod 600 server.properties
        fi

        sed -i '/^level-seed=/d' server.properties

        echo "" >> server.properties
        echo "level-seed=$(cat ${seedPath})" >> server.properties
    '';
    */
}
