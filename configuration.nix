# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:



{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
#  networking.networkmanager.enable = true;
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.networks = {
    briggsx1 = { psk = "Jr343434" ;
 };
  };
  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the XFCE Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.xfce.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  users = {
    defaultUserShell = pkgs.zsh; 
    users.thor = {
    isNormalUser = true;
    description = "thor";
    extraGroups = [ "networkmanager" "wheel" ];
    };
  };

  # Allow unfree and broken packages
  nixpkgs.config = {
  allowUnfree = true;
  allowBroken = true;
  };

  # For firefox addons
  nixpkgs.config.packageOverrides = pkgs: {
  nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
    inherit pkgs;
  };
};
  
  services.xserver.windowManager = {
    herbstluftwm.enable = true;
    stumpwm.enable = true;
    awesome.enable = true;
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
environment.systemPackages = with pkgs; [
emacs-all-the-icons-fonts
# ascii art

Asciiquarium
Banner
pipes
boxes
cbonsai
catimg
cmatrix
tty-clock


python
lsd  
pywal
wget
xorg.xinit
xorg.xorgserver
xorg.xrdb
xorg.xmodmap
git
obsidian
brave
blueman
firefox
emacs
gotop
gtop
gcc
screenfetch  
neofetch
pfetch
cowsay
feh
syncthing
polybar
sxhkd
dmenu
picom
ranger
screenkey
youtube-dl
  (st.overrideAttrs (oldAttrs: rec {
    src = fetchFromGitHub {
      owner = "LukeSmithxyz";
      repo = "st";
      rev = "8ab3d03681479263a11b05f7f1b53157f61e8c3b";
      sha256 = "1brwnyi1hr56840cdx0qw2y19hpr0haw4la9n0rqdn0r2chl8vag";
    };
    buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
    }))
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leavecatenate(variables, "bootdev", bootdev)
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
