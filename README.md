# 🌍 S6J5 - The Big Project : Cookies et Préparation à la Production

## 📖 Résumé du cours
Cette journée a marqué la fin de la semaine 6 avec deux objectifs majeurs :
1. **Sessions Persistantes** : Utilisation des cookies pour que le navigateur se souvienne de l'utilisateur même après fermeture.
2. **Sécurité des Jetons** : Mise en place d'un système de jetons aléatoires (`remember_token`) dont seule la version hachée (`remember_digest`) est stockée en base de données pour prévenir le vol de session.
3. **Stratégie de Déploiement** : Analyse des solutions PaaS (Heroku vs Render) et configuration de l'application pour PostgreSQL en production.

## 💡 Ce que j'ai compris
* **Le concept d'Attribut Virtuel** : J'ai compris que toutes les données manipulées par un modèle ne sont pas forcément des colonnes en base de données. L'utilisation de `attr_accessor` est vitale pour les données temporaires comme le jeton en clair.
* **Différenciation des Environnements** : Rails permet d'isoler les dépendances (SQLite pour le développement local et PostgreSQL pour la production) via le Gemfile.
* **PaaS (Platform as a Service)** : Des outils comme Render ou Heroku automatisent l'infrastructure, nous permettant de nous concentrer sur le code Ruby.

## 🛠️ Installation et Prise en main
L'application est prête pour le déploiement.

1. **Persistence** : Cochez "Se souvenir de moi" lors de la connexion pour activer les cookies permanents.
2. **Production** : Le Gemfile est configuré pour utiliser la gem `pg` sur le serveur de production.
