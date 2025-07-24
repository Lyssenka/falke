{
  config,
  pkgs,
  lib,
  ...
}:
let
  inherit (lib.attrsets) attrValues;
in
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      search = {
        force = true;
        default = "Startpage";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "''${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };
          "NixOS Wiki" = {
            urls = [ { template = "https://wiki.nixos.org/index.php?search={searchTerms}"; } ];
            icon = "https://wiki.nixos.org/favicon.png";
            definedAliases = [ "@nw" ];
          };
          "Startpage" = {
            urls = [ { template = "https://startpage.com"; } ];
            definedAliastes = [ "@sp" ];
          };
          bing.metaData.hidden = true;
          google.metaData.hidden = true;
        };
      };
      extensions.packages = attrValues {
        inherit (pkgs.nur.repos.rycee.firefox-addons)
          ublock-origin
          violentmonkey
          darkreader
          redirector
          auto-tab-discard
          bitwarden
          ;
      };
      settings = {
        "browser.aboutConfig.showWarning" = false;
        "browser.startup.homepage" = "https://startpage.com";
        "browser.search.defaultenginename" = "Startpage";
        "browser.search.order.1" = "Startpage";
        "dom.security.https_only_mode" = true;
        "dom.security.https_only_mode_ever_enabled" = true;
        "extensions.autoDisableScopes" = 0;
        "browser.discovery.enabled" = false;
        "extensions.getAddons.showPane" = false;
        "cookiebanners.bannerClicking.enabled" = true;
        "cookiebanners.service.mode" = 1;
        "cookiebanners.service.mode.privateBrowsing" = 1;

        "privacy.donottrackheader.enabled" = true;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.partition.network_state.ocsp_cache" = true;

        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.ping-centre.telemtry" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.hybridContent.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.reportingpolicy.firstRun" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;

        "experiments.activeExperiment" = false;
        "experiments.enabled" = false;
        "experiments.supported" = false;
        "network.allow-experiments" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "extensions.pocket.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.oAuthConsumerKey" = "";
        "extensions.pocket.showHome" = false;
        "extensions.pocket.site" = "";
      };
    };
  };
}
