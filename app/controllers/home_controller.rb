class HomeController < ApplicationController
  def index
		@articles = ArticleUser.all
  end
	
	def article_show
		@article = ArticleUser.find(params[:article])
	end
	
	
	
	def chat_show
	end
	
	private
		
		def access_level
			1
		end
end
