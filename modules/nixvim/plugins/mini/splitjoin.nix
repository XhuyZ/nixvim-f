{ config, lib, ... }:
{
  plugins.mini-splitjoin = lib.mkIf (config.xhuyzvim.text.splitJoin == "mini-splitjoin") {
    enable = true;
    settings = {
      mappings = {
        toggle = "gS"; # Toggle split/join
      };
    };
  };
}
