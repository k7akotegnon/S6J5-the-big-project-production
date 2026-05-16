class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      # On "remember" l'utilisateur seulement si la case est cochée
      params[:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "Heureux de vous revoir !"
      redirect_to root_path
    else
      flash.now[:danger] = 'Identifiants invalides'
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:info] = "Déconnexion réussie."
    redirect_to root_path
  end
end
