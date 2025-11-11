{
  config,
  lib,
  ...
}:
{
  plugins.nerdy = {
    enable = config.xhuyzvim.picker.tool == "telescope";
    enableTelescope = config.xhuyzvim.picker.tool == "telescope";
  };

  keymaps = lib.mkIf config.plugins.nerdy.enable [
    {
      mode = "n";
      key = "<leader>f,";
      action = "<CMD>Nerdy<CR>";
      options = {
        desc = "Find Nerd Icons";
      };
    }
  ];
}
