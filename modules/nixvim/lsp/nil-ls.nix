{
  config,
  lib,
  pkgs,
  ...
}:
{
  lsp.servers.nil_ls = {
    enable = config.xhuyzvim.lsp.nix == "nil-ls";

    config.settings = {
      formatting = {
        command = [ "${lib.getExe pkgs.nixfmt}" ];
      };
      nix = {
        flake = {
          autoArchive = true;
        };
      };
    };
  };
}
