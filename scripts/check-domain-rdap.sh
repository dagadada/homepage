#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <domain>"
  echo "Example: $0 haizhai.dev"
  exit 1
fi

DOMAIN="$1"
TLD="${DOMAIN##*.}"

# Minimal mapping for this project; extend if needed.
case "$TLD" in
  dev)
    URL="https://pubapi.registry.google/rdap/domain/${DOMAIN}"
    ;;
  com)
    URL="https://rdap.verisign.com/com/v1/domain/${DOMAIN}"
    ;;
  *)
    echo "Unsupported TLD in this quick script: .$TLD"
    echo "Check IANA RDAP bootstrap: https://www.iana.org/assignments/rdap-dns/rdap-dns.xhtml"
    exit 2
    ;;
esac

STATUS=$(curl -s -o /tmp/rdap-${TLD}.json -w "%{http_code}" "$URL")

echo "RDAP endpoint: $URL"
echo "HTTP status: $STATUS"

if [ "$STATUS" = "404" ]; then
  echo "Result: NOT FOUND in registry RDAP (usually means available to register)."
elif [ "$STATUS" = "200" ]; then
  echo "Result: Found in registry RDAP (already registered)."
  rg -n '"ldhName"|"handle"|"status"|"eventAction"|"eventDate"' /tmp/rdap-${TLD}.json | sed -n '1,24p'
else
  echo "Result: inconclusive. Try registrar search checkout page for final availability."
fi
