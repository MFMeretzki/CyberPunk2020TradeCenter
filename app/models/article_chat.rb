class ArticleChat < ApplicationRecord
	self.primary_key = :id
	belongs_to :chat
end