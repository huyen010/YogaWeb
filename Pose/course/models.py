from datetime import datetime
from django.db import models
from user.models import user

# Create your models here.


class Pose(models.Model):
    idPose = models.AutoField(primary_key=True)
    name = models.CharField(max_length=200, null=False)
    times = models.IntegerField(null=False, default=0)
    image1 = models.ImageField(upload_to="images", null=False, default=None)
    image2 = models.ImageField(upload_to="images", null=False, default=None)
    image3 = models.ImageField(upload_to="images", null=False, default=None)
    image4 = models.ImageField(upload_to="images", null=False, default=None)
    image5 = models.ImageField(upload_to="images", null=False, default=None)
    image6 = models.ImageField(upload_to="images", null=False, default=None)
    image7 = models.ImageField(upload_to="images", null=False, default=None)
    image8 = models.ImageField(upload_to="images", null=False, default=None)
    image9 = models.ImageField(upload_to="images", null=False, default=None)
    image10 = models.ImageField(upload_to="images", null=False, default=None)
    advantage = models.TextField(null=False)
    excepts = models.TextField(null=False)
    exercise = models.TextField(null=False)
class Pose_history(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=40,null=False)
    Check = models.CharField(max_length=40,null=False)
    time = models.TimeField(default=datetime.now)
    image = models.ImageField(upload_to="images", null=False, default=None)


