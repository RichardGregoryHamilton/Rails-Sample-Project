class ArticlesController < ApplicationController

  def index
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
end