# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require "faker"

# Nettoyage
User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all

# Création
10.times { City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code) }
10.times { User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.all.sample, email: Faker::Internet.email, age: rand(18..80)) }
20.times { Gossip.create!(title: Faker::Book.title, content: Faker::Lorem.paragraph, user: User.all.sample) }
10.times { Tag.create!(title: "#" + Faker::Verb.base) }

# Lier des tags au hasard
Gossip.all.each do |g|
  GossipTag.create!(gossip: g, tag: Tag.all.sample)
end

# Créer un utilisateur "Anonymous" pour éviter les erreurs de validation lors de la création de potins sans auteur spécifié
User.create(first_name: "Anonymous", last_name: "User", email: "anonymous@example.com")

puts "The Big Project est prêt !"
