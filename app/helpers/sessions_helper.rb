module SessionsHelper
  # Connecte l'utilisateur (session temporaire)
  def log_in(user)
    session[:user_id] = user.id
  end

  # Connecte l'utilisateur dans une session permanente (cookies)
  def remember(user)
    user.remember # Génère le token et sauve le digest en BDD
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Trouve l'utilisateur connecté (via session ou cookie)
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      # On vérifie que le token du cookie correspond au digest en BDD
      if user && BCrypt::Password.new(user.remember_digest).is_password?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    !current_user.nil?
  end

  # Supprime la session permanente
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Déconnecte l'utilisateur actuel
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
