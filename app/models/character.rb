class Character < ApplicationRecord
  belongs_to :user
  has_many :memberships
  has_many :campaigns, through: :memberships 
end
