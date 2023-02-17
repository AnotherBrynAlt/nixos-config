{
  config,
  pkgs,
  ...
}: {
  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      extraPackages = builtins.attrValues {inherit (pkgs) intel-media-driver vaapiIntel vaapiVdpau libvdpau-va-gl;};
      driSupport32Bit = true;
      extraPackages32 = builtins.attrValues {inherit (pkgs.pkgsi686Linux) vaapiIntel;};
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override {enableHybridCodec = true;};
  };

  services = {
    xserver = {
      enable = true;
      videoDrivers = ["intel" "iHD" "i915" "modesetting"];
      displayManager.startx.enable = true;
    };
  };
}
