class CampaignMembership < ApplicationRecord
    belongs_to :user
    belongs_to :campaign
    belongs_to :character
end