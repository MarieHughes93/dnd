class Membership < ApplicationRecord
    
  belongs_to :user
  belongs_to :campaign
  has_one :character, through: :user
end