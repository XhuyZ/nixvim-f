{
  config,
  ...
}:
{
  plugins = {
    rzls = {
      enable = config.xhuyzvim.lsp.csharp == "roslyn";
      enableRazorFiletypeAssociation = true;

      lazyLoad.settings.ft = [
        "cs"
        "razor"
      ];
    };
  };
}
