from django.urls import path
from . import views

urlpatterns = [
    path('',views.Poses,name = 'poses'),
    path('/<int:id>',views.PoseByID,name = 'PoseById'),
]
