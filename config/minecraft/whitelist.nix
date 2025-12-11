{ lib, self, ... }:
{
    # Get UUID from https://mcuuid.net/
    services.minecraft-server.whitelist = {
        # Antonio
        Zack_Sousa = "b5d43927-077d-414a-a747-ecf057de3125";
        # Valedo
        DESTROYER5156 = "5fc3d77f-e237-470b-9ead-171cf248698c";
    };
}
