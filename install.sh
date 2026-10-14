#!/bin/bash
# One-line install (published to the public homebrew-lilbro repo):
#   curl -fsSL https://raw.githubusercontent.com/rajaryan12123/homebrew-lilbro/main/install.sh | bash
# Downloads the latest release for this Mac (the app with its own Java), checks it, unpacks it
# into ~/.better-call-lilbro/app and hands over to `lilbro install` (setup questions).
set -euo pipefail
REPO="rajaryan12123/homebrew-lilbro"
DATA="$HOME/.better-call-lilbro"
APP="$DATA/app"

[ "$(uname)" = Darwin ] || { echo "better-call-lilbro runs on macOS only." >&2; exit 1; }
ARCH=x64
[ "$(uname -m)" = arm64 ] && ARCH=arm64
URL="https://github.com/$REPO/releases/latest/download/lilbro-mac-$ARCH.tar.gz"

mkdir -p "$DATA"
chmod 700 "$DATA"
TMP="$(mktemp -d "$DATA/.install.XXXXXX")"
trap 'rm -rf "$TMP"' EXIT

printf 'Downloading better-call-lilbro for this Mac (about 40 MB)… '
curl -fsSL "$URL" -o "$TMP/lilbro.tar.gz"
echo "done"
SUM="$(curl -fsSL "$URL.sha256" | cut -d' ' -f1)"
[ "$(shasum -a 256 "$TMP/lilbro.tar.gz" | cut -d' ' -f1)" = "$SUM" ] || { echo "Checksum mismatch: download corrupted, try again." >&2; exit 1; }
tar -xzf "$TMP/lilbro.tar.gz" -C "$TMP"

# Reinstalling over a running agent: stop it before swapping its files.
LABEL="io.lilbro.agent"
launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null || true
if [ -d "$APP" ]; then
  mv "$APP" "$TMP/old"
fi
mv "$TMP/lilbro" "$APP"
echo "Installed $(cat "$APP/VERSION") in $APP"
rm -rf "$TMP"
trap - EXIT
# stdin is this script when piped from curl: the setup questions need the keyboard.
exec "$APP/bin/lilbro" install </dev/tty
