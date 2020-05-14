class CharactersController < ApplicationController
  def index
    @characters = Character.all 
  end
  def show
    @character = Character.find_by(id: params[:id])
  end
  def new
    @user = User.find_by(id: params[:id])
    @character = Character.new
  end
  def create
    @user = User.find(params[:user_id])
    @character = @user.characters.create(character_params)
    redirect_to user_character_path(@user.id)
  end
  def edit
    @character = Character.find_by(id: params[:id])
  end
  def update
    @character = Character.find_by(id: params[:id])
    @character.update(character_params)
    redirect_to user_character_path(@character)
  end

  private
  
  def character_params
    params.require(:character).permit(:user_id, :name, :race, :level, :background)
  end

end
