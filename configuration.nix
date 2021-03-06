

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


nixpkgs.config.allowUnfree = true;
services.xserver.videoDrivers = [ "nvidia" ];

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiInstallAsRemovable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = false;


   networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Boise";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp6s0.useDHCP = true;
  networking.interfaces.enp7s0.useDHCP = true;
  networking.interfaces.wlp5s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;
  #services.xserver.displayManager.defaultSession = "plasma5";

  # Enable the xfce Desktop Environment.
  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;
  services.xserver.displayManager.defaultSession = "xfce";



  # Configure keymap in X11
   services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
   services.printing.enable = true;

  # Enable sound.
   sound.enable = true;
   hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.chuck = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   };

 # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     #archiving
     p7zip
     libsForQt5.ark

     #audio
     pavucontrol
     volctl

     #browser
#     firefox-bin

     #customisation
     nitrogen
     picom

     #download
     youtube-dl

     #editing
     gimp
     digikam

     #file manager
     pcmanfm
     vifm
     cinnamon.nemo

     #iso writer
     etcher

     #network
     networkmanagerapplet

     #note taking

     #password manager
     bitwarden

     #play
     vlc
     clementine

     #sync
     syncthing

     #system tools
     wget
     git
     rofi
     ripgrep
     exa
     gparted
     libsForQt5.kfind
     htop
     libsForQt5.kcalc
     hplip

     #terminal
     alacritty
     gnome.gnome-terminal

     #text editor
     vim
     libreoffice-fresh
     kate

     #torrent
     qbittorrent

     ];


     # Compositor (supposedly fixes screen tearing).
     # services.compton.enable = true;

     #{ config, pkgs, ... }: {
        #boot.blacklistedKernelModules = [ "nouveau" ];
        #boot.kernelParams = [ "nomodeset" "video=vesa:off" "vga=normal" ];
        #boot.vesa = false;

        hardware.opengl.enable = true;
        hardware.opengl.driSupport32Bit = true;
        #services.xserver.videoDrivers = [ "nvidia" ];
#}
        # Autoupgrade
        system.autoUpgrade.enable = true;
        system.autoUpgrade.allowReboot = true;



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

