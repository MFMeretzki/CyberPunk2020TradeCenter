class MessagesController < ApplicationController

	def create
		@chat = Chat.find(params[:chat_id])
		message = @chat.messages.create(message_params)
		@chat_message = ChatMessage.find(message.id)
		respond_to do |format|
			format.js
      format.json { render json: @chat_message, status: :created, location: @chat_message }
		end
	end
	
	def destroy
    @chat = Chat.find(params[:article_id])
    @message = @chat.messages.find(params[:id])
    @message.destroy
    #redirect_to chat_path(@chat.id)
		render request.referrer
  end
	
	private
	def message_params
		params.permit(:chat_id, :user_id, :body_text)
	end
		
		def access_level
			1
		end
end
