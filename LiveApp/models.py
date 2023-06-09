from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class Events(models.Model):
    id = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=100)
    content = models.TextField()
    nb_participant_max = models.IntegerField()
    participants = models.ManyToManyField(User, related_name='events')
    date_event = models.DateField()
    date_creation = models.DateTimeField(auto_now_add=True)

    def add_participant(self, user):
        self.participants.add(user)
    
    def remove_participant(self, user):
        self.participants.remove(user)