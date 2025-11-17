{ lib, self, ... }:
{
    programs.appimage = {
        enable = true;
        binfmt = true;
    };
}
