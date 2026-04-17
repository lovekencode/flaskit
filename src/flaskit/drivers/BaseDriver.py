from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from flaskit.foundation import Application


class BaseDriver:
    """Base Session driver"""

    def __init__(self, application: "Application"):
        self.application = application
        self.options = {}

    def set_options(self, options: dict):
        self.options = options
        return self
