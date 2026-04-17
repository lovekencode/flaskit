from setuptools import setup
import os

meta = {}
with open(
    os.path.join(
        os.path.abspath(os.path.dirname(__file__)), "src/flaskit", "__init__.py"
    ),
    "r",
) as f:
    exec(f.read(), meta)

with open("README.md", "r") as fh:
    long_description = fh.read()

setup(
    name="flaskit",
    # Versions should comply with PEP440.  For a discussion on single-sourcing
    # the version across setup.py and the project code, see
    # https://packaging.python.org/en/latest/single_source_version.html
    version=meta["__version__"],
    package_dir={"": "src"},
    description="The Flaskit Framework",
    long_description=long_description,
    long_description_content_type="text/markdown",
    # The project's main homepage.
    url="https://github.com/flaskitframework/flaskit",
    # Author details
    author="Flaskit Team",
    author_email="team@flaskitframework.com",
    # Choose your license
    license="MIT",
    # If your package should include things you specify in your MANIFEST.in file
    # Use this option if your package needs to include files that are not python files
    # like html templates or css files
    include_package_data=True,
    # List run-time dependencies here.  These will be installed by pip when
    # your project is installed. For an analysis of "install_requires" vs pip's
    # requirements files see:
    # https://packaging.python.org/en/latest/requirements.html
    install_requires=[
        "inflection>=0.3,<0.4",
        "exceptionite>=2.2,<3.0",
        "pendulum>=2,<3",
        "jinja2<3.2",
        "cleo>=0.8.1,<0.9",
        "hupper>=1.10,<1.11",
        "bcrypt>=3.2,<3.3",
        "whitenoise>=5.2,<5.3",
        "python-dotenv>=0.15,<0.16",
        "masonite-orm>=2.14,<3",
        "hashids>=1.3,<1.4",
        "cryptography>=36,<37",
        "tldextract>=2.2,<2.3",
        "hfilesize>=0.1",
        "dotty_dict>=1.3.0,<1.40",
        "pyjwt>=2.4,<2.5",
        "pytest>=7,<8",
        "werkzeug>=2,<3; python_version < '3.8'",
        "werkzeug>=3,<4; python_version >= '3.8'",
        "watchdog>=2,<=4",
        "phonenumbers>=8.12,<9",
    ],
    # See https://pypi.python.org/pypi?%3Aaction=list_classifiers
    classifiers=[
        # How mature is this project? Common values are
        #   3 - Alpha
        #   4 - Beta
        #   5 - Production/Stable
        "Development Status :: 5 - Production/Stable",
        # Indicate who your project is intended for
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Build Tools",
        "Environment :: Web Environment",
        # Pick your license as you wish (should match "license" above)
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        # Specify the Python versions you support here. In particular, ensure
        # that you indicate whether you support Python 2, Python 3 or both.
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Software Development :: Libraries :: Python Modules",
    ],
    # What does your project relate to?
    keywords="Flaskit, FlaskitFramework, Python, ORM",
    # You can just specify the packages manually here if your project is
    # simple. Or you can use find_packages().
    packages=[
        "flaskit",
        "flaskit.api",
        "flaskit.api.authentication",
        "flaskit.api.commands",
        "flaskit.api.controllers",
        "flaskit.api.facades",
        "flaskit.api.guards",
        "flaskit.api.middleware",
        "flaskit.api.providers",
        "flaskit.api.stubs",
        "flaskit.api.stubs.routes",
        "flaskit.auth",
        "flaskit.authentication.guards",
        "flaskit.authentication.models",
        "flaskit.authentication",
        "flaskit.authorization.models",
        "flaskit.authorization",
        "flaskit.broadcasting.controllers",
        "flaskit.broadcasting.drivers",
        "flaskit.broadcasting.providers",
        "flaskit.broadcasting",
        "flaskit.cache.drivers",
        "flaskit.cache",
        "flaskit.commands",
        "flaskit.configuration.providers",
        "flaskit.configuration",
        "flaskit.container",
        "flaskit.controllers",
        "flaskit.cookies",
        "flaskit.cors",
        "flaskit.drivers.queue",
        "flaskit.drivers.session",
        "flaskit.drivers",
        "flaskit.dumps",
        "flaskit.environment",
        "flaskit.essentials.helpers",
        "flaskit.essentials.middleware",
        "flaskit.essentials.providers",
        "flaskit.essentials",
        "flaskit.events.commands",
        "flaskit.events.providers",
        "flaskit.events",
        "flaskit.exceptions",
        "flaskit.exceptions.exceptionite",
        "flaskit.exceptions.handlers",
        "flaskit.facades",
        "flaskit.filesystem.drivers",
        "flaskit.filesystem.providers",
        "flaskit.filesystem",
        "flaskit.foundation",
        "flaskit.hashing.drivers",
        "flaskit.hashing",
        "flaskit.headers",
        "flaskit.helpers",
        "flaskit.input",
        "flaskit.loader",
        "flaskit.mail.drivers",
        "flaskit.mail",
        "flaskit.middleware.route",
        "flaskit.middleware",
        "flaskit.notification.commands",
        "flaskit.notification.drivers.vonage",
        "flaskit.notification.drivers",
        "flaskit.notification.providers",
        "flaskit.notification",
        "flaskit.orm",
        "flaskit.orm.commands",
        "flaskit.orm.providers",
        "flaskit.packages.providers",
        "flaskit.packages",
        "flaskit.pipeline.tasks",
        "flaskit.pipeline",
        "flaskit.presets",
        "flaskit.presets.providers",
        "flaskit.providers",
        "flaskit.queues",
        "flaskit.request",
        "flaskit.response",
        "flaskit.rates",
        "flaskit.rates.providers",
        "flaskit.routes",
        "flaskit.routes.commands",
        "flaskit.scheduling.commands",
        "flaskit.scheduling.providers",
        "flaskit.scheduling",
        "flaskit.sessions",
        "flaskit.storage",
        "flaskit.templates",
        "flaskit.tests",
        "flaskit.utils",
        "flaskit.utils.data",
        "flaskit.validation.commands",
        "flaskit.validation.providers",
        "flaskit.validation.resources",
        "flaskit.validation",
        "flaskit.views",
    ],
    # List additional groups of dependencies here (e.g. development
    # dependencies). You can install these using the following syntax,
    # for example:
    # $ pip install -e .[dev,test]
    # $ pip install your-package[dev,test]
    extras_require={
        "test": [
            "coverage",
            "pytest",
            "redis",
            "boto3",
            "pusher",
            "pymemcache",
            "vonage",
            "slackblocks",
            "argon2-cffi",
            "pwnedapi",
        ],
    },
    # If there are data files included in your packages that need to be
    # installed, specify them here.  If using Python 2.6 or less, then these
    # have to be included in MANIFEST.in as well.
    ## package_data={
    ##     'sample': [],
    ## },
    # Although 'package_data' is the preferred approach, in some case you may
    # need to place data files outside of your packages. See:
    # http://docs.python.org/3.4/distutils/setupscript.html#installing-additional-files # noqa
    # In this case, 'data_file' will be installed into '<sys.prefix>/my_data'
    ## data_files=[('my_data', ['data/data_file.txt'])],
    # To provide executable scripts, use entry points in preference to the
    # "scripts" keyword. Entry points provide cross-platform support and allow
    # pip to create the appropriate form of executable for the target platform.
    entry_points={
        "console_scripts": [
            "flaskit = flaskit.commands.Entry:application.run",
        ],
    },
)
