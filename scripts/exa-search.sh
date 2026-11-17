#!/usr/bin/env bash
# Search the web with Exa and print results with title, link, published date and an excerpt.
#
# Usage:
#   scripts/exa-search.sh "search query" [--num 10] [--since YYYY-MM-DD] [--domain example.com]
#
# The API key comes from the EXA_API_KEY environment variable if set (used by scheduled runs),
# otherwise from the EXA_API_KEY line in the .env file at the top of the repo.
set -euo pipefail

usage() {
  echo 'Usage: scripts/exa-search.sh "search query" [--num 10] [--since YYYY-MM-DD] [--domain example.com]' >&2
  exit 1
}

[ $# -ge 1 ] || usage
QUERY="$1"; shift
NUM=10
SINCE=""
DOMAIN=""
while [ $# -gt 0 ]; do
  case "$1" in
    --num)    NUM="${2:?}"; shift 2 ;;
    --since)  SINCE="${2:?}"; shift 2 ;;
    --domain) DOMAIN="${2:?}"; shift 2 ;;
    *) usage ;;
  esac
done

# Find the key without running anything in .env.
KEY="${EXA_API_KEY:-}"
if [ -z "$KEY" ]; then
  ENV_FILE="$(cd "$(dirname "$0")/.." && pwd)/.env"
  if [ -f "$ENV_FILE" ]; then
    KEY="$(grep -E '^EXA_API_KEY=' "$ENV_FILE" | tail -n 1 | cut -d= -f2- | tr -d '"'"'"' \r')"
  fi
fi
if [ -z "$KEY" ] || [ "$KEY" = "your-exa-api-key-here" ]; then
  echo "No Exa API key found. Add your real key to the EXA_API_KEY line in .env (see .env.example)." >&2
  exit 1
fi

BODY="$(jq -n --arg q "$QUERY" --argjson n "$NUM" --arg since "$SINCE" --arg domain "$DOMAIN" '
  {query: $q, numResults: $n, type: "auto", contents: {text: {maxCharacters: 1500}}}
  + (if $since  != "" then {startPublishedDate: ($since + "T00:00:00.000Z")} else {} end)
  + (if $domain != "" then {includeDomains: [$domain]} else {} end)')"

# The key is passed through a temporary header stream so it never appears in the process list.
RESPONSE="$(curl -sS --fail-with-body -X POST "https://api.exa.ai/search" \
  -H @<(printf 'x-api-key: %s\n' "$KEY") \
  -H "Content-Type: application/json" \
  -d "$BODY")" || { echo "Exa search failed: $RESPONSE" >&2; exit 1; }

echo "Search: $QUERY"
echo "Searched on: $(date +%Y-%m-%d)"
echo
echo "$RESPONSE" | jq -r '.results[] |
  "## \(.title // "Untitled")\nURL: \(.url)\nPublished: \((.publishedDate // "unknown") | split("T")[0])\n\n\((.text // "") | .[0:1500])\n"'
