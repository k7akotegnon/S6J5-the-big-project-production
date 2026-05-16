# 📓 Journal de Bord : Full CRUD (S6J3)

## 🧠 Ce que j'ai appris
* **L'importance de l'assignation** : J'ai appris à la dure que générer un contrôleur avec une action ne suffit pas ; il faut impérativement que la méthode dans le fichier `.rb` aille chercher l'objet (ex: `@city = City.find(params[:id])`) pour que la vue puisse l'afficher.
* **Verbes HTTP** : J'ai compris que `edit` utilise GET, `update` utilise PATCH/PUT, et `destroy` utilise DELETE. Chaque verbe a une mission précise dans l'architecture REST.

## 🥊 Mes combats (Debug Story)
* **Erreur nil sur la ville** : Ma page ville affichait une erreur car `@city` était vide. J'ai résolu cela en complétant la méthode `show` du `CitiesController`.

* **Problème de suppression** : Le lien de suppression ne fonctionnait pas car Rails 8 demande une syntaxe spécifique pour Turbo. En passant à `data: { turbo_method: :delete }`, le bouton est devenu fonctionnel.

## 📜 Liste des commandes exécutées
1. `cp -r S6J2/projet S6J3/projet` : Reprise du travail de la veille.

2. `rails generate controller cities show` : Création du contrôleur pour les profils de villes.
3. `rails db:migrate` : Pour s'assurer que la structure est à jour.
4. `rails routes` : Pour vérifier les prefixes `edit_gossip_path` et `city_path`.
