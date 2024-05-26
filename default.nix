{
  lib,
  stdenvNoCC,
  fetchurl,
  variant ? "light",
  lefty ? false
}:

let
  pname = "phinger-cursors-gruvbox-material";
  cursorSet = "phinger-cursors-gruvbox-material-" + variant + (if lefty then "-left" else "");
in
  lib.checkListOfEnum "${pname}: variants" ["dark" "light"] [variant]

  stdenvNoCC.mkDerivation {
    inherit pname;
    version = "2.0";

    src = fetchurl {
      url = "https://github.com/Mohaim-1/phinger-cursors-gruvbox-material/releases/download/v1.0/phinger-cursors-variants.tar.bz2";
      sha256 = "sha256-TCadyzkurIi23rvpOFk/J7o8QdrZ0fN+QGr2yDhv9CI=";
    };

    sourceRoot = ".";

    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/icons
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

