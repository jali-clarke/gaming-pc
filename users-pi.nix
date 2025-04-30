{ pkgs, ... }:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pi = {
    isNormalUser = true;
    description = "pi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [
      pkgs.git
      pkgs.qbittorrent
      pkgs.vlc
      pkgs.vscode
    ];
  };
}