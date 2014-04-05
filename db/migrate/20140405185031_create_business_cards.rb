class CreateBusinessCards < ActiveRecord::Migration
  def change
    create_table :business_cards do |t|
      t.string :first_nane
      t.string :last_name
      t.string :place
      t.string :tag
      t.datetime :meet_day
      t.text :remarks
      t.timestamps
    end
    add_index :business_cards, :id
  end
end
