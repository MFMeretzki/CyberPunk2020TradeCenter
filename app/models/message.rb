class Message < ApplicationRecord
  belongs_to :chat
	has_one :chat_message
	validates :chat_id, presence: true
	validates :user_id, presence: true
	validates :body_text, presence: true
end
