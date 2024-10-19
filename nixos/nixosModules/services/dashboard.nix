{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  services.homepage-dashboard = {
    enable = true;

    bookmarks = [
      {
        Developer = [
          {
            Github = [
              {
                abbr = "GH";
                icon = "github.png";
                href = "https://github.com/NilujePerchut/";
              }
            ];
          }
          {
            "Nixos package search" = [
              {
                abbr = "NPS";
                href = "https://search.nixos.org/packages";
              }
            ];
          }
          {
            MyNixos = [
              {
                abbr = "MN";
                href = "https://mynixos.com/";
              }
            ];
          }
        ];
      }
    ];

    services = [
      {
        "Media" = [
          {
            "Jellyfin" = {
              description = "The Jelyfin media server";
              icon = "jellyfin.png";
              href = "http://192.168.40.43:8096";
            };
          }
        ];
      }
      {
        "Home" = [
          {
            "Paperless" = {
              description = "All our papers";
              icon = "paperless-ng.png";
              href = "http://192.168.40.43:9091";
            };
          }
          {
            "NAS" = {
              description = "Saves";
              icon = "synology.png";
              href = "https://192.168.40.63:5001";
            };
          }
          {
            "Freebox" = {
              description = "Frebbox admin page";
              icon = "freebox-revolution.png";
              href = "https://192.168.40.254";
            };
          }
          {
            "Home Assistant" = {
              description = "Smart home control center";
              icon = "home-assistant.png";
              href = "http://192.168.40.43:8123";
            };
          }
        ];
      }
    ];

    widgets = [
      {
        resources = {
          cpu = true;
          disk = "/";
          memory = true;
        };
      }
      {
        search = {
          provider = "google";
          target = "_blank";
          focus = true;
          showSearchSuggestions = true;
        };
      }
      {
        datetime = {
          locale = "fr";
          text_size = "xl";
        };
      }
    ];
  };

  environment.systemPackages = with pkgs; [
    homepage-dashboard
  ];
}
