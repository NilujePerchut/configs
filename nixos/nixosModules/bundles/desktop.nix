{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {

  # We are using the lxde polkit agent
  security.polkit.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;

  programs = {
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };

  # Enable opengl
  hardware.graphics = {
    enable = true;
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "fr";
    xkb.variant = "";
    videoDrivers = [ "displaylink" "modesettings" ];
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    displayManager.sessionCommands = ''
      ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
    '';
  };

  security.pam.services.swaylock = {};

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.gnome = {
    gnome-keyring.enable = true;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

  programs.dconf = {
    enable = true;
  };

  fonts.packages = with pkgs; [
    #noto-fonts
    #(nerdfonts.override { fonts = [ "Noto" "Iosevka"]; })
    pkgs.nerd-fonts.noto
    pkgs.nerd-fonts.iosevka
  ];

  environment.systemPackages = with pkgs; [
    # Wayland
    wayland
    waydroid
    arandr

    # Hyprland
    hyprland
    waybar
    dunst
    libnotify
    kitty
    rofi-wayland
    wev
    nemo-with-extensions
    pavucontrol
    bluez
    swaylock-effects
    arandr
    waybar
    networkmanagerapplet
    brightnessctl
    gsimplecal
    grim
    slurp
    hyprpicker
    jq
    waypaper
    swaybg
    wl-clipboard

    gparted

    lxqt.lxqt-policykit

    firefox
    chromium
    kdePackages.okular
  ];
}
