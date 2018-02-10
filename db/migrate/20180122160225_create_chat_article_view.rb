class CreateChatArticleView < ActiveRecord::Migration[5.1]
	disable_ddl_transaction!
	
	def up
		execute <<-SQL
			CREATE VIEW article_chats AS
			SELECT
				A.id,
				A.user_id AS customer_id,
				A.article_id,
				A.title,
				A.closed,
				B.nick AS customer,
				C.user_id AS trader_id,
				C.trader
			FROM chats A, users B, article_users C
			WHERE A.user_id = B.id AND A.article_id = C.id;
		SQL
	end
	
	def down
		execute <<-SQL
			DROP VIEW article_chats;
		SQL
	end
	
end
