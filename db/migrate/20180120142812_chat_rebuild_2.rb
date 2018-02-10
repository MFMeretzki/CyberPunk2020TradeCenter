class ChatRebuild2 < ActiveRecord::Migration[5.1]
  def change
		rename_column :chats, :user, :user_id
		remove_column :chats, :body_text
  end
end
