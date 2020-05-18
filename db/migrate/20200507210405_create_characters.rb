class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.belongs_to :user, foreign_key: {on_delete: :cascade}
      t.string :name
      t.string :race
      t.integer :level
      t.text :background

      t.timestamps
    end
  end
end
