class Gossip < ApplicationRecord
  # Chaque potin a un seul auteur, qui est un utilisateur
  belongs_to :user

  # On force la présence du titre (entre 3 et 14 caractères) et du contenu
  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true

  # Relation N-N avec les Tags via la table intermédiaire GossipTag
  has_many :gossip_tags, dependent: :destroy
  has_many :tags, through: :gossip_tags

  # Un potin peut recevoir plusieurs commentaires et plusieurs likes
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
