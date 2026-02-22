#!/bin/bash

BASE_URL="https://huggingface.co/ibrahimkettaneh/Qwen2.5-72B-Instruct-abliterated-AWQ/resolve/main"
DEST_DIR="/runpod-volume/model-72b"

FILES=(
  "config.json"
  "generation_config.json"
  "special_tokens_map.json"
  "tokenizer_config.json"
  "tokenizer.json"
  "vocab.json"
  "merges.txt"
  "added_tokens.json"
  "model.safetensors.index.json"
  "model-00001-of-00009.safetensors"
  "model-00002-of-00009.safetensors"
  "model-00003-of-00009.safetensors"
  "model-00004-of-00009.safetensors"
  "model-00005-of-00009.safetensors"
  "model-00006-of-00009.safetensors"
  "model-00007-of-00009.safetensors"
  "model-00008-of-00009.safetensors"
  "model-00009-of-00009.safetensors"
)

mkdir -p "$DEST_DIR"
cd "$DEST_DIR" || { echo "Failed to change directory to $DEST_DIR"; exit 1; }

for FILE in "${FILES[@]}"; do
  echo "Downloading: $FILE"
  if ! wget --continue --show-progress "$BASE_URL/$FILE"; then
    echo "Failed to download $FILE"
    exit 1
  fi
  echo ""
done

echo "All files downloaded. Contents of $DEST_DIR:"
ls -lh "$DEST_DIR"
