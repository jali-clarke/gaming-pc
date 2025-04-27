# https://openzfs.github.io/openzfs-docs/Getting%20Started/NixOS/

{ ... }:
{
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
  networking.hostId = "b09975b1"; # head -c4 /dev/urandom | od -A none -t x4
}
