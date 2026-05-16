class User < ApplicationRecord

  # Cette ligne magique active la gestion du mot de passe avec BCrypt
  has_secure_password

  # Un utilisateur appartient à une seule ville
  belongs_to :city

  # Un utilisateur peut avoir écrit plusieurs potins 
  has_many :gossips

  # On crée un attribut virtuel pour le jeton (non sauvegardé en clair en BDD)
  attr_accessor :remember_token

  # Validations de sécurité
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true

  # Gestion des messages privés (Le défi class_name) :
  # On précise la clé étrangère car le nom de l'association (sent_messages)
  # est différent du nom du modèle (PrivateMessage)
  has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: "recipient_id", class_name: "PrivateMessage"

  # Un utilisateur peut laisser plusieurs commentaires et likes 
  has_many :comments
  has_many :likes

  # Retourne un hash (digest) d'une chaîne de caractères
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Retourne un jeton aléatoire
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  # Stocke en base un jeton haché pour les sessions persistantes
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Oublie un utilisateur (pour la déconnexion)
  def forget
    update_attribute(:remember_digest, nil)
  end
end
