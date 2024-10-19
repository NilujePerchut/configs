{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  virtualisation.oci-containers = {
    backend = "podman";
    containers.homeassistant = {
      volumes = [ "home-assistant:/config" ];
      environment.TZ = "Europe/Paris";
      image = "ghcr.io/home-assistant/home-assistant:stable";
      extraOptions = [
        "--network=host"
# Activate this option when the zigbee adapter will be plugged
#        "--device=/dev/ttyACM0:/dev/ttyACM0"
      ];
    };
  };
}
