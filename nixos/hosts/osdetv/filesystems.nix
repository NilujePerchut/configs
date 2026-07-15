{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: let

  # Needs a derivation for snapraid because its new default way to detect
  # smartctl is not compatible.
  # Kids, do not reproduce it at home
  my_snapraid = pkgs.stdenv.mkDerivation {
    pname = "my_snapraid";
    version = "master";

    src = pkgs.fetchFromGitHub {
      owner = "amadvance";
      repo = "snapraid";
      rev = "8a2ccdee8c91cf456ac5ff7451842ddc54a222cb";
      hash = "sha256-Zi4FopMulKjvNPiboQRlybnnSx3SVGqc7lICW5mQEBc=";
    };

    env.VERSION = "master";

    doCheck = true;

    nativeBuildInputs = [
      pkgs.autoreconfHook
      pkgs.smartmontools
      pkgs.breakpointHook
    ];

    configureFlags = [
      "--enable-option-checking=fatal"
      "--with-smartctl=${pkgs.smartmontools}/bin/smartctl"
    ];

    meta = {
      homepage = "http://www.snapraid.it/";
      downloadPage = "https://github.com/amadvance/snapraid/releases";
      description = "Backup program for disk arrays (custom version)";
      license = lib.licenses.gpl3Plus;
      mainProgram = "snapraid";
    };
  };

  snapraidd = pkgs.stdenv.mkDerivation {
    pname = "snapraidd";
    version = "1.14";

    src = pkgs.fetchzip {
      url = "https://github.com/amadvance/snapraid-daemon/releases/download/v1.14/snapraid-daemon-1.14.tar.gz";
      sha256 = "sha256-FULXcQ4lmOicUbhbLVkQkfvscFFLn3uw6iWe6+vFQ+8=";
    };

    buildInputs = [ pkgs.zip ];

    meta = with pkgs.lib; {
      description = "snapraidd";
      homepage = "https://www.snapraid.it/ui";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };
  };

in {
  programs.fuse.userAllowOther = true;

  environment.systemPackages = with pkgs; [
    gptfdisk
    parted
    smartmontools
    my_snapraid
    snapraidd
    mergerfs
    mergerfs-tools
  ];

  # This fixes the weird mergerfs permissions issue
  #boot.initrd.systemd.enable = true;

  # MergerFS + Snapraid config:
  #  3 data disk labelled Data1 to Data3
  #  2 parity disk labelled Parity1 to Parity2

  fileSystems."/mnt/data1" = {
    device = "/dev/disk/by-label/disk1";
    fsType = "ext4";
  };

  fileSystems."/mnt/data2" = {
    device = "/dev/disk/by-label/disk2";
    fsType = "ext4";
  };

  fileSystems."/mnt/data3" = {
    device = "/dev/disk/by-label/disk3";
    fsType = "ext4";
  };

  fileSystems."/mnt/parity1" = {
    device = "/dev/disk/by-label/disk4";
    fsType = "ext4";
  };

  fileSystems."/mnt/parity2" = {
    device = "/dev/disk/by-label/disk5";
    fsType = "ext4";
  };

  fileSystems."/mnt/mergerfs" = {
    device = "/mnt/data*";
    options = [
      "defaults"
      "allow_other"
      "moveonenospc=1"
      "func.getattr=newest"
      "fsname=mergerfs"
      "uid=1000"
      "gid=100"
      "umask=002"
      "x-mount.mkdir"
    ];
    fsType = "mergerfs";
  };

  services.snapraid = {
    enable = true;
    parityFiles = [ "/mnt/parity1/snapraid.parity"
                    "/mnt/parity2/snapraid.parity" ];
    contentFiles = [
      "/mnt/data1/snapraid.content"
      "/mnt/data2/snapraid.content"
      "/mnt/data3/snapraid.content"
    ];
    dataDisks = {
      d1 = "/mnt/data1";
      d2 = "/mnt/data2";
      d3 = "/mnt/data3";
    };
  };

  system.activationScripts.setupSnapraiddConfig = ''
    mkdir -p /etc
    cat > /etc/snapraidd.conf <<EOF
    net_enabled = 1

    # Listen on localhost and the host's LAN IP
    net_port = 127.0.0.1:7627,192.168.40.66:7627
    net_acl = +192.168.40.0/24

    # Enable full config access from the web interface
    net_config_full_access = 1

    sys_engine = /run/current-system/sw/bin/snapraid
    sys_log_directory = /home/niluje/configs/nixos/hosts/osdetv/logs

    net_web_root = ${snapraidd}/share/snapraidd/commander.zip
    EOF
  '';

  systemd.tmpfiles.rules = [
    "f /etc/snapraidd.conf 0644 root root -"
  ];

  systemd.services."snapraidd" = {
    description = "Snapraidd ui deamon";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    enable = true;
    serviceConfig = {
      User = "root";
      Restart = "always";
      ExecStart = "${snapraidd}/bin/snapraidd -c /etc/snapraidd.conf";
    };
  };
}
