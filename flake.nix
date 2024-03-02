{
  description = "My nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    rust-overlay,
  }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
      extraArgs = {
        inherit rust-overlay;
      };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;

          home-manager.users.mawfy = import ./home.nix;

          home-manager.extraSpecialArgs = {
            inherit self;
            last_pkgs = nixpkgs.legacyPackages.x86_64-linux;
          };
        }
      ];
    };
  };
}
