from django.shortcuts import redirect, render, get_object_or_404
from .form import CustomUserCreationForm, EventForms, UserForm
from django.contrib.auth.forms import AuthenticationForm, PasswordChangeForm, PasswordResetForm
from django.contrib.auth import login, authenticate, logout
from django.contrib import messages
from LiveApp.models import Events
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.utils import timezone


def home(request):
    """
    View that returns the "homepage.html" template.
    """
    return render(request, 'homepage.html')

def register(request):
    """
    Allows you to register a user
    """
    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect("LiveApp:home")
        else:
            return render(request, 'formulaires/register.html', {'form': form})
    else:
        form = CustomUserCreationForm()
        return render(request, 'formulaires/register.html', {'form': form})

def connect(request):
    """
    Allows a user to login
    """
    if request.method == "POST":
        form = AuthenticationForm(data=request.POST)
        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect("LiveApp:home")
        else:
            return render(request, 'formulaires/connect.html', {'form': form, 'erreur': "Nom d'utilisateur ou mot de passe incorrect."})
    else:
        form = AuthenticationForm()
        return render(request, 'formulaires/connect.html', {'form': form})
    
def deconnexion(request):
    """
    Allows a user to log out
    """
    logout(request)
    return render(request, "users/deconnexion.html")

def profil(request):
    """
    Allows a user to access their profile page
    """
    if request.user.is_authenticated:
        user = request.user
        return render(request, 'users/profil.html',{'user': user})
    else:
        return redirect("LiveApp:home")

def change_password(request):
    """
    Allows a user to change their password
    """
    if request.method == 'POST':
        form = PasswordChangeForm(user=request.user, data=request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Votre mot de passe a été modifié avec succès.')
            return redirect('LiveApp:profil')
    else:
        form = PasswordChangeForm(user=request.user)
    return render(request, 'formulaires/change_password.html', {'form': form})

def events(request):
    """
    Allows you to see all the events
    """
    events = Events.objects.all().order_by('date_creation')
    return render(request, 'events/events.html', {'events':events})

@login_required
def user_events(request):
    """
    Allows to see all these user events
    """
    user = request.user
    events = Events.objects.filter(participants=user)
    return render(request, 'events/user_events.html', {'events': events})

def event(request, id):
    """
    Allows you to see the details of an event
    """
    if request.user.is_authenticated:
        user = request.user
        event = get_object_or_404(Events, id=id)

        if request.method == 'POST':
            event.add_participant(request.user)
            return redirect('LiveApp:event', id=id)
    
        return render(request, 'events/event.html', {'event': event,'user':user})
    else:
        return redirect("LiveApp:home")

def add_participant(request, id):
    """
    Used to add a user to the event
    """
    event = get_object_or_404(Events, id=id)
    event.add_participant(request.user)
    return redirect('LiveApp:event', id=id)
    
def remove_participant(request, id):
    """
    Used to remove a user from the event
    """
    event = get_object_or_404(Events, id=id)
    event.remove_participant(request.user)
    return redirect('LiveApp:event', id=id)

def adminstaff(request):
    if not request.user.is_staff:
        return redirect("LiveApp:home")
    
    user = request.user
    events = Events.objects.all()
    users = User.objects.all()

    num_events = events.count()
    num_ongoing_events = events.filter(date_event__gte=timezone.now()).count()
    num_finished_events = events.filter(date_event__lt=timezone.now()).count()
    num_employees = users.filter(is_staff=True).count;
    num_participants = users.count()
    num_participants_actif = users.exclude(events__isnull=True).count()

    return render(request, 'admin/backoffice.html', {
        'user':user, 
        'events':events, 
        'users':users, 
        'num_events': num_events, 
        'num_ongoing_events': num_ongoing_events, 
        'num_finished_events': num_finished_events,
        'num_employees': num_employees,
        'num_participants': num_participants,
        'num_participants_actif':num_participants_actif,
        })

def admin_events(request):
    if not request.user.is_staff:
        return redirect("LiveApp:home")

    events = Events.objects.all()
    return render(request, 'admin/adminevents.html', {'events': events})

def create_event(request):
    if not request.user.is_staff:
        return redirect("LiveApp:home")

    users = User.objects.all()

    if request.method == 'POST':
        form = EventForms(request.POST)
        if form.is_valid():
            event = form.save()
            return redirect('LiveApp:admin_events')
    else:
        form = EventForms()
    
    return render(request, 'formulaires/create_event.html', {'form': form, 'users':users})

def edit_event(request, id):
    if not request.user.is_staff:
        return redirect("LiveApp:home")

    event = get_object_or_404(Events, id=id)
    users = User.objects.all()

    if request.method == 'POST':
        form = EventForms(request.POST, instance=event)
        if form.is_valid():
            form.save()
            return redirect('LiveApp:admin_events')
    else:
        form = EventForms(instance=event)
    
    return render(request, 'formulaires/edit_event.html', {'form': form, 'event': event, 'users':users})

def delete_event(request, id):
    if not request.user.is_staff:
        return redirect("LiveApp:home")

    event = get_object_or_404(Events, id=id)

    if request.method == 'POST':
        event.delete()
        return redirect('LiveApp:admin_events')
    
    return render(request, 'formulaires/delete_event.html', {'event': event})

def admin_users(request):
    if not request.user.is_staff:
        return redirect("LiveApp:home")

    users = User.objects.all()
    form = UserForm()

    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('LiveApp:admin_users')

    return render(request, 'admin/adminusers.html', {'users': users, 'form': form})

def create_user(request):
    if not request.user.is_staff:
        return redirect("LiveApp:home")

    form = UserForm()

    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('LiveApp:admin_users')

    return render(request, 'formulaires/create_user.html', {'form': form})

def edit_user(request, user_id):
    if not request.user.is_staff:
        return redirect("LiveApp:home")

    user = get_object_or_404(User, id=user_id)
    form = UserForm(instance=user)

    if request.method == 'POST':
        form = UserForm(request.POST, instance=user)
        if form.is_valid():
            form.update_user(user)
            return redirect('LiveApp:admin_users')

    return render(request, 'formulaires/edit_user.html', {'form': form,'user':user})

def delete_user(request, user_id):
    if not request.user.is_staff:
        return redirect("LiveApp:home")

    user = get_object_or_404(User, id=user_id)

    if request.method == 'POST':
        user.delete()
        return redirect('LiveApp:admin_users')

    return render(request, 'formulaires/delete_user.html', {'user': user})