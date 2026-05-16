class UsersController < ApplicationController
  # Affiche le profil d'un utilisateur spécifique
  def show
    @user = User.find(params[:id])
  end

  # Prépare un objet User vide pour le formulaire d'inscription (Sign Up)
  def new
    @user = User.new
  end

  # Traite les données envoyées par le formulaire d'inscription
  def create
    # On crée l'utilisateur avec les données reçues du formulaire via le hash params
    # Comme on a une relation belongs_to :city, on assigne une ville par défaut
    @user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      description: params[:description],
      email: params[:email],
      age: params[:age],
      password: params[:password],
      city: City.all.sample # On prend une ville au hasard pour éviter l'erreur "City must exist"
    )

    if @user.save
      # Si la sauvegarde réussit, on connecte l'utilisateur immédiatement
      log_in(@user) 
      flash[:success] = "Ton compte a été créé avec succès ! Bienvenue, #{@user.first_name}."
      redirect_to root_path
    else
      # Si la sauvegarde échoue (ex: mot de passe trop court), on reste sur la page d'inscription
      # pour afficher les erreurs de validation
      render :new
    end
  end
end
