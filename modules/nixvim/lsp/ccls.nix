{ config, ... }:
{
  plugins = {
    lsp = {
      servers = {
        ccls = {
          enable = config.xhuyzvim.lsp.cpp == "ccls";

          initOptions.compilationDatabaseDirectory = "build";
        };
      };
    };
  };
}
