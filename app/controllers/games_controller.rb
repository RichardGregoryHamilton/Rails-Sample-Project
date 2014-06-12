class GamesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @games = Game.order(sort_column + " " + sort_direction)
  end
  
  def show
    @game = Game.find(params[:id])
  end
  
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to games_path, :flash => { :success => "Game was succesfully saved"}
    else
      render 'new'
    end
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.save
      redirect_to @game, :notice => "Game has been updated"
    else
      render 'edit'
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to :action => 'index'
  end
  
  # Add favorite functionality that allows users to select games as 'favorites'
  
  def favorite
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @game
      redirect_to :back, notice: "#{@game.name} successfully added to your favorites!"
    elsif type == "unfavorite"
      current_user.favorites.delete(@game)
      redirect_to :back, notice: "#{game.name} removed from your favorites"
    else
      redirect_to :back, notice: 'No change'
    end
  end
  
  # Defining static pages
  
  def welcome
  end
  
  def about
  end
  
  def help
  end
  
  private
  
    # Defining parameters
  
    def game_params
      params.require(:game).permit(:title, :console, :genre, :released_on)
    end
  
    #Sorting column 
    
    def sort_column
      Game.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end
  
    # Sort by direction
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
end