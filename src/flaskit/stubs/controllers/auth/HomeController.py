from flaskit.controllers import Controller
from flaskit.views import View


class HomeController(Controller):
    def show(self, view: View):
        return view.render("auth.home")
