class StaticPagesController < ApplicationController
  
  def show
    @page = StaticPage.find(params[:id])
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.find(params[:page])
  end
  
  def welcome
  end
  
  def about
  end
  
  def contact
  end
  
  def terms
  end
  
  def privacy
  end
  
  def help
  end
  
end