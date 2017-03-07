from django.db import models

class Memo(models.Model):
    category = models.CharField(max_length=250, default = "None")
    title = models.CharField(max_length=250, default = "")
    content = models.TextField()
    tasks = models.TextField(default = "")
    images = models.CharField(max_length=250, default = "")
