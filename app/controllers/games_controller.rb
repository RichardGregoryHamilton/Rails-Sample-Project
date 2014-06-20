class GamesController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @games = Game.order(sort_column + " " + sort_direction)
    
    @all_consoles = Game.all_consoles
    
    @selected_consoles = params[:console] || session[:console] || {}
    
    if @selected_consoles == {}
      @selected_consoles = Hash[@all_consoles.map {|console| [console, console]}]
    end
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
      redirect_to games_path, :flash => { :success => "#{@game.title} was succesfully added to this database"}
    else
      render 'new'
    end
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(game_params)
      redirect_to @game, :flash => { :success => "This game has been updated"}
    else
      render 'edit'
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to :action => 'index', :flash => { :success => "This game has been deleted"}
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
  
  def reviews
  end
  
  private
  
    # Defining parameters
  
    def game_params
      params.require(:game).permit(:title, :console, :genre, :released_on, :stars)
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