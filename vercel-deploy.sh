#!/usr/bin/env bash
# SMARTY — Vercel Deployment Script
# Loads VERCEL_TOKEN from local secrets. Never commit tokens.

set -euo pipefail

SECRET_FILE="${HOME}/.secrets/vercel.env"

if [[ ! -f "$SECRET_FILE" ]]; then
  echo "ERROR: Secret file not found at $SECRET_FILE"
  echo "Create it with: echo 'VERCEL_TOKEN=your_token_here' > $SECRET_FILE && chmod 600 $SECRET_FILE"
  exit 1
fi

# shellcheck source=/dev/null
source "$SECRET_FILE"

if [[ -z "${VERCEL_TOKEN:-}" ]]; then
  echo "ERROR: VERCEL_TOKEN not set in $SECRET_FILE"
  exit 1
fi

echo "Deploying SMARTY to Vercel..."
npx vercel --prod --token "$VERCEL_TOKEN" --yes

echo ""
echo "Deployment complete. Check the URL above."
echo "Pin: DEPLOY-VERCEL-v1 | Status: Active"
