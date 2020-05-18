class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  belongs_to :character
  accepts_nested_attributes_for :character
 
  def character_attributes=(character)
    self.build_character(name: character[:name], user_id: self.user_id)
    self.save
  end
  
end