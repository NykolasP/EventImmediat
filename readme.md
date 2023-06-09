# Context
C'est un projet Livecampus sous Django, le but de ce project est de réaliser une application qui gère et permet de créer des evenements

# Déploiement
## Prérequis
- Python
- Un serveur local avec MySQL dessus
## Instalation
1 - Récupérer le projet sur votre environement
```
https://github.com/NykolasP/EventImmediat.git
```
2 - Entrer dans le répertoire
```
cd EventImmediat
```
3 - Créez un environnement virtuel :
```
python -m venv venv
```
4 - Activez ensuite l'environnement virtuel :

Sous Windows :
```
venv\Scripts\activate
```
Sous macOS/Linux :
```
source venv/bin/activate
```
5 - installer les packages
```
pip install -r requirements.txt
``` 
6 - Configurez les paramètres de la base de données MySQL dans le fichier 'settings.py'
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'nom_de_la_base_de_données',
        'USER': 'nom_d_utilisateur',
        'PASSWORD': 'mot_de_passe',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```
## Contenu BDD
### Avec BDD
1- Installer la base de données fourni dans le git pour avoir accès directement au compte créer

2- Effectuer quand même cette commande
```
python manage.py migrate
```

3 - Lancer le serveur
```
python manage.py runserver
```
### Sans BDD
1 - Effectuer quand même cette commande
```
python manage.py migrate
```
2 - Créer un super utilisateur pour avoir accès au BO
```
python manage.py create_superuser
```
3 - Lancer le serveur
```
python manage.py runserver
```
# Fonctionnalité
## Si BDD
Voci les accès au compte pour tester les fonctionnalités
### Utilisateur
```
id : test_utilisateur
mdp : azerty123456789
```

### Admin
```
id : test_admin
mdp : azerty123456789
```

### Staff
```
id : test_staff
mdp : azerty123456789
```

## Utilisateur lambda
- Il peut seulement accèder à la page d'accueil
- Se créer un compte

## Utilisateur Connecter
- Il peut accèder au evenements
- Voir les détails des evenements
- Accèder a au evenements qu'il participe
- Accèder a sa page profil
- Changer de mot de passe

## Utilisateur Staff
- Il possède les fonctionnalité qu'un utilisateur connécter
- Il a accès a un BO a coter de "profil"
- Sur le BO on voit qu'il est employer
- Dans le Header 2 nouveau champs son disponnible "Utilisateurs" et "Evenements"
- Il peut créer un utilisateur, editer, supprimer
- Il peut également passer des personnes en tant que role employes
- Il peut créer un evenements, editer, supprimer
- Il ne peut pas supprimer les personnes qui on le role "superuser"

## Utilisateur Admin
- Il possède les fonctionnalité qu'un utilisateur staff
- Peut supprimer les utilisateurs ayant le role superuser