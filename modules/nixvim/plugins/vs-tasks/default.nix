{
  config,
  lib,
  pkgs,
  ...
}:
{
  extraPlugins = lib.mkIf (config.xhuyzvim.tasks.tool == "vs-tasks") [
    pkgs.vimPlugins.vs-tasks-nvim
  ];

  plugins.telescope =
    lib.mkIf (config.xhuyzvim.picker.tool == "telescope" && config.xhuyzvim.tasks.tool == "vs-tasks")
      {
        luaConfig.post = ''
          require("vstask").setup({
            picker = "${config.xhuyzvim.picker.tool}"
          })
          require("telescope").load_extension("vstask")
        '';
      };

  # Setup vs-tasks for non-telescope pickers
  plugins.lz-n.plugins =
    lib.mkIf (config.xhuyzvim.tasks.tool == "vs-tasks" && config.xhuyzvim.picker.tool != "telescope")
      [
        {
          __unkeyed-1 = "vs-tasks-nvim";
          lazy = false;
          after.__raw = ''
            function()
              require("vstask").setup({
                picker = "${config.xhuyzvim.picker.tool}"
              })
            end
          '';
        }
      ];

  keymaps = lib.mkIf (config.xhuyzvim.tasks.tool == "vs-tasks") [
    {
      mode = "n";
      key = "<leader>RT";
      action =
        if config.xhuyzvim.picker.tool == "telescope" then
          "<cmd>Telescope vstask tasks<CR>"
        else
          "<cmd>VstaskViewTasks<CR>";
      options = {
        desc = "Find tasks";
      };
    }
  ];
}
