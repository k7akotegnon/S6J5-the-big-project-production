class CitiesController < ApplicationController
  def show
    # On va chercher la ville en base de données grâce à l'id passé dans l'URL
    @city = City.find(params[:id])
  end
end
