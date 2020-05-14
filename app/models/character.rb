class Character < ApplicationRecord
  belongs_to :user
  has_many :campaign_memberships
end
