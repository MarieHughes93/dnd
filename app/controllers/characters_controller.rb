class CharactersController < ApplicationController
    def index
        @characters = Character.all
      end
      
      def show
        @character = Characters.find_by(id: params[:id])
      end
      
      def new
        @character = Character.new
      end
      
      def create
        @character = Character.create(character_params)
        if @character.save
          redirect_to user_character_path(@character)
        else
          render ':new'
        end
      end
      
      def edit
        @character = Character.find(params[:id])
      end
    
      def update
        @character = Character.find(params[:id])
        @character.update(character_params)
        if @character.save
          redirect_to @character
        else
          render :edit
        end
      end
    
      def destroy
        @character = Character.find(params[:id])
        @character.destroy
        flash[:notice] = "Character deleted."
        redirect_to characters_path
      end

      private

      def character_params
        params.require(:character).permit(:user_id, :name, :race, :level, :background)
      end

end
