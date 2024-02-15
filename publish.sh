#!/bin/bash

# Exit in case of error
set -e

echo "Installing required packages..."
pip install wheel twine

echo "Generating distribution archives..."
python3 setup.py sdist bdist_wheel

echo "Uploading the package to TestPyPI..."
twine upload --repository-url https://test.pypi.org/legacy/ dist/*

echo "Reminder: Test your package with TestPyPI before uploading to the real PyPI!"
echo "Use the following command to install from TestPyPI:"
echo "pip install --index-url https://test.pypi.org/simple/ your-package-name"

echo "When ready, upload your package to PyPI with:"
echo "twine upload dist/*"
