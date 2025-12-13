{ lib, ... }:
let
    scanEntries = path:
        let
            entries = builtins.readDir path;
            nixImports = lib.filterAttrs (
                name: _: name != "default.nix"
            ) entries;
        in
            lib.mapAttrsToList (name: _: path + "/${name}") nixImports;
in
{
  imports = scanEntries ./.;
}
