{pkgs, ...}: {
  home.packages = builtins.attrValues {
    inherit (pkgs) alejandra betterdiscordctl discord just microsoft-edge ripgrep;
  };
}
