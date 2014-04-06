class AddUserIdToSendMails < ActiveRecord::Migration
  def change
    add_column :send_mails, :user_id, :integer
  end
end
