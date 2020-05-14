class CreateCampaignMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :campaign_members do |t|
      t.belongs_to :campaign, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end
end
