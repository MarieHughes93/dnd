class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.belongs_to :user, foreign_key: {on_delete: :cascade}
      t.belongs_to :campaign, foreign_key: {on_delete: :cascade}
      t.belongs_to :character, foreign_key: {on_delete: :cascade}
    end
  end
end
