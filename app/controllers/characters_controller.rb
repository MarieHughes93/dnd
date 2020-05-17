class CharactersController < ApplicationController
  before_action :get_user
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    @characters = @user.characters
    @user = User.find_by(id: params[:user_id])
  end
  def show
    @character = Character.find_by(id: params[:id])
  end
  def new
    @character = @user.characters.build
  end
  def create
    @character = @user.characters.build(character_params)
    @character.save
    redirect_to user_character_path(current_user, @character)
  end
  def edit
    @character = Character.find_by(id: params[:id])
  end
  def update
    @character.update(character_params)
    redirect_to user_character_path(@user, @character)
  end

  def destroy
    @character.destroy 
    redirect_to user_characters_path(current_user)
  end

  private
  
  def character_params
    params.require(:character).permit(:user_id, :name, :race, :level, :background)
  end

  def set_character
    @character = @user.characters.find(params[:id])
  end

  def get_user
    @user = User.find(params[:user_id])
  end

end
