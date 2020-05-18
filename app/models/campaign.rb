class Campaign < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :characters, through: :memberships
  belongs_to :owner, class_name: "User", foreign_key: :owner_id

  scope :owned, ->(user) { where('owner_id = ?', user.id) }

end