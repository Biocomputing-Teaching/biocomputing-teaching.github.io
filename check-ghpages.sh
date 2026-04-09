#!/usr/bin/env bash
set -euo pipefail
ORG=${1:-Biocomputing-Teaching}
TARGET=${2:-docs/index.md}
API_URL="https://api.github.com/orgs/${ORG}/repos?per_page=100"

if ! command -v python3 >/dev/null 2>&1; then
  echo "Error: python3 is required." >&2
  exit 1
fi

echo "Consultant GitHub API per a l'organització '${ORG}'..."
repos_json=$(curl -sSL -H 'Accept: application/vnd.github+json' -A 'check-ghpages.sh' "${API_URL}")
if [[ -z "$repos_json" ]]; then
  echo "Error: no s'ha pogut recuperar dades de GitHub." >&2
  exit 1
fi

md_intro=$(cat <<'MARKER'
<!-- GH_PAGES_LIST_START -->
## Public GitHub Pages repositories for the Biocomputing-Teaching organization

This list was generated automatically with `check-ghpages.sh` and includes only public repositories that have GitHub Pages enabled. Descriptions are shown in English, and repositories with content in Catalan are marked accordingly.

MARKER
)

tmp_list_py=$(mktemp)
cat > "$tmp_list_py" <<'PY'
import json
import sys

repos = json.loads(sys.stdin.read())
pages = [r for r in repos if r.get("has_pages") and r.get("visibility") == "public"]
if not pages:
    sys.exit(0)
org = sys.argv[1].lower()
translations = {
    "Sense descripció disponible.": "No description available.",
    "Material de formació en models matemàtics, amb un enfoc en Biologia i Biotecnologia": "Training material on mathematical models with an emphasis on Biology and Biotechnology.",
    "Material divers sobre estructura de proteïnes": "Various material on protein structure.",
    "material per a un curs de primer any de química a Enginyeria de l'Automoció": "Material for a first-year chemistry course in Automotive Engineering.",
}
cat_tokens = [
    "sense descripció",
    "per a",
    "enginyeria",
    "automoció",
    "proteïnes",
    "biotecnologia",
    "formació",
    "matemàtics",
    "estructura",
    "química",
    "curs",
    "primer any",
]

def is_catalan(text):
    lower = text.lower()
    return any(token in lower for token in cat_tokens)

for r in sorted(pages, key=lambda x: x["name"].lower()):
    name = r["name"]
    desc = r.get("description") or "Sense descripció disponible."
    translated = translations.get(desc.strip(), desc)
    suffix = ""
    if is_catalan(desc):
        suffix = " (Catalan content)"
        if translated == desc:
            translated = "Description in Catalan."
    if name.lower() == f"{org}.github.io":
        url = f"https://{org}.github.io/"
    else:
        url = f"https://{org}.github.io/{name}/"
    print(f"- [{name}]({url}) — {translated}{suffix}")
PY
html=$(printf '%s' "$repos_json" | python3 "$tmp_list_py" "$ORG")
rm -f "$tmp_list_py"

if [[ -z "$html" ]]; then
  echo "No s'han trobat repositoris amb GitHub Pages." >&2
  exit 1
fi

md_block="$md_intro

$html
<!-- GH_PAGES_LIST_END -->"

if [[ ! -f "$TARGET" ]]; then
  echo "Error: fitxer de destinació '$TARGET' no existeix." >&2
  exit 1
fi

tmp_python=$(mktemp)
cat > "$tmp_python" <<'PY'
import re
import sys
import pathlib

target = pathlib.Path(sys.argv[1])
text = target.read_text(encoding='utf-8')
new_block = sys.stdin.read()
start = '<!-- GH_PAGES_LIST_START -->'
end = '<!-- GH_PAGES_LIST_END -->'
if start in text and end in text:
    before, rest = text.split(start, 1)
    _, after = rest.split(end, 1)
    text = before.rstrip() + '\n' + new_block + '\n' + after.lstrip()
else:
    if text and not text.endswith('\n'):
        text += '\n'
    text += '\n' + new_block + '\n'

target.write_text(text, encoding='utf-8')
PY

printf '%s' "$md_block" | python3 "$tmp_python" "$TARGET"
status=$?
rm -f "$tmp_python"
if [[ $status -ne 0 ]]; then
  echo "Error actualitzant '$TARGET'." >&2
  exit 1
fi

echo "S'ha actualitzat '$TARGET' amb la llista de GitHub Pages."
