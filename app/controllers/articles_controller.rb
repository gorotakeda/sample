class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy] 
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
   if @article.save
     redirect_to articles_path, notice: "blog was successfully created."
   elsif 
     render :new, status: :unprocessable_entity
   end
  end


  def show
  end


  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to article_url(@article), notice: "blog was successfully updated."
    elsif 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
      @article.destroy
      redirect_to articles_url, notice: "blog was successfully destroyed."
  end

  private
  
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
