from django import forms

from .models import Events
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class CustomUserCreationForm(UserCreationForm):
    first_name = forms.CharField(max_length=30) 
    last_name  = forms.CharField(max_length=30) 
    email = forms.CharField(max_length=254)

    class Meta:
        model = User
        fields = ['username', 'first_name','last_name', 'email', 'password1', 'password2']

class EventForms(forms.ModelForm):
    class Meta:
        model = Events
        fields = ['titre', 'content', 'nb_participant_max', 'participants', 'date_event']

class UserForm(forms.ModelForm):
    password = forms.CharField(required=False, widget=forms.PasswordInput)

    class Meta:
        model = User
        fields = ['username','first_name','last_name', 'email', 'password', 'is_staff', 'is_superuser']
        widgets = {
            'password': forms.PasswordInput(),
        }
    def save(self):
        user = User(
            username=self.cleaned_data['username'],
            first_name=self.cleaned_data['first_name'],
            last_name=self.cleaned_data['last_name'],
            email=self.cleaned_data['email'],
            is_staff=self.cleaned_data['is_staff'],
            is_superuser=self.cleaned_data['is_superuser']
        )
        password = self.cleaned_data['password']
        if password:
            user.set_password(password)
        user.save()
        return user
    
    def update_user(self, user):
        user.username = self.cleaned_data['username']
        user.first_name = self.cleaned_data['first_name']
        user.last_name = self.cleaned_data['last_name']
        user.email = self.cleaned_data['email']
        user.is_staff = self.cleaned_data['is_staff']
        user.is_superuser = self.cleaned_data['is_superuser']
        password = self.cleaned_data['password']
        if password:
            user.set_password(password)
        else:
            user.password = user.password
        user.save()
        return user