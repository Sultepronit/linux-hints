{ config, pkgs, ... }:

{
  home.username = "step";
  home.homeDirectory = "/home/step";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05";

  home.packages = [
  	pkgs.go
    
    (pkgs.writeShellScriptBin "nix-expose" (builtins.readFile ./nix-expose.sh))
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "nano";
    CGO_ENABLED = "0";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
