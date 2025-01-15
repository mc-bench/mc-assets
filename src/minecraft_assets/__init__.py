"""A wrapper around PrismarineJS/minecraft-assets."""

import pathlib

__version__ = "1.13.0rc0"


def get_asset_root() -> pathlib.Path:
    """Return the absolute path to the root of the assets directory."""
    return pathlib.Path(__file__).parent / "data"


def get_asset_dir(version: str) -> pathlib.Path:
    """Return the absolute path to the assets directory for the specified Minecraft version."""
    return get_asset_root() / version
