class Campaign < ApplicationRecord
  
  has_many :campaign_members, :dependent => :destroy
  has_many :users, :through => :campaign_members
  belongs_to :owner, class_name: "User", foreign_key: :owner_id
end