{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  services.jellyfin = {
    enable = true;
    user = "niluje";
  };

  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];

  systemd.services.jellyfin = {
      wants = [
        "mnt-music.mount"
        "mnt-video.mount"
      ];
  };

  # Mount Music folder
  fileSystems."/mnt/music" = {
    device = "niluje@vmshare2:/sftp/niluje/vmshare2/music";
    fsType = "sshfs";
    options = [
      "nodev"
      "noatime"
      "allow_other"
      "user"
      "IdentityFile=/home/niluje/.ssh/id_ed25519"
      "ConnectTimeout=20"
    ];
  };

  # Mount Video folder
  fileSystems."/mnt/video" = {
    device = "niluje@vmshare2:/sftp/niluje/vmshare2/video";
    fsType = "sshfs";
    options = [
      "nodev"
      "noatime"
      "allow_other"
      "user"
      "IdentityFile=/home/niluje/.ssh/id_ed25519"
      "ConnectTimeout=20"
    ];
  };
}
