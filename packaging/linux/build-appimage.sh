#!/usr/bin/env bash
#
# Build a CrossDrop AppImage from a Flutter Linux release bundle.
#
# Usage:
#   packaging/linux/build-appimage.sh <bundle_dir> <output_appimage>
#
# Example:
#   flutter build linux --release
#   packaging/linux/build-appimage.sh \
#     build/linux/x64/release/bundle \
#     dist/CrossDrop-1.0.0-linux-x86_64.AppImage
#
# Must be run from the repository root so the icon and .desktop file can be
# located. Downloads appimagetool on first use.
set -euo pipefail

BUNDLE_DIR="${1:?usage: build-appimage.sh <bundle_dir> <output_appimage>}"
OUTPUT="${2:?usage: build-appimage.sh <bundle_dir> <output_appimage>}"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
DESKTOP_FILE="${REPO_ROOT}/linux/de.medformatik.crossdrop.desktop"
ICON_FILE="${REPO_ROOT}/assets/icons/app_icon.png"

if [[ ! -d "${BUNDLE_DIR}" ]]; then
  echo "error: bundle directory '${BUNDLE_DIR}' not found (run 'flutter build linux --release' first)" >&2
  exit 1
fi

work_dir="$(mktemp -d)"
trap 'rm -rf "${work_dir}"' EXIT
appdir="${work_dir}/CrossDrop.AppDir"

# Lay out the AppDir: the Flutter bundle lives in usr/bin so the executable
# keeps its data/ and lib/ siblings; AppRun launches it.
mkdir -p "${appdir}/usr/bin"
cp -r "${BUNDLE_DIR}/." "${appdir}/usr/bin/"

# Icon must be named after the .desktop "Icon=" key (CrossDrop).
install -Dm644 "${ICON_FILE}" "${appdir}/CrossDrop.png"
install -Dm644 "${ICON_FILE}" "${appdir}/usr/share/icons/hicolor/512x512/apps/CrossDrop.png"

# Desktop entry at the AppDir root (and the standard location).
install -Dm644 "${DESKTOP_FILE}" "${appdir}/de.medformatik.crossdrop.desktop"
install -Dm644 "${DESKTOP_FILE}" "${appdir}/usr/share/applications/de.medformatik.crossdrop.desktop"

cat > "${appdir}/AppRun" <<'APPRUN'
#!/usr/bin/env bash
HERE="$(dirname "$(readlink -f "${0}")")"
exec "${HERE}/usr/bin/CrossDrop" "$@"
APPRUN
chmod +x "${appdir}/AppRun"

# Fetch appimagetool if it is not already cached next to this script.
tool="${APPIMAGETOOL:-${work_dir}/appimagetool}"
if [[ ! -x "${tool}" ]]; then
  echo "Downloading appimagetool..."
  curl -fsSL \
    "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage" \
    -o "${tool}"
  chmod +x "${tool}"
fi

mkdir -p "$(dirname "${OUTPUT}")"
# --appimage-extract-and-run avoids needing FUSE on CI runners.
ARCH=x86_64 "${tool}" --appimage-extract-and-run "${appdir}" "${OUTPUT}"
echo "Built ${OUTPUT}"
