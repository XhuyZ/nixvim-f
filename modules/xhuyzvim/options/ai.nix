{ lib, ... }:
{
  options.xhuyzvim.ai = {
    provider = lib.mkOption {
      type = lib.types.nullOr (
        lib.types.enum [
          "copilot"
          "windsurf"
        ]
      );
      default = "copilot";
      description = "AI completion provider to use";
    };

    chatEnable = lib.mkEnableOption "AI chat functionality" // {
      default = true;
    };
  };
}
