{ config, lib, ... }:
{
  plugins.mini-cursorword = lib.mkIf (config.xhuyzvim.ui.referenceHighlighting == "mini-cursorword") {
    enable = true;
    settings = {
      delay = 100; # Delay in milliseconds before highlighting
    };
  };
}
