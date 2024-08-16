{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  services.cockpit = {
    enable = true;
    port = 9090;
    settings = {
      WebService = {
        AllowUnencrypted = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    freshrss
  ];
}
