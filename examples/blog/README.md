# Flaskit Blog Example

Une application de blog simple construite avec Flaskit Framework pour démontrer les fonctionnalités de base.

## Fonctionnalités

- Création et affichage d'articles
- Système de commentaires
- Authentification des utilisateurs
- Interface d'administration
- API REST

## Installation

```bash
# Cloner l'exemple
git clone https://github.com/flaskitframework/flaskit.git
cd flaskit/examples/blog

# Installer Flaskit
pip install flaskit

# Démarrer le serveur
flaskit serve
```

## Structure

```
blog/
├── config/
├── app/
│   ├── controllers/
│   ├── models/
│   └── views/
├── routes/
├── migrations/
└── storage/
```

## Utilisation

1. Accéder à `http://localhost:8000`
2. Créer un compte utilisateur
3. Commencer à écrire des articles

## API Endpoints

- `GET /api/posts` - Lister les articles
- `POST /api/posts` - Créer un article
- `GET /api/posts/{id}` - Voir un article
- `PUT /api/posts/{id}` - Mettre à jour un article
- `DELETE /api/posts/{id}` - Supprimer un article
