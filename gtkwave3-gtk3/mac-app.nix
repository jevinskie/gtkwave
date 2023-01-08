{ bzip2
, fetchurl
, glib
, gperf
, gtk3
, gtk-mac-integration
, judy
, lib
, pkg-config
, stdenv
, tcl
, tk
, wrapGAppsHook
, xz
}:

stdenv.mkDerivation rec {
  pname = "gtkwave";
  version = "3.3.113";

  src = fetchurl {
    url = "mirror://sourceforge/gtkwave/${pname}-gtk3-${version}.tar.gz";
    sha256 = "sha256-bv81puBSiFVkO2hNk63rMchbTSN3KtSnyHnL0/apQe0=";
  };

  nativeBuildInputs = [ pkg-config wrapGAppsHook ];
  buildInputs = [ bzip2 glib gperf gtk3 judy tcl tk xz ]
    ++ lib.optional stdenv.isDarwin gtk-mac-integration;

  configureFlags = [
    "--with-tcl=${tcl}/lib"
    "--with-tk=${tk}/lib"
    "--enable-judy"
    "--enable-gtk3"
  ];

  meta = {
    description = "VCD/Waveform viewer for Unix and Win32";
    homepage = "http://gtkwave.sourceforge.net";
    license = lib.licenses.gpl2Plus;
    maintainers = with lib.maintainers; [ thoughtpolice jiegec ];
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
  };
}
