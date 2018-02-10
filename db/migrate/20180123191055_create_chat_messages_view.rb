class CreateChatMessagesView < ActiveRecord::Migration[5.1]
	disable_ddl_transaction!
	
	def up
		execute <<-SQL
			CREATE VIEW chat_messages AS
			SELECT
				A.id,
				A.chat_id,
				A.user_id,
				B.nick,
				A.body_text
			FROM messages A, users B
			WHERE A.user_id = B.id;
		SQL
	end
	
	def down
		execute <<-SQL
			DROP VIEW chat_messages;
		SQL
	end
end
