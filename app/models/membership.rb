class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  has_many :characters, through: :user
end