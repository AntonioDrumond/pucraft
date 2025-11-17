{ lib, self, ... }:
{
    services.flatpak = {
        enable = false;
        packages = [
            # { appId = "net.waterfox.waterfox"; origin = "flathub"; }
        ];
    };

    programs.appimage = {
        enable = true;
        binfmt = true;
    };
}
