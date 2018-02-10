class RenameArticleUserView < ActiveRecord::Migration[5.1]
	disable_ddl_transaction!
	
	def up
		execute <<-SQL
			DROP VIEW article_users;
		SQL
		
    execute <<-SQL
			CREATE VIEW article_users AS
			SELECT
				A.id,
				A.user_id,
				A.title,
				A.subtitle,
				A.resume,
				A.body_text,
				B.nick AS trader
			FROM articles A, users B
			WHERE A.user_id = B.id;
		SQL
  end
	
	def down
	end
  def change
  end
end
