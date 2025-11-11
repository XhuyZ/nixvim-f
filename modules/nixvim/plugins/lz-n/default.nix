{ config, ... }:
{
  plugins = {
    lzn-auto-require.enable = config.xhuyzvim.loading.strategy == "lazy";
    lz-n.enable = config.xhuyzvim.loading.strategy == "lazy";
  };
}
