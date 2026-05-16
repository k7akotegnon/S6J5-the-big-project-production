class GossipsController < ApplicationController

  # On interdit l'accès à 'new' et 'create' si on n'est pas connecté
  before_action :authenticate_user, only: [:new, :create, :show]

  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  # Traite la création du potin en base de données
  def create
    @gossip = Gossip.new(
    title: params[:title], 
    content: params[:content], 
    user: current_user # <--- Utilise l'utilisateur connecté !
  )
    if @gossip.save
      flash[:success] = "Potin créé avec succès !"
      redirect_to root_path
    else
      render :new
    end
  end

  # Affiche le formulaire d'édition pré-rempli
  def edit
    @gossip = Gossip.find(params[:id])
  end

  # Traite la modification en base de données
  def update
    @gossip = Gossip.find(params[:id])
    # On utilise les paramètres du formulaire pour mettre à jour l'objet
    if @gossip.update(title: params[:title], content: params[:content])
      flash[:success] = "Potin mis à jour !"
      redirect_to @gossip # Redirige vers la page show du potin
    else
      render :edit
    end
  end

  # Supprime le potin
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    flash[:success] = "Le potin a été supprimé avec succès."
    redirect_to root_path # On retourne à l'accueil après la suppression
  end

  private
  
    def authenticate_user
    unless logged_in?
      flash[:danger] = "Connecte-toi pour poster un potin !"
      redirect_to new_session_path
    end
  end

end
