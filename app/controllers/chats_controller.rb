class ChatsController < ApplicationController

  def index
			@chats = ArticleChat.where(:customer_id => session[:user_id])
  end
	
  def show
		@chat = Chat.find(params[:id])
		@chat_messages = ChatMessage.where(:chat_id => @chat.id)
  end
	
  def new
  end
	
  def edit
  end
	
  def create
		article = Article.find(chat_params[:article_id])
		if @chat = article.chats.create(chat_params)
			redirect_to @chat
		else
       redirect_to request.referrer, notice: "Operation failed."
		end
  end
	
  def update
  end
	
  def destroy
  end

  private

		def chat_params
			params.permit(:title, :article_id, :user_id)
		end
		
		def access_level
			1
		end
	
end
