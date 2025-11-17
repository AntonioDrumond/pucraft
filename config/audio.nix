{ lib, self, ... }:
{
    security.rtkit.enable = false;
    services = {
        pipewire = {
            enable = false;
            alsa.enable = false;
            alsa.support32Bit = false;
            pulse.enable = false;
            jack.enable = false;
            wireplumber.enable = false;
        };
    };

    hardware.enableAllFirmware = true;
    /*
    boot.extraModprobeConfig = ''
        options snd-intel-dspcfg dsp_driver=1
    '';
    */

}
    
