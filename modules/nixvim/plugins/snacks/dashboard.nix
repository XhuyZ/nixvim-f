{ config, lib, ... }:
{
  plugins = {
    snacks = {
      settings = {
        dashboard = lib.mkIf (config.xhuyzvim.dashboard.tool == "snacks") {
          sections = [
            {
              header = ''
                "██╗  ██╗██╗  ██╗██╗   ██╗██╗   ██╗███████╗"
                "╚██╗██╔╝██║  ██║██║   ██║╚██╗ ██╔╝╚══███╔╝"
                " ╚███╔╝ ███████║██║   ██║ ╚████╔╝   ███╔╝ "
                " ██╔██╗ ██╔══██║██║   ██║  ╚██╔╝   ███╔╝  "
                "██╔╝ ██╗██║  ██║╚██████╔╝   ██║   ███████╗"
                "╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝"
              '';
            }
            {
              pane = 2;
              icon = " ";
              desc = "Browse Repo";
              padding = 1;
              key = "b";
              action.__raw = ''
                function()
                  Snacks.gitbrowse()
                end'';
            }
            (lib.mkIf config.plugins.lazy.enable { section = "startup"; })
          ];
        };
      };
    };
  };
}
