class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :campaign
  belongs_to :character
  accepts_nested_attributes_for :character
 
  def character_attributes=(character)
    self.build_character(name: character[:name], user_id: self.user_id,race: character[:race], level: character[:level], background: character[:background])
    self.save
  end
  
end