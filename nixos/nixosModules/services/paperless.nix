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

  services.paperless = {
    enable = true;
    port = 9091;
    address = "0.0.0.0";
    dataDir = "/mnt/data/paperless/data";
    mediaDir = "/mnt/data/paperless/media";
    consumptionDir = "/mnt/data/paperless/consumption";
    consumptionDirIsPublic = true;
  };

  systemd.services.paperless = {
      wants = [ "mnt-data.mount" ];
  };

  environment.systemPackages = with pkgs; [
    paperless-ngx
    rsync
  ];

  systemd.timers."paperless-backup" = {
  wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar="Mon..Sun *-*-* 3:00:00";
      Unit = "paperless-backup.service";
    };
  };

  systemd.services."paperless-backup" = {
    path = [
      pkgs.openssh
    ];
    script = ''
      set -eu
      TMP_DIR=/tmp/paperless
      DIST_DIR=/volume1/server/paperless/
      rm -rf "$TMP_DIR"
      mkdir "$TMP_DIR"

      # Export paperless data
      /mnt/data/paperless/data/paperless-manage document_exporter --no-progress-bar --zip "$TMP_DIR"

      # Make it niluje's property
      chown -R niluje:users "$TMP_DIR"
      chmod -R u+rwx "$TMP_DIR"

      # Get the name of the archive
      export_name=$(ls $TMP_DIR)

      # Copy it to the backup
      scp -i /home/niluje/.ssh/id_ed25519 -O "$TMP_DIR/$export_name" "niluje@vmshare:$DIST_DIR/"
    '';
    enable = true;
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
