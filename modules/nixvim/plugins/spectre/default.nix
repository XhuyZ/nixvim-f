{ lib, config, ... }:
{
  plugins = {
    spectre = {
      enable = config.xhuyzvim.editor.search == "spectre";
      lazyLoad = {
        settings = {
          cmd = "Spectre";
        };
      };
    };
  };

  keymaps = lib.mkIf (config.xhuyzvim.editor.search == "spectre") [
    {
      mode = "n";
      key = "<leader>rs";
      action = "<cmd>Spectre<CR>";
      options = {
        desc = "Spectre toggle";
      };
    }
  ];
}
