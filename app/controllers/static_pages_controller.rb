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
  
end