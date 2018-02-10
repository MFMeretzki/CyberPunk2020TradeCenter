class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.references :user_id1, foreign_key: true
      t.references :user_id2, foreign_key: true
      t.string :title
      t.text :body_text
      t.integer :closed

      t.timestamps
    end
  end
end
