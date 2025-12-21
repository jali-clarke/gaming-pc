# mostly from https://medium.com/@notquitethereyet_/gaming-on-nixos-%EF%B8%8F-f98506351a24

{ config, pkgs, ... }:
{
  # `hardware.opengl` renamed to `hardware.graphics`,
  # with some options removed / renamed
  hardware.graphics = {
    enable32Bit = true;
  };

  fileSystems."/home/pi/steam-games" = {
    device = "/dev/disk/by-id/nvme-KINGSTON_SNV3S1000G_50026B76871D698E-part1";
    fsType = "ext4";
  };

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  # some steam games are distributed as appimages
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  environment.systemPackages = [
    pkgs.bottles
    pkgs.heroic
    pkgs.lutris
    pkgs.protonup-qt
  ];
}