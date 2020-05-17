class CharactersController < ApplicationController
  def index
    @characters = User.find(params[:user_id]).characters
    @user = User.find_by(id: params[:user_id])
  end
  def show
    @character = Character.find_by(id: params[:id])
  end
  def new
    @user = User.find_by(id: params[:user_id])
    @character = Character.new
  end
  def create
    @character = current_user.characters.create(character_params)
    redirect_to user_character_path(current_user, @character)
  end
  def edit
    @character = Character.find_by(id: params[:id])
  end
  def update
    @character = Character.find_by(id: params[:id])
    @character.update(character_params)
    redirect_to user_character_path(@character)
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy 
    redirect_to user_characters_path(current_user)
  end

  private
  
  def character_params
    params.require(:character).permit(:user_id, :name, :race, :level, :background)
  end

end
