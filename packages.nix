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
    flake-inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    code-cursor
    kitty
    ranger
    highlight
    tree
    kubectl
    kubernetes-helm
    kind
    fishPlugins.z
  ];

  environment.systemPackages = with pkgs; [
    git
    gcc
    gnome-tweaks
    psmisc
  ];
}
