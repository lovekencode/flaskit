from flaskit.controllers import Controller
from flaskit.views import View


class __class__(Controller):
    def show(self, view: View):
        return view.render("welcome")
