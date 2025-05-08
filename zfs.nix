# https://openzfs.github.io/openzfs-docs/Getting%20Started/NixOS/

{ ... }:
{
  boot.supportedFilesystems = [ "zfs" ];
  boot.zfs.forceImportRoot = false;
  networking.hostId = "b09975b1"; # head -c4 /dev/urandom | od -A none -t x4

  services.zfs.autoScrub.enable = true;

  # limit arc size, in bytes
  boot.kernelParams = [ "zfs.zfs_arc_max=${toString (2 * 1024 * 1024 * 1024)}" ];

  services.sanoid = {
    enable = true;
    datasets."zfs-fast" = {
      autosnap = true;
      autoprune = true;
      recursive = true;

      hourly = 48;
      daily = 14;
      monthly = 0;
      yearly = 0;
    };
  };

  fileSystems."/home/pi" = {
    device = "zfs-fast/home-persistent";
    fsType = "zfs";
  };
}
