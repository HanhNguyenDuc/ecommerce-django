from django.db import models
from django.contrib.auth.models import User
from .enums import *


def custom_media_path(instance, filename):
    file_ext = filename.split(".")[-1]
    return str(uuid.uuid4()) + "." + file_ext


class Image(models.Model):
    img_url = models.FileField(
        upload_to=custom_media_path, max_length=100, default="default.jpg"
    )

# Create your models here.

class Comment(models.Model):
    content = models.CharField("content", max_length=255)
    rate = models.IntegerField("rate", default=1)
    created_time = models.TimeField("created_time", auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
