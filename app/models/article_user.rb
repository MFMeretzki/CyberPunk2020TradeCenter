class ArticleUser < ApplicationRecord
	self.primary_key = :id
	belongs_to :article
end