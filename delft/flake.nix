{
  #inputs.nixpkgs.url = "/home/deploy/src/edolstra-nixpkgs"; # toString ../../edolstra-nixpkgs; # = "nixpkgs/release-19.09";
  inputs.nixpkgs.url = "nixpkgs/nixos-21.11-small";
  inputs.nix.follows = "hydra/nix";
  #inputs.hydra.url = "github:NixOS/hydra/master";
  inputs.hydra.url = "github:DeterminateSystems/hydra/queue-runner-exporter";
  outputs = flakes @ { self, nixpkgs, nix, hydra /*, dwarffs */ }: {

    nixopsConfigurations.default =
      { inherit nixpkgs; }
      // import ./network.nix flakes;

  };
}
