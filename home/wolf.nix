{config, lib, ...}: {
  # import other files here
  imports = [

  ];

  # allow unfree packages
  # like discord and steam
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  # enable the home-manager program
  # this is how you actually switch 
  # generations
  programs.home-manager = {
    enable = true;
    # default path to your flake dir
    path = lib.mkDefault "$HOME/nixden";
  };

  home = {
    # your username
    username = "wolf";
    # your home directory
    homeDirectory = "/home/${config.home.username}";
    # don't change this without reading changelog first
    # https://nix-community.github.io/home-manager/release-notes.html
    stateVersion = "23.05";
  };

  # makes user services reload cleanly
  systemd.user.startServices = "sd-switch";

  # some garbage I had in my config
  xdg.enable = true;
}