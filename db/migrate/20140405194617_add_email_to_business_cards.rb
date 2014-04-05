class AddEmailToBusinessCards < ActiveRecord::Migration
  def change
    add_column :business_cards, :email, :string
  end
end
