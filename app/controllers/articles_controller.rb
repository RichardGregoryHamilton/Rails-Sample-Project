class ArticlesController < ApplicationController

  before_action :correct_user, only: [:new, :edit, :update]
  
  def index
    @article = Article.all.reverse
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path, :flash => { :success => "Your article was successfully added." }
    else
      render 'new'
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article updated"
      redirect_to articles_path
    else
      flash[:error] = "There was an error updating your article"
      render 'edit'
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :action => 'index', :flash => { :success => "This article has been deleted" }
  end
  
  private
  
    def article_params
      params.require(:article).permit(:title, :body, :date, :avatar)
    end
  
    def correct_user
      redirect_to(root_url) unless signed_in? && current_user.admin?
    end
  
end
