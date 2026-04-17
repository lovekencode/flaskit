<p align="center">
  <a href="https://github.com/lovekencode/flaskit">
    <img src="https://img.shields.io/badge/Flaskit-Modern%20Python%20Web%20Framework-blue?style=for-the-badge&logo=python" alt="Flaskit Framework">
  </a>
</p>

<p align="center">
  <pre>
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║   ███████╗███████╗ ██████╗██████╗ ███████╗████████╗         ║
║   ██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝╚══██╔══╝         ║
║   ███████╗█████╗  ██║     ██████╔╝█████╗     ██║            ║
║   ╚════██║██╔══╝  ██║     ██╔══██╗██╔══╝     ██║            ║
║   ███████║███████╗╚██████╗██║  ██║███████╗   ██║            ║
║   ╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝            ║
║                                                              ║
║                � FLASKIT FRAMEWORK 🔥                      ║
║         Modern Python Web Framework Developers Love         ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
  </pre>
</p>

<p align="center">
  <img alt="GitHub release" src="https://img.shields.io/github/v/release/lovekencode/flaskit?style=flat-square">
  <img alt="PyPI version" src="https://img.shields.io/pypi/v/flaskit?style=flat-square">
  <img alt="Python versions" src="https://img.shields.io/pypi/pyversions/flaskit?style=flat-square">
  <img alt="License" src="https://img.shields.io/github/license/lovekencode/flaskit?style=flat-square">
  <img alt="Code style" src="https://img.shields.io/badge/code%20style-black-000000?style=flat-square">
</p>

<p align="center">
  <strong>🚀 The Python Web Framework Developers Actually Love to Build With</strong>
</p>

## 🎯 Why Developers Love Flaskit

**Stop fighting with your framework. Start building amazing applications.**

Flaskit is the modern Python web framework that puts developer experience first. Built on proven architecture with modern tooling, it's everything you need to build real applications—nothing you don't.

### ✨ **What Makes Flaskit Different**

#### **🚀 Zero to Production in Minutes**
```bash
pip install flaskit
flaskit new my_app
flaskit serve
```
That's it. You're building features, not configuring frameworks.

#### **🎨 Beautiful, Pythonic Code**
```python
from flaskit import Route, Request

@Route.get("/users")
def users(request: Request):
    return User.all()

@Route.post("/users")
def create_user(request: Request, mail: Mail):
    user = User.create(request.all())
    mail.to(user.email).send(WelcomeEmail(user))
    return {"message": "User created"}
```

#### **🛠️ Everything Built In**
- ✅ **Active Record ORM** - Database interactions that feel natural
- ✅ **Authentication** - Complete auth system out of the box
- ✅ **Queue System** - Background jobs that just work
- ✅ **Task Scheduling** - Cron functionality built right in
- ✅ **Mail System** - Multiple drivers, beautiful mailables
- ✅ **Cache Layer** - Redis, file, or memory caching
- ✅ **API Tools** - RESTful development made simple
- ✅ **Event System** - Decoupled, event-driven architecture

### 🔥 **Features Developers Actually Use**

#### **Modern CLI That Doesn't Suck**
```bash
flaskit new my_app           # Create project
flaskit serve                # Start dev server
flaskit make controller User  # Generate code
flaskit migrate              # Database migrations
flaskit test                 # Run tests
```

#### **ORM That Makes Sense**
```python
# Beautiful relationships
user = User.find(1)
posts = user.posts().where('published', True).get()

# Automatic timestamps
user.name = 'Jane'
user.save()  # Updates updated_at automatically
```

#### **Queue System That Just Works**
```python
class SendWelcomeEmail:
    def handle(self, user):
        mail.to(user.email).send(WelcomeEmail(user))

Queue.push(SendWelcomeEmail(user))  # Fire and forget
```

### 🎯 **Built for Real Applications**

- **SaaS Platforms** - Multi-tenant with billing
- **E-commerce** - Catalogs, carts, payments  
- **API Services** - RESTful APIs with auth
- **Content Management** - Flexible content types
- **Real-time Apps** - WebSockets, notifications

### 🌟 **Why Developers Choose Flaskit**

1. **It Just Works** - No fighting with configuration
2. **It's Modern** - Python 3.7+, type hints, async support
3. **It's Complete** - Everything you need for real applications
4. **It's Fast** - Optimized for performance
5. **It's Professional** - Comprehensive docs, tests, CI/CD

---

**Flaskit: The Python Web Framework Developers Actually Love to Build With** 

*Because building web applications should be enjoyable, not painful.*

## Learning Flaskit

New to Flaskit? Read the [Official Documentation](https://docs.flaskitframework.com/).
Flaskit strives to have extremely clear documentation 😃. It would be wise to go through the tutorials there.
If you find any discrepencies or anything that doesn't make sense, please open an issue and we will get it cleared up!

Have questions or want to talk? Be sure to join the [Flaskit Discord Community](https://discord.gg/TwKeFahmPZ)!

## Getting Started Quickly

Create and activate a virtual environment and if you have a working Python <= 3.11 installation then getting started is as quick as typing

```bash
pip install flaskit
flaskit new .
flaskit serve
```

## Modern CLI Commands

Flaskit features a modern CLI with intuitive commands:

```bash
# Create a new project
flaskit new my_app

# Start development server
flaskit serve

# Generate controllers, models, etc.
flaskit make controller MyController
flaskit make model User

# Database migrations
flaskit migrate
flaskit migrate:rollback

# Run tests
flaskit test
```

## Modern File Structure

Flaskit features an improved and modern file structure for better organization:

```
flaskit/
├── src/
│   └── flaskit/           # Core framework code
├── docs/                  # Documentation files
│   ├── WHITEPAPER.md
│   ├── CONTRIBUTING.md
│   └── SECURITY.md
├── examples/              # Example applications
├── scripts/               # Build and utility scripts
│   ├── craft
│   └── Makefile
├── tests/                 # Test suite
└── wsgi.py               # WSGI entry point
```

## Contributing

Contributing to Flaskit is simple:

- Hop on [Flaskit Discord Community](https://discord.gg/TwKeFahmPZ) to ask any questions you need!
- Read the [How To Contribute](https://docs.flaskitframework.com/prologue/how-to-contribute) documentation to see ways to contribute to the project.
- Read the [Contributing Guide](https://docs.flaskitframework.com/prologue/contributing-guide) to learn how to contribute to the core source code development of the project.
- [Follow Flaskit Framework on X](https://x.com/flaskitproject) to get updates about tips and tricks, announcement and releases.

## Core Maintainers

- [Flaskit Team](https://github.com/flaskitframework)

## Sponsors

To become a sponsor head to our [GitHub Sponsors page](https://github.com/sponsors/FlaskitFramework)!

## Security Vulnerabilities

If you discover a security vulnerability within Flaskit please read the [Security Policy](./docs/SECURITY.md). All security vulnerabilities will be promptly addressed.

## License

The Flaskit framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
