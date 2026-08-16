{ ... }:
{
    boot.loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
    };

    environment.sessionVariables = {
        # NIXOS_OZONE_WL = "1";
        # GDK_BACKEND = "wayland,x11";
        # GDK_SCALE = 1;
        # QT_SCALE_FACTOR = "1.0";
        # QT_QPA_PLATFORM = "wayland;xcb";
        # QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    services = {
        thermald.enable = true;
        # printing.enable = true;
        logind.settings.Login.HandlePowerKey = "suspend";
    };

    hardware = {
        # Drawing tablet driver
        # opentabletdriver.enable = true;
        # Brightness control
        brillo.enable = true;
    };

    # Bluetooth
    services.blueman.enable = false;
    hardware.bluetooth = {
        enable = false;
        powerOnBoot = false;
        input.General.ClassicBondedOnly = false;
    };

    # DO NOT CHANGE
    system.stateVersion = "26.05"; # Did you read the comment?
}
    
