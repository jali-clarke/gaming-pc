# mostly from https://medium.com/@notquitethereyet_/gaming-on-nixos-%EF%B8%8F-f98506351a24

{ config, pkgs, ... }:
{
  # `hardware.opengl` renamed to `hardware.graphics`,
  # with some options removed / renamed
  hardware.graphics = {
    enable32Bit = true;
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.systemPackages = [
    pkgs.bottles
    pkgs.heroic
    pkgs.lutris
    pkgs.protonup-qt
  ];
}