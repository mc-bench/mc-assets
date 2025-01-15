# minecraft-assets

Python wrapper for [PrismarineJS/minecraft-assets](https://github.com/PrismarineJS/minecraft-assets).

## Installation

This package requires Python 3.9 or higher, and supports Python versions up to 3.13.

First, create and activate a virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate  # On Unix/macOS
# or
.venv\Scripts\activate     # On Windows
```

Install the package:
```bash
pip install -e .
```

For development:
```bash
pip install -e ".[dev]"
```

## Usage

```python
from minecraft_assets import get_asset_root, get_asset_dir

# Get the root assets directory
assets_root = get_asset_root()
print(assets_root)  # Path to the root assets directory

# Get assets directory for a specific version
version_dir = get_asset_dir("1.20.4")
print(version_dir)  # Path to version-specific assets

# Will raise MinecraftVersionError if version doesn't exist
try:
    invalid_dir = get_asset_dir("9.99.99")
except MinecraftVersionError as e:
    print(f"Error: {e}")
```

The package provides functions to access Minecraft asset directories. Each version's directory contains the raw asset files from the corresponding Minecraft version.

## Development

This project uses:
- [ruff](https://github.com/astral-sh/ruff) for linting and formatting
- [pytest](https://docs.pytest.org/) for testing
- [setuptools](https://setuptools.pypa.io/) for building

### Make Commands

Remember to activate your virtual environment before running these commands:

```bash
make format     # Format code using ruff
make lint       # Run linting checks
make test       # Run tests
make clean      # Clean build artifacts and virtual environment
```

### Version Strategy

This package follows the version numbers of the upstream minecraft-assets repository, with the addition of release candidate suffixes (e.g., `1.21.0rc1`) during development. Once a version is thoroughly tested, it will be released with the matching version number from minecraft-assets. 

## Building Distributions

To build both source distribution (sdist) and wheel distribution (bdist_wheel):

```bash
python -m build
```

This will create:
- A source distribution (.tar.gz) in the `dist/` directory
- A wheel distribution (.whl) in the `dist/` directory

### Validating Distribution Contents

To inspect the contents of the source distribution:
```bash
tar tzf dist/*.tar.gz  # List contents without extracting
# or
tar xzf dist/*.tar.gz -C /tmp  # Extract to /tmp for inspection
```

To inspect the wheel distribution (which is a ZIP file):
```bash
unzip -l dist/*.whl  # List contents without extracting
# or
unzip dist/*.whl -d /tmp  # Extract to /tmp for inspection
```

To clean all build artifacts and start fresh:
```bash
make clean
```

## License

See [LICENSE](LICENSE) for more information.
