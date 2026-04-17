#!/bin/bash
# Flaskit Git Setup Script - Professional Repository Setup
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Function to print colored output
print_header() {
    echo -e "${PURPLE}================================${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}================================${NC}"
}

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

print_step() {
    echo -e "${CYAN}[STEP]${NC} $1"
}

# Flaskit ASCII Art
echo -e "${CYAN}"
cat << "EOF"
 _____ _   _ _   _    _    _   _  ____ _____ ____  
| ____| \ | | | | |  / \  | \ | |/ ___| ____|  _ \ 
|  _| |  \| | |_| | / _ \ |  \| | |   |  _| | | | |
| |___| |\  |  _  |/ ___ \| |\  | |___| |___| |_| |
|_____|_| \_|_| |_/_/   \_\_| \_|\____|_____|____/ 
                                                   
    FRAMEWORK - Professional Git Setup
EOF
echo -e "${NC}"

print_header "FLASKIT PROFESSIONAL GIT SETUP"

# Check if we're in the right directory
if [ ! -f "setup.py" ] || [ ! -f "pyproject.toml" ]; then
    print_error "Must be run from Flaskit root directory (contains setup.py and pyproject.toml)"
    exit 1
fi

# Step 1: Check Git configuration
print_step "Step 1: Checking Git configuration..."
if ! git config --global user.name >/dev/null 2>&1; then
    print_warning "Git user.name not configured"
    read -p "Enter your Git username: " GIT_USERNAME
    git config --global user.name "$GIT_USERNAME"
fi

if ! git config --global user.email >/dev/null 2>&1; then
    print_warning "Git user.email not configured"
    read -p "Enter your Git email: " GIT_EMAIL
    git config --global user.email "$GIT_EMAIL"
fi

print_success "Git configuration checked"
echo "  User: $(git config --global user.name)"
echo "  Email: $(git config --global user.email)"

# Step 2: Initialize Git repository
print_step "Step 2: Initializing Git repository..."
if [ -d ".git" ]; then
    print_warning "Git repository already exists"
    read -p "Do you want to reinitialize? (yes/no): " REINIT
    if [ "$REINIT" = "yes" ]; then
        rm -rf .git
        git init
        print_success "Git repository reinitialized"
    else
        print_status "Keeping existing Git repository"
    fi
else
    git init
    print_success "Git repository initialized"
fi

# Step 3: Create .gitignore if not exists
print_step "Step 3: Checking .gitignore..."
if [ ! -f ".gitignore" ]; then
    cat > .gitignore << 'EOF'
# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
pip-wheel-metadata/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
.python-version

# pipenv
Pipfile.lock

# PEP 582
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/

# Flaskit specific
.DS_Store
*.sqlite
*.sqlite3
.env.local
.env.production
logs/
storage/app/public/
storage/framework/cache/
storage/framework/sessions/
storage/framework/testing/
storage/framework/views/
storage/logs/

# IDE
.vscode/
.idea/
*.swp
*.swo
*~

# OS
Thumbs.db
.DS_Store
EOF
    print_success "Created .gitignore"
else
    print_status ".gitignore already exists"
fi

# Step 4: Add all files
print_step "Step 4: Adding files to Git..."
git add .
print_success "Files added to Git"

# Step 5: Check status
print_step "Step 5: Checking Git status..."
git status --porcelain

# Step 6: Create professional commit
print_step "Step 6: Creating initial commit..."
COMMIT_MESSAGE="feat: Initial Flaskit Framework v1.0.0

🚀 Modern Python Web Framework

This is the initial release of Flaskit, a modern Python web framework
based on Masonite architecture with significant improvements and modern
tooling.

✨ Features:
- Modern CLI with 'flaskit' command
- Complete MVC architecture with Active Record ORM
- Authentication and authorization system
- Queue system for background jobs
- Task scheduling capabilities
- Event-driven architecture
- Mail system with multiple drivers
- Caching and session management
- API development tools
- Comprehensive middleware system
- Modern file structure organization

🛠️ Technical Improvements:
- Modern file structure (docs/, examples/, scripts/)
- Professional CI/CD pipeline
- Complete test suite
- PyPI-ready packaging
- GitHub templates and workflows
- Professional documentation

📦 Installation:
pip install flaskit
flaskit new my_app
flaskit serve

🏗️ Architecture:
- Based on Masonite 4.20.3
- Modern Python 3.7+ support
- IOC Container pattern
- Service Provider architecture
- Active Record ORM

📚 Documentation:
- Complete README with getting started guide
- API documentation
- Examples and tutorials
- Contributing guidelines

🔧 Development:
- Professional Git workflow
- Issue and PR templates
- Automated testing and releases
- Code quality checks

This release represents months of work to create a modern,
professional Python web framework that's easy to use and extend."

git commit -m "$COMMIT_MESSAGE"
print_success "Initial commit created"

# Step 7: Create branches
print_step "Step 7: Creating branch structure..."
git branch -M main
print_success "Main branch created/updated"

git checkout -b develop
print_success "Develop branch created"

git checkout main
print_success "Switched back to main branch"

# Step 8: Instructions for GitHub
print_header "NEXT STEPS - GITHUB SETUP"

echo -e "${BLUE}1. Create GitHub Repository:${NC}"
echo "   - Go to: https://github.com/new"
echo "   - Repository name: flaskit"
echo "   - Description: Modern Python Web Framework"
echo "   - Public: Yes"
echo "   - Don't add README, .gitignore, or license"

echo -e "${BLUE}2. Add Remote Origin:${NC}"
echo "   git remote add origin https://github.com/YOUR_USERNAME/flaskit.git"

echo -e "${BLUE}3. Push to GitHub:${NC}"
echo "   git push -u origin main"
echo "   git push -u origin develop"

echo -e "${BLUE}4. Configure GitHub:${NC}"
echo "   - Add secrets (PYPI_API_TOKEN)"
echo "   - Set up branch protection"
echo "   - Configure labels and milestones"
echo "   - Enable discussions and wiki"

echo -e "${BLUE}5. Create First Release:${NC}"
echo "   git tag v1.0.0"
echo "   git push origin v1.0.0"

print_success "Git setup completed! 🎉"
echo ""
echo -e "${CYAN}Flaskit is ready for professional GitHub deployment!${NC}"
echo -e "${CYAN}Follow the steps above to complete the setup.${NC}"
