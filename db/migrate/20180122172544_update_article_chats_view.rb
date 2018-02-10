class UpdateArticleChatsView < ActiveRecord::Migration[5.1]
	disable_ddl_transaction!
	
	def up
		execute <<-SQL
			DROP VIEW article_chats;
		SQL
	end
	
	def down
	end
	
end
