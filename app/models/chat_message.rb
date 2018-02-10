class ChatMessage < ApplicationRecord
	self.primary_key = :id
	belongs_to :message
end