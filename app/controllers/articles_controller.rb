class ArticlesController < ApplicationController

	def index
		@user = User.find(session[:user_id])
	
		if @user.user_type < 3
			@articles = Article.where(:user => @user.id)
		else
			@articles = Article.all
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		@user = User.find(session[:user_id])
		@article = @user.articles.create(article_params)
		if @article.id != nil
			redirect_to url: user_article_path(:user_id => @user.id, :id => @article.id), method: :get
		else
			render 'new'
		end
	end

	def update
	end

	def destroy
		u = User.find(session[:user_id])
    u.articles.find(params[:id]).destroy
		redirect_to user_articles_path(session[:user_id])
	end
	
	def article_chats
		@article_chats = ArticleChat.where(:article_id => params[:article_id])
	end

	private

		def article_params
			params.require(:article).permit(:title, :subtitle, :resume, :body_text)
		end
		
		def access_level
			2
		end
		
end
