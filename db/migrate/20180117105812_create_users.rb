class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nick
      t.string :hashed_pass
      t.string :salt
      t.integer :type

      t.timestamps
    end
  end
end
