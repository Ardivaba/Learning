from django.conf.urls import url
from django.contrib import admin
from . import views

def register_default_system(name):
    return [
        url(r'^' + name + '/id/(?P<id>[-\w]+)/$', getattr(views, name + "_id")),
        url(r'^' + name + '/create/$', getattr(views, name + "_create")),
        url(r'^' + name + '/update/$', getattr(views, name + "_update")),
        url(r'^' + name + '/delete/$', getattr(views, name + "_delete")),
        url(r'^' + name, getattr(views, name))
    ]

# register_default_system("memos")

urlpatterns = register_default_system("memos")
