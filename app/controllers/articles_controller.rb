class ArticlesController < ApplicationController

	def index
		@articles = Article.all
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

		# .update already saves it so this says that if the changes save, send
		# the page back to the article page, if not start the page again.
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end

	end

	def show
		@article = Article.find(params[:id])
	end

	private

	def article_params
		params.require(:article).permit(:title, :text)
	end

	
end
