class Chat < ApplicationRecord
  belongs_to :article
	has_one :article_chats
	has_many :messages, dependent: :destroy
	validates :article, presence: true
	validates :user_id, presence: true
	validates :title, presence: true, length: {minimum: 5}
	
	before_create :init_closed_value
	
	private
	
		def init_closed_value
			self.closed = 0
		end
	
end
