class AddUserIdToBusinessCards < ActiveRecord::Migration
  def change
    add_column :business_cards, :user_id, :integer
  end
end
