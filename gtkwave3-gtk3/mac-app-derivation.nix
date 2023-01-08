{ bzip2
, ccacheStdenv
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

ccacheStdenv.mkDerivation rec {
  pname = "gtkwave";
  version = "HEAD";

  src = ./.;

  nativeBuildInputs = [ pkg-config wrapGAppsHook ];
  buildInputs = [ bzip2 glib gperf gtk3 judy tcl tk xz ]
    ++ lib.optional stdenv.isDarwin gtk-mac-integration;

  enableParallelBuilding = true;
  preConfigure = ''
    export CCACHE_DIR=/nix/var/cache/ccache
    export CCACHE_UMASK=007
  '';
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