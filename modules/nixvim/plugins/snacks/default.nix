{
  config,
  lib,
  ...
}:
{
  imports = [
    ./bigfile.nix
    ./bufdelete.nix
    ./dashboard.nix
    ./debug.nix
    ./dim.nix
    ./gh.nix
    ./gitbrowse.nix
    ./image.nix
    ./lazygit.nix
    ./notifier.nix
    ./picker.nix
    ./profiler.nix
    ./rename.nix
    ./scope.nix
    ./scratch.nix
    ./terminal.nix
    ./toggle.nix
    ./words.nix
    ./zen.nix
  ];

  plugins = {
    snacks = {
      enable = true;

      settings = {
        indent.enabled = config.xhuyzvim.ui.indentGuides == "snacks";
        input.enabled = true;
        scroll.enabled = true;
        statuscolumn = {
          enabled = config.xhuyzvim.ui.statusColumn == "snacks";

          folds = {
            open = true;
            git_hl = lib.elem "gitsigns" config.xhuyzvim.git.integrations;
          };
        };
        quickfile.enabled = true;
      };
    };
  };
}
