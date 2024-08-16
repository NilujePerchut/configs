{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  # Disable DNSStubListener need to access service behind a Wireguard VPN
  services.resolved = {
    extraConfig = ''
      DNSStubListener=no
    '';
  };

  environment.etc."paperless-admin-pass".text = "admin";
  services.paperless = {
    enable = true;
    port = 9091;
    address = "0.0.0.0";
    passwordFile = "/etc/paperless-admin-pass";
  };

  environment.systemPackages = with pkgs; [
    paperless-ngx
  ];
}
