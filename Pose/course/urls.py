from django.urls import path

from django.conf import settings
from django.conf.urls.static import static
from . import views

urlpatterns = [
    path('addPoseForm', views.get_pose_add),
    path('addPose/', views.add_pose),
    path('delete/<int:id>', views.delete_pose),
    path('editPoseForm/<int:id>', views.get_pose_edit),
    path('editPose/<int:id>', views.edit_pose),
    path('findPose/', views.get_pose_find),
    path('searchPose/', views.get_pose_search),
    path('detail/<int:id_pose>', views.detail_view),
]
