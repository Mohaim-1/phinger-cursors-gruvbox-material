{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "phinger-cursors-gruvbox-material";
  version = "2.0";

  src = fetchurl {
    url = "";
    sha256 = "";
  };

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons
    cp -r ./phinger-cursors* $out/share/icons
    runHook postInstall
  '';

  meta = with lib; {
    description = "The most over-engineered cursor theme";
    homepage = "https://github.com/phisch/phinger-cursors";
    platforms = platforms.unix;
    license = licenses.cc-by-sa-40;
    maintainers = with maintainers; [ ];
  };
}
