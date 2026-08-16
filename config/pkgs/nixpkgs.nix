{ pkgs, ... }:
{
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "ventoy-1.1.12" ];
    };

    environment.systemPackages = with pkgs; [

        #CLI -> Essential
        vim
        git
        gh
        fzf
        zip
        unzip
        rar
        unrar
        killall

        #CLI -> Pretty and shiny :D
        bat
        tree
        eza
        fastfetch

        #Hardware/Libs
        fan2go
        btop

        noip
        sops
    ];


    nix = {
        settings.experimental-features = [
            "nix-command"
            "flakes"
        ];
    };
}
