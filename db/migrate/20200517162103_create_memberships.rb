class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :campaign, foreign_key: true
      t.belongs_to :character, foreign_key: true
    end
  end
end
