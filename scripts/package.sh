#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$(dirname "$ROOT_DIR")"
zip -r java-telegram-bot-builder.zip java-telegram-bot-builder
