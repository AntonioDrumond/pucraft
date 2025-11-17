{ ... }:
{
  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        UseDns = true;
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        X11Forwarding = false;
        PermitRootLogin = "no";
        AllowUsers = [ "admin" ];
      };
    };

    fail2ban = {
      enable = true;
      maxentry = 5;
      bantime = "1m";
    };
  };
}
