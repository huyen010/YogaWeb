from django.db import models
from django.utils import timezone

# Create your models here.
class user(models.Model):
    user_id = models.AutoField(primary_key=True)
    username = models.CharField(max_length=40,null=False)
    password = models.CharField(max_length=40,null=False)
    first_name = models.CharField(max_length=40, default="Nguyen")
    last_name = models.CharField(max_length=40, default="Tuyet")
    email = models.CharField(max_length=50, null=True)
    phone = models.CharField(max_length=10, default="0123456789")
    address = models.CharField(max_length=500, default="Viet Nam")
    date = models.DateTimeField(default=timezone.now)
    gender = models.BooleanField(default=True)
    role = models.BooleanField(default=False, null=True)

    def __str__(self):
        return f"{self.user_id}, {self.username}, {self.password}, {self.first_name}, {self.last_name},{self.email}, {self.phone},{self.address}, {self.date},{self.gender}, {self.role}"
