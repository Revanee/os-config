{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    famedly-nixos.url = "github:famedly/famedly-nixos";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, famedly-nixos, rust-overlay, ... }@inputs:
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [ 
          ./configuration.nix
          ({ pkgs, ... }: {
            nixpkgs.overlays = [ rust-overlay.overlays.default ];
            environment.systemPackages = [
              (pkgs.rust-bin.stable.latest.default.override {
                extensions = [ "rust-src" "rust-analyzer" ];
              })
            ];
          })
        ];
        specialArgs.flake-inputs = inputs;
      };
    };
}
