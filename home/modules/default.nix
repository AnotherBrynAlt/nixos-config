_: let
  alacritty = import ./alacritty.nix;
  bat = import ./bat.nix;
  cursor = import ./cursor.nix;
  direnv = import ./direnv.nix;
  exa = import ./exa.nix;
  firefox = import ./firefox.nix;
  flameshot = import ./flameshot.nix;
  fzf = import ./fzf.nix;
  git = import ./git.nix;
  gtk = import ./gtk.nix;
  helix = import ./helix.nix;
  home-manager = import ./home-manager.nix;
  lazygit = import ./lazygit.nix;
  micro = import ./micro.nix;
  mpv = import ./mpv.nix;
  nnn = import ./nnn.nix;
  packages = import ./packages.nix;
  starship = import ./starship.nix;
  wezterm = import ./wezterm.nix;
  zsh = import ./zsh.nix;
in {
  flake = {
    homeModules = {
      inherit
        alacritty
        bat
        cursor
        direnv
        exa
        firefox
        flameshot
        fzf
        git
        helix
        home-manager
        lazygit
        micro
        mpv
        nnn
        packages
        starship
        wezterm
        zsh
        ;
      base = {imports = [home-manager git packages zsh];};
      commandline = {imports = [bat direnv exa fzf helix micro lazygit nnn starship];};
      graphical = {imports = [alacritty cursor flameshot gtk];};
      internet = {imports = [firefox];};
      media = {imports = [mpv];};
    };
  };
}
