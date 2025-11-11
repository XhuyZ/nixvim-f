{ config, lib, ... }:
{
  plugins.mini-comment = lib.mkIf (lib.elem "mini-comment" config.xhuyzvim.text.comments) {
    enable = true;
    settings = {
      mappings = {
        comment = "<leader>/";
        comment_line = "<leader>/";
        comment_visual = "<leader>/";
        textobject = "<leader>/";
      };
    };
  };
}
