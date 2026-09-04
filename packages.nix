{ pkgs, flake-inputs, ... }:
{
  programs = {
    firefox.enable = true;
    nix-ld.enable = true;
    fish.enable = true;
    nh = {
      enable = true;
      flake = "/home/rev/Documents/os-config";
    };
  };

  users.users."rev".packages = with pkgs; [
    	flake-inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    	code-cursor
    	kitty
  ];

  environment.systemPackages = with pkgs; [
    neovim
    git
    gcc
    gnome-tweaks
    psmisc
  ];
}
