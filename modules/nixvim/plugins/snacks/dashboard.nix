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
              icon = " ";
              title = "Keymaps";
              section = "keys";
              gap = 1;
              padding = 1;
            }
            {
              icon = " ";
              title = "Find Files";
              __unkeyed-1.__raw = "require('snacks').dashboard.sections.recent_files({cwd = true})";
              gap = 1;
              padding = 1;
            }
            {
              icon = " ";
              title = "Projects";
              section = "projects";
              gap = 1;
              padding = 1;
            }
            {
              pane = 2;
              section = "terminal";
              cmd = "colorscript -e square";
              height = 5;
              padding = 2;
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
