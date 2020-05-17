class Character < ApplicationRecord
  belongs_to :user
  has_many :campaign_memberships
  has_many :campaigns, through: :campaign_memberships 
end
