class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :chat, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body_text

      t.timestamps
    end
  end
end
