self: super: rec {
  # RDNA3 FIX
  # Right now nixpkgs only has Mesa 22.2.5, but I need Meda 22.3.1 to support RDNA 3. This brings in the patch from
  # staging that updates to the new Mesa version. It probably can be removed once it hits unstable.
  libclc-patched = super.callPackage ./pkgs/libclc {
    llvmPackages = super.llvmPackages_latest;
  };

  mesa-patched = super.callPackage ./pkgs/mesa {
    llvmPackages = super.llvmPackages_latest;
    libclc = libclc-patched;
    inherit (super.darwin.apple_sdk.frameworks) OpenGL;
    inherit (super.darwin.apple_sdk.libs) Xplugin;
  };

  # X11 is broken on my machine due to the RDNA3 issues, and the tests for this dep require X11 to run. So skip them...
  libhandy = super.libhandy.overrideAttrs (old: {
    doCheck = false;
    doInstallCheck = false;
  });

  # END RDNA3 FIX
}
