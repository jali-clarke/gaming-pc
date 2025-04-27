{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations."oblivion" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./gaming.nix
        ./hardware-configuration.nix
        ./nvidia.nix
        ./users-pi.nix
        ./zfs.nix
      ];
    };
  };
}
