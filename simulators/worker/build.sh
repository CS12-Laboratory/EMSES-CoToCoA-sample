#!/bin/bash
hostname=$(uname -n)

case $hostname in
  fn*)      source ../requester/env/fugaku.env   ;;
  camphor*) source ../requester/env/camphor.env  ;;
  *)        echo "unknown host $hostname"; exit 1 ;;
esac

# Install Fpm (Fortran package manager) if not exists.
PACKAGE="fpm"
if ! pip3 show "$PACKAGE" >/dev/null 2>&1; then
	echo "$PACKAGE is not currently installed. Initiating installation..."
	pip3 install --user "$PACKAGE"
else
	echo "$PACKAGE:ok"
fi

# Add path to use Fpm.
export PATH="$PATH:$HOME/.local/bin"

export FPM_FC="$FC"
export FPM_CC="$CC"
export FPM_CXX="$CXX"

export FPM_CFLAGS="$CFLAGS"

export FPM_FFLAGS="$FFLAGS"

export FPM_LDFLAGS=

fpm install --prefix ./ "$@"
