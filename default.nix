{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  variant ? "light",
  lefty ? false
}:

let
  pkgName = "phinger-cursors-gruvbox-material";
  cursorSet = variant + (lefty ? "-left");
in
  lib.checkListOfEnum "${pkgName}: variants" ["dark" "light"] [variant]
  stdenvNoCC.mkDerivation {
    pname = pkgName;
    version = "2.0";

    src = fetchFromGitHub {};


    installPhase = ''
      runHook preInstall
      mkdir -p $out/share/icon
      cp -r ./cursor-themes/${variant} $out/share/icons/
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
