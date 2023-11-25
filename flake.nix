{
  description = "My nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";  
    home-manager = {
      url = "github:nix-community/home-manager";  
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };  

  outputs = { self, nixpkgs, home-manager }: {

   nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
    modules = [
      ./configuration.nix
      home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # TODO replace ryan with your own username
            home-manager.users.mawfy = import ./home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass arguments to home.nix
          }
    ];
   };

  };
}
