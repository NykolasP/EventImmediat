from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

app_name = 'Live'

urlpatterns =[
    path('',views.home,name='home'),

    path('inscription/', views.register, name='register'),
    path('connexion/', views.connect, name='connect'),
    path('deconnexion/', views.deconnexion, name='deconnexion'),
    path('profil',views.profil,name='profil'),
    path('change-password/', views.change_password, name='change_password'),

    path('events/', views.events, name='events'),
    path('myevents/', views.user_events, name='myevents'),
    path('event/<int:id>/', views.event, name='event'),
    path('event/<int:id>/add_participant/', views.add_participant, name='add_participant'),
    path('event/<int:id>/remove_participant/', views.remove_participant, name='remove_participant'),

    path('adminstaff/',views.adminstaff,name='adminstaff'),

    path('adminstaff/events/', views.admin_events, name='admin_events'),
    path('adminstaff/events/create/', views.create_event, name='create_event'),
    path('adminstaff/events/edit/<int:id>/', views.edit_event, name='edit_event'),
    path('adminstaff/events/delete/<int:id>/', views.delete_event, name='delete_event'),

    path('adminstaff/users/', views.admin_users, name='admin_users'),
    path('adminstaff/users/create/', views.create_user, name='create_user'),
    path('adminstaff/users/edit/<int:user_id>/', views.edit_user, name='edit_user'),
    path('adminstaff/users/delete/<int:user_id>/', views.delete_user, name='delete_user'),
]