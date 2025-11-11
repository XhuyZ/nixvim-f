{
  plugins = {
    copilot-lsp = {
      # enable = config.xhuyzvim.ai.provider == "copilot";
      enable = true;

      settings = {
        nes = {
          move_count_threshold = 3;
        };
      };
    };
  };
}
