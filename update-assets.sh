#!/bin/bash

# Exit on any error
set -e

# Configuration
MINECRAFT_ASSETS_VERSION="1.13.0"
TEMP_DIR=$(mktemp -d)
TARGET_DIR="${1:-src/minecraft_assets/data}"  # Allow override via first argument

echo "Creating temporary directory at: $TEMP_DIR"

# Clone the repository at specific version
echo "Cloning PrismarineJS/minecraft-assets at version $MINECRAFT_ASSETS_VERSION..."
git clone git@github.com:PrismarineJS/minecraft-assets.git "$TEMP_DIR"
cd "$TEMP_DIR"
git checkout "$MINECRAFT_ASSETS_VERSION"

# Go back to original directory
cd -

# Remove existing data directory if it exists
echo "Removing existing data directory..."
rm -rf "$TARGET_DIR"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Copy data directory from cloned repo
echo "Copying new assets..."
cp -r "$TEMP_DIR/data/"* "$TARGET_DIR/"

# Cleanup
echo "Cleaning up temporary directory..."
rm -rf "$TEMP_DIR"

echo "Assets update complete!" 