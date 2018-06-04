class ArticlesController < ApplicationController
	before_action :authenticate_user!, only: [:new,:create,:destroy,:update,:edit]
	def index
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])

	end

	def create
	  @article = Article.new(article_params)
	 
	  if @article.save
	  	redirect_to @article
	  else
	  	render 'new'
	  end
	end

	def update
		@article = Article.find(params[:id])
		if current_user.id == @article.user_id		
			if @article.update(article_params)
				   redirect_to @article
			else
				   render 'edit'
			end
		end

	end
	def destroy
	  @article = Article.find(params[:id])
	  if current_user.id == @article.user_id	
		  @article.destroy
		 
		  redirect_to articles_path
	  end
	end
	private
	  def article_params
	    params.require(:article).permit(:title, :desc,:user_id)
	  end

end