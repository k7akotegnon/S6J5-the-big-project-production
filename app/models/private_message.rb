class PrivateMessage < ApplicationRecord
  # On définit que l'expéditeur et le destinataire sont des instances de la classe User [11]
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
end
