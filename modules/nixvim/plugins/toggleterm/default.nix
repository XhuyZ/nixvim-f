{ config, lib, ... }:
{
  plugins.toggleterm = {
    enable = lib.elem "toggleterm" config.xhuyzvim.ui.terminal;

    lazyLoad = {
      settings = {
        cmd = "ToggleTerm";
        keys = [
          "<C-t>"
        ];
      };
    };

    settings = {
      direction = "float";
    };
  };

  keymaps = lib.mkIf config.plugins.toggleterm.enable [
    # TODO: remap
    # {
    #   mode = "n";
    #   key = "<leader>uT";
    #   action = "<cmd>ToggleTerm<CR>";
    #   options = {
    #     desc = "Open Terminal";
    #   };
    # }
    (lib.mkIf (!lib.elem "snacks-lazygit" config.xhuyzvim.git.integrations) {
      mode = "n";
      key = "<leader>gg";
      action.__raw = ''
        function()
          local toggleterm = require('toggleterm.terminal')

          toggleterm.Terminal:new({cmd = 'lazygit',hidden = true}):toggle()
        end
      '';
      options = {
        desc = "Open Lazygit";
        silent = true;
      };
    })
  ];
}
