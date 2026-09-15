{ pkgs, flake-inputs, ... }:
{
  programs = {
    firefox.enable = true;
    nix-ld.enable = true;
    fish = {
      enable = true;
      shellAbbrs = {
        vi = "nvim";
        kc = "kubectl";
      };
    interactiveShellInit = ''
        set -g fish_greeting ""
      '';
    };
    nh = {
      enable = true;
      flake = "/home/rev/Documents/os-config";
    };
    neovim = {
      enable = true;
      defaultEditor = true;
    };
  };

  users.users."rev".packages = with pkgs; [
    code-cursor
    fishPlugins.z
    flake-inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    highlight
    kind
    kitty
    kubectl
    kubernetes-helm
    neovide
    ranger
    tree
  ];

  environment.systemPackages = with pkgs; [
    fd
    gcc
    git
    gnome-tweaks
    go
    nodejs
    openssl
    pkg-config
    psmisc
    ripgrep
    unzip
  ];
}
