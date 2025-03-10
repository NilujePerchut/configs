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
      NUMBER_OF_KEPT_FILES=5
      TMP_DIR=/tmp/paperless
      DIST_DIR=/sftp/niluje/vmshare2/files/server/paperless
      SSH_COMMON=niluje@vmshare2

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
      scp -i /home/niluje/.ssh/id_ed25519 -O $TMP_DIR/$export_name "niluje@vmshare2:$DIST_DIR/"

      # Suppress old saves, only keep last $NUMBER_OF_KEPT_FILE
      all_files=$(ssh -i /home/niluje/.ssh/id_ed25519 $SSH_COMMON ls $DIST_DIR)
      all_files_len=$(ssh -i /home/niluje/.ssh/id_ed25519 $SSH_COMMON wc -w <<< $all_files)
      let "nb_files_to_suppress=$all_files_len - $NUMBER_OF_KEPT_FILES"
      if [ "$nb_files_to_suppress" -gt 0 ]; then
        files_to_suppress=$(ssh -i /home/niluje/.ssh/id_ed25519 "$SSH_COMMON" ls -t $DIST_DIR | tail -n"$nb_files_to_suppress")
        for file in $files_to_suppress; do
          ssh -i /home/niluje/.ssh/id_ed25519 "$SSH_COMMON" rm $DIST_DIR/$file
        done
      fi

      # For a reason, the data dir changes its rights after some times.
      # Make it accessible for anybody
      chmod -R ugo+rwx /mnt/data/paperless
    '';
    enable = true;
    serviceConfig = {
      Type = "oneshot";
      User = "root";
    };
  };
}
