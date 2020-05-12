class CharactersController < ApplicationController

    def index
    end
    def show
    end
      private

      def character_params
        params.require(:character).permit(:user_id, :name, :race, :level, :background)
      end

end
