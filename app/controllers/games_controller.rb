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
      redirect_to games_path, :flash => { :success => "#{@game.title} was successfully added to this database"}
    else
      render 'new'
    end
  end
  
  def edit
    @game = Game.find(params[:id])
  end
  
  def update
   @game = Game.find(params[:id])

  stars = game_params.delete(:stars)

  if @game.update_attributes(game_params)
    @game.add_rating stars
      unless current_user.games.include?(@game)
        @game = Game.find(params[:id])
        current_user.games << @game
        redirect_to @game, :flash => { :success => "Thank you! This game has been added to your Favorites List" }
      else
        redirect_to :action => 'index'
        flash[:success] = 'Thank you! This game has been updated' 
      end
    else
      render 'edit'
    end
  end
  
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to :action => 'index', :flash => { :success => "This game has been deleted" }
    current_user.games.delete(@game)
  end
  
  # Defining static pages
  
  private
  
    # Defining parameters
  
    def game_params
      params.require(:game).permit(:title, :console, :genre, :release_date, :stars, :rating, :description)
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