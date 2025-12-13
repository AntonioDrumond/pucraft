{ pkgs, ... }:
{
    nixpkgs.config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "ventoy-1.1.05" ];
    };

    environment.systemPackages = with pkgs; [

        #CLI -> Essential
        vim
        git
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
