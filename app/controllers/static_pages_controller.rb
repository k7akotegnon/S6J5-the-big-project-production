class StaticPagesController < ApplicationController
  def team
    # Affiche simplement la vue team.html.erb
  end

  def contact
    # Affiche simplement la vue contact.html.erb
  end

  def welcome
    # Récupère le prénom passé dans l'URL via le hash params
    @first_name = params[:first_name]
  end
end
