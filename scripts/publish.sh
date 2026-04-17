#!/bin/bash
# Flaskit Publication Script
set -e

echo "🚀 Starting Flaskit publication process..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
if [ ! -f "setup.py" ] || [ ! -f "pyproject.toml" ]; then
    print_error "Must be run from Flaskit root directory (contains setup.py and pyproject.toml)"
    exit 1
fi

# Check if virtual environment is active
if [ -z "$VIRTUAL_ENV" ]; then
    print_warning "No virtual environment detected. Consider activating one."
fi

# Step 1: Run tests
print_status "Running tests..."
if python -m pytest; then
    print_success "All tests passed!"
else
    print_error "Tests failed. Please fix them before publishing."
    exit 1
fi

# Step 2: Check version
print_status "Checking version..."
VERSION=$(python -c "import sys; sys.path.insert(0, 'src'); import flaskit; print(flaskit.__version__)")
print_status "Current version: $VERSION"

# Step 3: Clean previous builds
print_status "Cleaning previous builds..."
rm -rf build/ dist/ *.egg-info/

# Step 4: Install build dependencies
print_status "Installing build dependencies..."
pip install --upgrade build twine wheel

# Step 5: Build the package
print_status "Building package..."
if python -m build; then
    print_success "Package built successfully!"
else
    print_error "Package build failed."
    exit 1
fi

# Step 6: Check the package
print_status "Checking package..."
if twine check dist/*; then
    print_success "Package check passed!"
else
    print_error "Package check failed."
    exit 1
fi

# Step 7: Ask for publication target
echo ""
echo "Where do you want to publish?"
echo "1) TestPyPI (for testing)"
echo "2) PyPI (production)"
read -p "Choose (1 or 2): " choice

case $choice in
    1)
        print_status "Publishing to TestPyPI..."
        if twine upload --repository testpypi dist/*; then
            print_success "Published to TestPyPI!"
            print_status "Install with: pip install --index-url https://test.pypi.org/simple/ flaskit"
        else
            print_error "Failed to publish to TestPyPI."
            exit 1
        fi
        ;;
    2)
        print_warning "You are about to publish to PRODUCTION PyPI!"
        read -p "Are you sure? (yes/no): " confirm
        if [ "$confirm" = "yes" ]; then
            print_status "Publishing to PyPI..."
            if twine upload dist/*; then
                print_success "Published to PyPI!"
                print_status "Install with: pip install flaskit"
            else
                print_error "Failed to publish to PyPI."
                exit 1
            fi
        else
            print_status "Publication cancelled."
            exit 0
        fi
        ;;
    *)
        print_error "Invalid choice."
        exit 1
        ;;
esac

# Step 8: Git tag (if production)
if [ "$choice" = "2" ]; then
    print_status "Creating git tag..."
    if git tag "v$VERSION"; then
        print_success "Tag v$VERSION created!"
        print_status "Push tag with: git push origin v$VERSION"
    else
        print_warning "Failed to create tag (may already exist)."
    fi
fi

print_success "🎉 Flaskit publication completed successfully!"
echo ""
echo "Next steps:"
echo "1. Test the installation"
echo "2. Create GitHub release"
echo "3. Update documentation"
echo "4. Announce the release"
