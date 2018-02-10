class RecreateChatsAnDmessages < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.string :title
      t.integer :closed

      t.timestamps
    end
		
    create_table :messages do |t|
      t.references :chat, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body_text

      t.timestamps
    end
  end
end
