class CreateSendMails < ActiveRecord::Migration
  def change
    create_table :send_mails do |t|
      t.text :emails
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
