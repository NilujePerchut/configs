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
    dataDir = "/mnt/paperless/data";
    mediaDir = "/mnt/paperless/media";
    consumptionDir = "/mnt/paperless/consumption";
    consumptionDirIsPublic = true;
  };

  systemd.services.paperless = {
      wants = [ "mnt-paperless.mount" ];
  };

  environment.systemPackages = with pkgs; [
    paperless-ngx
  ];

  # Paperless-ngx data are mounted from an sshfs point on wmShare
  fileSystems."/mnt/paperless" = {
    device = "niluje@192.168.40.63:/server/paperless";
    fsType = "sshfs";
    options = [
      "nodev"
      "noatime"
      "allow_other"
      "IdentityFile=/home/niluje/.ssh/id_ed25519"
    ];
  };
}
