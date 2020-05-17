class Character < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :campaign_memberships
  has_many :campaigns, through: :campaign_memberships , dependent: :destroy
end
