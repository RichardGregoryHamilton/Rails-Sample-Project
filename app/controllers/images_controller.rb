class ImagesController < ApplicationController

  before_filter :find_game

  def index
    @image = Image.all
  end
  
  def show
  end
  
  def new
    @image = Image.new
  end
  
  def create
  end
  
  def delete
  end
  
  private
  
    def find_game
	  @game = Game.find(params[:game_id])
	end
  
end
