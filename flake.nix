{
  description = "A home-manager template providing useful tools & settings for Nix-based development";

  inputs = {
    # Core Nix ecosystem
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    # Applications & packages
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        # Optional inputs removed
        nuschtosSearch.follows = "";
        # Required inputs
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };
    pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    snacks-nvim = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };
  };

  nixConfig = {
    extra-substituters = [
    ];
    extra-trusted-public-keys = [
    ];
    allow-import-from-derivation = false;
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      imports = [
        ./flake
      ];
    };
}
