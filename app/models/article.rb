class Article < ApplicationRecord
  belongs_to :user
	has_one :article_user
	has_many :chats, dependent: :destroy
	validates :title, presence: true, length: {minimum: 5}
end
