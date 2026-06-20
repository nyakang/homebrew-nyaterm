#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <version>" >&2
  echo "Example: $0 1.1.6" >&2
  exit 1
fi

VERSION="${1#v}"
TAG="v${VERSION}"
CASK_FILE="Casks/nyaterm.rb"

# Keep these in sync with the artifact names produced by the NyaTerm release workflow.
ASSET_ARM_TEMPLATE="NyaTerm_${VERSION}_aarch64.dmg"
ASSET_INTEL_TEMPLATE="NyaTerm_${VERSION}_x64.dmg"

BASE_URL="https://github.com/nyakang/nyaterm/releases/download/${TAG}"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

download_and_hash() {
  local asset="$1"
  local output="${TMP_DIR}/${asset}"
  local url="${BASE_URL}/${asset}"

  echo "Downloading ${url}" >&2
  curl -fL --retry 3 --retry-delay 2 -o "${output}" "${url}"
  shasum -a 256 "${output}" | awk '{print $1}'
}

ARM_SHA="$(download_and_hash "${ASSET_ARM_TEMPLATE}")"
INTEL_SHA="$(download_and_hash "${ASSET_INTEL_TEMPLATE}")"

python3 - "$CASK_FILE" "$VERSION" "$ARM_SHA" "$INTEL_SHA" <<'PY'
from pathlib import Path
import re
import sys

path = Path(sys.argv[1])
version, arm_sha, intel_sha = sys.argv[2:5]
text = path.read_text()

text = re.sub(r'version "[^"]+"', f'version "{version}"', text, count=1)

sha_block = (
    f'sha256 arm:   "{arm_sha}",\n'
    f'         intel: "{intel_sha}"'
)

if "sha256 :no_check" in text:
    text = text.replace("sha256 :no_check", sha_block, 1)
else:
    text = re.sub(
        r'sha256 arm:\s+"[0-9a-f]{64}",\n\s+intel:\s+"[0-9a-f]{64}"',
        sha_block,
        text,
        count=1,
    )

path.write_text(text)
PY

echo "Updated ${CASK_FILE} to ${VERSION}"
echo "arm64 sha256: ${ARM_SHA}"
echo "x64 sha256:   ${INTEL_SHA}"

