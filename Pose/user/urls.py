from django.urls import path, include

from course.views import get_history
from .views import detail_view, update_user, update_password
from . import views

urlpatterns = [
    path('my-course', get_history, name='my-course'),
    path('account-view', detail_view, name='account_view'),
    path('update-id=<int:id>', update_user, name='update_view'),
    path('update-password-id=<int:id>', update_password, name='update_password'),
    path('login', views.login_view),
    path('adminhome/', views.get_home_admin, name='adminhome'),
    path('viewmoves/', views.get_view_moves, name='get_view_moves'),
    path('userhome/', views.get_home_user),
    path('logout',views.logout_view),
    path('register', views.register_view)
]