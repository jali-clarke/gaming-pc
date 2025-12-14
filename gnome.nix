{ pkgs, ... }:
{
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # `gnome` comes with a bunch of packages installed by default.
  # we don't need em all.  see a list here (change to whatever
  # release branch you're using):
  # https://github.com/NixOS/nixpkgs/blob/2baa12ff69913392faf0ace833bc54bba297ea95/nixos/modules/services/x11/desktop-managers/gnome.nix#L422
  environment.gnome.excludePackages = [
    pkgs.epiphany
    pkgs.gnome-contacts
    pkgs.gnome-text-editor
    pkgs.gnome-maps
    pkgs.gnome-music
    pkgs.decibels
  ];
}
