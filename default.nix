{
  lib,
  stdenvNoCC,
  fetchurl,
  variant ? "light",
  lefty ? false
}:

let
  pkgName = "phinger-cursors-gruvbox-material";
  cursorSet = "phinger-cursors-gruvbox-material-" + variant + (if lefty then "-left" else "");
in
  lib.checkListOfEnum "${pkgName}: variants" ["dark" "light"] [variant]
  stdenvNoCC.mkDerivation {
    pname = pkgName;
    version = "2.0";

    src = fetchurl {
      url = "https://github.com/Mohaim-1/phinger-cursors-gruvbox-material/releases/download/v0.1-alpha/phinger-cursors-variants.tar.bz2";
      sha256 = "0bg5nz88c8bcnk6sb6h3sxx93gk1vrl8nvl5b6a1y8zskq9i2g67";
    };

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/icon
      cp -r ./${cursorSet} $out/share/icons/
      runHook postInstall
    '';

    meta = with lib; {
      description = "The most over-engineered cursor theme";
      homepage = "https://github.com/phisch/phinger-cursors";
      platforms = platforms.unix;
      license = licenses.cc-by-sa-40;
      maintainers = [ ];
    };
  }
