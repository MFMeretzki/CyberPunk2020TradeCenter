class ChatRebuild < ActiveRecord::Migration[5.1]
  def change
		add_reference :chats, :article, index: true
		add_foreign_key :chats, :articles
		rename_column :chats, :user_id1_id, :user
		remove_column :chats, :user_id2_id
  end
end
