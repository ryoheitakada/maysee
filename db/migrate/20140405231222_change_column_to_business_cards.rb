class ChangeColumnToBusinessCards < ActiveRecord::Migration
  def change
    rename_column(:business_cards, :first_nane, :first_name)
  end
end
